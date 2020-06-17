From: Mike Davies <busybox_mail@rovoreed.com>
Date: Wed, 17 Jun 2020 18:21:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/rpi-userland: fix build on 64-bit
 Raspberry Pi 3
Message-ID: <0478efa17e8530ec60d74c8e3fff37fccbed614f.camel@rovoreed.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Prior to this patch it was not possible to select the package rpi-userland if
raspberrypi3_64_defconfig was used.
Then the .mk file needed updating to allow 64 bit builds.

Signed-off-by: Mike Davies <git-user44@rovoreed.com>
---
 package/rpi-userland/Config.in       | 4 ++--
 package/rpi-userland/rpi-userland.mk | 6 ++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/rpi-userland/Config.in b/package/rpi-userland/Config.in
index 342faf26e3..81f3588822 100644
--- a/package/rpi-userland/Config.in
+++ b/package/rpi-userland/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_RPI_USERLAND
        bool "rpi-userland"
-       depends on BR2_arm
+       depends on BR2_arm || BR2_aarch64
        depends on BR2_INSTALL_LIBSTDCPP
        depends on BR2_TOOLCHAIN_HAS_THREADS
        depends on !BR2_STATIC_LIBS
@@ -40,6 +40,6 @@ config BR2_PACKAGE_RPI_USERLAND_HELLO
 endif
 
 comment "rpi-userland needs a toolchain w/ C++, threads, dynamic library"
-       depends on BR2_arm
+       depends on BR2_arm || BR2_aarch64
        depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
                BR2_STATIC_LIBS
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index efb02f719f..d8b2a281af 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -13,6 +13,12 @@ RPI_USERLAND_CONF_OPTS = -DVMCS_INSTALL_PREFIX=/usr
 
 RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
 
+ifeq ($(BR2_aarch64),y)
+
+RPI_USERLAND_CONF_OPTS += -DARM64=YES
+
+endif # BR2_aarch64
+
 ifeq ($(BR2_PACKAGE_RPI_USERLAND_HELLO),y)
 
 RPI_USERLAND_CONF_OPTS += -DALL_APPS=ON
-- 
2.21.3
