Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62E4C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 08:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22C4C607D5;
	Fri,  1 Mar 2024 08:40:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bWKKIHWy9HsF; Fri,  1 Mar 2024 08:40:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DFF960FE3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DFF960FE3;
	Fri,  1 Mar 2024 08:40:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8D201BF377
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 08:40:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B48C5405D5
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 08:40:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eOYtycpfJLjs for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 08:40:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B8EB400BF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B8EB400BF
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 08:40:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DCF087E85; Fri,  1 Mar 2024 08:40:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 1 Mar 2024 09:39:11 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: c4bfb4d799d25b523c2dfa7ac2f9e7fd8487f206
X-Git-Newrev: cd6a1977c6f520321c9634c09300f9eda9db258d
X-Patchwork-Hint: ignore
Message-Id: <20240301084001.6DCF087E85@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/petitboot:
 propagate dependencies from kexec/kexec-lite
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd6a1977c6f520321c9634c09300f9eda9db258d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Commit 719921bebe17 (package/kexec: bump to version 2.0.27) forgot to
propagate the new dependency on kernel headers to petitboot, which may
select kexec, causing unmet dependencies warnings (unfortunately, not
errors), such as:

    $ KCONFIG_SEED=0x84462FFC make randconfig
    WARNING: unmet direct dependencies detected for BR2_PACKAGE_KEXEC
      Depends on [n]: BR2_PACKAGE_KEXEC_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 [=n]
      Selected by [y]:
      - BR2_PACKAGE_PETITBOOT [=y] && (BR2_PACKAGE_KEXEC_ARCH_SUPPORTS [=y] || BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS [=n]) && BR2_USE_MMU [=y] && BR2_USE_WCHAR [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_PACKAGE_HAS_UDEV [=y] && !BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS [=n]

Propagate the dependency from kexec, and add comments about dependencies
also inherited from kexec-lite.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c721a583790ef9e35e2a974450bdcbc5662621c8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/petitboot/Config.in | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
index f931ab91cd..6a3d476b11 100644
--- a/package/petitboot/Config.in
+++ b/package/petitboot/Config.in
@@ -2,10 +2,11 @@ config BR2_PACKAGE_PETITBOOT
 	bool "petitboot"
 	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS || BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # lvm2
-	depends on BR2_USE_WCHAR # elfutils
-	depends on !BR2_STATIC_LIBS # elfutils, lvm2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils, lvm2
+	depends on BR2_USE_WCHAR # elfutils, kexec-lite
+	depends on !BR2_STATIC_LIBS # elfutils, kexec-lite, lvm2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils, kexec-lite, lvm2
 	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 || !BR2_PACKAGE_KEXEC_ARCH_SUPPORTS # kexec
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_LVM2 # devmapper
 	select BR2_PACKAGE_NCURSES
@@ -36,3 +37,7 @@ comment "petitboot needs a toolchain w/ wchar, dynamic library, threads, udev /d
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_PACKAGE_HAS_UDEV
+
+comment "petitboot w/ kexec needs a toolchain w/ headers >= 3.17"
+	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS && !BR2_PACKAGE_KEXEC_LITE_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
