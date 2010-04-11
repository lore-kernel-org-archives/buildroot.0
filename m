From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Apr 2010 06:05:13 +0200
Subject: [Buildroot] [PATCH 17/25] Guess build system and remove
	BR2_GNU_BUILD_SUFFIX
In-Reply-To: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0f4314c2987311fe825f8a6841b90109fa45a87a.1270958653.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Instead of having a configuration option BR2_GNU_BUILD_SUFFIX, let's
use config.guess to guess the build system type.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in           |   13 -------------
 Makefile            |   10 ++++++----
 package/Makefile.in |    1 -
 package/qt/qt.mk    |    2 +-
 4 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/Config.in b/Config.in
index 7ad84e7..bc4fec2 100644
--- a/Config.in
+++ b/Config.in
@@ -103,19 +103,6 @@ config BR2_STAGING_DIR
 
 source	"target/device/Config.in.mirrors"
 
-config BR2_GNU_BUILD_SUFFIX
-	string "GNU build hostname suffix"
-	default "pc-linux-gnu"
-	help
-	  The string used to pass to configure scripts via the
-	  --build= option.  Just specify the suffix here, the leading
-	  arch will be filled in automatically.
-
-	  Here's some copy and paste build host options for you:
-	      linux:   pc-linux-gnu
-	      cygwin:  pc-cygwin
-	      os x:    apple-darwin7 / apple-darwin8
-
 config BR2_GNU_TARGET_SUFFIX
 	string "GNU target suffix"
 	default "linux-uclibcgnueabi" if BR2_ARM_EABI
diff --git a/Makefile b/Makefile
index 03ed4c5..7fdf697 100644
--- a/Makefile
+++ b/Makefile
@@ -153,29 +153,31 @@ cc-option=$(shell if $(TARGET_CC) $(TARGET_CFLAGS) $(1) -S -o /dev/null -xc /dev
 unexport CROSS_COMPILE
 unexport ARCH
 
+GNU_HOST_NAME=$(shell package/gnuconfig/config.guess)
+
 #############################################################
 #
 # Setup the proper filename extensions for the host
 #
 ##############################################################
-ifneq ($(findstring linux,$(BR2_GNU_BUILD_SUFFIX)),)
+ifneq ($(findstring linux,$(GNU_HOST_NAME)),)
 HOST_EXEEXT:=
 HOST_LIBEXT:=.a
 HOST_SHREXT:=.so
 endif
-ifneq ($(findstring apple,$(BR2_GNU_BUILD_SUFFIX)),)
+ifneq ($(findstring apple,$(GNU_HOST_NAME)),)
 HOST_EXEEXT:=
 HOST_LIBEXT:=.a
 HOST_SHREXT:=.dylib
 endif
-ifneq ($(findstring cygwin,$(BR2_GNU_BUILD_SUFFIX)),)
+ifneq ($(findstring cygwin,$(GNU_HOST_NAME)),)
 HOST_EXEEXT:=.exe
 HOST_LIBEXT:=.lib
 HOST_SHREXT:=.dll
 HOST_LOADLIBES="-lcurses -lintl"
 export HOST_LOADLIBES
 endif
-ifneq ($(findstring mingw,$(BR2_GNU_BUILD_SUFFIX)),)
+ifneq ($(findstring mingw,$(GNU_HOST_NAME)),)
 HOST_EXEEXT:=.exe
 HOST_LIBEXT:=.lib
 HOST_SHREXT:=.dll
diff --git a/package/Makefile.in b/package/Makefile.in
index efb4dec..8f1a29d 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -187,7 +187,6 @@ HOST_ARCH:=$(shell $(HOSTCC) -dumpmachine | sed -e s'/-.*//' \
 	-e 's/i[3-9]86/i386/' \
 	-e 's/xtensa.*/xtensa/' \
 	)
-GNU_HOST_NAME:=$(HOST_ARCH)-$(call qstrip,$(BR2_GNU_BUILD_SUFFIX))
 
 TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
 		AR="$(TARGET_AR)" \
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 9167349..4f42e59 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -372,7 +372,7 @@ BR2_PACKAGE_QT_EMB_PLATFORM:=$(call qstrip,$(BR2_PACKAGE_QT_EMB_PLATFORM))
 # x86x86fix
 # Workaround Qt Embedded bug when crosscompiling for x86 under x86 with linux
 # host. It's unclear if this would happen on other hosts.
-ifneq ($(findstring pc-linux,$(BR2_GNU_BUILD_SUFFIX)),)
+ifneq ($(findstring unknown-linux,$(GNU_HOST_NAME)),)
 ifneq ($(findstring x86,$(BR2_PACKAGE_QT_EMB_PLATFORM)),)
 QT_CONFIGURE+= -platform linux-g++
 endif
-- 
1.6.3.3
