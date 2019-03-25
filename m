From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Mar 2019 19:36:32 +0100
Subject: [Buildroot] [git commit] package/{openjdk,
 openjdk-bin}: bump version to 12+33
Message-ID: <20190325185456.7FED37F924@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d0b60e656aa935af7709b30b231bb92cb850259
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Because one package relies on the other, bump both at the same time.

Other changes:
 - Drop --with-cpu-port=aarch64 option as it is no longer a valid option.
   (See https://openjdk.java.net/jeps/340)
 - Add xlib_libXrandr as a dependency.

Tested with:
./support/testing/run-tests -s -o ./output/ -d dl tests.package.test_openjdk.TestOpenJdk

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openjdk-bin/openjdk-bin.hash | 4 ++--
 package/openjdk-bin/openjdk-bin.mk   | 8 ++++----
 package/openjdk/Config.in            | 1 +
 package/openjdk/openjdk.hash         | 2 +-
 package/openjdk/openjdk.mk           | 9 +++++----
 5 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index d36a582a33..63ed5874c4 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -1,5 +1,5 @@
-# From https://github.com/AdoptOpenJDK/openjdk11-binaries/releases
-sha256	d02089d834f7702ac1a9776d8d0d13ee174d0656cf036c6b68b9ffb71a6f610e	OpenJDK11U-jdk_x64_linux_hotspot_11.0.2_9.tar.gz
+# From https://github.com/AdoptOpenJDK/openjdk12-binaries/releases
+sha256	4739064dc439a05487744cce0ba951cb544ed5e796f6c699646e16c09da5dd6a	OpenJDK12U-jdk_x64_linux_hotspot_12_33.tar.gz
 
 # Locally calculated
 sha256	4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726	legal/java.prefs/LICENSE
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 1d4f44804c..d2e0c2fd3b 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-HOST_OPENJDK_BIN_VERSION_MAJOR = 11.0.2
-HOST_OPENJDK_BIN_VERSION_MINOR = 9
+HOST_OPENJDK_BIN_VERSION_MAJOR = 12
+HOST_OPENJDK_BIN_VERSION_MINOR = 33
 HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
-HOST_OPENJDK_BIN_SOURCE = OpenJDK11U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
-HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
+HOST_OPENJDK_BIN_SOURCE = OpenJDK12U-jdk_x64_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
+HOST_OPENJDK_BIN_SITE = https://github.com/AdoptOpenJDK/openjdk12-binaries/releases/download/jdk-$(HOST_OPENJDK_BIN_VERSION_MAJOR)%2B$(HOST_OPENJDK_BIN_VERSION_MINOR)
 HOST_OPENJDK_BIN_LICENSE = GPL-2.0+ with exception
 HOST_OPENJDK_BIN_LICENSE_FILES = legal/java.prefs/LICENSE legal/java.prefs/ASSEMBLY_EXCEPTION
 
diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 3f2f1f47c2..9cd7bffea3 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -33,6 +33,7 @@ config BR2_PACKAGE_OPENJDK
 	select BR2_PACKAGE_LCMS2
 	select BR2_PACKAGE_LIBPNG
 	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_XLIB_LIBXRANDR
 	select BR2_PACKAGE_XLIB_LIBXRENDER
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XLIB_LIBXTST
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 8b14609066..91d0f1dbce 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 6c69a2c1b5177659d4263545cf83e0fbcd697669b0107481372be3648af7b89b  openjdk-jdk-11.0.2+9.tar.gz
+sha256 de278328668bdaf35d50d0319d15d64d195ddd8a0de9c6fde3a6c9ca10135a92  openjdk-jdk-12+33.tar.gz
 sha256 4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 602e26b34b..3f7b87ca96 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-OPENJDK_VERSION_MAJOR = 11.0.2
-OPENJDK_VERSION_MINOR = 9
+OPENJDK_VERSION_MAJOR = 12
+OPENJDK_VERSION_MINOR = 33
 OPENJDK_VERSION = jdk-$(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
-OPENJDK_SITE = $(call github,AdoptOpenJDK,openjdk-jdk11u,$(OPENJDK_VERSION))
+OPENJDK_SITE = $(call github,AdoptOpenJDK,openjdk-jdk12u,$(OPENJDK_VERSION))
 OPENJDK_LICENSE = GPL-2.0+ with exception
 OPENJDK_LICENSE_FILES = LICENSE
 
@@ -26,6 +26,7 @@ OPENJDK_DEPENDENCIES = \
 	lcms2 \
 	libpng \
 	libusb \
+	xlib_libXrandr \
 	xlib_libXrender \
 	xlib_libXt \
 	xlib_libXtst \
@@ -90,7 +91,7 @@ OPENJDK_CONF_OPTS = \
 
 # If building for AArch64, use the provided CPU port.
 ifeq ($(BR2_aarch64),y)
-OPENJDK_CONF_OPTS += --with-cpu-port=aarch64 --with-abi-profile=aarch64
+OPENJDK_CONF_OPTS += --with-abi-profile=aarch64
 endif
 
 ifeq ($(BR2_CCACHE),y)
