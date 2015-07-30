From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jul 2015 09:29:23 +0200
Subject: [Buildroot] [git commit] package/libcec: bump to version 3.0.1
Message-ID: <20150730132257.D8ECC7FFC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cfefcd859f2b51a6ebe23c5be149ff258755e249
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- reflect upstream changes of the build system by switching from
  an autotools-package to cmake-package

[Thomas:
  - remove the gcc 4.5 dependency. While we do need a dependency on
    the gcc version, the proposed implementation was not correct as it
    wasn't handling external toolchains.
  - add a patch to fix a problem caused by libcec build system trying
    to use 'git' to get a version number, which does not work when the
    version control system information is not available, as is the
    case in Buildroot.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-generate-an-invalid-env.h-when-not-built.patch |   31 ++++++++++++++++++++
 package/libcec/0001-remove-Wno-psabi.patch         |   21 -------------
 package/libcec/Config.in                           |    1 +
 package/libcec/libcec.mk                           |   23 +++++++++-----
 4 files changed, 47 insertions(+), 29 deletions(-)

diff --git a/package/libcec/0001-fixed-don-t-generate-an-invalid-env.h-when-not-built.patch b/package/libcec/0001-fixed-don-t-generate-an-invalid-env.h-when-not-built.patch
new file mode 100644
index 0000000..d823a5b
--- /dev/null
+++ b/package/libcec/0001-fixed-don-t-generate-an-invalid-env.h-when-not-built.patch
@@ -0,0 +1,31 @@
+From 369ffb5be23eca520df99732541d0482da271fd3 Mon Sep 17 00:00:00 2001
+From: Lars Op den Kamp <lars@opdenkamp.eu>
+Date: Sat, 11 Jul 2015 00:53:17 +0200
+Subject: [PATCH] fixed: don't generate an invalid env.h when not built with
+ the .git dir present. closes #112
+
+Backported from upstream commit 2f32a9debc1f148b5dfcfc463480f1432bb71725.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ support/git-rev.sh | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/support/git-rev.sh b/support/git-rev.sh
+index 5dce3d0..4aadae6 100755
+--- a/support/git-rev.sh
++++ b/support/git-rev.sh
+@@ -1,5 +1,8 @@
+ #!/bin/sh
+ 
+ ## cmake doesn't read the variable when it doesn't end with a newline, and I haven't figured out how to have it add a newline directly...
+-echo -n "`git --no-pager log --abbrev=7 -n 1 --pretty=format:"%h"`\n"
+-
++if [ -d .git ]; then
++  echo "`git --no-pager log --abbrev=7 -n 1 --pretty=format:"%h"`"
++else
++  echo "<unknown>"
++fi
+-- 
+2.5.0
+
diff --git a/package/libcec/0001-remove-Wno-psabi.patch b/package/libcec/0001-remove-Wno-psabi.patch
deleted file mode 100644
index 4956c14..0000000
--- a/package/libcec/0001-remove-Wno-psabi.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Do not use -Wno-psabi option
-
-This option was added in gcc 4.5, and Buildroot still uses gcc 4.3 on
-some architectures. Since it's non essential (only disables some
-warning), let's get rid of it.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/configure.ac
-===================================================================
---- a/configure.ac
-+++ b/configure.ac
-@@ -137,7 +137,7 @@
- use_udev="no"
- use_adapter_detection="yes"
- use_lockdev="no"
--SUPPRESS_MANGLING_WARNINGS=" -Wno-psabi"
-+SUPPRESS_MANGLING_WARNINGS=""
- case "${host}" in
-   *-*-linux*)
-     ## search for udev if pkg-config was found
diff --git a/package/libcec/Config.in b/package/libcec/Config.in
index e5fa9c8..2cf011d 100644
--- a/package/libcec/Config.in
+++ b/package/libcec/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LIBCEC
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBPLATFORM
 	help
 	  libcec allows you in combination with the right hardware to
 	  control your home theater devices with your TV remote
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 8bdc9ea..c5b008f 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCEC_VERSION = libcec-2.2.0-repack
+LIBCEC_VERSION = libcec-3.0.1
 LIBCEC_SITE = $(call github,Pulse-Eight,libcec,$(LIBCEC_VERSION))
 LIBCEC_LICENSE = GPLv2+
 LIBCEC_LICENSE_FILES = COPYING
@@ -12,7 +12,7 @@ LIBCEC_LICENSE_FILES = COPYING
 # Autoreconf required due to being a dev tarball and not a release tarball.
 LIBCEC_AUTORECONF = YES
 LIBCEC_INSTALL_STAGING = YES
-LIBCEC_DEPENDENCIES = host-pkgconf
+LIBCEC_DEPENDENCIES = host-pkgconf libplatform
 
 ifeq ($(BR2_PACKAGE_LOCKDEV),y)
 LIBCEC_DEPENDENCIES += lockdev
@@ -22,13 +22,20 @@ ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 LIBCEC_DEPENDENCIES += udev
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
+LIBCEC_DEPENDENCIES += host-swig $(if $(BR2_PACKAGE_PYTHON3),python3,python)
+endif
+
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-LIBCEC_CONF_OPTS = --enable-rpi \
-	--with-rpi-include-path=$(STAGING_DIR)/usr/include
 LIBCEC_DEPENDENCIES += rpi-userland
-LIBCEC_CONF_ENV += LIBS="-lvcos -lvchostif"
-else
-LIBCEC_CONF_OPTS = --disable-rpi
+LIBCEC_CONF_OPTS += \
+	-DCMAKE_C_FLAGS="-lvcos -lvchiq_arm" \
+	-DCMAKE_CXX_FLAGS="-I$(STAGING_DIR)/usr/include/interface/vmcs_host/linux \
+		-I$(STAGING_DIR)/usr/include/interface/vcos/pthreads"
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXRANDR),y)
+LIBCEC_DEPENDENCIES += xlib_libXrandr
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
