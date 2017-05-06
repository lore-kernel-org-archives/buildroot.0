From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  6 May 2017 16:07:07 +0200
Subject: [Buildroot] [PATCH] package/libloki: new package
Message-ID: <20170506140707.12931-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Corentin GUILLEVIC <corentin.guillevic@smile.fr>

A C++ library of designs, containing flexible implementations of common design patterns and idioms.

Sigend-off-by: Corentin GUILLEVIC <corentin.guillevic@smile.fr>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 DEVELOPERS                                         |  3 +
 package/Config.in                                  |  1 +
 ...stall-to-a-specific-location-using-DESTDI.patch | 65 ++++++++++++++++++++++
 package/libloki/0002-use-ln-snf.patch              | 31 +++++++++++
 package/libloki/Config.in                          | 12 ++++
 package/libloki/libloki.hash                       |  5 ++
 package/libloki/libloki.mk                         | 44 +++++++++++++++
 7 files changed, 161 insertions(+)
 create mode 100644 package/libloki/0001-allow-to-install-to-a-specific-location-using-DESTDI.patch
 create mode 100644 package/libloki/0002-use-ln-snf.patch
 create mode 100644 package/libloki/Config.in
 create mode 100644 package/libloki/libloki.hash
 create mode 100644 package/libloki/libloki.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 8fbb69a..df47636 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -361,6 +361,9 @@ F:	package/policycoreutils/
 F:	package/sepolgen/
 F:	package/ustr/
 
+N:	Corentin GUILLEVIC <corentin.guillevic@smile.fr>
+F:	package/libloki/
+
 N:	C?dric Ch?pied <cedric.chepied@gmail.com>
 F:	package/znc/
 
diff --git a/package/Config.in b/package/Config.in
index d57813c..a5e71ef 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1385,6 +1385,7 @@ menu "Other"
 	source "package/libical/Config.in"
 	source "package/libite/Config.in"
 	source "package/liblinear/Config.in"
+	source "package/libloki/Config.in"
 	source "package/libnpth/Config.in"
 	source "package/libnspr/Config.in"
 	source "package/libpfm4/Config.in"
diff --git a/package/libloki/0001-allow-to-install-to-a-specific-location-using-DESTDI.patch b/package/libloki/0001-allow-to-install-to-a-specific-location-using-DESTDI.patch
new file mode 100644
index 0000000..d19306f
--- /dev/null
+++ b/package/libloki/0001-allow-to-install-to-a-specific-location-using-DESTDI.patch
@@ -0,0 +1,65 @@
+From 0b80e8beff68a0570fdc2d9281992060414475c1 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 29 Apr 2017 22:13:54 +0200
+Subject: [PATCH] allow to install to a specific location using DESTDIR
+
+DESTDIR is the autotools standard variable where to copy
+headers, libraries and binaries. It's not the same as "prefix".
+
+So while installing to Buildroot STAGING directory, use prefix=/usr
+and DESTOR=$(STAGING_DIR).
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+Sigend-off-by: Corentin GUILLEVIC <corentin.guillevic@smile.fr>
+---
+ include/Makefile | 12 ++++++------
+ src/Makefile     | 10 +++++-----
+ 2 files changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/include/Makefile b/include/Makefile
+index 26a8139..a8cf369 100644
+--- a/include/Makefile
++++ b/include/Makefile
+@@ -2,10 +2,10 @@ include ../Makefile.common
+ 
+ .PHONY: install
+ install:
+-	mkdir -p $(prefix)/include/loki
+-	mkdir -p $(prefix)/include/loki/flex
+-	mkdir -p $(prefix)/include/loki/yasli
++	mkdir -p $(DESTDIR)$(prefix)/include/loki
++	mkdir -p $(DESTDIR)$(prefix)/include/loki/flex
++	mkdir -p $(DESTDIR)$(prefix)/include/loki/yasli
+ 	
+-	install -m 644 loki/*.h $(prefix)/include/loki
+-	install -m 644 loki/flex/*.h $(prefix)/include/loki/flex
+-	install -m 644 loki/yasli/*.h $(prefix)/include/loki/yasli
++	install -m 644 loki/*.h $(DESTDIR)$(prefix)/include/loki
++	install -m 644 loki/flex/*.h $(DESTDIR)$(prefix)/include/loki/flex
++	install -m 644 loki/yasli/*.h $(DESTDIR)$(prefix)/include/loki/yasli
+diff --git a/src/Makefile b/src/Makefile
+index b272929..054285e 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -74,13 +74,13 @@ INSTALL_DATA := $(INSTALL) -m 644
+ install: install-static install-shared
+ 
+ install-static: $(RESULT_DIR)$(STATIC_LIB)
+-	mkdir -p $(prefix)/lib
+-	$(INSTALL_DATA) $(RESULT_DIR)$(STATIC_LIB) $(prefix)/lib
++	mkdir -p $(DESTDIR)$(prefix)/lib
++	$(INSTALL_DATA) $(RESULT_DIR)$(STATIC_LIB) $(DESTDIR)$(prefix)/lib
+ 
+ install-shared: $(RESULT_DIR)$(SHARED_LIB_VERSIONED)
+-	mkdir -p $(prefix)/lib
+-	$(INSTALL_DATA) $(RESULT_DIR)$(SHARED_LIB_VERSIONED) $(prefix)/lib
+-	cd $(prefix)/lib; ln -s $(SHARED_LIB_VERSIONED) $(SHARED_LIB_BASE)
++	mkdir -p $(DESTDIR)$(prefix)/lib
++	$(INSTALL_DATA) $(RESULT_DIR)$(SHARED_LIB_VERSIONED) $(DESTDIR)$(prefix)/lib
++	cd $(DESTDIR)$(prefix)/lib; ln -s $(SHARED_LIB_VERSIONED) $(SHARED_LIB_BASE)
+ 
+ %.lo : %.cpp
+ 	$(CXX) -c $(CXXFLAGS) -fPIC $(CPPFLAGS) -o $@ $<
+-- 
+2.9.3
+
diff --git a/package/libloki/0002-use-ln-snf.patch b/package/libloki/0002-use-ln-snf.patch
new file mode 100644
index 0000000..5b73d7f
--- /dev/null
+++ b/package/libloki/0002-use-ln-snf.patch
@@ -0,0 +1,31 @@
+From 7fcaa080ef3fddb3f7dcfaf2984bc397d7c9e96c Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 29 Apr 2017 22:27:26 +0200
+Subject: [PATCH] use ln -snf
+
+Otherwise the install step fail due to existing symlink.
+
+'libloki.so': File exists
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+Sigend-off-by: Corentin GUILLEVIC <corentin.guillevic@smile.fr>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 054285e..2c169ab 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -80,7 +80,7 @@ install-static: $(RESULT_DIR)$(STATIC_LIB)
+ install-shared: $(RESULT_DIR)$(SHARED_LIB_VERSIONED)
+ 	mkdir -p $(DESTDIR)$(prefix)/lib
+ 	$(INSTALL_DATA) $(RESULT_DIR)$(SHARED_LIB_VERSIONED) $(DESTDIR)$(prefix)/lib
+-	cd $(DESTDIR)$(prefix)/lib; ln -s $(SHARED_LIB_VERSIONED) $(SHARED_LIB_BASE)
++	cd $(DESTDIR)$(prefix)/lib; ln -snf $(SHARED_LIB_VERSIONED) $(SHARED_LIB_BASE)
+ 
+ %.lo : %.cpp
+ 	$(CXX) -c $(CXXFLAGS) -fPIC $(CPPFLAGS) -o $@ $<
+-- 
+2.9.3
+
diff --git a/package/libloki/Config.in b/package/libloki/Config.in
new file mode 100644
index 0000000..7e9816b
--- /dev/null
+++ b/package/libloki/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBLOKI
+	bool "libloki"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  A C++ library of designs, containing flexible implementations
+	  of common design patterns and idioms.
+
+	  http://sourceforge.net/projects/loki-lib
+
+comment "libloki needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libloki/libloki.hash b/package/libloki/libloki.hash
new file mode 100644
index 0000000..52d67c8
--- /dev/null
+++ b/package/libloki/libloki.hash
@@ -0,0 +1,5 @@
+# From https://sourceforge.net/projects/loki-lib/files/Loki/Loki%200.1.7
+md5 33a24bcbb99fa2ec8fcbbab65649f3f6 loki-0.1.7.tar.bz2
+sha1 006c630217b1e1fd33015dc0597d2d743d8ee4e3 loki-0.1.7.tar.bz2
+# locally computed
+sha256 07553754f6be2738559947db69b0718512665bf4a34015fa3a875b6eb1111198 loki-0.1.7.tar.bz2
diff --git a/package/libloki/libloki.mk b/package/libloki/libloki.mk
new file mode 100644
index 0000000..e61601e
--- /dev/null
+++ b/package/libloki/libloki.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# libloki
+#
+################################################################################
+
+LIBLOKI_VERSION = 0.1.7
+LIBLOKI_SOURCE = loki-$(LIBLOKI_VERSION).tar.bz2
+LIBLOKI_SITE = https://sourceforge.net/projects/loki-lib/files/Loki/Loki%20$(LIBLOKI_VERSION)
+LIBLOKI_LICENSE = MIT
+LIBLOKI_INSTALL_STAGING = YES
+
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBLOKI_BUILD_TARGETS += build-static
+LIBLOKI_INSTALL_TARGETS += install-static
+else ifeq ($(BR2_SHARED_LIBS),y)
+LIBLOKI_BUILD_TARGETS += build-shared
+LIBLOKI_INSTALL_TARGETS += install-shared
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+LIBLOKI_BUILD_TARGETS += build-static build-shared
+LIBLOKI_INSTALL_TARGETS += install-static install-shared
+endif
+
+define LIBLOKI_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) $(LIBLOKI_BUILD_TARGETS)
+endef
+
+define LIBLOKI_INSTALL_STAGING_CMDS
+	$(MAKE) -C $(@D)/src DESTDIR=$(STAGING_DIR) $(LIBLOKI_INSTALL_TARGETS)
+	$(MAKE) -C $(@D)/include DESTDIR=$(STAGING_DIR) install
+endef
+
+# install to TARGET_DIR only the shared library
+ifeq ($(BR2_STATIC_LIBS),)
+define LIBLOKI_INSTALL_STAGING_SHARED_LIB
+	$(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) $(LIBLOKI_INSTALL_TARGETS)
+endef
+endif
+
+define LIBLOKI_INSTALL_TARGET_CMDS
+	$(LIBLOKI_INSTALL_STAGING_SHARED_LIB)
+endef
+
+$(eval $(generic-package))
-- 
2.9.3
