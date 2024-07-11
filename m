Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779A1C3DA4B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 19:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28D1D60811;
	Thu, 11 Jul 2024 19:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gOkREKTcR0fQ; Thu, 11 Jul 2024 19:46:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A1F26082E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A1F26082E;
	Thu, 11 Jul 2024 19:46:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9F9A1BF479
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 19:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A57AE84050
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 19:46:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qDMDj1nbXSA2 for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 19:46:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6EFE84045
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6EFE84045
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 19:46:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9534D84758; Thu, 11 Jul 2024 19:46:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 21:46:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60c8807c69be60a8f1c35ed9f992850b009126be
X-Git-Newrev: 63b4cbacb1bb22ead0a6351d4aa2fc9b85f0bbde
X-Patchwork-Hint: ignore
Message-Id: <20240711194637.9534D84758@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: fix compiling with
 headers < 4.14
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9146652884074096759=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9146652884074096759==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=63b4cbacb1bb22ead0a6351d4aa2fc9b85f0bbde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 360a7cd738a85067ba60b029ca88eb7c874bfe4f ("package/systemd:
bump linux-headers dependency to 4.14"), the headers requirements were
bumped to 4.14 because of new build failures due to
LOOP_SET_BLOCK_SIZE.

Even though systemd does not recommend using it with headers <
4.15 (see [1]), it is still possible to build it and use some of its
features (after fixing the build failure).

Note that this was build-tested with 4.4 headers only, and not all the
way back to 3.15 (which is the version requirement that was used
before 360a7cd738a85067ba60b029ca88eb7c874bfe4f).

[1]: https://github.com/systemd/systemd/blob/main/README

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...issing_loop.h-fix-missing-LOOP_SET_BLOCK_.patch | 38 ++++++++++++++++++++++
 package/systemd/Config.in                          |  7 ++--
 system/Config.in                                   |  6 ++--
 3 files changed, 45 insertions(+), 6 deletions(-)

diff --git a/package/systemd/0001-src-basic-missing_loop.h-fix-missing-LOOP_SET_BLOCK_.patch b/package/systemd/0001-src-basic-missing_loop.h-fix-missing-LOOP_SET_BLOCK_.patch
new file mode 100644
index 0000000000..7d520f81d4
--- /dev/null
+++ b/package/systemd/0001-src-basic-missing_loop.h-fix-missing-LOOP_SET_BLOCK_.patch
@@ -0,0 +1,38 @@
+From e358793a796f8c742af4ea3f4fe398731ca46649 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
+Date: Fri, 14 Jun 2024 14:37:29 +0200
+Subject: [PATCH] src/basic/missing_loop.h: fix missing LOOP_SET_BLOCK_SIZE
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Builds with kernels headers < 4.14 fail with:
+
+../src/shared/loop-util.c: In function ‘loop_configure_fallback’:
+../src/shared/loop-util.c:237:31: error: ‘LOOP_SET_BLOCK_SIZE’ undeclared (first use in this function); did you mean ‘LOOP_SET_DIRECT_IO’?
+                 if (ioctl(fd, LOOP_SET_BLOCK_SIZE, (unsigned long) c->block_size) < 0)
+                               ^~~~~~~~~~~~~~~~~~~
+                               LOOP_SET_DIRECT_IO
+
+Fixes: https://github.com/systemd/systemd/issues/33341
+Upstream: https://github.com/systemd/systemd/commit/56ab1c54497d9fac74380ff9e11aaf931a917d2b
+Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
+---
+ src/basic/missing_loop.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/basic/missing_loop.h b/src/basic/missing_loop.h
+index 7141544b64..b1505f678b 100644
+--- a/src/basic/missing_loop.h
++++ b/src/basic/missing_loop.h
+@@ -22,3 +22,7 @@ struct loop_config {
+ #ifndef LOOP_SET_STATUS_SETTABLE_FLAGS
+ #define LOOP_SET_STATUS_SETTABLE_FLAGS (LO_FLAGS_AUTOCLEAR | LO_FLAGS_PARTSCAN | LO_FLAGS_DIRECT_IO)
+ #endif
++
++#ifndef LOOP_SET_BLOCK_SIZE
++#  define LOOP_SET_BLOCK_SIZE 0x4C09
++#endif
+-- 
+2.25.1
+
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index a94e9b73b8..82c0e30474 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -22,7 +22,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on !BR2_STATIC_LIBS # kmod
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 # LOOP_SET_BLOCK_SIZE
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_HOST_GCC_AT_LEAST_5 # host-systemd
 	select BR2_PACKAGE_HAS_UDEV
@@ -239,6 +239,7 @@ config BR2_PACKAGE_SYSTEMD_HOMED
 	depends on BR2_USE_MMU # cryptsetup -> lvm2
 	depends on !BR2_STATIC_LIBS # cryptsetup -> lvm2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup -> json-c
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # fscrypt_key
 	select BR2_PACKAGE_CRYPTSETUP
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
@@ -249,11 +250,11 @@ config BR2_PACKAGE_SYSTEMD_HOMED
 
 	  https://www.freedesktop.org/software/systemd/man/systemd-homed.service.html
 
-comment "homed support needs a toolchain w/ threads, dynamic library"
+comment "homed support needs a toolchain w/ threads, dynamic library, kernel headers >= 4.12"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
 
 config BR2_PACKAGE_SYSTEMD_HOSTNAMED
 	bool "enable hostname daemon"
diff --git a/system/Config.in b/system/Config.in
index 3fb17ed1c6..bc0c6eb6bc 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -125,19 +125,19 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_HOST_GCC_AT_LEAST_5
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_ROOTFS_SKELETON_DEFAULT
 
-comment "systemd needs a glibc toolchain w/ SSP, headers >= 4.14, host and target gcc >= 5"
+comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.15, host and target gcc >= 5"
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_HAS_SSP || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_HOST_GCC_AT_LEAST_5
 

--===============9146652884074096759==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9146652884074096759==--
