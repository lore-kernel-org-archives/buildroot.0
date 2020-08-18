From: Christian Stewart <christian@paral.in>
Date: Tue, 18 Aug 2020 12:11:30 -0700
Subject: [Buildroot] [PATCH 1/1] package/rpi-userland: add support for
 aarch64 build
Message-ID: <20200818191130.2888592-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested on Pi4 Model B (aarch64).

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/rpi-userland/Config.in       | 4 ++--
 package/rpi-userland/rpi-userland.mk | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index 342faf26e3..81f3588822 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_RPI_USERLAND
 	bool "rpi-userland"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_aarch64
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
@@ -40,6 +40,6 @@ config BR2_PACKAGE_RPI_USERLAND_HELLO
 endif
 
 comment "rpi-userland needs a toolchain w/ C++, threads, dynamic library"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_aarch64
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 9edc92344e..ec5e26f140 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -13,6 +13,10 @@ RPI_USERLAND_CONF_OPTS = -DVMCS_INSTALL_PREFIX=/usr
 
 RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
 
+ifeq ($(BR2_aarch64),y)
+RPI_USERLAND_CONF_OPTS += -DARM64=ON
+endif
+
 ifeq ($(BR2_PACKAGE_RPI_USERLAND_HELLO),y)
 
 RPI_USERLAND_CONF_OPTS += -DALL_APPS=ON
-- 
2.28.0
