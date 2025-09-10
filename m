Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A165CA101F
	for <buildroot@archiver.kernel.org>; Wed, 10 Sep 2025 21:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F46F614EC;
	Wed, 10 Sep 2025 21:33:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id theII5mBVZve; Wed, 10 Sep 2025 21:33:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5593614D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5593614D7;
	Wed, 10 Sep 2025 21:33:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A56D234
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2666B4191B
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u1GVSdKN-nhB for <buildroot@buildroot.org>;
 Wed, 10 Sep 2025 21:33:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 95BC9418E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95BC9418E4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 95BC9418E4
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6CC6B4E40B80
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 455CF606D4
 for <buildroot@buildroot.org>; Wed, 10 Sep 2025 21:33:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B202F102F28F0; 
 Wed, 10 Sep 2025 23:33:13 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Sep 2025 23:32:12 +0200
Message-ID: <20250910213241.1529448-5-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1757539994; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=jp2ZaydyeLR0EXuMAYbAoxmzN9qgH72MpOYVS8m1N4E=;
 b=wAbl3FJNb2oxYoRlT8i7bnjvsR7gq6Ng78hQ7IU6cR78LN0p/Zx7ZqTlFWGeF5hNU9ExZL
 OHm6wxVTpfsghALVZ3O33bXxDw3VmvJ6PDpVaO2rtT/mfK9B7mwCYVQPtrfNWlwRPavez5
 QjWjT4iDG4Plpm0TcOBRo52j3zbiha7dmclvBI3C7fACXkzMYjxRIkyGKAuP7VvHd0yXaF
 pauQexJDKCe8cqUKogJkBrvrRUlF33U5tg3AIU4RdenI8p5bC+qIy5KHkP+muac5TP3fUr
 o0KP1DXNyVyiJEjw2B8Gujny1dVfLJdFMSVChjaLQfrOWqoIQLjeZagkn4AIjg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=wAbl3FJN
Subject: [Buildroot] [PATCH 04/23] package/gtk2-engines: remove package,
 needs libgtk2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As we're about to remove libgtk2, let's drop gtk2-engines, which
obviously relies on libgtk2.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                       |  7 ++
 package/Config.in                      |  3 -
 package/gtk2-engines/Config.in         |  5 --
 package/gtk2-engines/gtk2-engines.hash |  4 --
 package/gtk2-engines/gtk2-engines.mk   | 88 --------------------------
 5 files changed, 7 insertions(+), 100 deletions(-)
 delete mode 100644 package/gtk2-engines/Config.in
 delete mode 100644 package/gtk2-engines/gtk2-engines.hash
 delete mode 100644 package/gtk2-engines/gtk2-engines.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 5badcfe259..ea23ae1b2c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_GTK2_ENGINES
+	bool "gtk2-engines has been removed"
+	select BR2_LEGACY
+	help
+	  The gtk2-engines package has been removed, as libgtk2 has
+	  been removed as well.
+
 config BR2_PACKAGE_GKRELLM
 	bool "gkrellm has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 1b740c02f5..e42ef67d7d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -279,9 +279,6 @@ comment "Sounds"
 	source "package/sound-theme-borealis/Config.in"
 	source "package/sound-theme-freedesktop/Config.in"
 
-comment "Themes"
-	source "package/gtk2-engines/Config.in"
-
 endmenu
 
 menu "Games"
diff --git a/package/gtk2-engines/Config.in b/package/gtk2-engines/Config.in
deleted file mode 100644
index 756a7d00f1..0000000000
--- a/package/gtk2-engines/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_GTK2_ENGINES
-	bool "gtk engines"
-	depends on BR2_PACKAGE_LIBGTK2
-	help
-	  A collection of basic theme engines for GTK+.
diff --git a/package/gtk2-engines/gtk2-engines.hash b/package/gtk2-engines/gtk2-engines.hash
deleted file mode 100644
index 71a0ecd213..0000000000
--- a/package/gtk2-engines/gtk2-engines.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# From https://download.gnome.org/sources/gtk-engines/2.20/gtk-engines-2.20.2.sha256sum
-sha256  15b680abca6c773ecb85253521fa100dd3b8549befeecc7595b10209d62d66b5  gtk-engines-2.20.2.tar.bz2
-# Locally computed
-sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/gtk2-engines/gtk2-engines.mk b/package/gtk2-engines/gtk2-engines.mk
deleted file mode 100644
index ea41bccaea..0000000000
--- a/package/gtk2-engines/gtk2-engines.mk
+++ /dev/null
@@ -1,88 +0,0 @@
-################################################################################
-#
-# gtk2-engines
-#
-################################################################################
-
-GTK2_ENGINES_VERSION_MAJOR = 2.20
-GTK2_ENGINES_VERSION = $(GTK2_ENGINES_VERSION_MAJOR).2
-GTK2_ENGINES_SOURCE = gtk-engines-$(GTK2_ENGINES_VERSION).tar.bz2
-GTK2_ENGINES_SITE = https://download.gnome.org/sources/gtk-engines/$(GTK2_ENGINES_VERSION_MAJOR)
-GTK2_ENGINES_DEPENDENCIES = libgtk2 host-intltool
-GTK2_ENGINES_LICENSE = LGPL-2.1+
-GTK2_ENGINES_LICENSE_FILES = COPYING
-
-GTK2_ENGINES_CONF_ENV = \
-	ac_cv_func_posix_getpwuid_r=yes \
-	glib_cv_stack_grows=no \
-	glib_cv_uscore=no \
-	ac_cv_func_strtod=yes \
-	ac_fsusage_space=yes \
-	fu_cv_sys_stat_statfs2_bsize=yes \
-	ac_cv_func_closedir_void=no \
-	ac_cv_func_getloadavg=no \
-	ac_cv_lib_util_getloadavg=no \
-	ac_cv_lib_getloadavg_getloadavg=no \
-	ac_cv_func_getgroups=yes \
-	ac_cv_func_getgroups_works=yes \
-	ac_cv_func_chown_works=yes \
-	ac_cv_have_decl_euidaccess=no \
-	ac_cv_func_euidaccess=no \
-	ac_cv_have_decl_strnlen=yes \
-	ac_cv_func_strnlen_working=yes \
-	ac_cv_func_lstat_dereferences_slashed_symlink=yes \
-	ac_cv_func_lstat_empty_string_bug=no \
-	ac_cv_func_stat_empty_string_bug=no \
-	vb_cv_func_rename_trailing_slash_bug=no \
-	ac_cv_have_decl_nanosleep=yes \
-	jm_cv_func_nanosleep_works=yes \
-	gl_cv_func_working_utimes=yes \
-	ac_cv_func_utime_null=yes \
-	ac_cv_have_decl_strerror_r=yes \
-	ac_cv_func_strerror_r_char_p=no \
-	jm_cv_func_svid_putenv=yes \
-	ac_cv_func_getcwd_null=yes \
-	ac_cv_func_getdelim=yes \
-	ac_cv_func_mkstemp=yes \
-	utils_cv_func_mkstemp_limitations=no \
-	utils_cv_func_mkdir_trailing_slash_bug=no \
-	jm_cv_func_gettimeofday_clobber=no \
-	gl_cv_func_working_readdir=yes \
-	jm_ac_cv_func_link_follows_symlink=no \
-	utils_cv_localtime_cache=no \
-	ac_cv_struct_st_mtim_nsec=no \
-	gl_cv_func_tzset_clobber=no \
-	gl_cv_func_getcwd_null=yes \
-	gl_cv_func_getcwd_path_max=yes \
-	ac_cv_func_fnmatch_gnu=yes \
-	am_getline_needs_run_time_check=no \
-	am_cv_func_working_getline=yes \
-	gl_cv_func_mkdir_trailing_slash_bug=no \
-	gl_cv_func_mkstemp_limitations=no \
-	ac_cv_func_working_mktime=yes \
-	jm_cv_func_working_re_compile_pattern=yes \
-	ac_use_included_regex=no \
-	gl_cv_c_restrict=no \
-	ac_cv_path_CUPS_CONFIG=no
-
-GTK2_ENGINES_CONF_OPTS = \
-	--with-x \
-	--x-includes=$(STAGING_DIR)/usr/include/X11 \
-	--x-libraries=$(STAGING_DIR)/usr/lib \
-	--disable-glibtest \
-	--enable-explicit-deps=no \
-	--enable-clearlooks \
-	--disable-crux \
-	--disable-hc \
-	--disable-industrial \
-	--disable-mist \
-	--disable-redmond \
-	--disable-smooth \
-	--disable-glide \
-	--disable-thinice \
-	--enable-animation \
-	--disable-development \
-	--disable-paranoia \
-	--disable-deprecated
-
-$(eval $(autotools-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
