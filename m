Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC464CCFA1E
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 11:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 925024064D;
	Sun,  9 Nov 2025 11:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nnn5q1FWYuzD; Sun,  9 Nov 2025 11:04:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 426784065B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 426784065B;
	Sun,  9 Nov 2025 11:04:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D37F1CD
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 11:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2489F4064D
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 11:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8lgO9CrTGhF9 for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 11:04:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F35094065B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F35094065B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F35094065B
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 11:04:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd38.dip0.t-ipconnect.de [84.161.189.56])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 019A8A4C49B8
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 12:03:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47282)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vI3DB-000000002Wi-2Ryc
 for buildroot@buildroot.org; Sun, 09 Nov 2025 11:03:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  9 Nov 2025 12:03:57 +0100
Message-ID: <20251109110357.3158832-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251109110357.3158832-1-bernd@kuhls.net>
References: <20251109110357.3158832-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762686238;
 bh=rXg+yULjI05wPW4nFkPfOCHy23fMtigzpm0weljR3dw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=rpIH0dizyTU+1AlQqmWzEIFHgnnX/hBWiO5DaQ9rRy/otLREVdXU7m1JRdDBqHHU7
 XCBdGZFgbuF0zpUegxrqwoo/4wmOczi/nBSn4mGBViHfFgWqjOxdfh48UrtHOueYwy
 HPzehFGrifm2EA4pe0KWCkiQeHjQ0BfMK/KxAugB0HWbug03BYmZ5wYsSuuk+j4ajL
 k33lKG2fifG3ni2TvkIWvJJJIDQyB1rc2lLdNJyspsdPefWnCwHx9snqvKeIOiDXxi
 mzajoHjXDUFrGVtD+QIOmRNDiAFct1DzEZtXksyA1WEJntIKY1eGDp/AB16bIuvUtp
 SU2vav/heOpIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=rpIH0diz
Subject: [Buildroot] [PATCH 2/2] package/nbd: bump version to 3.26.1
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

Added two upstream patches to fix build errors, autoreconf is required.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...he-check-no-cases-of-enable_manpages.patch | 56 +++++++++++++++++++
 ...03-fix-generation-of-systemd-service.patch | 56 +++++++++++++++++++
 package/nbd/nbd.hash                          |  2 +-
 package/nbd/nbd.mk                            | 10 +++-
 4 files changed, 122 insertions(+), 2 deletions(-)
 create mode 100644 package/nbd/0002-Fix-the-check-no-cases-of-enable_manpages.patch
 create mode 100644 package/nbd/0003-fix-generation-of-systemd-service.patch

diff --git a/package/nbd/0002-Fix-the-check-no-cases-of-enable_manpages.patch b/package/nbd/0002-Fix-the-check-no-cases-of-enable_manpages.patch
new file mode 100644
index 0000000000..e27f8c188d
--- /dev/null
+++ b/package/nbd/0002-Fix-the-check-no-cases-of-enable_manpages.patch
@@ -0,0 +1,56 @@
+From f0418b0d8b54c21a1e5b0c6dce3277e938d07e7c Mon Sep 17 00:00:00 2001
+From: Dave Jones <dave.jones@canonical.com>
+Date: Thu, 14 Mar 2024 11:13:05 +0000
+Subject: [PATCH] Fix the check & no cases of enable_manpages
+
+Currently, running "configure --disable-manpages" while docbook2man *is*
+installed results in the error "don't know what to do here" when it
+should disable manpages.
+
+There also appears to be a missing conditional at the start of the line;
+there's closing un-matched ]) at the end of the line. Still, at this
+point the check can be done in pure shell; no need for AC macros. I've
+also removed the confusing m4_divert_text call on the check case. Not
+sure why that was there, but it appears unnecessary.
+
+Upstream: https://github.com/NetworkBlockDevice/nbd/commit/f0418b0d8b54c21a1e5b0c6dce3277e938d07e7c
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.ac | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5e1b53c..0dccafd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -328,7 +328,7 @@ AC_MSG_CHECKING([whether man pages are requested])
+ AC_ARG_ENABLE([manpages],
+ 	AS_HELP_STRING([--disable-manpages], [Do not install man pages]),
+ 	[],
+-	[: m4_divert_text([DEFAULTS], [enable_manpages=check])]
++	[enable_manpages=check]
+ )
+ AC_MSG_RESULT([$enable_manpages])
+ 
+@@ -337,9 +337,14 @@ AS_IF([test "x$enable_manpages" != "xno"], [
+ 	])
+ AS_IF([test "x$enable_manpages" = "xyes" -a "x$DB2M" = "x"], [
+        AC_MSG_ERROR([docbook2man not found, but is required to build manpages])
+-	],
+-      [test "x$DB2M" != "x"], [enable_manpages=yes],
+-       [AC_MSG_ERROR([don't know what to do here])])
++	])
++if test "x$enable_manpages" = "xcheck"; then
++	if test "x$DB2M" = "x"; then
++		enable_manpages=no
++	else
++		enable_manpages=yes
++	fi
++fi
+ AC_MSG_CHECKING([whether to build manpages])
+ AC_MSG_RESULT([$enable_manpages])
+ 
+-- 
+2.47.3
+
diff --git a/package/nbd/0003-fix-generation-of-systemd-service.patch b/package/nbd/0003-fix-generation-of-systemd-service.patch
new file mode 100644
index 0000000000..d001d1e36d
--- /dev/null
+++ b/package/nbd/0003-fix-generation-of-systemd-service.patch
@@ -0,0 +1,56 @@
+From f8d7d3dbf1ef2ef84c92fe375ebc8674a79e25c2 Mon Sep 17 00:00:00 2001
+From: Christian Hesse <mail@eworm.de>
+Date: Mon, 4 Mar 2024 11:24:57 +0100
+Subject: [PATCH] fix generation of systemd service
+
+The shell template is no longer required to generate man pages, so more
+it to systemd/ and ship it in tarball.
+
+Signed-off-by: Wouter Verhelst <w@uter.be>
+
+Upstream: https://github.com/NetworkBlockDevice/nbd/commit/f8d7d3dbf1ef2ef84c92fe375ebc8674a79e25c2
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Bernd: rebased for 3.26.1 tarball which does not contain man/sh.tmpl]
+---
+ systemd/Makefile.am | 6 +++---
+ systemd/sh.tmpl     | 7 +++++++
+ 3 files changed, 10 insertions(+), 10 deletions(-)
+ delete mode 100644 man/sh.tmpl
+ create mode 100644 systemd/sh.tmpl
+
+diff --git a/systemd/Makefile.am b/systemd/Makefile.am
+index f771dce..204f06f 100644
+--- a/systemd/Makefile.am
++++ b/systemd/Makefile.am
+@@ -5,11 +5,11 @@
+ 
+ noinst_DATA = nbd@.service
+ DISTCLEANFILES = nbd@.service
+-EXTRA_DIST=nbd@.service.tmpl
++EXTRA_DIST=nbd@.service.tmpl sh.tmpl
+ 
+ nbd@.service: nbd@.service.sh
+ 	sh nbd@.service.sh > nbd@.service
+ 
+-nbd@.service.sh.in: nbd@.service.tmpl ../man/sh.tmpl
+-	cat ../man/sh.tmpl nbd@.service.tmpl > nbd@.service.sh.in
++nbd@.service.sh.in: nbd@.service.tmpl sh.tmpl
++	cat sh.tmpl nbd@.service.tmpl > nbd@.service.sh.in
+ 	echo EOF >> nbd@.service.sh.in
+diff --git a/systemd/sh.tmpl b/systemd/sh.tmpl
+new file mode 100644
+index 0000000..d97aa3f
+--- /dev/null
++++ b/systemd/sh.tmpl
+@@ -0,0 +1,7 @@
++#!/bin/sh
++
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++sysconfdir=@sysconfdir@
++
++cat <<EOF
+-- 
+2.47.3
+
diff --git a/package/nbd/nbd.hash b/package/nbd/nbd.hash
index 9fe95441af..d4f3693463 100644
--- a/package/nbd/nbd.hash
+++ b/package/nbd/nbd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f5c8fd0fcb57b1c926594d0e57f356432ee08678bef1d40d088f0830f0cbdd0a  nbd-3.25.tar.xz
+sha256  f0cf509fa5b20b1a07f7904eb637e9b47d3e30b6ed6f00075af5d8b701c78fef  nbd-3.26.1.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index b077e43624..4eb089e23e 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -4,11 +4,19 @@
 #
 ################################################################################
 
-NBD_VERSION = 3.25
+NBD_VERSION = 3.26.1
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.xz
 NBD_SITE = https://github.com/NetworkBlockDevice/nbd/releases/download/nbd-$(NBD_VERSION)
 NBD_CONF_OPTS = --enable-lfs
 NBD_DEPENDENCIES = host-bison host-pkgconf libglib2
+
+# 0002-Fix-the-check-no-cases-of-enable_manpages.patch
+# 0003-fix-generation-of-systemd-service.patch
+NBD_AUTORECONF = YES
+# needed for autoreconf
+NBD_DEPENDENCIES += host-autoconf-archive
+NBD_AUTORECONF_OPTS = --include=$(HOST_DIR)/share/autoconf-archive
+
 NBD_LICENSE = GPL-2.0
 NBD_LICENSE_FILES = COPYING
 NBD_CPE_ID_VENDOR = network_block_device_project
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
