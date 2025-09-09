Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C37CCAC58D
	for <buildroot@archiver.kernel.org>; Tue,  9 Sep 2025 13:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE1028127C;
	Tue,  9 Sep 2025 13:00:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sI8BoaBS3T6l; Tue,  9 Sep 2025 13:00:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A003281678
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A003281678;
	Tue,  9 Sep 2025 13:00:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2836ECA
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 13:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EFC4400FC
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 13:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aiXbJ_7RHJ-l for <buildroot@buildroot.org>;
 Tue,  9 Sep 2025 13:00:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ECCC340148
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECCC340148
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ECCC340148
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:59:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 333F01A0E2D
 for <buildroot@buildroot.org>; Tue,  9 Sep 2025 12:59:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0DC6560630;
 Tue,  9 Sep 2025 12:59:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 49B43102F287A; 
 Tue,  9 Sep 2025 14:59:57 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue,  9 Sep 2025 14:08:12 +0200
Message-ID: <20250909120822.1069595-8-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909120822.1069595-1-thomas.petazzoni@bootlin.com>
References: <20250909120822.1069595-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757422797; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=iuM66nx4fIlOu18Mi4z27d3GWQ3nJpZy4Cn5U3mcCBo=;
 b=1NBq0C/l4AVj7ob+7rxoT+BDY3VKjpGQlUu3QjJEgyUrehHqzPiS03iA9ih8owzFgh91X3
 KhMngErQwDbmqDsQ6LDOjj+383tY6Ku1Y+SHOSEP+d4rQRFpBMcqL/ZGahjvlYP/7a6Bsp
 cmL4qclexM/brzCDWEU+6cAnX1op5fRARgMQBmRzVBuU1k8RR5/ix9oUBGHNY+wButk6QL
 iiBUuUji41XdRBcrxtJtZ2OaQTBZb1ZvPxUDx6jo3fPoCIBLO2GTfK/JPubJvK5l9Qu0au
 NnrYWpb+bIEMZhKzT4ekMrUHz9+RcvvK/t1imfnuC6vN2fZe6qzhWgWiMpiQlw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=1NBq0C/l
Subject: [Buildroot] [PATCH 07/11] package/libsepol: bump to version 3.9
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes:
https://github.com/SELinuxProject/selinux/releases/download/3.9/RELEASE-3.9.txt

Notable changes for libsepol:

* libsepol: Add new 'netif_wildcard' policy capability

* libsepol: Allow multiple policycap statements

* libsepol: Support genfs_seclabel_wildcard

We can drop our patch since SELinux now has an official DISABLE_SHARED
variable to do a static-only build (but it needs a 'y' value and not a
'1' value like our previous variable needed).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                           |  1 -
 .../libsepol/0001-support-static-only.patch   | 52 -------------------
 package/libsepol/libsepol.hash                |  2 +-
 package/libsepol/libsepol.mk                  |  4 +-
 4 files changed, 3 insertions(+), 56 deletions(-)
 delete mode 100644 package/libsepol/0001-support-static-only.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 426d112c14..3814df39b9 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -636,7 +636,6 @@ package/libroxml/0001-src-roxml_mem.h-add-missing-extern.patch lib_patch.Upstrea
 package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch lib_patch.Upstream
 package/librtlsdr/0001-Makefile.am-respect-DESTDIR-with-install-udev-rules.patch lib_patch.Upstream
 package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch lib_patch.Upstream
-package/libsepol/0001-support-static-only.patch lib_patch.Upstream
 package/libserial/0001-SerialPort.cpp-fix-build-when-size_t-is-an-unsigned-.patch lib_patch.Upstream
 package/libserial/0002-SerialPort.cpp-don-t-use-high-baudrates-when-not-ava.patch lib_patch.Upstream
 package/libshdata/0001-backend-Add-missing-include-files.patch lib_patch.Upstream
diff --git a/package/libsepol/0001-support-static-only.patch b/package/libsepol/0001-support-static-only.patch
deleted file mode 100644
index 7a614d7d0d..0000000000
--- a/package/libsepol/0001-support-static-only.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 2140db697c7f1da2a0a3f7bbcb14c1a0dade84e5 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <adam.duskett@amarulasolutions.com>
-Date: Wed, 14 May 2025 16:32:53 +0200
-Subject: [PATCH] Add support for static-only build
-
-Instead of unconditionally building shared libraries, this patch
-improves the libsepol build system with a "STATIC" variable, which
-when defined to some non-empty value, will disable the build of shared
-libraries. It allows to support cases where the target architecture
-does not have support for shared libraries.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Updated for 3.8.1]
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Update for 2.8]
----
- src/Makefile | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 71fa3ed..efb81bc 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -45,7 +45,12 @@ LDFLAGS += -undefined dynamic_lookup
- LN=gln
- endif
- 
--all: $(LIBA) $(LIBSO) $(LIBPC)
-+ALL_TARGETS = $(LIBA) $(LIBPC)
-+ifeq ($(STATIC),)
-+ALL_TARGETS += $(LIBSO)
-+endif
-+
-+all: $(ALL_TARGETS)
- 
- 
- $(LIBA):  $(OBJS)
-@@ -87,8 +92,10 @@ endif
- install: all
- 	test -d $(DESTDIR)$(LIBDIR) || install -m 755 -d $(DESTDIR)$(LIBDIR)
- 	install -m 644 $(LIBA) $(DESTDIR)$(LIBDIR)
-+ifeq ($(STATIC),)
- 	test -d $(DESTDIR)$(SHLIBDIR) || install -m 755 -d $(DESTDIR)$(SHLIBDIR)
- 	install -m 755 $(LIBSO) $(DESTDIR)$(SHLIBDIR)
-+endif
- 	test -d $(DESTDIR)$(LIBDIR)/pkgconfig || install -m 755 -d $(DESTDIR)$(LIBDIR)/pkgconfig
- 	install -m 644 $(LIBPC) $(DESTDIR)$(LIBDIR)/pkgconfig
- 	$(LN) -sf --relative $(DESTDIR)$(SHLIBDIR)/$(LIBSO) $(DESTDIR)$(LIBDIR)/$(TARGET)
--- 
-2.49.0
-
diff --git a/package/libsepol/libsepol.hash b/package/libsepol/libsepol.hash
index adf7cb86bb..08a1bf0cc2 100644
--- a/package/libsepol/libsepol.hash
+++ b/package/libsepol/libsepol.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  0e78705305f955abd4c0654d37a5477ee26349ab74db9e2b03a7868897ae1ddf  libsepol-3.8.1.tar.gz
+sha256  ba630b59e50c5fbf9e9dd45eb3734f373cf78d689d8c10c537114c9bd769fa2e  libsepol-3.9.tar.gz
 
 # Hash for license file
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  LICENSE
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index 2376ab852d..3e1a275808 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSEPOL_VERSION = 3.8.1
+LIBSEPOL_VERSION = 3.9
 LIBSEPOL_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEPOL_VERSION)
 LIBSEPOL_LICENSE = LGPL-2.1+
 LIBSEPOL_LICENSE_FILES = LICENSE
@@ -17,7 +17,7 @@ HOST_LIBSEPOL_DEPENDENCIES = $(BR2_COREUTILS_HOST_DEPENDENCY) host-flex
 LIBSEPOL_MAKE_FLAGS = $(TARGET_CONFIGURE_OPTS)
 
 ifeq ($(BR2_STATIC_LIBS),y)
-LIBSEPOL_MAKE_FLAGS += STATIC=1
+LIBSEPOL_MAKE_FLAGS += DISABLE_SHARED=y
 endif
 
 define LIBSEPOL_BUILD_CMDS
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
