Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED01C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 12:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C79A060B2A;
	Sun, 20 Feb 2022 12:18:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rmqi26ncWpv8; Sun, 20 Feb 2022 12:18:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6CE4605B2;
	Sun, 20 Feb 2022 12:18:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 569E31BF371
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 12:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 538DF80C7A
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 12:18:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 33seIUHh5RGr for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 12:18:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6DED80BFA
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 12:18:35 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d3so6674548wrf.1
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 04:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OUZeLr41afJ4HxBpZmJDVai+m7JhXwTjSWZbQQGKk4U=;
 b=KOYHmq+cxS8YWc2biaV0jTKBeCfJ9kcKJt+OfeF6xGeHUssbmpgJKXlc09aiyZzINd
 Pfz1ECcKe5kcWz/z9x8jepGcUzVMvPfcARiB/YE/9swKUEyTbqEh0qs5/6tDIc9t2lsD
 IkV+4Z+SNqowTMlVZgIv3WNdDGcARlQA1ePLqtTHym0wUeflzIpoWtDU0O5VIBNR0pKG
 SmHb4sFo6bMFjOOjTUqqDDLGvkgpDbnq0urEMuaAK4lEhb4OWCDQ6dGifqtfv4olqs+b
 rOnKppWVLh32XXGTPlBLPOOW5BPj8gCrE1FCYVXBEIu8wGhyzgjUst3GSLxCS2uCucYZ
 4V3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OUZeLr41afJ4HxBpZmJDVai+m7JhXwTjSWZbQQGKk4U=;
 b=6j09+bdqkEgCaNF+swAeNS1AqiR54m8a8HsjjTAeuvZPivhgR/iz65Lzd8LiE4G+HW
 OnYLVZUxsGnqCoNSYz/jTK/SYP9J7bQpKQCfTM8hLQ4DlMH5mDe2u9x5KZJ/ufCCpjUc
 PSOJ+vsxyF792PLzs129utGX74i0oaFvjRUT2cuntGvd3LzHJXfPujYGDkSZIPL+dCi4
 zWvCBKFl3qtFnZLKJSEnPnS4ukNUze63AvDys0XnAaeoAUJO81Z0KrBYfyknGDP9UUgR
 pz9pNutjm2dlne23F0mMjg3rEN892PxRVBl61SH6zglSavioYs1atiSKZ0IrfWTnKtaT
 giOw==
X-Gm-Message-State: AOAM531SbhZb2TgXfdDkA1ltbTwznBSIQsHPT+4qdYUyT+LQz6ScprxO
 ad7OkuMolIiEy3tiwQxcp5n5C+vtdjU=
X-Google-Smtp-Source: ABdhPJxW5zfaCOvYp59yLFb4eTc+fxaViVrGXl23tWrT9Jb4xPYSW12v5xiDL9d19uQWYkirBfM4xw==
X-Received: by 2002:a05:6000:144a:b0:1e6:2783:b3fd with SMTP id
 v10-20020a056000144a00b001e62783b3fdmr12104975wrx.156.1645359513662; 
 Sun, 20 Feb 2022 04:18:33 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id a10sm19701397wri.74.2022.02.20.04.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 04:18:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 13:16:37 +0100
Message-Id: <20220220121637.200393-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220220121637.200393-1-fontaine.fabrice@gmail.com>
References: <20220220121637.200393-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 2/2] package/librsvg: fix loaders.cache with with per-package
 directories
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-librsvg invokes the gdk-pixbuf-queryloaders to update loaders.cache
(which is originally built by host-gdk-pixbuf). loaders.cache contains
the list of all the gdk-pixbuf modules; that includes paths to
dlopen()ed shared libs. host-librsvg must update this file to add the
path to its SVG shared library.

By default, gdk-pixbuf-queryloaders uses a hardcoded path to find the
installed shared libs and this path will point to the location of the
host-gdk-pixbuf per-package directory. Obviously, this is wrong, the SVG
library installed by host-librsvg is installed in its own per-package
directory.

So set GDK_PIXBUF_MODULEDIR to gdk_pixbuf_moduledir before calling
gdk-pixbuf-query-loaders to build a correct loaders.cache.
gdk_pixbuf_moduledir is already retrieved from host-pkgconfig in
configure.ac and so will point to the correct location (thanks to
PPD_FIXUP_PATHS).

After this update, the loaders.cache will be correctly updated in
host-librsvg per-package directory and so the loaders.cache installed in
adwaita-icon-theme per-package directory will also be correct (thanks to
PPD_FIXUP_PATHS).

This will fix the following PPD build failure of adwaita-icon-theme:

Can't load file: Unrecognized image file format

Fixes:
 - http://autobuild.buildroot.org/results/0e00059b09b4445eaaec1030997883187c6a80d6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Enhance commit message
 - Add patch upstream status

 ...r-Makefile.am-set-GDK_PIXBUF_MODULED.patch | 41 +++++++++++++++++++
 package/librsvg/librsvg.mk                    |  2 +
 2 files changed, 43 insertions(+)
 create mode 100644 package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch

diff --git a/package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch b/package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch
new file mode 100644
index 0000000000..761ff92605
--- /dev/null
+++ b/package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch
@@ -0,0 +1,41 @@
+From 2c472bf55289ccbd7f305aa3e98d6fd70be4e3ab Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 19 Feb 2022 12:02:10 +0100
+Subject: [PATCH] gdk-pixbuf-loader/Makefile.am: set GDK_PIXBUF_MODULEDIR
+
+Set GDK_PIXBUF_MODULEDIR to gdk_pixbuf_moduledir before calling
+gdk-pixbuf-query-loaders to build a correct gdk_pixbuf_cache_file and
+gdk-pixbuf.loaders on 'exotic' systems
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.gnome.org/GNOME/librsvg/-/merge_requests/668]
+---
+ gdk-pixbuf-loader/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gdk-pixbuf-loader/Makefile.am b/gdk-pixbuf-loader/Makefile.am
+index c3493736..de1f9641 100644
+--- a/gdk-pixbuf-loader/Makefile.am
++++ b/gdk-pixbuf-loader/Makefile.am
+@@ -49,7 +49,7 @@ rsvg_loader_LDADD = \
+ EXTRA_rsvg_loader_DEPENDENCIES = libpixbufloader-svg.la gdk-pixbuf-loaders
+ 
+ gdk-pixbuf-loaders: Makefile
+-	$(AM_V_GEN) ( $(GDK_PIXBUF_QUERYLOADERS) ./libpixbufloader-svg.la && $(GDK_PIXBUF_QUERYLOADERS)) > gdk-pixbuf.loaders 2>/dev/null
++	$(AM_V_GEN) ( $(GDK_PIXBUF_QUERYLOADERS) ./libpixbufloader-svg.la && GDK_PIXBUF_MODULEDIR=$(gdk_pixbuf_moduledir) $(GDK_PIXBUF_QUERYLOADERS)) > gdk-pixbuf.loaders 2>/dev/null
+ 
+ if CROSS_COMPILING
+ RUN_QUERY_LOADER_TEST=false
+@@ -68,7 +68,7 @@ endif
+ install-data-hook:
+ 	@if $(RUN_QUERY_LOADER_TEST) ; then \
+ 		$(mkinstalldirs) $(DESTDIR)$(gdk_pixbuf_binarydir) ; \
+-		$(GDK_PIXBUF_QUERYLOADERS) > $(DESTDIR)$(gdk_pixbuf_cache_file) ; \
++		GDK_PIXBUF_MODULEDIR=$(gdk_pixbuf_moduledir) $(GDK_PIXBUF_QUERYLOADERS) > $(DESTDIR)$(gdk_pixbuf_cache_file) ; \
+ 	else \
+ 	  echo "***" ; \
+ 	  echo "*** Warning: loaders.cache not built" ; \
+-- 
+2.34.1
+
diff --git a/package/librsvg/librsvg.mk b/package/librsvg/librsvg.mk
index e4b1942b79..07a14b4366 100644
--- a/package/librsvg/librsvg.mk
+++ b/package/librsvg/librsvg.mk
@@ -20,6 +20,8 @@ HOST_LIBRSVG_DEPENDENCIES = host-cairo host-gdk-pixbuf host-libglib2 host-libxml
 LIBRSVG_LICENSE = LGPL-2.1+
 LIBRSVG_LICENSE_FILES = COPYING.LIB
 LIBRSVG_CPE_ID_VENDOR = gnome
+# We're patching gdk-pixbuf-loader/Makefile.am
+LIBRSVG_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 LIBRSVG_CONF_OPTS += --enable-introspection
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
