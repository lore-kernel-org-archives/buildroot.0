From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Oct 2008 10:54:40 +0200
Subject: [Buildroot] Issue when compiling libpng and directfb
Message-ID: <20081007105440.05399a80@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

With current Buildroot SVN, I have an issue when trying to build libpng
and directfb: the configure script cannot find that zlib is installed.

The configure script tries to compile a simple program that makes a
call to zlibVersion() using the -lz option. But the
-L$(STAGING_DIR)/usr/lib/ option is not passed to gcc (the -I options
are correct however), so the compilation fails and configure complains
that it can't find the configure script.

In package/Makefile.in, it seems that the library path is passed in
TARGET_CONFIGURE_OPTS, using LD :

 LD="$(TARGET_LD) $(TARGET_LDFLAGS)" \

In the config.log, I see reference to the correct -L paths, but these
paths seem to be removed when testing the compilation of the sample
zlib program.

I workarounded the problem by using the two following patches, but I'm
quite sure they are not the proper fix.

I don't know if it's important, but I'm using an external toolchain
(that has been previously compiled by Buildroot a long time ago).

Any clue ?

Thanks,

Thomas

---
 package/directfb/directfb.mk |    1 +
 1 file changed, 1 insertion(+)

Index: buildroot/package/directfb/directfb.mk
===================================================================
--- buildroot.orig/package/directfb/directfb.mk
+++ buildroot/package/directfb/directfb.mk
@@ -38,6 +38,7 @@
 	(cd $(DIRECTFB_DIR); rm -f config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
 	ac_cv_header_linux_wm97xx_h=no \
 	ac_cv_header_linux_sisfb_h=no \
 	ac_cv_header_asm_page_h=no \

---
 package/libpng/libpng.mk |    1 +
 1 file changed, 1 insertion(+)

Index: buildroot/package/libpng/libpng.mk
===================================================================
--- buildroot.orig/package/libpng/libpng.mk
+++ buildroot/package/libpng/libpng.mk
@@ -42,6 +42,7 @@
 	(cd $(LIBPNG_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		ac_cv_have_decl_malloc=yes \
 		gl_cv_func_malloc_0_nonnull=yes \
 		ac_cv_func_malloc_0_nonnull=yes \

-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
