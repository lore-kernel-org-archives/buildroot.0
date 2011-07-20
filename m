From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2011 06:43:08 +0200
Subject: [Buildroot] =?utf-8?q?=5BPATCH_2/3=5D_disko=3A_new_package?=
In-Reply-To: <cover.1311136895.git.thomas.petazzoni@free-electrons.com>
References: <cover.1311136895.git.thomas.petazzoni@free-electrons.com>
Message-ID: <b6e283dc4b704958ba62e9255cfc20058869e661.1311136895.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/Config.in                       |    1 +
 package/multimedia/disko/Config.in                 |   41 ++++++++++
 .../disko/disko-1.8.0-directfb-fix-errors.patch    |   82 ++++++++++++++++++++
 .../disko/disko-1.8.0-fixup-pkgconfig.patch        |   22 +++++
 package/multimedia/disko/disko.mk                  |   57 ++++++++++++++
 5 files changed, 203 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/disko/Config.in
 create mode 100644 package/multimedia/disko/disko-1.8.0-directfb-fix-errors.patch
 create mode 100644 package/multimedia/disko/disko-1.8.0-fixup-pkgconfig.patch
 create mode 100644 package/multimedia/disko/disko.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 79c601c..74885bd 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -2,6 +2,7 @@ menu "Audio and video libraries and applications"
 source "package/multimedia/alsa-lib/Config.in"
 source "package/multimedia/alsa-utils/Config.in"
 source "package/multimedia/aumix/Config.in"
+source "package/multimedia/disko/Config.in"
 source "package/multimedia/faad2/Config.in"
 source "package/multimedia/flac/Config.in"
 source "package/multimedia/ffmpeg/Config.in"
diff --git a/package/multimedia/disko/Config.in b/package/multimedia/disko/Config.in
new file mode 100644
index 0000000..8a2fe96
--- /dev/null
+++ b/package/multimedia/disko/Config.in
@@ -0,0 +1,41 @@
+config BR2_PACKAGE_DISKO
+	bool "disko"
+	select BR2_PACKAGE_LIBSIGC
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_JPEG
+	help
+	  Disko is an LGPL-licensed user interface (UI) application
+	  framework for the fast and simple development of flexible
+	  applications on Embedded Linux systems ? with a particular
+	  focus on interactive user interfaces. It is high-performance
+	  and easy to learn, and due to its architecture is well
+	  suited to creating complex applications. Disko is a product
+	  of BerLinux Solutions GmbH.
+
+	  http://www.diskohq.com/
+
+choice
+	prompt "Disko graphical backend"
+	default BR2_PACKAGE_DISKO_GRAPHIC_FBDEV
+	depends on BR2_PACKAGE_DISKO
+	help
+	  Select the graphical backend for Disko.
+
+config BR2_PACKAGE_DISKO_GRAPHIC_FBDEV
+	bool "framebuffer"
+
+config BR2_PACKAGE_DISKO_GRAPHIC_DIRECTFB
+	bool "directfb"
+	depends on BR2_PACKAGE_DIRECTFB
+
+config BR2_PACKAGE_DISKO_GRAPHIC_X11
+	bool "x11"
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
+	select BR2_PACKAGE_XLIB_LIBXV
+endchoice
diff --git a/package/multimedia/disko/disko-1.8.0-directfb-fix-errors.patch b/package/multimedia/disko/disko-1.8.0-directfb-fix-errors.patch
new file mode 100644
index 0000000..1cc2a52
--- /dev/null
+++ b/package/multimedia/disko/disko-1.8.0-directfb-fix-errors.patch
@@ -0,0 +1,82 @@
+From: Matthias Hardt <mhardt@berlinux-solutions.de>
+Date: Wed, 8 Jun 2011 18:16:10 +0000 (+0200)
+Subject: mmsgui: -compile errors fixed for DirectFB
+X-Git-Url: http://git.diskohq.com/gitweb/?p=disko.git;a=commitdiff_plain;h=ed0026e853747ed251e438e30643fe29fa42c426
+
+mmsgui: -compile errors fixed for DirectFB
+---
+
+diff --git a/src/mmsgui/fb/mmsfbsurface.cpp b/src/mmsgui/fb/mmsfbsurface.cpp
+index 7cd6d3e..bb7e24b 100755
+--- a/src/mmsgui/fb/mmsfbsurface.cpp
++++ b/src/mmsgui/fb/mmsfbsurface.cpp
+@@ -857,7 +857,7 @@ void MMSFBSurface::initPlanePointers(MMSFBSurfacePlanes *planes, int height) {
+     	planes->ptr2 = ((unsigned char *)planes->ptr) + planes->pitch * height;
+     	planes->pitch2 = planes->pitch / 4;
+     	planes->ptr3 = NULL;
+-    	planes->pitch3 = NULL;
++    	planes->pitch3 = 0;
+     	break;
+     default:
+     	break;
+@@ -4785,7 +4785,7 @@ bool MMSFBSurface::stretchBlit(MMSFBSurface *source, MMSFBRectangle *src_rect, M
+ 					dfbres=((IDirectFBSurface *)tempsuf->getDFBSurface())->StretchBlit((IDirectFBSurface *)tempsuf->getDFBSurface(), (IDirectFBSurface *)source->getDFBSurface(), (DFBRectangle*)&src, (DFBRectangle*)&temp);
+ 					if (dfbres == DFB_OK) {
+ 						if (!this->is_sub_surface) {
+-							if (extendedAccelBlit(tempsuf, &temp, dst.x, dst.y)) {
++							if (extendedAccelBlit(tempsuf, &temp, dst.x, dst.y, this->config.blittingflags)) {
+ 								blit_done = true;
+ 								ret = true;
+ 							}
+@@ -4806,7 +4806,7 @@ bool MMSFBSurface::stretchBlit(MMSFBSurface *source, MMSFBRectangle *src_rect, M
+ 							SETSUBSURFACE_BLITTINGFLAGS;
+ #endif
+ 
+-							if (!extendedAccelBlit(tempsuf, &temp, dst.x, dst.y))
++							if (!extendedAccelBlit(tempsuf, &temp, dst.x, dst.y, this->config.blittingflags))
+ 								this->dfb_surface->Blit(this->dfb_surface, (IDirectFBSurface *)tempsuf->getDFBSurface(), (DFBRectangle*)&temp, dst.x, dst.y);
+ 
+ #ifndef USE_DFB_SUBSURFACE
+@@ -7121,7 +7121,7 @@ bool MMSFBSurface::dump2file(string filename, MMSFBSurfaceDumpMode dumpmode) {
+ 
+ bool dump_fcb(char *buf, int len, void *argp, int *argi) {
+ 	buf[len] = 0;
+-	printf(buf);
++	printf("%s", buf);
+ 	return true;
+ }
+ 
+diff --git a/src/mmsgui/mmsfbmanager.cpp b/src/mmsgui/mmsfbmanager.cpp
+index ab604e8..871000d 100755
+--- a/src/mmsgui/mmsfbmanager.cpp
++++ b/src/mmsgui/mmsfbmanager.cpp
+@@ -73,13 +73,6 @@ bool MMSFBManager::init(int argc, char **argv, string appl_name, string appl_ico
+ 	for(i=0;i<argc;i++)
+ 		myargv[i]=strdup(argv[i]);
+ 
+-#ifdef  __HAVE_DIRECTFB__
+-	if(config.getOutputType() == MMSFB_OT_X11) {
+-		myargv[myargc]=strdup("--dfb:system=x11");
+-		myargc++;
+-	}
+-#endif
+-
+     DEBUGMSG("MMSGUI", "init mmsfb");
+     bool ea = config.getExtendedAccel();
+ #ifdef  __HAVE_DIRECTFB__
+@@ -98,6 +91,15 @@ bool MMSFBManager::init(int argc, char **argv, string appl_name, string appl_ico
+ 	MMSConfigDataLayer videolayer_conf = this->config.getVideoLayer();
+ 	MMSConfigDataLayer graphicslayer_conf = this->config.getGraphicsLayer();
+ 
++#ifdef  __HAVE_DIRECTFB__
++	if(videolayer_conf.outputtype == MMSFB_OT_X11) {
++		myargv[myargc++] = strdup("--dfb:system=x11");
++		char mode[24];
++		snprintf(mode, 24, "--dfb:mode=%dx%d", graphicslayer_conf.rect.w, graphicslayer_conf.rect.h);
++		myargv[myargc++] = strdup(mode);
++	}
++#endif
++
+ 	// init the MMSFB class
+     if (!mmsfb->init(myargc, myargv, config.getBackend(), graphicslayer_conf.rect,
+ 					 ea, config.getFullScreen(), config.getPointer(), appl_name, appl_icon_name, config.getHideApplication())) {
diff --git a/package/multimedia/disko/disko-1.8.0-fixup-pkgconfig.patch b/package/multimedia/disko/disko-1.8.0-fixup-pkgconfig.patch
new file mode 100644
index 0000000..7e10df9
--- /dev/null
+++ b/package/multimedia/disko/disko-1.8.0-fixup-pkgconfig.patch
@@ -0,0 +1,22 @@
+Do not prepend pkg-config prefix variable with destdir
+
+The SConstruct script of Disko preprends the destdir to the prefix=
+variable in the .pc file. This is useless and also broken, as
+pkg-config already preprends the destdir to the prefix= variable
+thanks to the PKG_CONFIG_SYSROOT_DIR environment variable.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: disko_1.8.0/SConstruct
+===================================================================
+--- disko_1.8.0.orig/SConstruct	2011-07-15 14:23:01.478750933 +0200
++++ disko_1.8.0/SConstruct	2011-07-15 14:23:15.565746631 +0200
+@@ -859,8 +859,6 @@
+ 		disko_pc_libs_private += ' -lswscale -lavutil'
+ 
+ 	disko_pc.write('prefix=')
+-	if env['destdir'] and env['destdir'] != 'none':
+-		disko_pc.write(env['destdir'] + '/')
+ 	disko_pc.write(env['prefix'] + '\n')
+ 	disko_pc.write('exec_prefix=${prefix}\n')
+ 	disko_pc.write('libdir=${exec_prefix}/lib\n')
diff --git a/package/multimedia/disko/disko.mk b/package/multimedia/disko/disko.mk
new file mode 100644
index 0000000..0d6d894
--- /dev/null
+++ b/package/multimedia/disko/disko.mk
@@ -0,0 +1,57 @@
+
+DISKO_VERSION = 1.8.0
+DISKO_SOURCE = disko_$(DISKO_VERSION).tar.gz
+DISKO_SITE = http://www.diskohq.com/repository/sources/
+DISKO_INSTALL_STAGING = YES
+
+DISKO_DEPENDENCIES = \
+	host-scons host-pkg-config libsigc \
+	libxml2 libcurl freetype sqlite zlib \
+	libpng jpeg
+
+# SCons uses directly "ld" as the linker, but the external toolchain
+# wrapper does not wrap ld, so we tell scons to use gcc as the linker.
+DISKO_SCONS_ENV = 	 	 \
+	$(TARGET_CONFIGURE_OPTS) \
+	LD="$(TARGET_CC)"
+
+DISKO_SCONS_OPTS =		\
+	prefix=/usr		\
+	cross=True
+
+ifeq ($(BR2_PACKAGE_DISKO_GRAPHIC_FBDEV),y)
+DISKO_SCONS_OPTS += graphics_backend=fbdev
+else ifeq ($(BR2_PACKAGE_DISKO_GRAPHIC_DIRECTFB),y)
+DISKO_SCONS_OPTS += graphics_backend=dfb
+DISKO_DEPENDENCIES += directfb
+else ifeq ($(BR2_PACKAGE_DISKO_GRAPHIC_X11),y)
+DISKO_SCONS_OPTS += graphics_backend=x11
+DISKO_DEPENDENCIES += xserver_xorg-server xlib_libXv xlib_libXcomposite
+endif
+
+define DISKO_BUILD_CMDS
+	(cd $(@D); \
+		$(DISKO_SCONS_ENV)	 \
+		scons			 \
+		$(DISKO_SCONS_OPTS))
+endef
+
+define DISKO_INSTALL_STAGING_CMDS
+	(cd $(@D); \
+		$(DISKO_SCONS_ENV)	   \
+		scons			   \
+		$(DISKO_SCONS_OPTS)	   \
+		destdir=$(STAGING_DIR) 	   \
+		install)
+endef
+
+define DISKO_INSTALL_TARGET_CMDS
+	(cd $(@D); \
+		$(DISKO_SCONS_ENV)	   \
+		scons			   \
+		$(DISKO_SCONS_OPTS)	   \
+		destdir=$(TARGET_DIR) 	   \
+		install)
+endef
+
+$(eval $(call GENTARGETS,package/multimedia,disko))
-- 
1.7.4.1
