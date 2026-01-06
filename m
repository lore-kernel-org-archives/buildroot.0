Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E768BCEFCFE
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 20:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A22A24091C;
	Tue,  6 Jan 2026 20:04:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W_5Q1ILxQqFL; Tue,  6 Jan 2026 20:04:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5EF740920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767729845;
	bh=JhX2Qjf84DAr11uxExmVijFNsyKSKwEpTUHzsPB6ExE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ceUXaG1DJ+tBz0gu4lZPgaEawcC433l+/7gVXDKJe60/sH97zKGhbx6r8MbWOojfo
	 ElAe94tvtXCt665APy8sJacHariI7KYlQKvDi49sdg9SbjYYOFPmUQlQrGnY0/nd3y
	 fN2szsIdg1d6BHFz2ZQckKbcVMDfR1omTtBkI87JkeEvZByAXn27fzJf3eVeT+OgDB
	 Yb1GRyGhZ18cTMcS8ENAnvsTJKUw0wgVZmhbAixq4kTnHxCO2zX49jc4jYfENoRBTF
	 Y9oXmzz5xUR1e008q/Mnw4M12U8WkCJeOz8H3WZqtGncLXpOUBM7L/ifhWRxpgzHGn
	 WyqnxwHA7j5UA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5EF740920;
	Tue,  6 Jan 2026 20:04:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15F0C70B
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 082AD40920
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:04:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fN0KyldUGTHM for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 20:04:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF4A540911
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF4A540911
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF4A540911
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 20:04:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 58B3FA4C3993;
 Tue,  6 Jan 2026 21:01:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48554)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vdDF0-000000002Vv-3zAc;
 Tue, 06 Jan 2026 20:01:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  6 Jan 2026 21:01:10 +0100
Message-ID: <20260106200115.1985522-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106200115.1985522-1-bernd@kuhls.net>
References: <20260106200115.1985522-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767729679;
 bh=LCAajGEpJIHdhNQzNBLGG2IT0phvWgC3oGoc4He+SyI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=il7ESHJG4UtPFNqQfz0PDr+u58dZB47X61UHcHAX2U+TqHgLwKhGnN6G1coj0LBIA
 U81deLReB3bUIKnB8GgjzgRPRzOXzSTS+jJys3eru0X8r/YiiMNbcjEvv9YfL20GjL
 Ub9RCiYr1PQfZutaQWUlXVssb6VksD886LdZMx9SS7ShEHHnmW7dE8vcAGkvNFNOMy
 mV5hU9v6BbEWq4L4XbAQqmmymmoVISmweMhCCISQSHjzR4gMH7YPF7CNJb/LwEdoy2
 vHJb5j8JNVT5Z0Na3RvX2ECKFPHF/0KOR38Wr71txb7DFObDBZ7N7BatrEEmiR312H
 Vwu6yMVoeiHCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=il7ESHJG
Subject: [Buildroot] [PATCH v2 5/9] package/cvs: drop package
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

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

The CVS project is no longer maintained upstream. It no longer builds
with GCC 14.x, has been failing to build for months in our
autobuilders with nobody caring about it.

We managed to fix the GCC 14.x build issue, then there are GCC 15.x,
some of them fixed by Debian patches, but some not. Overall, this is
too much effort, while upstream is completely dead.

So let's get rid of cvs entirely.

Fixes:

  https://autobuild.buildroot.net/results/59f6e77106ac98535688ff5b9392b0b3ad3041ae/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy      |  7 ++++++
 package/Config.in     |  1 -
 package/cvs/Config.in | 24 ------------------
 package/cvs/cvs.hash  |  8 ------
 package/cvs/cvs.mk    | 58 -------------------------------------------
 5 files changed, 7 insertions(+), 91 deletions(-)
 delete mode 100644 package/cvs/Config.in
 delete mode 100644 package/cvs/cvs.hash
 delete mode 100644 package/cvs/cvs.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 062a9ebd5a..28919e8594 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_CVS
+	bool "cvs has been removed"
+	select BR2_LEGACY
+	help
+	  The cvs project was no longer maintained upstream, broken
+	  with GCC 14.x, so it was removed.
+
 config BR2_PACKAGE_CRIU
 	bool "criu has been removed"
 	help
diff --git a/package/Config.in b/package/Config.in
index 628a1f0aa6..bbbc04226f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -173,7 +173,6 @@ menu "Development tools"
 	source "package/cppunit/Config.in"
 	source "package/cukinia/Config.in"
 	source "package/cunit/Config.in"
-	source "package/cvs/Config.in"
 	source "package/cxxtest/Config.in"
 	source "package/diffutils/Config.in"
 	source "package/dos2unix/Config.in"
diff --git a/package/cvs/Config.in b/package/cvs/Config.in
deleted file mode 100644
index e8f0606ecc..0000000000
--- a/package/cvs/Config.in
+++ /dev/null
@@ -1,24 +0,0 @@
-config BR2_PACKAGE_CVS
-	bool "cvs"
-	depends on BR2_USE_WCHAR
-	# needs fork()
-	depends on BR2_USE_MMU
-	select BR2_PACKAGE_NCURSES
-	help
-	  Concurrent Versions System - source code revision control
-	  tools.
-
-	  http://www.nongnu.org/cvs/
-
-if BR2_PACKAGE_CVS
-
-config BR2_PACKAGE_CVS_SERVER
-	bool "server support"
-	help
-	  Enable cvs server code
-
-endif
-
-comment "cvs needs a toolchain w/ wchar"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR
diff --git a/package/cvs/cvs.hash b/package/cvs/cvs.hash
deleted file mode 100644
index 7b03a552d0..0000000000
--- a/package/cvs/cvs.hash
+++ /dev/null
@@ -1,8 +0,0 @@
-# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cvs/cvs_1.12.13-12%2Bsqueeze1.dsc
-sha256  b5961c2476b996e5758fa5e22b60af085adca41164cac0d8f68a1d3b49d4e4f1  cvs_1.12.13.orig.tar.gz
-sha256  d52a9232d9cf36302a150d782fc7e5b6f92f8115505ae8a7dc6acfc83e809d2f  cvs_1.12.13-12+squeeze1.diff.gz
-
-# Hash for license files, locally computed
-sha256  569c5b876327d899cf444b2277fe910128a38ca71d90755fe4125dd44f8ece02  COPYING
-sha256  da0e282103fb508894e78db519aab255e36971ce0bc87de585e3b05014b83b1e  COPYING.LIB
-sha256  ee9a2fbdb626c0ac57fd8e569f357eb2e6d6c80cc6f41efa8bd126d5ea589d72  lib/glob-libc.h
diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
deleted file mode 100644
index cf9127fc3a..0000000000
--- a/package/cvs/cvs.mk
+++ /dev/null
@@ -1,58 +0,0 @@
-################################################################################
-#
-# cvs
-#
-################################################################################
-
-CVS_VERSION = 1.12.13
-CVS_SOURCE = cvs_$(CVS_VERSION).orig.tar.gz
-CVS_PATCH = cvs_$(CVS_VERSION)-12+squeeze1.diff.gz
-CVS_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cvs
-CVS_LICENSE = GPL-1.0+, LGPL-2.0+, LGPL-2.1+ (glob)
-CVS_LICENSE_FILES = COPYING COPYING.LIB lib/glob-libc.h
-CVS_CPE_ID_VENDOR = gnu
-CVS_SELINUX_MODULES = apache cvs
-CVS_DEPENDENCIES = ncurses
-
-CVS_CONF_ENV = \
-	ac_cv_func_working_mktime=yes \
-	cvs_cv_func_printf_ptr=yes
-
-CVS_CONF_OPTS = \
-	--disable-old-info-format-support \
-	--with-editor=/bin/vi
-ifeq ($(BR2_PACKAGE_CVS_SERVER),y)
-CVS_CONF_OPTS += --enable-server
-else
-CVS_CONF_OPTS += --disable-server
-endif
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-CVS_CONF_OPTS += --with-external-zlib
-endif
-
-define CVS_BZIP_UNPACK
-	$(BZCAT) $(@D)/cvs-$(CVS_VERSION).tar.bz2 | $(TAR) -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	rm -f $(@D)/cvs-$(CVS_VERSION).tar.bz2
-endef
-
-CVS_POST_PATCH_HOOKS += CVS_BZIP_UNPACK
-
-ifneq ($(CVS_PATCH),)
-define CVS_DEBIAN_PATCHES
-	if [ -d $(@D)/debian/patches ]; then \
-		(cd $(@D)/debian/patches && for i in *; \
-		 do $(SED) 's,^\+\+\+ .*cvs-$(CVS_VERSION)/,+++ cvs-$(CVS_VERSION)/,' $$i; \
-		 done; \
-		); \
-		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*; \
-	fi
-endef
-endif
-
-CVS_POST_PATCH_HOOKS += CVS_DEBIAN_PATCHES
-
-define CVS_INSTALL_TARGET_CMDS
-	$(INSTALL) -D $(@D)/src/cvs $(TARGET_DIR)/usr/bin/cvs
-endef
-
-$(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
