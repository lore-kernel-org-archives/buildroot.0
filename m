From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 23:22:17 +0200
Subject: [Buildroot] [git commit] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.55
Message-ID: <20200919211303.0DD2987323@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=559d41ddfb9cd6d67dd0edcf3589b0aa4ea9ec26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a config option to explicitly enable the hid2hci tool, which is not
build by default anymore.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bluez5_utils-headers/bluez5_utils-headers.mk | 2 +-
 package/bluez5_utils/Config.in                       | 9 +++++++++
 package/bluez5_utils/bluez5_utils.hash               | 2 +-
 package/bluez5_utils/bluez5_utils.mk                 | 9 ++++++++-
 4 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
index 871986c817..589978c8c5 100644
--- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
+++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils
-BLUEZ5_UTILS_HEADERS_VERSION = 5.54
+BLUEZ5_UTILS_HEADERS_VERSION = 5.55
 BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 73c6f01324..016a16c4c5 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -104,6 +104,15 @@ config BR2_PACKAGE_BLUEZ5_UTILS_TEST
 	help
 	  Build BlueZ 5.x tests
 
+config BR2_PACKAGE_BLUEZ5_UTILS_TOOLS_HID2HCI
+	bool "build hid2hci tool"
+	depends on BR2_PACKAGE_HAS_UDEV
+	help
+	  Build BlueZ 5.x hid2hci tool
+
+comment "hid2hci tool needs udev /dev management"
+	depends on !BR2_PACKAGE_HAS_UDEV
+
 endif
 
 comment "bluez5-utils needs a toolchain w/ wchar, threads, headers >= 3.4, dynamic library"
diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index 3eb6912fb3..d0f3b80598 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256  68cdab9e63e8832b130d5979dc8c96fdb087b31278f342874d992af3e56656dc  bluez-5.54.tar.xz
+sha256  8863717113c4897e2ad3271fc808ea245319e6fd95eed2e934fae8e0894e9b88  bluez-5.55.tar.xz
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 2149614c56..f2c8cabcff 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils-headers
-BLUEZ5_UTILS_VERSION = 5.54
+BLUEZ5_UTILS_VERSION = 5.55
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
@@ -110,6 +110,13 @@ else
 BLUEZ5_UTILS_CONF_OPTS += --disable-test
 endif
 
+# enable hid2hci tool
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_TOOLS_HID2HCI),y)
+BLUEZ5_UTILS_CONF_OPTS += --enable-hid2hci
+else
+BLUEZ5_UTILS_CONF_OPTS += --disable-hid2hci
+endif
+
 # use udev if available
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 BLUEZ5_UTILS_CONF_OPTS += --enable-udev
