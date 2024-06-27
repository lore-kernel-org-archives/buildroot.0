Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9ED0C2BD09
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 22:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15DE34173A;
	Thu, 27 Jun 2024 22:02:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RbeoKsBu7rRe; Thu, 27 Jun 2024 22:02:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E8B04173E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E8B04173E;
	Thu, 27 Jun 2024 22:02:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 350401BF576
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 22:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 234F7841C6
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 22:02:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lKStfFK1UWT8 for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 22:02:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8BAB4841C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BAB4841C5
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BAB4841C5
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 22:02:26 +0000 (UTC)
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sMxCC-008KoX-Hg; Fri, 28 Jun 2024 00:02:24 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 56febe86;
 Thu, 27 Jun 2024 22:02:23 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jun 2024 01:02:18 +0300
Message-ID: <20240627220223.6687-2-aperez@igalia.com>
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
 bh=/lWDMT0jsYaM9yd5ABjIgeunK/S2RcHPHVxvqm5LSaU=; b=Tsm5OcFEPVsY24NXFK5zX7uUmn
 NyHFF5iKliVGfOuiixGMA2BDsdlnZjjO+xSvl337cnV6EaYzZ8b+5+rfAexdIbHF5NLAjrM8hg2E/
 0MfIOikx7h6NYZn8dv1fqhSE8/weKRmMetaBBUHIlrzmTZqY/pITRsVwaWnW7Gst6LZfmMS3bSZ3F
 JlMzdmabM/M2L8xY9MxqxGErYjmSTCTTO7eOpYORAGEKz0AaTwavZg0U/rh1KpA679g3oGKCIyseC
 T9R4u23PZ/UDgY4ixH7LITykt3hSkz+TjL4/YqbrkOP3cK+4SKHvUECOZUzEKrwouA6BCLe2/W97Y
 ml4gOKcw==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=Tsm5OcFE
Subject: [Buildroot] [PATCH 1/2] package/libdex: new package
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

This package provides utilities for asynchronous programming in C
using a futures/promises model. Newer versions of sysprof require
this library.

https://gitlab.gnome.org/GNOME/libdex

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/libdex/Config.in   | 17 +++++++++++++++++
 package/libdex/libdex.hash |  5 +++++
 package/libdex/libdex.mk   | 31 +++++++++++++++++++++++++++++++
 5 files changed, 55 insertions(+)
 create mode 100644 package/libdex/Config.in
 create mode 100644 package/libdex/libdex.hash
 create mode 100644 package/libdex/libdex.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8a5cceba78e..be622599387 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -55,6 +55,7 @@ F:	package/brotli/
 F:	package/bubblewrap/
 F:	package/cage/
 F:	package/cog/
+F:	package/libdex/
 F:	package/libepoxy/
 F:	package/libmanette/
 F:	package/libpsl/
diff --git a/package/Config.in b/package/Config.in
index 550fdc1f411..ff55d892e0e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2155,6 +2155,7 @@ menu "Other"
 	source "package/libcap/Config.in"
 	source "package/libcap-ng/Config.in"
 	source "package/libcgroup/Config.in"
+	source "package/libdex/Config.in"
 	source "package/llvm-project/libclc/Config.in"
 	source "package/libcofi/Config.in"
 	source "package/libcorrect/Config.in"
diff --git a/package/libdex/Config.in b/package/libdex/Config.in
new file mode 100644
index 00000000000..f10bdac46f1
--- /dev/null
+++ b/package/libdex/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LIBDEX
+	bool "libdex"
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_USE_WCHAR # libglib2, gettext
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  Dex provides Future-based programming for GLib-based
+	  applications. It both integrates with and brings new
+	  features for application and library authors who want
+	  to structure concurrent code in an easy to manage way.
+
+	  https://gitlab.gnome.org/GNOME/libdex
+
+comment "libdex needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libdex/libdex.hash b/package/libdex/libdex.hash
new file mode 100644
index 00000000000..ec22f330d9f
--- /dev/null
+++ b/package/libdex/libdex.hash
@@ -0,0 +1,5 @@
+# From https://download.gnome.org/sources/libdex/0.6/libdex-0.6.1.sha256sum
+sha256  d176de6578571e32a8c0b603b6a5a13fa5f87fb6b5442575b38ec5af16b17a92  libdex-0.6.1.tar.xz
+
+# License files
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libdex/libdex.mk b/package/libdex/libdex.mk
new file mode 100644
index 00000000000..3a61a8504fb
--- /dev/null
+++ b/package/libdex/libdex.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# libdex
+#
+################################################################################
+
+LIBDEX_VERSION_MAJOR = 0.6
+LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).1
+LIBDEX_SOURCE = libdex-$(LIBDEX_VERSION).tar.xz
+LIBDEX_SITE = https://download.gnome.org/sources/libdex/$(LIBDEX_VERSION_MAJOR)
+LIBDEX_LICENSE = LGPL-2.1+
+LIBDEX_LICENSE_FILES = COPYING
+LIBDEX_INSTALL_STAGING = YES
+LIBDEX_DEPENDENCIES += libglib2
+LIBDEX_CONF_OPTS += \
+	-Ddocs=false \
+	-Dexamples=false \
+	-Dsysprof=false \
+	-Dtests=false \
+	-Dvapi=false \
+	-Deventfd=enabled \
+	-Dintrospection=disabled
+
+ifeq ($(BR2_PACKAGE_LIBURING),y)
+LIBDEX_CONF_OPTS += -Dliburing=enabled
+LIBDEX_DEPENDENCIES += liburing
+else
+LIBDEX_CONF_OPTS += -Dliburing=disabled
+endif
+
+$(eval $(meson-package))
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
