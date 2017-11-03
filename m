From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  3 Nov 2017 20:53:43 +0100
Subject: [Buildroot] [PATCH 1/1] duktape: new package
Message-ID: <20171103195343.29670-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Duktape is an embeddable Javascript engine, with a focus on
portability and compact footprint.

Duktape is easy to integrate into a C/C++ project: add duktape.c,
duktape.h, and duk_config.h to your build, and use the Duktape API
to call Ecmascript functions from C code and vice versa.

http://www.duktape.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/duktape/0001-Replace-gcc-by-CC.patch       | 46 +++++++++++++++
 ...0002-Don-t-copy-headers-in-install-target.patch | 28 ++++++++++
 package/duktape/Config.in                          | 11 ++++
 package/duktape/duktape.hash                       |  3 +
 package/duktape/duktape.mk                         | 65 ++++++++++++++++++++++
 7 files changed, 155 insertions(+)
 create mode 100644 package/duktape/0001-Replace-gcc-by-CC.patch
 create mode 100644 package/duktape/0002-Don-t-copy-headers-in-install-target.patch
 create mode 100644 package/duktape/Config.in
 create mode 100644 package/duktape/duktape.hash
 create mode 100644 package/duktape/duktape.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 154a3a784..446ec2dc3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -587,6 +587,7 @@ F:	package/alljoyn-base/
 F:	package/alljoyn-tcl/
 F:	package/alljoyn-tcl-base/
 F:	package/boinc/
+F:	package/duktape/
 F:	package/gtksourceview/
 F:	package/gssdp/
 F:	package/gupnp/
diff --git a/package/Config.in b/package/Config.in
index ce389ce6a..421b6635f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1211,6 +1211,7 @@ menu "External AngularJS plugins"
 endmenu
 endif
 	source "package/bootstrap/Config.in"
+	source "package/duktape/Config.in"
 	source "package/explorercanvas/Config.in"
 	source "package/flot/Config.in"
 	source "package/jquery/Config.in"
diff --git a/package/duktape/0001-Replace-gcc-by-CC.patch b/package/duktape/0001-Replace-gcc-by-CC.patch
new file mode 100644
index 000000000..01ac5e044
--- /dev/null
+++ b/package/duktape/0001-Replace-gcc-by-CC.patch
@@ -0,0 +1,46 @@
+From 7e055e36b2822eb2d2acd254c7053c37a24d6e6d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 3 Nov 2017 15:31:09 +0100
+Subject: [PATCH] Replace gcc by $(CC)
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile.sharedlibrary | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.sharedlibrary b/Makefile.sharedlibrary
+index 56f82f9..9a110aa 100644
+--- a/Makefile.sharedlibrary
++++ b/Makefile.sharedlibrary
+@@ -36,6 +36,8 @@ INSTALL_PREFIX=/usr/local
+ DUKTAPE_SRCDIR=./src
+ #DUKTAPE_SRCDIR=./src-noline
+ 
++CC:=gcc
++
+ .PHONY: all
+ all: libduktape.so.$(REAL_VERSION) libduktaped.so.$(REAL_VERSION)
+ 
+@@ -44,11 +46,11 @@ all: libduktape.so.$(REAL_VERSION) libduktaped.so.$(REAL_VERSION)
+ # to $INSTALL_PREFIX/include on installation.
+ 
+ libduktape.so.$(REAL_VERSION):
+-	gcc -shared -fPIC -Wall -Wextra -Os -Wl,-soname,libduktape.so.$(SONAME_VERSION) \
++	$(CC) -shared -fPIC -Wall -Wextra -Os -Wl,-soname,libduktape.so.$(SONAME_VERSION) \
+ 		-o $@ $(DUKTAPE_SRCDIR)/duktape.c
+ 
+ libduktaped.so.$(REAL_VERSION):
+-	gcc -shared -fPIC -g -Wall -Wextra -Os -Wl,-soname,libduktaped.so.$(SONAME_VERSION) \
++	$(CC) -shared -fPIC -g -Wall -Wextra -Os -Wl,-soname,libduktaped.so.$(SONAME_VERSION) \
+ 		-o $@ $(DUKTAPE_SRCDIR)/duktape.c
+ 
+ # Symlinks depend on platform conventions.
+@@ -68,4 +70,4 @@ install: libduktape.so.$(REAL_VERSION) libduktaped.so.$(REAL_VERSION)
+ #CCOPTS=-I/usr/local/include -L/usr/local/lib
+ CCOPTS=-I./examples/cmdline
+ duk:
+-	gcc $(CCOPTS) -Wall -Wextra -Os -o $@ ./examples/cmdline/duk_cmdline.c -lduktape -lm
++	$(CC) $(CCOPTS) -Wall -Wextra -Os -o $@ ./examples/cmdline/duk_cmdline.c -lduktape -lm
+-- 
+2.14.1
+
diff --git a/package/duktape/0002-Don-t-copy-headers-in-install-target.patch b/package/duktape/0002-Don-t-copy-headers-in-install-target.patch
new file mode 100644
index 000000000..391a89f6d
--- /dev/null
+++ b/package/duktape/0002-Don-t-copy-headers-in-install-target.patch
@@ -0,0 +1,28 @@
+From e5e839b96332229a860424b451fe3d678ff2d0f2 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 3 Nov 2017 20:10:41 +0100
+Subject: [PATCH] Don't copy headers in install target
+
+Don't copy headers in install target to be able to use this Makefile to
+install duktape library in staging and target directory
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ Makefile.sharedlibrary | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile.sharedlibrary b/Makefile.sharedlibrary
+index 9a110aa..dfc63f3 100644
+--- a/Makefile.sharedlibrary
++++ b/Makefile.sharedlibrary
+@@ -63,7 +63,6 @@ install: libduktape.so.$(REAL_VERSION) libduktaped.so.$(REAL_VERSION)
+ 	rm -f $(INSTALL_PREFIX)/lib/libduktaped.so $(INSTALL_PREFIX)/lib/libduktaped.so.$(SONAME_VERSION)
+ 	ln -s libduktaped.so.$(REAL_VERSION) $(INSTALL_PREFIX)/lib/libduktaped.so
+ 	ln -s libduktaped.so.$(REAL_VERSION) $(INSTALL_PREFIX)/lib/libduktaped.so.$(SONAME_VERSION)
+-	cp $(DUKTAPE_SRCDIR)/duktape.h $(DUKTAPE_SRCDIR)/duk_config.h $(INSTALL_PREFIX)/include/
+ 
+ # Note: assumes /usr/local/include/ and /usr/local/lib/ are in include/link
+ # path which may not be the case for all distributions.
+-- 
+2.14.1
+
diff --git a/package/duktape/Config.in b/package/duktape/Config.in
new file mode 100644
index 000000000..b422afb58
--- /dev/null
+++ b/package/duktape/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_DUKTAPE
+	bool "duktape"
+	help
+	  Duktape is an embeddable Javascript engine, with a focus on
+	  portability and compact footprint.
+
+	  Duktape is easy to integrate into a C/C++ project: add duktape.c,
+	  duktape.h, and duk_config.h to your build, and use the Duktape API
+	  to call Ecmascript functions from C code and vice versa.
+
+	  http://www.duktape.org
diff --git a/package/duktape/duktape.hash b/package/duktape/duktape.hash
new file mode 100644
index 000000000..37eb942e6
--- /dev/null
+++ b/package/duktape/duktape.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	794805992a5bf6d47c3f244bb1df41c528f4a1f2d1e2f81dfa33f0920ab016ef	duktape-v2.2.0.tar.gz
+sha256	5358498534dac625c89a69c10becf3dcc40f9af58e6b69ee358ebdf6934f49c6	LICENSE.txt
diff --git a/package/duktape/duktape.mk b/package/duktape/duktape.mk
new file mode 100644
index 000000000..7cb2f18ab
--- /dev/null
+++ b/package/duktape/duktape.mk
@@ -0,0 +1,65 @@
+################################################################################
+#
+# duktape
+#
+################################################################################
+
+DUKTAPE_VERSION = v2.2.0
+DUKTAPE_SITE = $(call github,svaarala,duktape-releases,$(DUKTAPE_VERSION))
+DUKTAPE_LICENSE = MIT
+DUKTAPE_LICENSE_FILES = LICENSE.txt
+DUKTAPE_INSTALL_STAGING = YES
+
+DUKTAPE_MAKE_OPTS = \
+	CC=$(TARGET_CC)
+
+# For dynamic library, use Makefile.sharedlibrary provided by duktape
+ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+define DUKTAPE_BUILD_SHARED
+	$(TARGET_MAKE_ENV) $(MAKE) -f Makefile.sharedlibrary \
+		$(DUKTAPE_MAKE_OPTS) -C $(@D)
+endef
+
+# $1: destination directory
+define DUKTAPE_INSTALL_SHARED
+	$(TARGET_MAKE_ENV) $(MAKE) -f Makefile.sharedlibrary \
+		$(DUKTAPE_MAKE_OPTS) -C $(@D) INSTALL_PREFIX=$(1)/usr install
+endef
+endif
+
+# For static library, nothing is provided by duktape so build and install it
+ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
+define DUKTAPE_BUILD_STATIC
+	$(TARGET_CC) $(TARGET_CFLAGS) -c $(@D)/src/duktape.c \
+		-o $(@D)/libduktape.a
+	$(TARGET_CC) $(TARGET_CFLAGS) -g -c $(@D)/src/duktape.c \
+		-o $(@D)/libduktaped.a
+endef
+
+define DUKTAPE_INSTALL_STATIC
+	$(INSTALL) -m 0644 -D $(@D)/libduktape.a \
+		$(STAGING_DIR)/usr/lib/libduktape.a
+	$(INSTALL) -m 0644 -D $(@D)/libduktaped.a \
+		$(STAGING_DIR)/usr/lib/libduktaped.a
+endef
+endif
+
+define DUKTAPE_BUILD_CMDS
+	$(DUKTAPE_BUILD_SHARED)
+	$(DUKTAPE_BUILD_STATIC)
+endef
+
+define DUKTAPE_INSTALL_STAGING_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/src/duk_config.h \
+		$(STAGING_DIR)/usr/include/duk_config.h
+	$(INSTALL) -m 0644 -D $(@D)/src/duktape.h \
+		$(STAGING_DIR)/usr/include/duktape.h
+	$(call DUKTAPE_INSTALL_SHARED,$(STAGING_DIR))
+	$(DUKTAPE_INSTALL_STATIC)
+endef
+
+define DUKTAPE_INSTALL_TARGET_CMDS
+	$(call DUKTAPE_INSTALL_SHARED,$(TARGET_DIR))
+endef
+
+$(eval $(generic-package))
-- 
2.14.1
