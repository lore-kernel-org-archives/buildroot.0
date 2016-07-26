From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 26 Jul 2016 17:29:51 -0300
Subject: [Buildroot] [PATCH v2] stella: new package
Message-ID: <1469564991-29029-1-git-send-email-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stella is a multi-platform Atari 2600 VCS emulator.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
Changes v1 -> v2:
 - separate patch that prevents striping stella binary when installing
 - inherit dependency on !BR2_STATIC_LIBS from sdl2
 - change license to GPLv2+ and add Copyright.txt to license files
 - unconditionally depends on libpng and zlib
 - build the package with the generic-package infrastructure
---
 package/Config.in                                  |  1 +
 .../0001-Add-cross-compilation-support.patch       | 29 +++++++++++++++++
 .../stella/0002-Do-not-strip-when-installing.patch | 26 ++++++++++++++++
 package/stella/Config.in                           | 16 ++++++++++
 package/stella/stella.hash                         |  2 ++
 package/stella/stella.mk                           | 36 ++++++++++++++++++++++
 6 files changed, 110 insertions(+)
 create mode 100644 package/stella/0001-Add-cross-compilation-support.patch
 create mode 100644 package/stella/0002-Do-not-strip-when-installing.patch
 create mode 100644 package/stella/Config.in
 create mode 100644 package/stella/stella.hash
 create mode 100644 package/stella/stella.mk

diff --git a/package/Config.in b/package/Config.in
index 8ceeb9eec203..c7e96d68fbb4 100644
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
index 000000000000..3266d31d26de
--- /dev/null
+++ b/package/stella/0001-Add-cross-compilation-support.patch
@@ -0,0 +1,29 @@
+From fba2627bebc7d497f64827a0517316e9b5c64c0a Mon Sep 17 00:00:00 2001
+From: Sergio Prado <sergio.prado@e-labworks.com>
+Date: Tue, 26 Jul 2016 13:24:00 -0300
+Subject: [PATCH 1/2] Add cross-compilation support
+
+Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ configure | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
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
diff --git a/package/stella/0002-Do-not-strip-when-installing.patch b/package/stella/0002-Do-not-strip-when-installing.patch
new file mode 100644
index 000000000000..cba4b088fde0
--- /dev/null
+++ b/package/stella/0002-Do-not-strip-when-installing.patch
@@ -0,0 +1,26 @@
+From a86140353cb2e162d88da9caa1716915be2f6893 Mon Sep 17 00:00:00 2001
+From: Sergio Prado <sergio.prado@e-labworks.com>
+Date: Tue, 26 Jul 2016 13:25:12 -0300
+Subject: [PATCH 2/2] Do not strip when installing
+
+Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
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
+-- 
+1.9.1
+
diff --git a/package/stella/Config.in b/package/stella/Config.in
new file mode 100644
index 000000000000..55f177f75371
--- /dev/null
+++ b/package/stella/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_STELLA
+	bool "stella"
+	select BR2_PACKAGE_SDL2
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_ZLIB
+	depends on !BR2_STATIC_LIBS # sdl2
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	help
+	  Stella is a multi-platform Atari 2600 VCS emulator.
+
+	  http://stella.sourceforge.net/
+
+comment "stella needs a toolchain w/ dynamic library, C++, gcc >= 4.8"
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
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
index 000000000000..9fd7f40c61f3
--- /dev/null
+++ b/package/stella/stella.mk
@@ -0,0 +1,36 @@
+################################################################################
+#
+# stella
+#
+################################################################################
+
+STELLA_VERSION = 4.7.2
+STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
+STELLA_SITE = http://downloads.sourceforge.net/stella
+STELLA_LICENSE = GPLv2+
+STELLA_LICENSE_FILES = Copyright.txt License.txt
+
+STELLA_DEPENDENCIES = sdl2 libpng zlib
+
+STELLA_CONF_OPTS = \
+	--host=$(GNU_TARGET_NAME) \
+	--prefix=/usr \
+	--with-sdl-prefix=$(STAGING_DIR)/usr
+
+define STELLA_CONFIGURE_CMDS
+	(cd $(@D); \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure $(STELLA_CONF_OPTS) \
+	)
+endef
+
+define STELLA_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define STELLA_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
