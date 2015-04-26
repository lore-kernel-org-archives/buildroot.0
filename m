From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Apr 2015 20:47:19 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/libical: bump version to v1.0.1
Message-ID: <1430074039-15578-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Project moved to github according to http://sourceforge.net/projects/freeassociation
"As of 2014-06-14, this project may now be found at http://github.com/libical."

From install.txt:

  Libical v1.0 and above uses the CMake buildsystem.
  The autoconf build system has been removed and is no longer supported.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: add note about cmake switch in commit message (Baruch)
v2: adjust comment in Config.in (Baruch)

 package/libical/0001-no-tests.patch |   19 +++++++++++++++++++
 package/libical/Config.in           |    7 ++++---
 package/libical/libical.hash        |    2 +-
 package/libical/libical.mk          |   10 +++++++---
 4 files changed, 31 insertions(+), 7 deletions(-)
 create mode 100644 package/libical/0001-no-tests.patch

diff --git a/package/libical/0001-no-tests.patch b/package/libical/0001-no-tests.patch
new file mode 100644
index 0000000..324c04f
--- /dev/null
+++ b/package/libical/0001-no-tests.patch
@@ -0,0 +1,19 @@
+Disable tests to avoid MMU dependency due to fork.
+
+Fixes
+CMakeFiles/regression.dir/regression.c.o: In function `_test_file_locks':
+/home/br/br4/output/build/libical-v1.0.1/src/test/regression.c:(.text+0x96d8): undefined reference to `_fork'
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr libical-1.0.1.org/src/CMakeLists.txt libical-1.0.1/src/CMakeLists.txt
+--- libical-1.0.1.org/src/CMakeLists.txt	2014-10-09 17:07:05.000000000 +0200
++++ libical-1.0.1/src/CMakeLists.txt	2015-04-25 17:41:22.657345548 +0200
+@@ -1,7 +1,6 @@
+ add_subdirectory(libical)
+ add_subdirectory(libicalss)
+ add_subdirectory(libicalvcal)
+-add_subdirectory(test)
+ 
+ if(MSVC)
+   install(FILES
diff --git a/package/libical/Config.in b/package/libical/Config.in
index 9bb63c3..1616d34 100644
--- a/package/libical/Config.in
+++ b/package/libical/Config.in
@@ -1,11 +1,12 @@
 config BR2_PACKAGE_LIBICAL
 	bool "libical"
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
 	help
 	  libical is an Open Source (MPL/LGPL) implementation of the IETF's
 	  iCalendar Calendaring and Scheduling protocols.
 
-	  http://www.citadel.org/doku.php/documentation:featured_projects:libical
+	  http://libical.github.io/libical
 
-comment "libical needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
+comment "libical needs a toolchain w/ dynamic library, wchar"
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/libical/libical.hash b/package/libical/libical.hash
index 2382ad7..ab5c2dd 100644
--- a/package/libical/libical.hash
+++ b/package/libical/libical.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  2ae78b0757f0dd13431acf42a9a8d038339fd4767fd5134e650bf60ee0b4dff0  libical-0.48.tar.gz
+sha256	7d5f613454ec6c7d1bcfb441c919215be53292aa15cd1cb14249d1413d6c610c	libical-v1.0.1.tar.gz
diff --git a/package/libical/libical.mk b/package/libical/libical.mk
index 4025627..b3702ae 100644
--- a/package/libical/libical.mk
+++ b/package/libical/libical.mk
@@ -4,10 +4,14 @@
 #
 ################################################################################
 
-LIBICAL_VERSION = 0.48
-LIBICAL_SITE = http://downloads.sourceforge.net/project/freeassociation/libical/libical-$(LIBICAL_VERSION)
+LIBICAL_VERSION = v1.0.1
+LIBICAL_SITE = $(call github,libical,libical,$(LIBICAL_VERSION))
 LIBICAL_INSTALL_STAGING = YES
 LIBICAL_LICENSE = MPLv1.0 or LGPLv2.1
 LIBICAL_LICENSE_FILES = LICENSE
 
-$(eval $(autotools-package))
+# building without this option is broken, it is used by
+# Gentoo/alpinelinux as well
+LIBICAL_CONF_OPTS = -DSHARED_ONLY=true
+
+$(eval $(cmake-package))
-- 
1.7.10.4
