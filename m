Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A62C433FE
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 10:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2054D4015F;
	Fri, 11 Nov 2022 10:58:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2054D4015F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xndogmvaLR2J; Fri, 11 Nov 2022 10:58:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDFBE402A7;
	Fri, 11 Nov 2022 10:58:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDFBE402A7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 290281BF2C8
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 10:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 045D460A84
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 10:58:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 045D460A84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mRtha-M7BprG for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 10:58:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9EAA605D6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9EAA605D6
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 10:58:31 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so5344861wmb.2
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 02:58:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=diumG4v+Gn9HrPfPyGbnjn/Z0cvFp0WM5j32cZufrp8=;
 b=p8OHTp+ZxVZNpocGyqUqTCT5nvQrQn0/eAx7gF3pS+PY1k8M6o8GvaMba5B7EKyuYi
 lMtT8xqy8MZqzJKgDrTi6hwoVDkP0uvRS5RBqNFxUpCVdjBT0lNONEXrjSzHz+lRbWoS
 BR0zEinNGldlQjfHZflppiPb8TBKVsWFLBafRhQYZLicVXMRv/dOvoBqv3P+YXU5u0zC
 T429KJaxbSuPdUS1dFr5Q3cmt6607yvVTHsnskqquHUFLPSPrmL+ujGgW/yboiLlpd1M
 Xuqvup+7pGoXIQo8rUQ/q9n55lyhyVeInVczx9sUGuZ+TlFCH1nGcWtiIdy+2I4Z/CsE
 JzdA==
X-Gm-Message-State: ANoB5pnmUOOrTxTmwy4SwkcUcBAEOcUGk/aWKPu2oL6TkLqryZTBc/cQ
 CnzTga6oOkk8Q31x7U5kTWwcie7AJPQ=
X-Google-Smtp-Source: AA0mqf5XqlMaxMXCSQr4Q9wj6zOr3/Us1zEqTdNGQD6a44X25RzCsZvSaD1qf8eMy91nNYgOqFPHWQ==
X-Received: by 2002:a05:600c:354d:b0:3cf:7514:a806 with SMTP id
 i13-20020a05600c354d00b003cf7514a806mr869201wmq.116.1668164309656; 
 Fri, 11 Nov 2022 02:58:29 -0800 (PST)
Received: from lano-work.. ([80.120.136.76]) by smtp.gmail.com with ESMTPSA id
 q10-20020adff94a000000b0022cc6b8df5esm1627594wrr.7.2022.11.11.02.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 02:58:29 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Nov 2022 11:57:53 +0100
Message-Id: <20221111105757.552459-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=diumG4v+Gn9HrPfPyGbnjn/Z0cvFp0WM5j32cZufrp8=;
 b=kahgaD6de1eodivj2PhItUiDvlAm54SJG1rmVMT/EmvEsSX/4tBICTuwmvgrE0UtlW
 3hUecMHwRtazNT4jYt8+tJ9sppoEFw943IXULQXvZtH56UmCJ5/fTv/yzKw0ODhHlzuF
 UXulNRznEbxnOIxti7oomTKV0eOIQlj/SDV8b8KQj6KU7qQBrEKC+jh+BqievOolD255
 VRxKREMHVP+/Lt2LhNj7gNPIiECSjK0GeQyPHUXO3eFsmFQnGhwP236mkGwsPfL7uXUe
 omgew5VEcRAQ71PlEeZJvhRMYBpYTz2OjYqYTsZYWWxvfZucCrKWeaZWqqQjLEQXFAfL
 VMPQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kahgaD6d
Subject: [Buildroot] [PATCH v7 1/4] package/systemd: bump to version 252.1
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
Cc: james.hilliard1@gmail.com, Norbert Lange <nolange79@gmail.com>,
 Sen Hastings <sen@phobosdpl.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Following files changed *license* from CC0-1.0 to MIT-0:

-   src/systemctl/systemd-sysv-install.SKELETON
-   config files
-   examples under /network

The file LICENSES/MIT-0.txt has been added for this reason,
hashes added, corrected for LICENSES/README.md.

Kernel version 3.15 is now the bare minimum, but only
version 4.15 and higher are fully supported and tested:

-   bump kernel header dependencies
-   correct kconfig description
-   improvements to make the kconfig description better reflect
    the information from the README

Remove upstreamed patch.

Set new options to their default, remove -Defi-cc option.

Set -Ddbus=false to ensure dbus dependency is runtime only.

Set -Ddbus-interfaces-dir=no as interface XML file generation is
not supported when cross compiling.

Set -Ddefault-user-shell=/bin/sh to the always available shell.

Signed-off-by: Norbert Lange <nolange79@gmail.com>

---
v6->v7:

*   update to 252.1
*   compare changes in licenses to 250.4
*   update systemd description in kconfig with required and recommended
    kernel
*   split patch

v5->v6:

*   update to 251.4

v4->v5:

*   fix dnssec changes, use James' solution

v2->v4:

*   Bump kernel header dependency to 3.15
*   Inherit changes from James' version bump patch (following)
*   (Force) disable compile time dbus dependencies
*   set default-dnssec to allow-downgrade

v1->v2:

*   note about changed LICENSES/README.md
*   always set default-user-shell to /bin/sh
*   always set default-locale to C-UTF-8
*   fix typos in commit message

---

License diff for illustration

--- systemd-stable-250.4/LICENSES/README.md
+++ systemd-stable-252.1/LICENSES/README.md
@@ -45,9 +45,11 @@
  * the following sources are licensed under the **CC0-1.0** license:
    - src/basic/siphash24.c
    - src/basic/siphash24.h
-   - src/systemctl/systemd-sysv-install.SKELETON
    - tools/check-includes.pl
+  * the following sources are licensed under the **MIT-0** license:
    - all examples under man/
+   - src/systemctl/systemd-sysv-install.SKELETON
+   - config files and examples under /network
  * the following sources are under **Public Domain** (LicenseRef-murmurhash2-public-domain):
    - src/basic/MurmurHash2.c
    - src/basic/MurmurHash2.h

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 ...define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch | 33 -------------------
 package/systemd/Config.in                     | 12 +++++--
 package/systemd/systemd.hash                  |  5 +--
 package/systemd/systemd.mk                    | 16 +++++++--
 system/Config.in                              |  6 ++--
 5 files changed, 29 insertions(+), 43 deletions(-)
 delete mode 100644 package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch

diff --git a/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch b/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
deleted file mode 100644
index 0934886acb..0000000000
--- a/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 16c132a6a0389e0eaea70c4ad95dbfd1637ec5ba Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Fri, 7 Jan 2022 22:25:23 +0100
-Subject: [PATCH] missing-syscall: define MOVE_MOUNT_T_EMPTY_PATH if missing
-
-MOVE_MOUNT_T_EMPTY_PATH has been added to systemd 250 by [1]
-but it's defined in kernel headers since version 5.2.
-
-[1] c7bf079bbc19e3b409acc0c7acc3e14749211fe2
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- src/basic/missing_syscall.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
-index 8267b1a90c..793d111c55 100644
---- a/src/basic/missing_syscall.h
-+++ b/src/basic/missing_syscall.h
-@@ -569,6 +569,10 @@ static inline int missing_open_tree(
- #define MOVE_MOUNT_F_EMPTY_PATH 0x00000004 /* Empty from path permitted */
- #endif
- 
-+#ifndef MOVE_MOUNT_T_EMPTY_PATH
-+#define MOVE_MOUNT_T_EMPTY_PATH 0x00000040 /* Empty to path permitted */
-+#endif
-+
- static inline int missing_move_mount(
-                 int from_dfd,
-                 const char *from_pathname,
--- 
-2.31.1
-
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 45a9e2d644..f35305c0be 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -22,7 +22,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on !BR2_STATIC_LIBS # kmod
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_HOST_GCC_AT_LEAST_5 # host-systemd
 	select BR2_PACKAGE_HAS_UDEV
@@ -51,7 +51,11 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	  an elaborate transactional dependency-based service control
 	  logic.  It can work as a drop-in replacement for sysvinit.
 
-	  Systemd requires a Linux kernel >= 3.13 with the following
+	  Kernel versions below 4.15 ("recommended baseline") have
+	  significant gaps in functionality and are not recommended
+	  for use with this version of systemd.
+
+	  Systemd requires a Linux kernel >= 3.15 with the following
 	  options enabled:
 
 	  - CONFIG_DEVTMPFS
@@ -66,9 +70,11 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	  - CONFIG_PROC_FS
 	  - CONFIG_FHANDLE (libudev, mount and bind mount handling)
 
-	  - CONFIG_NET_NS (needed by PrivateNetwork=, used in some
+	  - CONFIG_NET_NS (Required for PrivateNetwork=, used in some
 	    systemd units)
 
+	  - CONFIG_USER_NS (Required for PrivateUsers=)
+
 	  - CONFIG_AUTOFS_FS / CONFIG_AUTOFS4_FS
 	  - CONFIG_TMPFS_POSIX_ACL
 	  - CONFIG_TMPFS_XATTR
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 3572b25965..4f618ee218 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  d2bda9d225da11dc9ff48b48e59fc36798d3e66902ed400a9f78fa370c596864  systemd-250.4.tar.gz
+sha256  efd1c04d14c5e44b55d19aaf9182b309c4253bbd884374f5d840947d598e9d47  systemd-252.1.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
@@ -8,7 +8,8 @@ sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENS
 sha256  61778e80a2fd85955b626b29aa2bcf06144c714277bded65633e4a81479d9fb3  LICENSES/LGPL-2.0-or-later.txt
 sha256  5bcef4fedbfc08776630e65d5d0d074dd31208037eddb167ca46a9ec4f737764  LICENSES/Linux-syscall-note.txt
 sha256  790ac93fb2859097bdda4cf08b5a4feb5e479d0cb2c74f403248241bc3e7c216  LICENSES/lookup3-public-domain.txt
+sha256  8a6fc0879cecc0b96bf4c08159b9d733bf0f15fcf32879aec98c4ffd05424554  LICENSES/MIT-0.txt
 sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
 sha256  2a98749f6bec00dfaed86fa9c1edea871aaae4f11ee4d100b671aaf4ce353a73  LICENSES/murmurhash2-public-domain.txt
 sha256  1a7adaa2c86cedfd6c7f5c0c7c72fd6d3e02cd0c9593f21fdb53c89bb2b130ec  LICENSES/OFL-1.1.txt
-sha256  11801e931f252252a16eac8299465510d0a82c36bfd9ac8aea9b202b76d2f82b  LICENSES/README.md
+sha256  da9b2c7b8cd10516fd2c4279b82496ea61787148f13e899c62fc8988c5fac34f  LICENSES/README.md
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1d7452de19..57b6734d21 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 250.4
+SYSTEMD_VERSION = 252.1
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
@@ -29,6 +29,7 @@ SYSTEMD_LICENSE = \
 	BSD-3-Clause (tools/chromiumos), \
 	CC0-1.0 (few source files, see LICENSES/README.md), \
 	GPL-2.0 with Linux-syscall-note (linux kernel headers), \
+	MIT-0 (few source files, see LICENSES/README.md), \
 	MIT (few source files, see LICENSES/README.md), \
 	OFL-1.1 (Heebo fonts)
 SYSTEMD_LICENSE_FILES = \
@@ -40,6 +41,7 @@ SYSTEMD_LICENSE_FILES = \
 	LICENSES/LGPL-2.0-or-later.txt \
 	LICENSES/Linux-syscall-note.txt \
 	LICENSES/lookup3-public-domain.txt \
+	LICENSES/MIT-0.txt \
 	LICENSES/MIT.txt \
 	LICENSES/murmurhash2-public-domain.txt \
 	LICENSES/OFL-1.1.txt \
@@ -61,7 +63,13 @@ SYSTEMD_SELINUX_MODULES = systemd udev xdg
 SYSTEMD_PROVIDES = udev
 
 SYSTEMD_CONF_OPTS += \
+	-Ddbus=false \
+	-Ddbus-interfaces-dir=no \
+	-Ddefault-compression='auto' \
 	-Ddefault-hierarchy=unified \
+	-Ddefault-locale='C.UTF-8' \
+	-Ddefault-user-shell=/bin/sh \
+	-Dfirst-boot-full-preset=false \
 	-Didn=true \
 	-Dima=false \
 	-Dkexec-path=/usr/sbin/kexec \
@@ -72,6 +80,7 @@ SYSTEMD_CONF_OPTS += \
 	-Dman=false \
 	-Dmount-path=/usr/bin/mount \
 	-Dmode=release \
+	-Dnspawn-locale='C.UTF-8' \
 	-Dnss-systemd=true \
 	-Dquotacheck-path=/usr/sbin/quotacheck \
 	-Dquotaon-path=/usr/sbin/quotaon \
@@ -82,6 +91,7 @@ SYSTEMD_CONF_OPTS += \
 	-Dsulogin-path=/usr/sbin/sulogin \
 	-Dsystem-gid-max=999 \
 	-Dsystem-uid-max=999 \
+	-Dsysupdate=false \
 	-Dsysvinit-path= \
 	-Dsysvrcnd-path= \
 	-Dtelinit-path= \
@@ -548,7 +558,6 @@ SYSTEMD_DEPENDENCIES += gnu-efi
 SYSTEMD_CONF_OPTS += \
 	-Defi=true \
 	-Dgnu-efi=true \
-	-Defi-cc=$(TARGET_CC) \
 	-Defi-ld=bfd \
 	-Defi-libdir=$(STAGING_DIR)/usr/lib \
 	-Defi-includedir=$(STAGING_DIR)/usr/include/efi
@@ -794,6 +803,8 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dbinfmt=false \
 	-Drepart=false \
 	-Dcoredump=false \
+	-Ddbus=false \
+	-Ddbus-interfaces-dir=no \
 	-Dpstore=false \
 	-Doomd=false \
 	-Dlogind=false \
@@ -802,6 +813,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dmachined=false \
 	-Dportabled=false \
 	-Dsysext=false \
+	-Dsysupdate=false \
 	-Duserdb=false \
 	-Dhomed=false \
 	-Dnetworkd=false \
diff --git a/system/Config.in b/system/Config.in
index 888c24ce81..24a0e941e3 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -125,19 +125,19 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_HOST_GCC_AT_LEAST_5
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_ROOTFS_SKELETON_DEFAULT
 
-comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.10, host and target gcc >= 5"
+comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.15, host and target gcc >= 5"
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_HAS_SSP || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_HOST_GCC_AT_LEAST_5
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
