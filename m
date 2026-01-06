Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76F1CEFCFE
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 20:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAFA2408FE;
	Tue,  6 Jan 2026 20:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OHGU0dIQUunG; Tue,  6 Jan 2026 20:04:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A613E40908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767729883;
	bh=DG1KBbm3Nrcpq6/RIkTJgvbz7Whf1/shGH2WXvwToNQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W2Uj4Qef6KOmErHlN45k3sfHs7bXaeQs5wY6GdBIdx3iwW026p+dvhsxifRM20Ptc
	 5TB9r7qjDIjUrNli55RvE46VBKl3D3KRuXhh9wlAEzDnyFQccG+gNhWnEKM/EMwyV+
	 NAGrbtVmpB/ZMOiupGfzO0wP8cwzF849TZD+IdpxIQoWvzBViTMLDe+VFct5w6pXL0
	 XlsILBQyaDhXVU1cTt7VchhEv7R9N+iOBMKl964i3dG5Tq3ZWS+DJnOa85hNDaOMgv
	 NuFnmDfBULCAdqqqTkrluewI3ApQ2WC8vzWKpz9DTAJmU2W52KgGi6Gj3jJ3qdB35Q
	 pui1Tx9mu2s9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A613E40908;
	Tue,  6 Jan 2026 20:04:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C4B5C249
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6A2E60B93
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WXiEKbLJLggq for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 20:04:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6358B60AC0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6358B60AC0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6358B60AC0
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:04:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7C416A4C3999
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 21:01:25 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48554)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vdDF1-000000002Vv-1KUC
 for buildroot@buildroot.org; Tue, 06 Jan 2026 20:01:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Jan 2026 21:01:14 +0100
Message-ID: <20260106200115.1985522-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106200115.1985522-1-bernd@kuhls.net>
References: <20260106200115.1985522-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767729685;
 bh=0lQy65CWH+5WxsLe2mpNLTNMKn8MX5l3DpYaWYvO/HA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=FE7eh5zxwOETlyg//n/d7TTqXWLU9zLeu5IUllTjYtkXKQ3tWue8SwmuUAVKOeVro
 C/8NjXQ8TeXEz/mYrpiEOpBx4kRtKAkDIHrboaR0sFWdMJYFlZBYndpA2JLQ6VxsIy
 PfqpvwYb43qa7YSZgS11+2XvrDqPTho2TM7wBdwj6l3A6zOuKn5bBQB+CL7bD1p7sX
 LSz7KppNjHQTX+843hjMwSAXNY5JOu+sttY4vyknRK0Hpgw8IU0st2yG4oW29uuS1b
 G8AhCaS5jOkM6DLqdJs3PoKj/kGEheHOHgDbm80PpCvOzsaf7hEq2JWSuIGh8+5x3v
 VAfwQzq9kEwnA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=FE7eh5zx
Subject: [Buildroot] [PATCH v2 9/9] package/lockdev: remove package
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

The package was removed from Debian in 2016:
https://tracker.debian.org/news/738763/removed-103-16-from-unstable/
"Obsolete and replaced by flock"

and causes build errors with musl.

Fixes:
https://autobuild.buildroot.net/results/9fa/9fa9323bac3ee1720396bb34fefb3017125e5a85/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                              |  7 +++
 package/Config.in                             |  1 -
 ...-static-library-and-headers-separate.patch | 44 --------------
 package/lockdev/Config.in                     |  6 --
 package/lockdev/lockdev.hash                  |  5 --
 package/lockdev/lockdev.mk                    | 58 -------------------
 6 files changed, 7 insertions(+), 114 deletions(-)
 delete mode 100644 package/lockdev/0001-Makefile-install-static-library-and-headers-separate.patch
 delete mode 100644 package/lockdev/Config.in
 delete mode 100644 package/lockdev/lockdev.hash
 delete mode 100644 package/lockdev/lockdev.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index e97fd0ebb2..4d9e2df986 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_LOCKDEV
+	bool "lockdev removed"
+	select BR2_LEGACY
+	help
+	  lockdev was no longer maintained upstream, so it has been
+	  dropped.
+
 config BR2_PACKAGE_DBUS_TRIGGERD
 	bool "dbus-triggerd removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 52ca6d19d3..0f96ec2527 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1698,7 +1698,6 @@ menu "Filesystem"
 	source "package/liblockfile/Config.in"
 	source "package/libnfs/Config.in"
 	source "package/libsysfs/Config.in"
-	source "package/lockdev/Config.in"
 	source "package/physfs/Config.in"
 endmenu
 
diff --git a/package/lockdev/0001-Makefile-install-static-library-and-headers-separate.patch b/package/lockdev/0001-Makefile-install-static-library-and-headers-separate.patch
deleted file mode 100644
index d5a498a19e..0000000000
--- a/package/lockdev/0001-Makefile-install-static-library-and-headers-separate.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 0dcd2368c3e23a5cc1cc4a979d9c241ed9302236 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Sun, 4 Jan 2015 16:06:07 +0100
-Subject: [PATCH] Makefile: install static library and headers separately
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- Makefile | 12 +++++++-----
- 1 file changed, 7 insertions(+), 5 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index e27dcbd..ecf52d1 100644
---- a/Makefile
-+++ b/Makefile
-@@ -45,12 +45,10 @@ perl-lib:	static
- 	cd LockDev && make OPTIMIZE="-O2 -g -Wall"
- 	cd LockDev && make test
- 
--.PHONY: install install_dev install_dbg install_doc install_run 
--install:	install_dev install_dbg install_doc install_run
-+.PHONY: install install_dev install_dbg install_doc install_run install_static
-+install:	install_dev install_dbg install_doc install_run install_static
- 
--install_dev:	${static} src/lockdev.h
--	install -m755 -d	${libdir}
--	install -m644 ${static}	${libdir}
-+install_dev:	src/lockdev.h
- 	install -m755 -d	${incdir}
- 	install -m644 src/lockdev.h	${incdir}
- 	install -m644 src/ttylock.h	${incdir}
-@@ -69,6 +67,10 @@ install_doc:	docs/lockdev.3
- 	install -m755 -d	${mandir}/man3
- 	install -m644 docs/lockdev.3	${mandir}/man3
- 
-+install_static:	${static}
-+	install -m755 -d	${libdir}
-+	install -m644 ${static}	${libdir}
-+
- install_run:	${shared}
- 	install -m755 -d	${libdir}
- 	install -m644 ${shared}	${libdir}
--- 
-1.9.3
-
diff --git a/package/lockdev/Config.in b/package/lockdev/Config.in
deleted file mode 100644
index 4b386f4ab0..0000000000
--- a/package/lockdev/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_LOCKDEV
-	bool "lockdev"
-	help
-	  Library for locking devices.
-
-	  No upstream site, primary site is Debian.
diff --git a/package/lockdev/lockdev.hash b/package/lockdev/lockdev.hash
deleted file mode 100644
index e32466dfe7..0000000000
--- a/package/lockdev/lockdev.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/l/lockdev/lockdev_1.0.3-1.6.dsc
-sha256  ccae635d7ac3fdd50897eceb250872b3d9a191d298f213e7f0c836910d869f82  lockdev_1.0.3.orig.tar.gz
-sha256  a5405c6ee5e97e45eeb1c81330a7e9f444a58bda5e6771fa30007516c115007e  lockdev_1.0.3-1.6.diff.gz
-# Locally calculated
-sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  LICENSE
diff --git a/package/lockdev/lockdev.mk b/package/lockdev/lockdev.mk
deleted file mode 100644
index e491b132d3..0000000000
--- a/package/lockdev/lockdev.mk
+++ /dev/null
@@ -1,58 +0,0 @@
-################################################################################
-#
-# lockdev
-#
-################################################################################
-
-LOCKDEV_VERSION_MAJOR = 1
-LOCKDEV_VERSION = $(LOCKDEV_VERSION_MAJOR).0.3
-LOCKDEV_SOURCE = lockdev_$(LOCKDEV_VERSION).orig.tar.gz
-LOCKDEV_PATCH = lockdev_$(LOCKDEV_VERSION)-1.6.diff.gz
-LOCKDEV_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/l/lockdev
-LOCKDEV_LICENSE = LGPL-2.1
-LOCKDEV_LICENSE_FILES = LICENSE
-LOCKDEV_INSTALL_STAGING = YES
-
-ifeq ($(BR2_STATIC_LIBS),y)
-LOCKDEV_BUILD_ARGS = static
-LOCKDEV_INSTALL_ARGS = install_static
-else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
-LOCKDEV_BUILD_ARGS = static shared
-LOCKDEV_INSTALL_ARGS = install_run install_static
-else # BR2_SHARED_LIBS
-LOCKDEV_BUILD_ARGS = shared
-LOCKDEV_INSTALL_ARGS = install_run
-endif
-
-# Make the code believe we are using a C library compatible with
-# glibc, which for the purpose of lockdev is actually true.
-ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
-LOCKDEV_BUILD_ARGS += CFLAGS="$(TARGET_CFLAGS) -D__GNU_LIBRARY__"
-endif
-
-ifeq ($(BR2_SHARED_STATIC_LIBS)$(BR2_SHARED_LIBS),y)
-define LOCKDEV_CREATE_LINKS_STAGING
-	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so
-	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(STAGING_DIR)/usr/lib/liblockdev.so.$(LOCKDEV_VERSION_MAJOR)
-endef
-
-define LOCKDEV_CREATE_LINKS_TARGET
-	ln -sf liblockdev.$(LOCKDEV_VERSION).so $(TARGET_DIR)/usr/lib/liblockdev.so.$(LOCKDEV_VERSION_MAJOR)
-endef
-endif
-
-define LOCKDEV_BUILD_CMDS
-	$(MAKE1) $(TARGET_CONFIGURE_OPTS) -C $(@D) $(LOCKDEV_BUILD_ARGS)
-endef
-
-define LOCKDEV_INSTALL_STAGING_CMDS
-	$(MAKE1) basedir=$(STAGING_DIR)/usr -C $(@D) $(LOCKDEV_INSTALL_ARGS) install_dev
-	$(LOCKDEV_CREATE_LINKS_STAGING)
-endef
-
-define LOCKDEV_INSTALL_TARGET_CMDS
-	$(MAKE1) basedir=$(TARGET_DIR)/usr -C $(@D) $(LOCKDEV_INSTALL_ARGS)
-	$(LOCKDEV_CREATE_LINKS_TARGET)
-endef
-
-$(eval $(generic-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
