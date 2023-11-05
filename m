Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5447DC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 18:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D641820DC;
	Sun,  5 Nov 2023 18:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D641820DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cAFMDjrdjkeA; Sun,  5 Nov 2023 18:32:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3287281CAD;
	Sun,  5 Nov 2023 18:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3287281CAD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 448681BF870
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D60381D4F
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D60381D4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qfu68_seoaax for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 18:31:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36B0681CAD
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 18:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36B0681CAD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22661867F3; Sun,  5 Nov 2023 18:31:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Nov 2023 18:32:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a97c1925b2e710f19b7ea6f95e8f14eaae1743d3
X-Git-Newrev: 1af0d4cb288b36548895967f0cf553d6f393d495
X-Patchwork-Hint: ignore
Message-Id: <20231105183144.22661867F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/petitboot: prefer kexec-lite on
 powerpc
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1af0d4cb288b36548895967f0cf553d6f393d495
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a better choice on platforms where it is available, so default
to it. Still select kexec for platforms where kexec-lite is not
available.

While we're at it, make use of the new
BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS symbol instead of relying of the
kexec-lite arch depends being a subject of kexec.

While we're at it, sort all run-time dependencies alphabetically and
don't repeat the comment.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
[Arnout:
 - use BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS;
 - still allow full kexec by turning around the dependency;
 - extend commit message.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/petitboot/Config.in | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
index bd50ff65a0..b81ab6310d 100644
--- a/package/petitboot/Config.in
+++ b/package/petitboot/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PETITBOOT
 	bool "petitboot"
-	# kexec-lite arch depends is a subset of kexec arch depends
-	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS || BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # lvm2
 	depends on BR2_USE_WCHAR # elfutils
 	depends on !BR2_STATIC_LIBS # elfutils, lvm2
@@ -10,12 +9,11 @@ config BR2_PACKAGE_PETITBOOT
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_LVM2 # devmapper
 	select BR2_PACKAGE_NCURSES
-	# run-time dependency only
-	select BR2_PACKAGE_KEXEC if !BR2_PACKAGE_KEXEC_LITE
-	# run-time dependency only
-	select BR2_PACKAGE_POWERPC_UTILS if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
-	# run-time dependency only
+	# run-time dependencies
+	select BR2_PACKAGE_KEXEC if !BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS
+	select BR2_PACKAGE_KEXEC_LITE if BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS && !BR2_PACKAGE_KEXEC
 	select BR2_PACKAGE_NVME if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
+	select BR2_PACKAGE_POWERPC_UTILS if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
 	help
 	  Petitboot is a small kexec-based bootloader
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
