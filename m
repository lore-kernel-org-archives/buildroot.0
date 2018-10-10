From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 10:43:34 +0200
Subject: [Buildroot] [git commit] libcorrect: add package
Message-ID: <20181010084336.54C1F81F87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=abbf2f4e5dd64afedffa019e16c818d68879ba13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds the libcorrect package. Libcorrect by default builds a shared
library, so require shared libraries. We add a patch to make sure
-Wpedantic is only used if supported by the C compiler (gcc < 4.8
didn't support it).

Signed-off-by: Joel Carlson <JoelsonCarl@gmail.com>
[Thomas: add a patch to use -Wpedantic only if available, instead of
depending on gcc >= 4.8.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...MakeLists.txt-conditionally-use-Wpedantic.patch | 42 ++++++++++++++++++++++
 package/libcorrect/Config.in                       | 12 +++++++
 package/libcorrect/libcorrect.hash                 |  3 ++
 package/libcorrect/libcorrect.mk                   | 13 +++++++
 6 files changed, 72 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0fb3738e9a..0757ebfcf2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1073,6 +1073,7 @@ N:	Joel Carlson <JoelsonCarl@gmail.com>
 F:	package/capnproto/
 F:	package/cmocka/
 F:	package/flatcc/
+F:	package/libcorrect/
 
 N:	Joel Stanley <joel@jms.id.au>
 F:	package/pdbg/
diff --git a/package/Config.in b/package/Config.in
index 29e11441f9..aae7855ec3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1609,6 +1609,7 @@ menu "Other"
 	source "package/libcap-ng/Config.in"
 	source "package/libcgroup/Config.in"
 	source "package/libcofi/Config.in"
+	source "package/libcorrect/Config.in"
 	source "package/libcroco/Config.in"
 	source "package/libcrossguid/Config.in"
 	source "package/libcsv/Config.in"
diff --git a/package/libcorrect/0001-CMakeLists.txt-conditionally-use-Wpedantic.patch b/package/libcorrect/0001-CMakeLists.txt-conditionally-use-Wpedantic.patch
new file mode 100644
index 0000000000..77e29ad833
--- /dev/null
+++ b/package/libcorrect/0001-CMakeLists.txt-conditionally-use-Wpedantic.patch
@@ -0,0 +1,42 @@
+From 8fc28b4c4c01581b25220fdbc1eeda196e399256 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Wed, 10 Oct 2018 09:28:00 +0200
+Subject: [PATCH] CMakeLists.txt: conditionally use -Wpedantic
+
+-Wpedantic is only provided by gcc >= 4.8. Since showing pedantic
+warnings is not really mandatory, let's only use this option when the
+compiler supports it.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://github.com/quiet/libcorrect/pull/25
+---
+ CMakeLists.txt | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 193f311..e570198 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -3,13 +3,18 @@ project(Correct C)
+ include(CheckLibraryExists)
+ include(CheckIncludeFiles)
+ include(CheckCSourceCompiles)
++include(CheckCCompilerFlag)
+ 
+ if(MSVC)
+ set(LIBM "")
+ set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /W4")
+ else(MSVC)
+ set(LIBM "m")
+-set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC -std=c99 -Wpedantic -Wall")
++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC -std=c99 -Wall")
++check_c_compiler_flag(-Wpedantic COMPILER_SUPPORTS_WPEDANTIC)
++if(COMPILER_SUPPORTS_WPEDANTIC)
++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wpedantic")
++endif()
+ if(CMAKE_BUILD_TYPE STREQUAL "Debug")
+     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g3 -O0 -fsanitize=address")
+     set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-no_pie,")
+-- 
+2.14.4
+
diff --git a/package/libcorrect/Config.in b/package/libcorrect/Config.in
new file mode 100644
index 0000000000..eba6dc43aa
--- /dev/null
+++ b/package/libcorrect/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBCORRECT
+	bool "libcorrect"
+	depends on !BR2_STATIC_LIBS
+	help
+	  A C library for Forward Error Correction, providing
+	  convolutional codes and Reed-Solomon codes. It is part
+	  of the Quiet Modem Project.
+
+	  https://github.com/quiet/libcorrect
+
+comment "libcorrect needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/libcorrect/libcorrect.hash b/package/libcorrect/libcorrect.hash
new file mode 100644
index 0000000000..20df38c158
--- /dev/null
+++ b/package/libcorrect/libcorrect.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256	79861750540fb3a1cc501ee217cb4d1febc4855f3fb82e5eb60906eec5379890  libcorrect-ce6c17f1f988765ae3695315d7cce1f2a2e6cf0d.tar.gz
+sha256	135138cd4304aa637836758dc5edfb5f21b7d09ecc637d25288d206b151a5768  LICENSE
diff --git a/package/libcorrect/libcorrect.mk b/package/libcorrect/libcorrect.mk
new file mode 100644
index 0000000000..0a84aa5c26
--- /dev/null
+++ b/package/libcorrect/libcorrect.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# libcorrect
+#
+################################################################################
+
+LIBCORRECT_VERSION = ce6c17f1f988765ae3695315d7cce1f2a2e6cf0d
+LIBCORRECT_SITE = $(call github,quiet,libcorrect,$(LIBCORRECT_VERSION))
+LIBCORRECT_LICENSE = BSD-3-Clause
+LIBCORRECT_LICENSE_FILES = LICENSE
+LIBCORRECT_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
