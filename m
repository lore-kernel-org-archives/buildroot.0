Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639EDC30653
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 22:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C53D341718;
	Thu, 27 Jun 2024 22:02:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eVwFwnqwPqKU; Thu, 27 Jun 2024 22:02:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECB9F41713
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECB9F41713;
	Thu, 27 Jun 2024 22:02:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 690711BF576
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 22:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 539F3841C8
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 22:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AIXYqzBJvypm for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 22:02:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 01C73841C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01C73841C6
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01C73841C6
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 22:02:27 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sMxCD-008KoX-0e; Fri, 28 Jun 2024 00:02:25 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 4da14329;
 Thu, 27 Jun 2024 22:02:23 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jun 2024 01:02:19 +0300
Message-ID: <20240627220223.6687-3-aperez@igalia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240627220223.6687-1-aperez@igalia.com>
References: <20240627220223.6687-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=71kFGwP9O3tqH8yofxzUkh41E1WrJCX8XFgA+lnjAHA=; b=rb8T8MJ6AOBWmXJGITRZevwbxF
 2kCM60OkV1ZAIH4+IyiPeszri/r9p4yp7rbxIrRptib44zwPirxy6V26PaoOTQJXiQt2rSbFGSBql
 lqWPDWzzoW5uQq+C9Dkepc8+xUGkI/ihO6U2hiO+z7FDiKgrBMpS9ubHYW4HfMpnEX4RN+LadK2q5
 aD5VHaokE9tklnap9AvDJvXnK/9qN8oZxzG3FmTGxz+Zm9PvkPEcFlMOmlRDu6EUL9JqV7A0rwu2i
 jHbjf7Jjl9QmeUt44HhcjnC6TNOB2Ta0ky2K5/853U3iIyyBI2nX8dMAZzO38AC+DbXSOeBXsKz3F
 +ekfZCTg==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=rb8T8MJ6
Subject: [Buildroot] [PATCH 2/2] package/sysprof: update to version 46.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Will Newton <will.newton@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bring Sysprof twelve years into the future by updating it to the most
recent release. The GUI now uses GTK4, for which there is not yet a
package, so for now the option is removed.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 .../sysprof/0001-define-NT_GNU_BUILD_ID.patch | 22 -----------
 package/sysprof/Config.in                     | 37 ++++++++-----------
 package/sysprof/sysprof.hash                  |  8 ++--
 package/sysprof/sysprof.mk                    | 26 +++++++++----
 4 files changed, 40 insertions(+), 53 deletions(-)
 delete mode 100644 package/sysprof/0001-define-NT_GNU_BUILD_ID.patch

diff --git a/package/sysprof/0001-define-NT_GNU_BUILD_ID.patch b/package/sysprof/0001-define-NT_GNU_BUILD_ID.patch
deleted file mode 100644
index dcc2cbe67cc..00000000000
--- a/package/sysprof/0001-define-NT_GNU_BUILD_ID.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-On uclibc elf.h does not have GNU extentions but we need this define
-so we define it locally if its not getting it from elf.h
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
-Index: git/elfparser.h
-===================================================================
---- git.orig/elfparser.h	2011-07-16 18:57:41.000000000 -0700
-+++ git/elfparser.h	2011-07-16 20:28:54.733829895 -0700
-@@ -17,6 +17,10 @@
-  */
- #include <glib.h>
- 
-+#ifndef NT_GNU_BUILD_ID
-+#define NT_GNU_BUILD_ID 3
-+#endif
-+
- typedef struct ElfSym ElfSym;
- typedef struct ElfParser ElfParser;
- 
diff --git a/package/sysprof/Config.in b/package/sysprof/Config.in
index 3913274be4f..4ea1d3ebf1d 100644
--- a/package/sysprof/Config.in
+++ b/package/sysprof/Config.in
@@ -1,31 +1,26 @@
 config BR2_PACKAGE_SYSPROF
 	bool "sysprof"
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	# In its util.h file, sysprof contains architecture-specific
-	# code
-	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_sh4a || BR2_sh4aeb
+	depends on BR2_USE_WCHAR # glib2, libdex, json-glib
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, libdex, json-glib, polkit
+	depends on BR2_USE_MMU # glib2, libdex, json-glib
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libunwind, polkit
+	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS # polkit
+	depends on !BR2_OPTIMIZE_FAST # polkit
+	select BR2_PACKAGE_JSON_GLIB
+	select BR2_PACKAGE_LIBDEX
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBUNWIND
+	select BR2_PACKAGE_POLKIT
 	help
 	  Sysprof is a statistical, system-wide profiler that can
 	  profile user and kernel code using the perf API.
 
 	  http://sysprof.com
 
-if BR2_PACKAGE_SYSPROF
-
-config BR2_PACKAGE_SYSPROF_GUI
-	bool "sysprof GUI"
-	depends on BR2_PACKAGE_LIBGTK2
-	select BR2_PACKAGE_LIBGLADE
-	select BR2_PACKAGE_GDK_PIXBUF
-	help
-	  GUI for the sysprof system-wide statistical profiler.
-
-endif
-
-comment "sysprof needs a toolchain w/ wchar, threads"
+comment "sysprof needs a toolchain w/ dynamic libraray, wchar, threads, gcc >= 7"
 	depends on BR2_USE_MMU
-	depends on BR2_i386 || BR2_x86_64 || BR2_powerpc || BR2_sh4a || BR2_sh4aeb
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+		!BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS || \
+		BR2_STATIC_LIBS || BR2_OPTIMIZE_FAST
diff --git a/package/sysprof/sysprof.hash b/package/sysprof/sysprof.hash
index 4ce206be0bd..f21e7621e14 100644
--- a/package/sysprof/sysprof.hash
+++ b/package/sysprof/sysprof.hash
@@ -1,3 +1,5 @@
-# Locally calculated
-sha256  baf03c6fc01a845c705873e6fc7927aa89539dcda6963f9ec4c8eb4c086a64f1  sysprof-1.2.0.tar.gz
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+# From https://download.gnome.org/sources/sysprof/46/sysprof-46.0.sha256sum
+sha256  73aa7e75ebab3e4e0946a05a723df7e6ee4249e3b9e884dba35500aba2a1d176  sysprof-46.0.tar.xz
+
+# License files
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
index 9823416e3fd..4df2f38a8b9 100644
--- a/package/sysprof/sysprof.mk
+++ b/package/sysprof/sysprof.mk
@@ -4,14 +4,26 @@
 #
 ################################################################################
 
-SYSPROF_VERSION = 1.2.0
-SYSPROF_SITE = http://sysprof.com
-SYSPROF_DEPENDENCIES = libglib2
-SYSPROF_LICENSE = GPL-2.0+
+SYSPROF_VERSION_MAJOR = 46
+SYSPROF_VERSION = $(SYSPROF_VERSION_MAJOR).0
+SYSPROF_SOURCE = sysprof-$(SYSPROF_VERSION).tar.xz
+SYSPROF_SITE = https://download.gnome.org/sources/sysprof/$(SYSPROF_VERSION_MAJOR)
+SYSPROF_LICENSE = GPL-3.0+
 SYSPROF_LICENSE_FILES = COPYING
+SYSPROF_DEPENDENCIES = libglib2 libdex libunwind json-glib polkit
+SYSPROF_CONF_OPTS += \
+	-Ddevelopment=false \
+	-Dexamples=false \
+	-Dgtk=false \
+	-Dhelp=false \
+	-Dinstall-static=false \
+	-Dlibsysprof=true \
+	-Dtests=false \
+	-Dtools=true \
+	-Dsystemdunitdir=/usr/lib/systemd/system
 
-ifeq ($(BR2_PACKAGE_SYSPROF_GUI),y)
-SYSPROF_DEPENDENCIES += libgtk2 libglade gdk-pixbuf
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+SYSPROF_DEPENDENCIES += systemd
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
