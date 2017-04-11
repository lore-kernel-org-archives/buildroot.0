From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 12 Apr 2017 00:26:31 +0200
Subject: [Buildroot] [PATCH 02/14] package/irrlicht: new package
In-Reply-To: <20170411222643.9770-1-romain.naour@gmail.com>
References: <20170411222643.9770-1-romain.naour@gmail.com>
Message-ID: <20170411222643.9770-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...-CPPFLAGS-CXXFLAGS-and-CFLAGS-in-Makefile.patch | 44 +++++++++++++++++
 package/irrlicht/0002-remove-sys-sysctl.h.patch    | 38 +++++++++++++++
 package/irrlicht/Config.in                         | 17 +++++++
 package/irrlicht/irrlicht.hash                     |  5 ++
 package/irrlicht/irrlicht.mk                       | 57 ++++++++++++++++++++++
 7 files changed, 163 insertions(+)
 create mode 100644 package/irrlicht/0001-override-CPPFLAGS-CXXFLAGS-and-CFLAGS-in-Makefile.patch
 create mode 100644 package/irrlicht/0002-remove-sys-sysctl.h.patch
 create mode 100644 package/irrlicht/Config.in
 create mode 100644 package/irrlicht/irrlicht.hash
 create mode 100644 package/irrlicht/irrlicht.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a298669..354866e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1336,6 +1336,7 @@ F:	package/efl/
 F:	package/enlightenment/
 F:	package/expedite/
 F:	package/iqvlinux/
+F:	package/irrlicht/
 F:	package/liblinear/
 F:	package/lensfun/
 F:	package/linux-syscall-support/
diff --git a/package/Config.in b/package/Config.in
index c12e5b5..19315f7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -263,6 +263,7 @@ comment "Graphic libraries"
 	source "package/fbv/Config.in"
 	source "package/freerdp/Config.in"
 	source "package/imagemagick/Config.in"
+	source "package/irrlicht/Config.in"
 	source "package/linux-fusion/Config.in"
 	source "package/lite/Config.in"
 	source "package/mesa3d/Config.in"
diff --git a/package/irrlicht/0001-override-CPPFLAGS-CXXFLAGS-and-CFLAGS-in-Makefile.patch b/package/irrlicht/0001-override-CPPFLAGS-CXXFLAGS-and-CFLAGS-in-Makefile.patch
new file mode 100644
index 0000000..d6e4b63
--- /dev/null
+++ b/package/irrlicht/0001-override-CPPFLAGS-CXXFLAGS-and-CFLAGS-in-Makefile.patch
@@ -0,0 +1,44 @@
+From 5c5e6d0f469c8b4384bbe5d6c8f78069c182daf0 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sun, 9 Apr 2017 19:56:55 +0200
+Subject: [PATCH] override CPPFLAGS, CXXFLAGS and CFLAGS in Makefile
+
+When CPPFLAGS is passed on the command line, include paths for the
+bundled libraries are lost. Since the hand written Makefile want
+to use them unconditionally, we need to use the key word "override"
+before CPPFLAGS.
+
+Do the same for CXXFLAGS and CFLAGS otherwise -fPIC is lost.
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ source/Irrlicht/Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/source/Irrlicht/Makefile b/source/Irrlicht/Makefile
+index 0712b07..b334e9c 100644
+--- a/source/Irrlicht/Makefile
++++ b/source/Irrlicht/Makefile
+@@ -62,7 +62,7 @@ LINKOBJ = $(IRRMESHOBJ) $(IRROBJ) $(IRRPARTICLEOBJ) $(IRRANIMOBJ) \
+ ###############
+ #Compiler flags
+ CXXINCS = -I../../include -Izlib -Ijpeglib -Ilibpng
+-CPPFLAGS += $(CXXINCS) -DIRRLICHT_EXPORTS=1
++override CPPFLAGS += $(CXXINCS) -DIRRLICHT_EXPORTS=1
+ CXXFLAGS += -Wall -pipe -fno-exceptions -fno-rtti -fstrict-aliasing
+ ifndef NDEBUG
+ CXXFLAGS += -g -D_DEBUG
+@@ -74,8 +74,8 @@ CXXFLAGS += -pg
+ endif
+ CFLAGS := -O3 -fexpensive-optimizations -DPNG_THREAD_UNSAFE_OK -DPNG_NO_MMX_CODE -DPNG_NO_MNG_FEATURES
+ 
+-sharedlib sharedlib_osx: CXXFLAGS += -fPIC
+-sharedlib sharedlib_osx: CFLAGS += -fPIC
++sharedlib sharedlib_osx: override CXXFLAGS += -fPIC
++sharedlib sharedlib_osx: override CFLAGS += -fPIC
+ 
+ #multilib handling
+ ifeq ($(HOSTTYPE), x86_64)
+-- 
+2.9.3
+
diff --git a/package/irrlicht/0002-remove-sys-sysctl.h.patch b/package/irrlicht/0002-remove-sys-sysctl.h.patch
new file mode 100644
index 0000000..d9142a9
--- /dev/null
+++ b/package/irrlicht/0002-remove-sys-sysctl.h.patch
@@ -0,0 +1,38 @@
+From 5382142d37730f6758753b758c91e257ffd5892c Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sun, 9 Apr 2017 22:20:19 +0200
+Subject: [PATCH] remove sys/sysctl.h
+
+With musl irrlicht doesn't build due to missing sys/sysctl.h
+
+fatal error: sys/sysctl.h: No such file or directory
+
+From [1]
+"sysctl does not work, and NEVER worked. using it is bogus.
+it was a bogus experimental syscall that was deprecated before
+it was ever used (basically, a broken binary version of
+/proc/sys, without any stability between kernel versions for
+what the binary constants meant)."
+
+[1] https://devsonacid.wordpress.com/tag/musl/
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ source/Irrlicht/COSOperator.cpp | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/source/Irrlicht/COSOperator.cpp b/source/Irrlicht/COSOperator.cpp
+index 0899d1d..ccf5ef5 100644
+--- a/source/Irrlicht/COSOperator.cpp
++++ b/source/Irrlicht/COSOperator.cpp
+@@ -13,7 +13,6 @@
+ #include <unistd.h>
+ #ifndef _IRR_SOLARIS_PLATFORM_
+ #include <sys/types.h>
+-#include <sys/sysctl.h>
+ #endif
+ #endif
+ 
+-- 
+2.9.3
+
diff --git a/package/irrlicht/Config.in b/package/irrlicht/Config.in
new file mode 100644
index 0000000..edd182b
--- /dev/null
+++ b/package/irrlicht/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_IRRLICHT
+	bool "irrlicht"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_HAS_LIBGL # use GLX
+	select BR2_PACKAGE_XLIB_LIBXXF86VM # libXxf86vm
+	help
+	  An open source high performance realtime 3D graphics engine.
+
+	  http://irrlicht.sourceforge.net/
+
+comment "irrlicht needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+comment "irrlicht needs X11 and an OpenGL provider"
+	depends on !BR2_PACKAGE_HAS_LIBGL || !BR2_PACKAGE_XORG7
+	depends on BR2_INSTALL_LIBSTDCPP
diff --git a/package/irrlicht/irrlicht.hash b/package/irrlicht/irrlicht.hash
new file mode 100644
index 0000000..489790e
--- /dev/null
+++ b/package/irrlicht/irrlicht.hash
@@ -0,0 +1,5 @@
+# From https://sourceforge.net/projects/irrlicht/files/Irrlicht%20SDK/1.8/1.8.4
+md5 9401cfff801395010b0912211f3cbb4f irrlicht-1.8.4.zip
+sha1 38bf0223fe868d243d6a39d0dc191c8df6e03b3b irrlicht-1.8.4.zip
+# locally calculated
+sha256 f42b280bc608e545b820206fe2a999c55f290de5c7509a02bdbeeccc1bf9e433  irrlicht-1.8.4.zip
diff --git a/package/irrlicht/irrlicht.mk b/package/irrlicht/irrlicht.mk
new file mode 100644
index 0000000..ab6187c
--- /dev/null
+++ b/package/irrlicht/irrlicht.mk
@@ -0,0 +1,57 @@
+################################################################################
+#
+# irrlicht
+#
+################################################################################
+
+IRRLICHT_VERSION_MAJOR = 1.8
+IRRLICHT_VERSION = $(IRRLICHT_VERSION_MAJOR).4
+IRRLICHT_SOURCE = irrlicht-$(IRRLICHT_VERSION).zip
+IRRLICHT_SITE = https://downloads.sourceforge.net/project/irrlicht/Irrlicht%20SDK/$(IRRLICHT_VERSION_MAJOR)/$(IRRLICHT_VERSION)
+IRRLICHT_INSTALL_STAGING = YES
+
+# Bundled libraries: bzip2, libaesGladman, libpng, lzma, zlib,
+IRRLICHT_LICENSE = bzip2 license, jpeg-license (BSD-3-Clause-like), Libpng, Zlib
+IRRLICHT_LICENSE_FILES = \
+	doc/aesGladman.txt \
+	doc/bzip2-license.txt \
+	doc/irrlicht-license.txt \
+	doc/jpglib-license.txt \
+	doc/libpng-license.txt
+
+IRRLICHT_SUBDIR = source/Irrlicht
+
+IRRLICHT_DEPENDENCIES = libgl xlib_libXxf86vm
+
+define IRRLICHT_EXTRACT_CMDS
+	$(UNZIP) -d $(@D) $(DL_DIR)/$(IRRLICHT_SOURCE)
+	mv $(@D)/irrlicht-$(IRRLICHT_VERSION)/* $(@D)
+	$(RM) -r $(@D)/irrlicht-$(IRRLICHT_VERSION)
+endef
+
+IRRLICHT_CONF_OPTS = $(TARGET_CONFIGURE_OPTS)
+
+# Build a static library OR a shared library, otherwise we need to compile with -fPIC
+# "relocation R_X86_64_32S can not be used when making a shared object; recompile with -fPIC"
+ifeq ($(BR2_STATIC_LIBS),)
+IRRLICHT_CONF_OPTS += sharedlib
+endif
+
+define IRRLICHT_BUILD_CMDS
+	$(TARGET_MAKE_ENV)
+		$(MAKE) -C $(@D)/$(IRRLICHT_SUBDIR) $(IRRLICHT_CONF_OPTS)
+endef
+
+define IRRLICHT_INSTALL_STAGING_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) \
+		INSTALL_DIR=$(STAGING_DIR)/usr/lib \
+		-C $(@D)/$(IRRLICHT_SUBDIR) install
+endef
+
+define IRRLICHT_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) \
+		INSTALL_DIR=$(TARGET_DIR)/usr/lib \
+		-C $(@D)/$(IRRLICHT_SUBDIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.9.3
