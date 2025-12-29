Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AF0E92FCB
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 18:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF96E60642;
	Mon, 29 Dec 2025 18:00:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNkfVuazFivi; Mon, 29 Dec 2025 18:00:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE6F160B35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767031207;
	bh=1/UjYZWOXJRe6IqAbHj6lD6kgr/wsLTe2Ono14MAaD8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U0+VM5vbgQUafaw1KTf97BsjZ/7caze2Nw4mza7Md2GVtsd1DFizUYHRdL9nN6Whi
	 /p0RtT+Yc1ECk6a7eAQ5ZHKJXe7glIlZTyIaInRi1y8Ri8ipKomSFaoXYoAZGynNQi
	 HGMvYF2ECQL3PiuEuPdFKpDgrFFCL9HxBtqA+l0Eg9/yrj1ozm6vLkE8UQjFzK4NNX
	 o4kiGvFwr21HjcCXcqfGR0Pfo8T81KYZ4qlChMvhPjLto15KHK52I9bzdQKJy7db0K
	 ++pDb6qlv1hD/5OPQUB5IhP3VafXra2gLudpG8se7isINbZYGJ3KQUrveDwtjixLtO
	 XeDS1VDX4w7DA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE6F160B35;
	Mon, 29 Dec 2025 18:00:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C0FDD8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 887E980B88
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9DQOb7kP2NuC for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 18:00:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 679BF809EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 679BF809EB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 679BF809EB
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 18:00:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E53EDA4C257C;
 Mon, 29 Dec 2025 18:59:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53686)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vaHWt-000000002P5-0qvo;
 Mon, 29 Dec 2025 17:59:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Romain Naour <romain.naour@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Mon, 29 Dec 2025 18:59:10 +0100
Message-ID: <20251229175938.3549882-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251229175938.3549882-1-bernd@kuhls.net>
References: <20251229175938.3549882-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767031179;
 bh=cs88vtc3Df7aCmXhefdm20fyhnd5LojnLMkKWdiIL14=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=arOTLuJzSX5X8DRFDJVp6iycgFli+csCJQDiLIuelUPJ4ttnbJQRRCfjZq9qGw+Ww
 t9H+S6HRER0zmGSYz0EfVA3D/4FmjAJs0vDc/n1AU3+3czWtCtq/z1kTfDUTydsg1s
 kXQfBSPjNDiLb/5GEyEtNZ2gpDinJSNiSlpqHGTGlbWmVjfaIdpWk/IzkcNTT3m7nf
 H6nvLOw32fwNdUJJ89RSJDXSql4E9Ac2QnrgOEfr9PZVIGJISOgAzegbxff0S8UDis
 yJUOShZUgNJLZU0VLlLE71xwWihDy4mUozWcH4w9D9CbYNDbxKpHT9u8elC4UK2N1k
 /djQ8rD9tycvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=arOTLuJz
Subject: [Buildroot] [PATCH v8 02/29] package/dmraid: remove package
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
 Config.in.legacy                              |  6 +++
 DEVELOPERS                                    |  2 -
 package/Config.in                             |  1 -
 .../0001-fix-compilation-under-musl.patch     | 47 -------------------
 package/dmraid/Config.in                      | 19 --------
 package/dmraid/S20dmraid                      | 29 ------------
 package/dmraid/dmraid.hash                    |  5 --
 package/dmraid/dmraid.mk                      | 25 ----------
 9 files changed, 6 insertions(+), 130 deletions(-)
 delete mode 100644 package/dmraid/0001-fix-compilation-under-musl.patch
 delete mode 100644 package/dmraid/Config.in
 delete mode 100644 package/dmraid/S20dmraid
 delete mode 100644 package/dmraid/dmraid.hash
 delete mode 100644 package/dmraid/dmraid.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 1652303dd3..a1166aabc9 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -317,8 +317,6 @@ package/dmalloc/0001-configure-fix-build-on-mips.patch lib_patch.Upstream
 package/dmalloc/0003-configure-allow-overriding-some-tests.patch lib_patch.Upstream
 package/dmalloc/0004-Makefile-use-the-configure-detected-or-user-supplied.patch lib_patch.Upstream
 package/dmalloc/0005-configure-use-LD-instead-of-hard-coding-ld.patch lib_patch.Upstream
-package/dmraid/0001-fix-compilation-under-musl.patch lib_patch.Upstream
-package/dmraid/S20dmraid lib_sysv.Variables
 package/docopt-cpp/0001-only-build-one-target-use-BUILD_SHARED_LIBS-where-appropriate.patch lib_patch.Upstream
 package/domoticz/S99domoticz Shellcheck
 package/dovecot/0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 4ed11ff095..bcd78cc67c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
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
index b9750d25b6..3a0b2aafa2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1884,8 +1884,6 @@ F:	support/testing/tests/package/test_compressor_base.py
 F:	support/testing/tests/package/test_coremark.py
 F:	support/testing/tests/package/test_cryptsetup.py
 F:	support/testing/tests/package/test_cryptsetup/
-F:	support/testing/tests/package/test_ddrescue.py
-F:	support/testing/tests/package/test_ddrescue/
 F:	support/testing/tests/package/test_dieharder.py
 F:	support/testing/tests/package/test_dmidecode.py
 F:	support/testing/tests/package/test_dos2unix.py
diff --git a/package/Config.in b/package/Config.in
index 3059b144e2..f516d3f883 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -492,7 +492,6 @@ endmenu
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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
