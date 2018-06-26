From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Jun 2018 23:40:30 +0200
Subject: [Buildroot] [git commit] cmocka: new package
Message-ID: <20180626214336.0B20683534@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b54c1e0730764548eb3bcc0cbe3142a247941033
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nimai Mahajan <nimaim@gmail.com>
Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
Signed-off-by: Joel Carlson &lt;<a href="mailto:JoelsonCarl@gmail.com" target="_blank">JoelsonCarl at gmail.com</a>&gt;<br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...0001-cmocka-cmake-fix-stack-protect-check.patch | 34 ++++++++++++++++++++++
 package/cmocka/Config.in                           | 15 ++++++++++
 package/cmocka/cmocka.hash                         |  2 ++
 package/cmocka/cmocka.mk                           | 23 +++++++++++++++
 6 files changed, 76 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8b1cb0c1d7..c52a57c507 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -968,6 +968,7 @@ N:	Jeremy Rosen <jeremy.rosen@openwide.fr>
 F:	package/fxload/
 
 N:	Joel Carlson <JoelsonCarl@gmail.com>
+F:	package/cmocka/
 F:	package/flatcc/
 
 N:	Joel Stanley <joel@jms.id.au>
diff --git a/package/Config.in b/package/Config.in
index b689017be5..a012d2c809 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1504,6 +1504,7 @@ menu "Other"
 	source "package/clang/Config.in"
 	source "package/clapack/Config.in"
 	source "package/classpath/Config.in"
+	source "package/cmocka/Config.in"
 	source "package/cppcms/Config.in"
 	source "package/cracklib/Config.in"
 	source "package/dawgdic/Config.in"
diff --git a/package/cmocka/0001-cmocka-cmake-fix-stack-protect-check.patch b/package/cmocka/0001-cmocka-cmake-fix-stack-protect-check.patch
new file mode 100644
index 0000000000..c7a2c2742a
--- /dev/null
+++ b/package/cmocka/0001-cmocka-cmake-fix-stack-protect-check.patch
@@ -0,0 +1,34 @@
+From f9a964edde4011adf88902018cbb87723d78d0a2 Mon Sep 17 00:00:00 2001
+From: Joel Carlson <JoelsonCarl@gmail.com>
+Date: Wed, 20 Jun 2018 14:35:13 -0600
+Subject: [PATCH 1/1] cmocka cmake: fix stack protect check
+
+The cmake check for if -fstack-protect is supported needs to use
+CMAKE_REQUIRED_FLAGS and not CMAKE_REQUIRED_DEFINITIONS.
+
+Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
+---
+Upstream status: submitted to cmocka mailing list
+
+ cmake/Modules/CheckCCompilerFlagSSP.cmake | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/cmake/Modules/CheckCCompilerFlagSSP.cmake b/cmake/Modules/CheckCCompilerFlagSSP.cmake
+index 2fe4395..ed34eb3 100644
+--- a/cmake/Modules/CheckCCompilerFlagSSP.cmake
++++ b/cmake/Modules/CheckCCompilerFlagSSP.cmake
+@@ -19,8 +19,8 @@
+ include(CheckCSourceCompiles)
+ 
+ function(CHECK_C_COMPILER_FLAG_SSP _FLAG _RESULT)
+-   set(SAFE_CMAKE_REQUIRED_DEFINITIONS "${CMAKE_REQUIRED_DEFINITIONS}")
+-   set(CMAKE_REQUIRED_DEFINITIONS "${_FLAG}")
++   set(SAFE_CMAKE_REQUIRED_FLAGS "${CMAKE_REQUIRED_FLAGS}")
++   set(CMAKE_REQUIRED_FLAGS "${_FLAG}")
+    check_c_source_compiles("int main(int argc, char **argv) { char buffer[256]; return buffer[argc]=0;}" ${_RESULT})
+-   set(CMAKE_REQUIRED_DEFINITIONS "${SAFE_CMAKE_REQUIRED_DEFINITIONS}")
++   set(CMAKE_REQUIRED_FLAGS "${SAFE_CMAKE_REQUIRED_FLAGS}")
+ endfunction(CHECK_C_COMPILER_FLAG_SSP)
+-- 
+2.7.4
+
diff --git a/package/cmocka/Config.in b/package/cmocka/Config.in
new file mode 100644
index 0000000000..cf49d0f6be
--- /dev/null
+++ b/package/cmocka/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_CMOCKA
+	bool cmocka
+	depends on !BR2_STATIC_LIBS
+	help
+	  cmocka is an elegant unit testing framework for C with support
+	  for mock objects. It only requires the standard C library,
+	  works on a range of computing platforms (including embedded)
+	  and with different compilers. It is a fork of Google's very
+	  popular cmockery unit testing framework to fix bugs and
+	  support it in the future.
+
+	  https://cmocka.org
+
+comment "cmocka needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/cmocka/cmocka.hash b/package/cmocka/cmocka.hash
new file mode 100644
index 0000000000..1de4a1240f
--- /dev/null
+++ b/package/cmocka/cmocka.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 f02ef48a7039aa77191d525c5b1aee3f13286b77a13615d11bc1148753fc0389 cmocka-1.1.1.tar.xz
diff --git a/package/cmocka/cmocka.mk b/package/cmocka/cmocka.mk
new file mode 100644
index 0000000000..64f5a4ae18
--- /dev/null
+++ b/package/cmocka/cmocka.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# cmocka
+#
+################################################################################
+
+CMOCKA_VERSION = 1.1.1
+CMOCKA_SOURCE = cmocka-$(CMOCKA_VERSION).tar.xz
+CMOCKA_SITE = https://cmocka.org/files/1.1
+CMOCKA_LICENSE = Apache-2.0
+CMOCKA_LICENSE_FILES = COPYING
+CMOCKA_INSTALL_STAGING = YES
+
+# cmocka only supports out of source builds
+CMOCKA_SUPPORTS_IN_SOURCE_BUILD = NO
+
+# cmocka always builds a shared library, but you can optionally build a static
+# library as well
+ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+CMOCKA_CONF_OPTS += -DWITH_STATIC_LIB=ON
+endif
+
+$(eval $(cmake-package))
