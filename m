Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791D5C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 22:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6757400C8;
	Sun, 20 Feb 2022 22:07:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S84QTGgdXd10; Sun, 20 Feb 2022 22:07:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C25740187;
	Sun, 20 Feb 2022 22:07:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E95C41BF393
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 22:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D725760B26
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 22:06:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FPnd1NlmmRHD for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 22:06:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7311606B0
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 22:06:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 0F6D3812C3; Sun, 20 Feb 2022 21:59:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 22:36:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6009ac821abf096ea8cb1010e3ed1e11f010b64
X-Git-Newrev: 63b780f5e96e2f9282fb48b2846bab1c0f4f9455
X-Patchwork-Hint: ignore
Message-Id: <20220220215908.0F6D3812C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/librsvg: fix loaders.cache with
 with per-package directories
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=63b780f5e96e2f9282fb48b2846bab1c0f4f9455
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-librsvg install a gdk-pixbuf module (aka plugin). As such, it needs
to update [0] the modules cache (a kind of registry of which modules are
installed and what the can handle). To that effect, it calls the utility
gdk-pixbuf-queryloaders, which generates the cache of existing modules.

gdk-pixbuf-queryloaders, from the gdk-pixbuf package, has been
configured to be relocatable. However, it still embeds the path to where
it was instaled, and thus where to look modules from. If it is run from
its install location, then gdk-pixbuf-queryloaders looks modules in that
location, and generates a modules cache with relative paths; otherwise,
it still looks at that location, but generates a cache with absolute
paths. In the later case, it will miss the modules that have not been
installed by gdk-pixbuf itself.

In the case of host-librsvg, that will miss the fact that librsvg just
happened to have installed a module. Further down the road, packages
that depend on host-librsvg, will get their PPD prepared, the path fixup
hook run, so that the cache properly points to the current package's
PPD, but the cache will not include the SVG module, which causes
failures to load CVG images:

    Can't load file: Unrecognized image file format

So, we need to tell gdk-pixbuf-queryloaders where the module path is,
which restores the relativity of the paths it reports, by specifying the
modules path pointing to the current package's PPD, passed in the
environement variable GDK_PIXBUF_MODULEDIR.

We need to do that at install time, so that the SVG module is properly
listed in the cache, so that dependees can use it.

A temporary cache is also generated at build time, but its usefullness
is dubious; it seem to only be used by the test tool, which we do not
run. However, for consistency-sake, we also fix that.

Fixes:
 - http://autobuild.buildroot.org/results/0e00059b09b4445eaaec1030997883187c6a80d6

[0] This will trigger file-overwrite detection in the future... But we
currently do not have infrastructure to properly handle such a cache.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: reword and extend an already-good commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch | 41 ++++++++++++++++++++++
 package/librsvg/librsvg.mk                         |  2 ++
 2 files changed, 43 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
