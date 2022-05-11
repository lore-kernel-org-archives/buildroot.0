Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0085C433FE
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 06:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 517798328E;
	Wed, 11 May 2022 06:23:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ObjozFR43d6F; Wed, 11 May 2022 06:23:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4320183276;
	Wed, 11 May 2022 06:23:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F33971BF870
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 06:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E17A041794
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 06:23:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=orange.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mgk7aFSAtk_e for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 06:23:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7379F40908
 for <buildroot@buildroot.org>; Wed, 11 May 2022 06:23:21 +0000 (UTC)
Received: from opfednr04.francetelecom.fr (unknown [xx.xx.xx.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr20.francetelecom.fr (ESMTP service) with ESMTPS id 4KylGG6kNsz208y; 
 Wed, 11 May 2022 08:23:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1652250198;
 bh=oz/h1XuMSXHftfJ/s7PddVrm81JLuHYZ/yoq/BVbXFM=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=FSsPuP8bFUYQoaj14FbsRA1Tj7wiMAsCUo3N+fb2PxuQvvMF6HgHo77RbSO9xY42o
 JCmJFPnDalueckPGY6rX915sCowU/flabRa1b6CGxhUUzt7/SzD2D7fphlTw5GMOjo
 taTg2i/dCSgSjRXKHy9zN40nCsY5ZS9cIwu6UYw3A4ztYA1GHTPzqbFCLM5MgLYASi
 odPg3ta3g9j1UPl+MVVk+je2B/3bnNA7Rc0UnHKlARLdlkZw8zrRrNUPqOpp5oYNaR
 1IBQ6Jcjfkpx1Ibr5blOLR6/4wLJagq+EX/pieSK5gDCSOetXB0leXQCV1tDolroVD
 j23V4rYxKk0uw==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Wed, 11 May 2022 08:23:16 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Wed, 11 May 2022 08:23:16 +0200
Message-ID: <17102_1652250198_627B5656_17102_437_1_abf36ee4172876cd86eaa1ce6691ddca377f8b0b.1652250196.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX605.corporate.adroot.infra.ftgroup
 (10.115.27.29) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: [Buildroot] [PATCH] package/pkg-generic: explicitly do not download
 package withtout source
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
Cc: "Yann E. MORIN" <yann.morin@orange.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

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
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 38219ce088..b233b07548 100644
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
-- 
2.25.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
