Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F44CF2566
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 14:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 298584172D;
	Sat, 12 Oct 2024 14:04:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eBVfqk3BfDuj; Sat, 12 Oct 2024 14:04:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5E904171F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5E904171F;
	Sat, 12 Oct 2024 14:04:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6769C1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 145D340858
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:03:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BfV_HIvowyuo for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 14:03:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DCAE40781
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DCAE40781
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 14:03:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 972487F903; Sat, 12 Oct 2024 14:03:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 15:55:44 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 99cf714dd813db8f112c40cc8da2491202223c8c
X-Git-Newrev: 0209d05619e674e931b382ec50d0252950c35943
X-Patchwork-Hint: ignore
Message-Id: <20241012140333.972487F903@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] support/scripts: fix
 RPATH fixups
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
Content-Type: multipart/mixed; boundary="===============8747569453367797296=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8747569453367797296==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0209d05619e674e931b382ec50d0252950c35943
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Commit a87abcf6da65 (Makefile: run PPD and RPATH fixup in host-fialize)
(sic) moved the fixups peviously done in prepare-sdk, to host-finalize.

This exposed a bug in fix-rpath, when RPATH contains multiple entries,
like:  /PPD/host-foo/host/lib:/PPD/host-foo/host/lib/foo

In that situation, we want to get rid of /PPD/host-foo and replace it
with the finale HOST_DIR, so we mangle the RPATH with a sed expression.

However, that sed expression only ever replaces the first match, as it
is missing the 'g' option. Thus, the second (and following) parts of
RPATH are still referring to the PPD, and thus patchelf does not find it
relative to the final HOST_DIR, amd rops it. This eventually lead to a
final RPATH set as $ORIGIN/../lib instead of the expected
$ORIGIN/../lib:$ORIGIN/../lib/foo

This is the case for host-systemd, which installs some of its libraries
in $PREFIX/lib/systemd/ and adds an RPATH set appropriately to
/PPD/host-systemd/host/lib:/PPD/host-systemd/host/lib/systemd and that
gets incorrectly mangled.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/issues/39

Also fix a typo in the comment just above.

Reported-by: José Luis Salvador Rufo @jlsalvador
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Reviewed-by: José Luis Salvador Rufo <salvador.joseluis@gmail.com>
Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Reviewed-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2100a76d9ef620d9749352fb85f83720412598ec)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/fix-rpath | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
index 1e58646cea..d3421504a5 100755
--- a/support/scripts/fix-rpath
+++ b/support/scripts/fix-rpath
@@ -84,9 +84,9 @@ patch_file() {
     # work with the --make-rpath-relative ${rootdir} invocation as
     # the per-package host directory is not within ${rootdir}. So,
     # we rewrite all RPATHs pointing to per-package directories so
-    # that they point to the global host directry.
+    # that they point to the global host directory.
     # shellcheck disable=SC2001 # ${var//search/replace} hard when search or replace have / in them
-    changed_rpath="$(echo "${rpath}" | sed "s@${PER_PACKAGE_DIR}/[^/]\+/host@${HOST_DIR}@")"
+    changed_rpath="$(echo "${rpath}" | sed "s@${PER_PACKAGE_DIR}/[^/]\+/host@${HOST_DIR}@g")"
     if test "${rpath}" != "${changed_rpath}" ; then
         "${PATCHELF}" --set-rpath "${changed_rpath}" "${file}"
     fi

--===============8747569453367797296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8747569453367797296==--
