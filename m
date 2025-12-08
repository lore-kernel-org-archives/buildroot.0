Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C7AD3B7EA
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 17:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6467A82351;
	Mon,  8 Dec 2025 17:55:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SZJZBFg2WwCR; Mon,  8 Dec 2025 17:55:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A578682332
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765216528;
	bh=72mK4K7cfd1uD/EWwqrYuxtF03X3Yl3KuzqlvxrzNpE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bC388kEvGn0tncAGxA1JMgL/2ARS/Tax5aBYMeloW8XR8Xj3HMjl9OA+u7/l5olPS
	 yuF6j/kEwUxzQTPDPbgvpDGqTQ2zSSW+44WowJGEV25vO9gDe/C+IlnqmU0K2PwJ2p
	 f5eT6Mjx3VxAZAl2OFfHAnyfR3ayl6utYd/wkrMC0YILWdGGIKKc0JS3nTMwQuGIS5
	 p5oRK8hwhX5IddeDK9dN6Ife3OhUgZw2t2jdDiJ1HjsL2MiOnYHaygDXDiG33Bm38N
	 +gYTP8mc3GIwXTksIDTiGi00t7MXLXUOo9LL5WMXo0eR4R1L09vqeF1JPxhfB61x4t
	 fulQn50oXgRRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A578682332;
	Mon,  8 Dec 2025 17:55:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A1B90197
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 17:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 932286087E
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 17:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n2fVwD5YyWuW for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 17:55:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2244C60C05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2244C60C05
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2244C60C05
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 17:55:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2B345A4C141F
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 18:55:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56900)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSfS2-000000006PE-1Pi3
 for buildroot@buildroot.org; Mon, 08 Dec 2025 17:55:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  8 Dec 2025 18:55:09 +0100
Message-ID: <20251208175510.3923692-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251208175510.3923692-1-bernd@kuhls.net>
References: <20251208175510.3923692-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765216511;
 bh=lOFLycaPUeNkNFnjAkmc3G1lz1WfOuBm+Z6Ah6ppTUg=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Huu1rmBtb+QtptYPQO8ZPSFvo2KYhp1yBmjmyky6RY4mWV90DJrRA67hsJXh64hMu
 ac23swp/QYl9EX6OoMLMwUWvXbv6RAPHcL02w/cf8sKb6n8ZevF1bCwDW9Rw73VP8D
 3VCD/jPM5GCiQGrJvj0zLPEqkZ/PhfIASeqCUeyjfYubJazYaOiAO22rW/krsv+gMz
 f2Ch0Z5XzcbjTZMQNUR31zFOiZPVxKyFhE4/8A11mgm3tRQG9kqSe4a/GAniE8fUfK
 MRjSFD0QjsupOUO3eRmrkgcv+3w8ryZrsPIKYm7GO1/RuZu+FBW/4fqOn1xLQN4xzo
 T1Z/oSEKuvqiA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Huu1rmBt
Subject: [Buildroot] [PATCH 2/3] package/dmraid: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Package was abandoned by Fedora:
https://src.fedoraproject.org/rpms/dmraid/c/2a27f40357e52d5497a0245b05624ce37b8474e6?branch=rawhide

Build is broken with newer gcc.

Fixes:
https://autobuild.buildroot.net/results/c79/c79232526ded1d6f1f0f8925f006d7613e22be89/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |  2 -
 Config.in.legacy                              |  6 ++
 DEVELOPERS                                    |  2 -
 package/Config.in                             |  1 -
 .../0001-fix-compilation-under-musl.patch     | 47 ----------
 package/dmraid/Config.in                      | 19 ----
 package/dmraid/S20dmraid                      | 29 ------
 package/dmraid/dmraid.hash                    |  5 -
 package/dmraid/dmraid.mk                      | 25 -----
 .../testing/tests/package/test_ddrescue.py    | 94 -------------------
 .../test_ddrescue/linux-ddrescue.fragment     |  4 -
 11 files changed, 6 insertions(+), 228 deletions(-)
 delete mode 100644 package/dmraid/0001-fix-compilation-under-musl.patch
 delete mode 100644 package/dmraid/Config.in
 delete mode 100644 package/dmraid/S20dmraid
 delete mode 100644 package/dmraid/dmraid.hash
 delete mode 100644 package/dmraid/dmraid.mk
 delete mode 100644 support/testing/tests/package/test_ddrescue.py
 delete mode 100644 support/testing/tests/package/test_ddrescue/linux-ddrescue.fragment

diff --git a/.checkpackageignore b/.checkpackageignore
index 0e202c54fe..51467ef3a7 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -319,8 +319,6 @@ package/dmalloc/0001-configure-fix-build-on-mips.patch lib_patch.Upstream
 package/dmalloc/0003-configure-allow-overriding-some-tests.patch lib_patch.Upstream
 package/dmalloc/0004-Makefile-use-the-configure-detected-or-user-supplied.patch lib_patch.Upstream
 package/dmalloc/0005-configure-use-LD-instead-of-hard-coding-ld.patch lib_patch.Upstream
-package/dmraid/0001-fix-compilation-under-musl.patch lib_patch.Upstream
-package/dmraid/S20dmraid lib_sysv.Variables
 package/docopt-cpp/0001-only-build-one-target-use-BUILD_SHARED_LIBS-where-appropriate.patch lib_patch.Upstream
 package/domoticz/S99domoticz Shellcheck
 package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 214560b4f4..e5d4afd441 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_DMRAID
+	bool "dmraid has been removed"
+	select BR2_LEGACY
+	help
+	  dmraid is unmaintained and has been removed
+
 config BR2_PACKAGE_LIBNIDS
 	bool "libnids has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 5d72f1e417..f0c60fff62 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1872,8 +1872,6 @@ F:	support/testing/tests/package/test_compressor_base.py
 F:	support/testing/tests/package/test_coremark.py
 F:	support/testing/tests/package/test_cryptsetup.py
 F:	support/testing/tests/package/test_cryptsetup/
-F:	support/testing/tests/package/test_ddrescue.py
-F:	support/testing/tests/package/test_ddrescue/
 F:	support/testing/tests/package/test_dieharder.py
 F:	support/testing/tests/package/test_dmidecode.py
 F:	support/testing/tests/package/test_dos2unix.py
diff --git a/package/Config.in b/package/Config.in
index 40be2484bb..2261b3d81a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -490,7 +490,6 @@ endmenu
 	source "package/dfu-programmer/Config.in"
 	source "package/dfu-util/Config.in"
 	source "package/dmidecode/Config.in"
-	source "package/dmraid/Config.in"
 	source "package/dt-utils/Config.in"
 	source "package/dtbocfg/Config.in"
 	source "package/dtv-scan-tables/Config.in"
diff --git a/package/dmraid/0001-fix-compilation-under-musl.patch b/package/dmraid/0001-fix-compilation-under-musl.patch
deleted file mode 100644
index 3d45641b8d..0000000000
--- a/package/dmraid/0001-fix-compilation-under-musl.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 89c7fc15e064dd407e6d5ccefe78985b86b8a036 Mon Sep 17 00:00:00 2001
-From: Brendan Heading <brendanheading@gmail.com>
-Date: Tue, 1 Sep 2015 12:26:36 +0100
-Subject: [PATCH] fix compilation under musl
-
-Patch borrowed from Void Linux :
-
-https://github.com/voidlinux/void-packages/blob/master/srcpkgs/dmraid/patches/25_musl-libc.patch
-
-Upstream package appears dormant, no mailing list and no
-maintenance releases since Nov 2010.
-
-Upstream-Status: dormant
-Signed-off-by: Brendan Heading <brendanheading@gmail.com>
-
----
- 1.0.0.rc16-3/dmraid/include/dmraid/misc.h | 1 +
- 1.0.0.rc16-3/dmraid/lib/device/scan.c     | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/1.0.0.rc16-3/dmraid/include/dmraid/misc.h b/1.0.0.rc16-3/dmraid/include/dmraid/misc.h
-index 247a68e..1b1dfdf 100644
---- a/1.0.0.rc16-3/dmraid/include/dmraid/misc.h
-+++ b/1.0.0.rc16-3/dmraid/include/dmraid/misc.h
-@@ -10,6 +10,7 @@
- 
- #ifndef _MISC_H_
- #define _MISC_H_
-+#include <fcntl.h>
- 
- #define DM_ASSERT(__cond) do { if (!(__cond)) { printf("ASSERT file:%s line:%d fuction:%s cond: %s\n", __FILE__, __LINE__, __FUNCTION__, #__cond); } } while(0);
- 
-diff --git a/1.0.0.rc16-3/dmraid/lib/device/scan.c b/1.0.0.rc16-3/dmraid/lib/device/scan.c
-index a040d53..6897146 100644
---- a/1.0.0.rc16-3/dmraid/lib/device/scan.c
-+++ b/1.0.0.rc16-3/dmraid/lib/device/scan.c
-@@ -10,6 +10,7 @@
- # include <dirent.h>
- # include <paths.h>
- #else
-+# include <paths.h>
- # include <dirent.h>
- # include <mntent.h>
- #endif
--- 
-2.4.3
-
diff --git a/package/dmraid/Config.in b/package/dmraid/Config.in
deleted file mode 100644
index ad86334f1e..0000000000
--- a/package/dmraid/Config.in
+++ /dev/null
@@ -1,19 +0,0 @@
-config BR2_PACKAGE_DMRAID
-	bool "dmraid"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # lvm2
-	depends on BR2_USE_MMU # lvm2
-	depends on !BR2_STATIC_LIBS # lvm2
-	select BR2_PACKAGE_LVM2
-	help
-	  dmraid discovers, activates, deactivates and displays
-	  properties of software RAID sets (eg, ATARAID) and contained
-	  DOS partitions.
-
-	  dmraid uses the Linux device-mapper to create devices with
-	  respective mappings for the ATARAID sets discovered.
-
-	  https://people.redhat.com/~heinzm/sw/dmraid/
-
-comment "dmraid needs a toolchain w/ threads, dynamic library"
-	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dmraid/S20dmraid b/package/dmraid/S20dmraid
deleted file mode 100644
index b3bfdcc84b..0000000000
--- a/package/dmraid/S20dmraid
+++ /dev/null
@@ -1,29 +0,0 @@
-#!/bin/sh
-
-set -e
-
-# try to load module in case that hasn't been done yet
-modprobe dm-mod >/dev/null 2>&1
-
-case "$1" in
-	start|"")
-		echo "Setting up DMRAID devices..."
-		/usr/sbin/dmraid --activate yes --ignorelocking --verbose
-		;;
-
-	stop)
-		echo "Shutting down DMRAID devices... "
-		/usr/sbin/dmraid --activate no --ignorelocking --verbose
-		;;
-
-	restart|force-reload)
-		$0 stop
-		sleep 1
-		$0 start
-		;;
-
-	*)
-		echo "Usage: dmraid {start|stop|restart|force-reload}"
-		exit 1
-		;;
-esac
diff --git a/package/dmraid/dmraid.hash b/package/dmraid/dmraid.hash
deleted file mode 100644
index 0f30864254..0000000000
--- a/package/dmraid/dmraid.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From https://people.redhat.com/~heinzm/sw/dmraid/src/dmraid-1.0.0.rc16-3.tar.bz2.md5.sum
-md5  819338fcef98e8e25819f0516722beeb  dmraid-1.0.0.rc16-3.tar.bz2
-# locally computed
-sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  1.0.0.rc16-3/dmraid/LICENSE_GPL
-sha256  4bc391fcf852e03c3a7564cb146af6e47717562eed296b28bce123ee1b0396b8  1.0.0.rc16-3/dmraid/LICENSE
diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
deleted file mode 100644
index dca9195ef6..0000000000
--- a/package/dmraid/dmraid.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-################################################################################
-#
-# dmraid
-#
-################################################################################
-
-DMRAID_VERSION = 1.0.0.rc16-3
-DMRAID_SOURCE = dmraid-$(DMRAID_VERSION).tar.bz2
-DMRAID_SITE = https://people.redhat.com/~heinzm/sw/dmraid/src
-DMRAID_SUBDIR = $(DMRAID_VERSION)/dmraid
-# lib and tools race with parallel make
-DMRAID_MAKE = $(MAKE1)
-DMRAID_INSTALL_STAGING = YES
-DMRAID_LICENSE = GPL-2.0
-DMRAID_LICENSE_FILES = $(DMRAID_SUBDIR)/LICENSE_GPL $(DMRAID_SUBDIR)/LICENSE
-DMRAID_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -fPIC"
-
-DMRAID_DEPENDENCIES = lvm2
-
-define DMRAID_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/dmraid/S20dmraid \
-		$(TARGET_DIR)/etc/init.d/S20dmraid
-endef
-
-$(eval $(autotools-package))
diff --git a/support/testing/tests/package/test_ddrescue.py b/support/testing/tests/package/test_ddrescue.py
deleted file mode 100644
index 989abc8f01..0000000000
--- a/support/testing/tests/package/test_ddrescue.py
+++ /dev/null
@@ -1,94 +0,0 @@
-import os
-
-import infra.basetest
-
-
-class TestDdrescue(infra.basetest.BRTest):
-
-    # A specific configuration is needed for testing ddrescue:
-    # - A kernel config fragment enables loop blk dev and device
-    #   mapper dm-dust, which are used to simulate a failing storage
-    #   block device.
-    # - dmraid user space package is needed to configure dm-dust
-    config = \
-        """
-        BR2_aarch64=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
-        BR2_LINUX_KERNEL=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.15"
-        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
-        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
-        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-        BR2_PACKAGE_DDRESCUE=y
-        BR2_PACKAGE_DMRAID=y
-        BR2_TARGET_ROOTFS_CPIO=y
-        BR2_TARGET_ROOTFS_CPIO_GZIP=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """.format(
-            infra.filepath("tests/package/test_ddrescue/linux-ddrescue.fragment")
-        )
-
-    def test_run(self):
-        img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
-        kern = os.path.join(self.builddir, "images", "Image")
-        self.emulator.boot(arch="aarch64",
-                           kernel=kern,
-                           kernel_cmdline=["console=ttyAMA0"],
-                           options=["-M", "virt", "-cpu", "cortex-a57", "-m", "256M", "-initrd", img])
-        self.emulator.login()
-
-        # Test variables:
-        dev_img = "/tmp/dev.img"
-        lo_dev = "/dev/loop0"
-        dm_dev_name = "dust0"
-        dm_dev = f"/dev/mapper/{dm_dev_name}"
-        ddrescue_img = "/tmp/ddrescue.img"
-
-        # Test the program can execute
-        self.assertRunOk("ddrescue --version")
-
-        # Create a 1MB file of zeroes for initial loopback block device
-        self.assertRunOk(f"dd if=/dev/zero of={dev_img} bs=1M count=1")
-
-        # Setup lookback block device
-        self.assertRunOk(f"losetup {lo_dev} {dev_img}")
-
-        # Create and setup dm-dust to simulate a failing block device
-        # The dev_img file is 1MB: 2048 blocks of 512 bytes each
-        self.assertRunOk(f"dmsetup create {dm_dev_name} --table '0 2048 dust {lo_dev} 0 512'")
-
-        # Add few bad blocks and enable I/O error emulation
-        for badblock in [30, 40, 50, 60]:
-            self.assertRunOk(f"dmsetup message {dm_dev_name} 0 addbadblock {badblock}")
-        self.assertRunOk(f"dmsetup message {dm_dev_name} 0 enable")
-
-        # Show device mapper status, to make debugging easier
-        self.assertRunOk(f"dmsetup status {dm_dev_name}")
-
-        # A normal 'dd' is expected to fail with I/O error
-        cmd = f"dd if={dm_dev} of=/dev/null bs=512"
-        _, exit_code = self.emulator.run(cmd)
-        self.assertNotEqual(exit_code, 0)
-
-        # Where a normal 'dd' fails, 'ddrescue' is expected to succeed
-        self.assertRunOk(f"ddrescue {dm_dev} {ddrescue_img}")
-
-        # ddrescue does not normally write any output data when there
-        # is I/O error on the input. The intent is to preserve any
-        # data that could have been read in a previous pass. There is
-        # one exception, when the output is a non-existing regular
-        # file, ddrescue will initialize it with zeroes the first
-        # time. Since the original image file was also including
-        # zeroes, the recovered image is expected to be the same as
-        # the original one. See ddrescue manual:
-        # https://www.gnu.org/software/ddrescue/manual/ddrescue_manual.html#Introduction
-        # "Ddrescue does not write zeros to the output when it finds
-        # bad sectors in the input, and does not truncate the output
-        # file if not asked to."
-        # https://www.gnu.org/software/ddrescue/manual/ddrescue_manual.html#Algorithm
-        # "If the output file is a regular file created by ddrescue,
-        # the areas marked as bad-sector will contain zeros."
-        self.assertRunOk(f"cmp {dev_img} {ddrescue_img}")
diff --git a/support/testing/tests/package/test_ddrescue/linux-ddrescue.fragment b/support/testing/tests/package/test_ddrescue/linux-ddrescue.fragment
deleted file mode 100644
index 5cbe18a89f..0000000000
--- a/support/testing/tests/package/test_ddrescue/linux-ddrescue.fragment
+++ /dev/null
@@ -1,4 +0,0 @@
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_MD=y
-CONFIG_BLK_DEV_DM=y
-CONFIG_DM_DUST=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
