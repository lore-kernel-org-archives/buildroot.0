Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16195C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 19:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53E7C416D1;
	Sat, 28 May 2022 19:40:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dfTFtZ5juRyK; Sat, 28 May 2022 19:40:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1775041700;
	Sat, 28 May 2022 19:40:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF3431BF867
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4B8140620
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hl448BOpQ7h6 for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 19:40:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDF0140556
 for <buildroot@buildroot.org>; Sat, 28 May 2022 19:40:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A149E85E62; Sat, 28 May 2022 19:29:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 21:33:36 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 7561c24377ab58b2949e2c997c31430e275dfb41
X-Git-Newrev: 9b6804f5b8d345417cc489e62b5c00f38cd46ed1
X-Patchwork-Hint: ignore
Message-Id: <20220528192901.A149E85E62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/pkg-generic:
 explicitly do not download package without source
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9b6804f5b8d345417cc489e62b5c00f38cd46ed1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Recent commit f0c7cb01a960 (package/pkg-download: do not try to vendor
_EXTRA_DOWNLOADS) got last-minute changes when applied, which changed
the expected behaviour for packages that do not have a main download.

Before f0c7cb01a960, the dl-wrapper would not even be called for those
packages, and the original patch that was sent also avoided downloading
such packages, but f0c7cb01a960 now causes the dl-wrapper to be called.

It is however an accident that the dl-wrapper does not fail. Indeed, it
is expected to fail if no download was successful; we pass no URI, so
the dl-wrapper should have failed, as it basically does:

    download_and_check=0
    for uri in "${uris[@]}"; do
        ...
    done
    if [ "${download_and_check}" -eq 0 ]; then
        exit 1
    fi

However, it does not even go that far...

Even though there is no output file, we still pass the path to the
package output directory as the output path. So, to avoid downloading
files already present, the wrapper checks if the output file exists,
and checks its hash:

    if [ -e "${output}" ]; then
        if support/download/check-hash ${quiet} "${hfile}" "${output}" ...
            exit 0
        ...
    fi

The output path does exist now, because we explicitly create it just
before calling the wrapper, because that's where we also locate the
lockfile.

So it ends up trying to validate the hash of a directory, but it fails
to, as there is indeed no hash file for that package. And a missing hash
file is just a warning, not an error, which makes the download actually
a success...

So, this is currently working, and this is by pure luck.

However, there is a potential issue: if a target package is a virtual
package, but the host package is a real package, e.g. the same foo.mk
does (or the other way around):

    HOST_FOO_VERSION = 1.2.3
    HOST_FOO_SITE = http://example.net/
    $(eval $(virtual-package))
    $(eval $(host-generic-package))

If there is a hash file to validate the host download, then the current
situation will cause a failure, because there would be a hash file, but
no hash for the output path of the target variant, which would then be
a hard-error.

So, revert to the behaviour from before f0c7cb01a960, where no download
is attempted for a package without a source (really, without a main
download, now).

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d95a6dac3143a74fbd011eb423f3010ae3b05927)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b03f1991b8..fdf53063be 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -192,7 +192,7 @@ $(BUILD_DIR)/%/.stamp_downloaded:
 			break ; \
 		fi ; \
 	done
-	$(call DOWNLOAD,$($(PKG)_MAIN_DOWNLOAD),$(PKG),$(patsubst %,-p '%',$($(PKG)_DOWNLOAD_POST_PROCESS)))
+	$(if $($(PKG)_MAIN_DOWNLOAD),$(call DOWNLOAD,$($(PKG)_MAIN_DOWNLOAD),$(PKG),$(patsubst %,-p '%',$($(PKG)_DOWNLOAD_POST_PROCESS))))
 	$(foreach p,$($(PKG)_ADDITIONAL_DOWNLOADS),$(call DOWNLOAD,$(p),$(PKG))$(sep))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 	$(Q)mkdir -p $(@D)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
