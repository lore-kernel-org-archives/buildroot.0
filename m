From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Thu, 21 Jul 2016 18:46:47 -0300
Subject: [Buildroot] [PATCH] stella: new package
Message-ID: <1469137607-8560-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stella is a multi-platform Atari 2600 VCS emulator.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 package/Config.in                                  |  1 +
 .../0001-Add-cross-compilation-support.patch       | 43 ++++++++++++++++++++++
 package/stella/Config.in                           | 12 ++++++
 package/stella/stella.hash                         |  2 +
 package/stella/stella.mk                           | 25 +++++++++++++
 5 files changed, 83 insertions(+)
 create mode 100644 package/stella/0001-Add-cross-compilation-support.patch
 create mode 100644 package/stella/Config.in
 create mode 100644 package/stella/stella.hash
 create mode 100644 package/stella/stella.mk

diff --git a/package/Config.in b/package/Config.in
index 009b8280a378..952937d1ab16 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -220,6 +220,7 @@ menu "Games"
 	source "package/prboom/Config.in"
 	source "package/rubix/Config.in"
 	source "package/sl/Config.in"
+	source "package/stella/Config.in"
 	source "package/supertuxkart/Config.in"
 endmenu
 
diff --git a/package/stella/0001-Add-cross-compilation-support.patch b/package/stella/0001-Add-cross-compilation-support.patch
new file mode 100644
index 000000000000..f75b88a46985
--- /dev/null
+++ b/package/stella/0001-Add-cross-compilation-support.patch
@@ -0,0 +1,43 @@
+From 4d1087d29606c092919dd4375df674521af31c9c Mon Sep 17 00:00:00 2001
+From: Sergio Prado <sergio.prado@e-labworks.com>
+Date: Thu, 21 Jul 2016 13:36:21 -0300
+Subject: [PATCH] Add cross-compilation support
+
+Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ Makefile  | 2 +-
+ configure | 5 +++--
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 6dd0129587b3..b1aea5eed4a1 100644
+--- a/Makefile
++++ b/Makefile
+@@ -172,7 +172,7 @@ config.mak: $(srcdir)/configure
+ 
+ install: all
+ 	$(INSTALL) -d "$(DESTDIR)$(BINDIR)"
+-	$(INSTALL) -c -s -m 755 "$(srcdir)/stella$(EXEEXT)" "$(DESTDIR)$(BINDIR)/stella$(EXEEXT)"
++	$(INSTALL) -c -m 755 "$(srcdir)/stella$(EXEEXT)" "$(DESTDIR)$(BINDIR)/stella$(EXEEXT)"
+ 	$(INSTALL) -d "$(DESTDIR)$(DOCDIR)"
+ 	$(INSTALL) -c -m 644 "$(srcdir)/Announce.txt" "$(srcdir)/Changes.txt" "$(srcdir)/Copyright.txt" "$(srcdir)/License.txt" "$(srcdir)/README-SDL.txt" "$(srcdir)/Readme.txt" "$(srcdir)/Todo.txt" "$(srcdir)/docs/index.html" "$(srcdir)/docs/debugger.html" "$(DESTDIR)$(DOCDIR)/"
+ 	$(INSTALL) -d "$(DESTDIR)$(DOCDIR)/graphics"
+diff --git a/configure b/configure
+index 0d90a4f0acde..a4afea8e1880 100755
+--- a/configure
++++ b/configure
+@@ -502,8 +502,9 @@ if test -n "$_host"; then
+ 			_host_os=win32
+ 			;;
+ 		*)
+-			echo "Cross-compiling to unknown target, please add your target to configure."
+-			exit 1
++			echo "Cross-compiling to $_host target"
++			DEFINES="$DEFINES -DUNIX"
++			_host_os=unix
+ 			;;
+ 	esac
+ 	
+-- 
+1.9.1
+
diff --git a/package/stella/Config.in b/package/stella/Config.in
new file mode 100644
index 000000000000..0bb96db68fbb
--- /dev/null
+++ b/package/stella/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_STELLA
+	bool "stella"
+	select BR2_PACKAGE_SDL2
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	help
+	  Stella is a multi-platform Atari 2600 VCS emulator.
+
+	  http://stella.sourceforge.net/
+
+comment "stella needs a toolchain w/ C++, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/stella/stella.hash b/package/stella/stella.hash
new file mode 100644
index 000000000000..71defd28d0f2
--- /dev/null
+++ b/package/stella/stella.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 b2727a0e2d3b112d35dcb89b4bdc789e2c7f15e9d9c7054a69a2f67facd7416e  stella-4.7.2-src.tar.xz
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
new file mode 100644
index 000000000000..789a586bfd99
--- /dev/null
+++ b/package/stella/stella.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# stella
+#
+################################################################################
+
+STELLA_VERSION = 4.7.2
+STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
+STELLA_SITE = http://downloads.sourceforge.net/stella
+LIBFOO_LICENSE = GPLv2
+LIBFOO_LICENSE_FILES = License.txt
+
+STELLA_DEPENDENCIES = sdl2
+
+STELLA_CONF_OPTS = --with-sdl-prefix=$(STAGING_DIR)/usr
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+STELLA_DEPENDENCIES += libpng
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+STELLA_DEPENDENCIES += zlib
+endif
+
+$(eval $(autotools-package))
-- 
1.9.1
