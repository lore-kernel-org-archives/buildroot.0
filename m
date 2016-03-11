From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Mar 2016 19:04:46 +0100
Subject: [Buildroot] [PATCH 2/2 v2] package/libcap: bump version
In-Reply-To: <cover.1457719347.git.yann.morin.1998@free.fr>
References: <cover.1457719347.git.yann.morin.1998@free.fr>
Message-ID: <1d03ae088a9b2990e6355f69ef3de103166b2db3.1457719347.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

attr is no longer a dependency, not even optional.

Refresh our patches, and drop the backport from upstream.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

---
Changes v1 -> v2:
  - drop the attr dependency, it's no longer needed  (Gustavo)
---
 ...-build-system-fixes-for-cross-compilation.patch | 26 ++++--------
 ...t-install-into-install-shared-install-sta.patch | 32 +++++++--------
 ...nge-the-location-we-include-linux-xattr.h.patch | 46 ----------------------
 package/libcap/libcap.hash                         |  2 +-
 package/libcap/libcap.mk                           | 18 +++------
 5 files changed, 29 insertions(+), 95 deletions(-)
 delete mode 100644 package/libcap/0003-Change-the-location-we-include-linux-xattr.h.patch

diff --git a/package/libcap/0001-build-system-fixes-for-cross-compilation.patch b/package/libcap/0001-build-system-fixes-for-cross-compilation.patch
index 705bbc7..de24090 100644
--- a/package/libcap/0001-build-system-fixes-for-cross-compilation.patch
+++ b/package/libcap/0001-build-system-fixes-for-cross-compilation.patch
@@ -1,19 +1,19 @@
-From 7f48413ef1688df0d7fc25e477f4e6c0c55edfac Mon Sep 17 00:00:00 2001
+From d8d70559a279706c206761dfaf665d2197934123 Mon Sep 17 00:00:00 2001
 From: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Date: Sun, 6 Mar 2016 22:52:02 +0100
 Subject: [PATCH] build-system: fixes for cross-compilation
 
 Avoid the libcap buildsys forcing CC/CFLAGS/LDFLAGS/AR/RANLIB
-Also install the shared lib +x
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[yann.morin.1998 at free.fr: dont chmod +x the shared lib]
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 
 diff --git a/Make.Rules b/Make.Rules
-index ec1c474..8a8fc50 100644
+index 8347b26..8a07a3f 100644
 --- a/Make.Rules
 +++ b/Make.Rules
-@@ -48,25 +48,25 @@ MINOR=24
+@@ -48,26 +48,26 @@ MINOR=25
  KERNEL_HEADERS := $(topdir)/libcap/include/uapi
  IPATH += -fPIC -I$(KERNEL_HEADERS) -I$(topdir)/libcap/include
  
@@ -37,6 +37,7 @@ index ec1c474..8a8fc50 100644
  LD=$(CC) -Wl,-x -shared
 -LDFLAGS := #-g
 +LDFLAGS ?= #-g
+ BUILD_GPERF := $(shell which gperf >/dev/null 2>/dev/null && echo yes)
  
  SYSTEM_HEADERS = /usr/include
  INCS=$(topdir)/libcap/include/sys/capability.h
@@ -44,22 +45,9 @@ index ec1c474..8a8fc50 100644
  CFLAGS += -Dlinux $(WARNINGS) $(DEBUG)
 -PAM_CAP := $(shell if [ -f /usr/include/security/pam_modules.h ]; then echo yes ; else echo no ; fi)
 +PAM_CAP = no
- INDENT := $(shell if [ -n "$(which indent 2>/dev/null)" ]; then echo "| indent -kr" ; fi)
+ INDENT := $(shell if [ -n "$$(which indent 2>/dev/null)" ]; then echo "| indent -kr" ; fi)
  DYNAMIC := $(shell if [ ! -d "$(topdir)/.git" ]; then echo yes; fi)
- LIBATTR := yes
-diff --git a/libcap/Makefile b/libcap/Makefile
-index 20ab00f..97fea3f 100644
---- a/libcap/Makefile
-+++ b/libcap/Makefile
-@@ -75,7 +75,7 @@ install: all
- 	install -m 0644 include/sys/capability.h $(INCDIR)/sys
- 	mkdir -p -m 0755 $(LIBDIR)
- 	install -m 0644 $(STALIBNAME) $(LIBDIR)/$(STALIBNAME)
--	install -m 0644 $(MINLIBNAME) $(LIBDIR)/$(MINLIBNAME)
-+	install -m 0755 $(MINLIBNAME) $(LIBDIR)/$(MINLIBNAME)
- 	ln -sf $(MINLIBNAME) $(LIBDIR)/$(MAJLIBNAME)
- 	ln -sf $(MAJLIBNAME) $(LIBDIR)/$(LIBNAME)
- ifeq ($(FAKEROOT),)
+ 
 -- 
 1.9.1
 
diff --git a/package/libcap/0002-libcap-split-install-into-install-shared-install-sta.patch b/package/libcap/0002-libcap-split-install-into-install-shared-install-sta.patch
index a7a9d13..a8579b7 100644
--- a/package/libcap/0002-libcap-split-install-into-install-shared-install-sta.patch
+++ b/package/libcap/0002-libcap-split-install-into-install-shared-install-sta.patch
@@ -1,4 +1,4 @@
-From 8d7339169b9a5df2082731fe5468923be4be39af Mon Sep 17 00:00:00 2001
+From af21635665ab568f3333ff9fe8b474f4950e5acb Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Sun, 6 Mar 2016 22:53:24 +0100
 Subject: [PATCH] libcap: split install into install-shared/install-static
@@ -11,10 +11,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 
 diff --git a/libcap/Makefile b/libcap/Makefile
-index 97fea3f..7ac45dd 100644
+index d189777..44ddb27 100644
 --- a/libcap/Makefile
 +++ b/libcap/Makefile
-@@ -70,19 +70,25 @@ $(MINLIBNAME): $(OBJS)
+@@ -62,19 +62,25 @@ $(MINLIBNAME): $(OBJS)
  cap_text.o: cap_text.c $(USE_GPERF_OUTPUT) $(INCLS)
  	$(CC) $(CFLAGS) $(IPATH) $(INCLUDE_GPERF_OUTPUT) -c $< -o $@
  
@@ -22,24 +22,24 @@ index 97fea3f..7ac45dd 100644
 +install: install-shared install-static
 +
 +install-common:
- 	mkdir -p -m 0755 $(INCDIR)/sys
- 	install -m 0644 include/sys/capability.h $(INCDIR)/sys
-+	mkdir -p -m 0755 $(PKGCONFIGDIR)
-+	install -m 0644 libcap.pc $(PKGCONFIGDIR)/libcap.pc
- 	mkdir -p -m 0755 $(LIBDIR)
+ 	mkdir -p -m 0755 $(FAKEROOT)$(INCDIR)/sys
+ 	install -m 0644 include/sys/capability.h $(FAKEROOT)$(INCDIR)/sys
++	mkdir -p -m 0755 $(FAKEROOT)$(PKGCONFIGDIR)
++	install -m 0644 libcap.pc $(FAKEROOT)$(PKGCONFIGDIR)/libcap.pc
 +
-+install-static: install-common
- 	install -m 0644 $(STALIBNAME) $(LIBDIR)/$(STALIBNAME)
++install-static: $(STALIBNAME) install-common
+ 	mkdir -p -m 0755 $(FAKEROOT)$(LIBDIR)
+ 	install -m 0644 $(STALIBNAME) $(FAKEROOT)$(LIBDIR)/$(STALIBNAME)
 +
-+install-shared: install-common
- 	install -m 0755 $(MINLIBNAME) $(LIBDIR)/$(MINLIBNAME)
- 	ln -sf $(MINLIBNAME) $(LIBDIR)/$(MAJLIBNAME)
- 	ln -sf $(MAJLIBNAME) $(LIBDIR)/$(LIBNAME)
++install-shared: $(MINLIBNAME) install-common
+ 	install -m 0644 $(MINLIBNAME) $(FAKEROOT)$(LIBDIR)/$(MINLIBNAME)
+ 	ln -sf $(MINLIBNAME) $(FAKEROOT)$(LIBDIR)/$(MAJLIBNAME)
+ 	ln -sf $(MAJLIBNAME) $(FAKEROOT)$(LIBDIR)/$(LIBNAME)
  ifeq ($(FAKEROOT),)
  	-/sbin/ldconfig
  endif
--	mkdir -p -m 0755 $(PKGCONFIGDIR)
--	install -m 0644 libcap.pc $(PKGCONFIGDIR)/libcap.pc
+-	mkdir -p -m 0755 $(FAKEROOT)$(PKGCONFIGDIR)
+-	install -m 0644 libcap.pc $(FAKEROOT)$(PKGCONFIGDIR)/libcap.pc
  
  clean:
  	$(LOCALCLEAN)
diff --git a/package/libcap/0003-Change-the-location-we-include-linux-xattr.h.patch b/package/libcap/0003-Change-the-location-we-include-linux-xattr.h.patch
deleted file mode 100644
index 7858780..0000000
--- a/package/libcap/0003-Change-the-location-we-include-linux-xattr.h.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 84fb6007dcc7f6b6da9f6dab77a487c22b6c7beb Mon Sep 17 00:00:00 2001
-From: Andrew G Morgan <morgan@kernel.org>
-Date: Sun, 9 Mar 2014 16:33:15 -0700
-Subject: [PATCH] Change the location we include linux/xattr.h
-
-This header stuff seems a bit fragile, but Serge reports including
-it in sys/capability.h was causing a lot of trouble building dependent
-app packages.
-
-From the perspective of libcap, this API is only needed internally in
-cap_file.c so we put an include there.
-
-Status: upstream.
-
-Signed-off-by: Andrew G Morgan <morgan@kernel.org>
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-
-diff --git a/libcap/cap_file.c b/libcap/cap_file.c
-index d3dc1d0..553c2d2 100644
---- a/libcap/cap_file.c
-+++ b/libcap/cap_file.c
-@@ -10,6 +10,8 @@
- #include <sys/stat.h>
- #include <unistd.h>
- 
-+#include <linux/xattr.h>
-+
- #define XATTR_SECURITY_PREFIX "security."
- 
- #include "libcap.h"
-diff --git a/libcap/include/sys/capability.h b/libcap/include/sys/capability.h
-index 64ac50e..dddc75b 100644
---- a/libcap/include/sys/capability.h
-+++ b/libcap/include/sys/capability.h
-@@ -27,7 +27,6 @@ extern "C" {
- #define __user
- #endif
- #include <linux/capability.h>
--#include <linux/xattr.h>
- 
- /*
-  * POSIX capability types
--- 
-2.0.4
-
diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index 75822e5..a1dcd62 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,2 +1,2 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
-sha256	cee4568f78dc851d726fc93f25f4ed91cc223b1fe8259daa4a77158d174e6c65	libcap-2.24.tar.xz
+sha256	693c8ac51e983ee678205571ef272439d83afe62dd8e424ea14ad9790bc35162  libcap-2.25.tar.xz
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 8625139..bcb5d8c 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,23 +4,16 @@
 #
 ################################################################################
 
-LIBCAP_VERSION = 2.24
+LIBCAP_VERSION = 2.25
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPLv2 or BSD-3c
 LIBCAP_LICENSE_FILES = License
 
-LIBCAP_DEPENDENCIES = host-libcap
+LIBCAP_DEPENDENCIES = host-libcap host-gperf
 LIBCAP_INSTALL_STAGING = YES
 
-ifeq ($(BR2_PACKAGE_ATTR),y)
-LIBCAP_DEPENDENCIES += attr
-LIBCAP_HAVE_LIBATTR = yes
-else
-LIBCAP_HAVE_LIBATTR = no
-endif
-
-HOST_LIBCAP_DEPENDENCIES = host-attr
+HOST_LIBCAP_DEPENDENCIES = host-gperf
 
 ifeq ($(BR2_STATIC_LIBS),y)
 LIBCAP_MAKE_TARGET = libcap.a libcap.pc
@@ -31,7 +24,6 @@ LIBCAP_MAKE_INSTALL_TARGET = install
 endif
 
 LIBCAP_MAKE_FLAGS = \
-	LIBATTR=$(LIBCAP_HAVE_LIBATTR) \
 	BUILD_CC="$(HOSTCC)" \
 	BUILD_CFLAGS="$(HOST_CFLAGS)"
 
@@ -67,12 +59,12 @@ endef
 
 define HOST_LIBCAP_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)\
-		LIBATTR=yes RAISE_SETFCAP=no
+		RAISE_SETFCAP=no
 endef
 
 define HOST_LIBCAP_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(HOST_DIR) \
-		LIBATTR=yes RAISE_SETFCAP=no prefix=/usr lib=lib install
+		RAISE_SETFCAP=no prefix=/usr lib=lib install
 endef
 
 $(eval $(generic-package))
-- 
1.9.1
