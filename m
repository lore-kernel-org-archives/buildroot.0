From: Peter Seiderer <ps.report@gmx.net>
Date: Fri,  9 Dec 2016 22:37:05 +0100
Subject: [Buildroot] [PATCH] WIP brummbeere: new package
Message-ID: <20161209213705.6784-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Just a preliminary patch providing a brummbeere buildroot package for
Azik Aziz to avoid the original brummbeere build system mess (see [1])

Warning:
- brummbeere runs as root user
- no password set for root user
- music playing not testes (needs an webdav server from where the music
  streams/files are loaded)
- only tested on RPi3, brummbeere starts up on HDMI Display (login possible after
  brummbeere exit)

Apply patch on lates buildroot, run
	$ make raspberrypi_brummbeere_defconfig
	$ make
and copy resulting output/sdcard.img to SD card (see board/raspberrypi/readme.txt).

[1] http://lists.busybox.net/pipermail/buildroot/2016-December/179089.html
---
 .../etc/systemd/network/wired.network              |  5 ++
 configs/raspberrypi3_brummbeere_defconfig          | 65 ++++++++++++++++++++++
 configs/raspberrypi_brummbeere_defconfig           | 63 +++++++++++++++++++++
 package/Config.in                                  |  1 +
 ...ce-file-handling-rename-qml.rc-to-qml.qrc.patch | 43 ++++++++++++++
 ...Start-brummbere-instead-of-wrapper-script.patch | 25 +++++++++
 .../0003-Do-not-wait-for-network-startup.patch     | 40 +++++++++++++
 package/brummbeere/Config.in                       | 11 ++++
 package/brummbeere/brummbeere.mk                   | 44 +++++++++++++++
 9 files changed, 297 insertions(+)
 create mode 100644 board/raspberrypi/rootfs-overlay/etc/systemd/network/wired.network
 create mode 100644 configs/raspberrypi3_brummbeere_defconfig
 create mode 100644 configs/raspberrypi_brummbeere_defconfig
 create mode 100644 package/brummbeere/0001-Fix-resource-file-handling-rename-qml.rc-to-qml.qrc.patch
 create mode 100644 package/brummbeere/0002-Start-brummbere-instead-of-wrapper-script.patch
 create mode 100644 package/brummbeere/0003-Do-not-wait-for-network-startup.patch
 create mode 100644 package/brummbeere/Config.in
 create mode 100644 package/brummbeere/brummbeere.mk

diff --git a/board/raspberrypi/rootfs-overlay/etc/systemd/network/wired.network b/board/raspberrypi/rootfs-overlay/etc/systemd/network/wired.network
new file mode 100644
index 000000000..457d565a9
--- /dev/null
+++ b/board/raspberrypi/rootfs-overlay/etc/systemd/network/wired.network
@@ -0,0 +1,5 @@
+[Match]
+Name=eth0
+
+[Network]
+DHCP=ipv4
diff --git a/configs/raspberrypi3_brummbeere_defconfig b/configs/raspberrypi3_brummbeere_defconfig
new file mode 100644
index 000000000..916a9326d
--- /dev/null
+++ b/configs/raspberrypi3_brummbeere_defconfig
@@ -0,0 +1,65 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+BR2_GLIBC_VERSION_2_24=y
+BR2_BINUTILS_VERSION_2_27_X=y
+BR2_GCC_VERSION_6_X=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_INIT_SYSTEMD=y
+BR2_ROOTFS_OVERLAY="board/raspberrypi3/rootfs-overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="c6d86f7aa554854b04614ebb4d394766081fb41f"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b"
+BR2_PACKAGE_GSTREAMER1=y
+BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA=y
+BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OGG=y
+BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_THEORA=y
+BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VORBIS=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUDIOPARSERS=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUPARSE=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ID3DEMUX=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_FLAC=y
+BR2_PACKAGE_GST1_PLUGINS_BAD=y
+BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ID3TAG=y
+BR2_PACKAGE_GST1_PLUGINS_UGLY=y
+BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_LAME=y
+BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MAD=y
+BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPG123=y
+BR2_PACKAGE_DEJAVU=y
+BR2_PACKAGE_QT5=y
+BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
+BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM=y
+BR2_PACKAGE_QT5BASE_LINUXFB=y
+BR2_PACKAGE_QT5BASE_EGLFS=y
+BR2_PACKAGE_QT5BASE_DEFAULT_QPA="eglfs"
+BR2_PACKAGE_QT5BASE_FONTCONFIG=y
+BR2_PACKAGE_QT5BASE_GIF=y
+BR2_PACKAGE_QT5BASE_JPEG=y
+BR2_PACKAGE_QT5BASE_PNG=y
+BR2_PACKAGE_QT5GRAPHICALEFFECTS=y
+BR2_PACKAGE_QT5IMAGEFORMATS=y
+BR2_PACKAGE_QT5MULTIMEDIA=y
+BR2_PACKAGE_QT5QUICKCONTROLS=y
+BR2_PACKAGE_QT5WEBSOCKETS=y
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_USERLAND=y
+BR2_PACKAGE_RPI_USERLAND_HELLO=y
+BR2_PACKAGE_OPENSSL=y
+BR2_PACKAGE_BRUMMBEERE=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/raspberrypi_brummbeere_defconfig b/configs/raspberrypi_brummbeere_defconfig
new file mode 100644
index 000000000..5a89b9592
--- /dev/null
+++ b/configs/raspberrypi_brummbeere_defconfig
@@ -0,0 +1,63 @@
+BR2_arm=y
+BR2_arm1176jzf_s=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+BR2_GLIBC_VERSION_2_24=y
+BR2_BINUTILS_VERSION_2_27_X=y
+BR2_GCC_VERSION_6_X=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_INIT_SYSTEMD=y
+BR2_ROOTFS_OVERLAY="board/raspberrypi/rootfs-overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="c6d86f7aa554854b04614ebb4d394766081fb41f"
+BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-b bcm2708-rpi-b-plus bcm2708-rpi-cm"
+BR2_PACKAGE_GSTREAMER1=y
+BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA=y
+BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OGG=y
+BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_THEORA=y
+BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VORBIS=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUDIOPARSERS=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUPARSE=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ID3DEMUX=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_FLAC=y
+BR2_PACKAGE_GST1_PLUGINS_BAD=y
+BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ID3TAG=y
+BR2_PACKAGE_GST1_PLUGINS_UGLY=y
+BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_LAME=y
+BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MAD=y
+BR2_PACKAGE_GST1_PLUGINS_UGLY_PLUGIN_MPG123=y
+BR2_PACKAGE_DEJAVU=y
+BR2_PACKAGE_QT5=y
+BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
+BR2_PACKAGE_QT5BASE_SQLITE_SYSTEM=y
+BR2_PACKAGE_QT5BASE_LINUXFB=y
+BR2_PACKAGE_QT5BASE_EGLFS=y
+BR2_PACKAGE_QT5BASE_DEFAULT_QPA="eglfs"
+BR2_PACKAGE_QT5BASE_FONTCONFIG=y
+BR2_PACKAGE_QT5BASE_GIF=y
+BR2_PACKAGE_QT5BASE_JPEG=y
+BR2_PACKAGE_QT5BASE_PNG=y
+BR2_PACKAGE_QT5GRAPHICALEFFECTS=y
+BR2_PACKAGE_QT5IMAGEFORMATS=y
+BR2_PACKAGE_QT5MULTIMEDIA=y
+BR2_PACKAGE_QT5QUICKCONTROLS=y
+BR2_PACKAGE_QT5WEBSOCKETS=y
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_USERLAND=y
+BR2_PACKAGE_RPI_USERLAND_HELLO=y
+BR2_PACKAGE_OPENSSL=y
+BR2_PACKAGE_BRUMMBEERE=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/package/Config.in b/package/Config.in
index c14575c4c..05d417230 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1407,6 +1407,7 @@ endmenu
 menu "Miscellaneous"
 	source "package/aespipe/Config.in"
 	source "package/bc/Config.in"
+	source "package/brummbeere/Config.in"
 	source "package/clamav/Config.in"
 	source "package/collectd/Config.in"
 	source "package/domoticz/Config.in"
diff --git a/package/brummbeere/0001-Fix-resource-file-handling-rename-qml.rc-to-qml.qrc.patch b/package/brummbeere/0001-Fix-resource-file-handling-rename-qml.rc-to-qml.qrc.patch
new file mode 100644
index 000000000..036c97b7d
--- /dev/null
+++ b/package/brummbeere/0001-Fix-resource-file-handling-rename-qml.rc-to-qml.qrc.patch
@@ -0,0 +1,43 @@
+From d3d3571bd99c0535db74278169bebc6a35016faf Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 8 Dec 2016 21:09:31 +0100
+Subject: [PATCH] Fix resource file handling (rename qml.rc to qml.qrc)
+
+Qt-5.6.2 seems to need a resource file ending in '.qrc' instead
+of '.rc' to handle it correct.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ src/mainapp/mainapp.pro         | 4 ++--
+ src/mainapp/{qml.rc => qml.qrc} | 0
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+ rename src/mainapp/{qml.rc => qml.qrc} (100%)
+
+diff --git a/src/mainapp/mainapp.pro b/src/mainapp/mainapp.pro
+index 84e0631..70ff4fd 100644
+--- a/src/mainapp/mainapp.pro
++++ b/src/mainapp/mainapp.pro
+@@ -1,6 +1,6 @@
+ TEMPLATE = app
+ 
+-QT += quick xml
++QT += quick xml qml
+ 
+ TARGET = brummbeere
+ 
+@@ -13,7 +13,7 @@ win32 {
+     LIBS += -L../lib -lbrummbeere
+ }
+ 
+-RESOURCES += qml.rc
++RESOURCES += qml.qrc
+ 
+ # Additional import path used to resolve QML modules in Qt Creator's code model
+ QML_IMPORT_PATH =
+diff --git a/src/mainapp/qml.rc b/src/mainapp/qml.qrc
+similarity index 100%
+rename from src/mainapp/qml.rc
+rename to src/mainapp/qml.qrc
+-- 
+2.11.0
+
diff --git a/package/brummbeere/0002-Start-brummbere-instead-of-wrapper-script.patch b/package/brummbeere/0002-Start-brummbere-instead-of-wrapper-script.patch
new file mode 100644
index 000000000..f66d6924d
--- /dev/null
+++ b/package/brummbeere/0002-Start-brummbere-instead-of-wrapper-script.patch
@@ -0,0 +1,25 @@
+From 7047a8964c05971d7d1ef898993239e94cbb00fe Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 8 Dec 2016 21:42:20 +0100
+Subject: [PATCH] Start brummbere instead of wrapper script.
+
+---
+ raspi/userland/target/brummbeere.service | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/raspi/userland/target/brummbeere.service b/raspi/userland/target/brummbeere.service
+index c6c7550..35605d4 100644
+--- a/raspi/userland/target/brummbeere.service
++++ b/raspi/userland/target/brummbeere.service
+@@ -4,7 +4,7 @@ Wants=network-online.target
+ After=network-online.target
+ 
+ [Service]
+-ExecStart=/usr/bin/brummbeere.sh
++ExecStart=/usr/bin/brummbeere
+ 
+ [Install]
+ WantedBy=brummbeere.target
+-- 
+2.11.0
+
diff --git a/package/brummbeere/0003-Do-not-wait-for-network-startup.patch b/package/brummbeere/0003-Do-not-wait-for-network-startup.patch
new file mode 100644
index 000000000..d366876fe
--- /dev/null
+++ b/package/brummbeere/0003-Do-not-wait-for-network-startup.patch
@@ -0,0 +1,40 @@
+From 667795307e74082110c61800333df5528d5503ee Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 8 Dec 2016 22:45:59 +0100
+Subject: [PATCH] Do not wait for network startup.
+
+---
+ raspi/userland/target/brummbeere.service | 4 +---
+ raspi/userland/target/brummbeere.target  | 4 ++--
+ 2 files changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/raspi/userland/target/brummbeere.service b/raspi/userland/target/brummbeere.service
+index 35605d4..ed46a9e 100644
+--- a/raspi/userland/target/brummbeere.service
++++ b/raspi/userland/target/brummbeere.service
+@@ -1,10 +1,8 @@
+ [Unit]
+ Description=Brummbeere
+-Wants=network-online.target
+-After=network-online.target
+ 
+ [Service]
+ ExecStart=/usr/bin/brummbeere
+ 
+ [Install]
+-WantedBy=brummbeere.target
++WantedBy=multi-user.target
+diff --git a/raspi/userland/target/brummbeere.target b/raspi/userland/target/brummbeere.target
+index 0aed083..eeec139 100644
+--- a/raspi/userland/target/brummbeere.target
++++ b/raspi/userland/target/brummbeere.target
+@@ -1,4 +1,4 @@
+ [Unit]
+ Description=Brummbeere application
+-Wants=multi-user.target network-online.target
+-After=multi-user.target network-online.target
++Wants=multi-user.target
++After=multi-user.target
+-- 
+2.11.0
+
diff --git a/package/brummbeere/Config.in b/package/brummbeere/Config.in
new file mode 100644
index 000000000..143fb4f44
--- /dev/null
+++ b/package/brummbeere/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_BRUMMBEERE
+	bool "brummbeere"
+	depends on BR2_PACKAGE_QT5
+	depends on BR2_PACKAGE_QT5BASE_GUI
+# ToDo: fix depends/select for: qt5base qt5declarative qt5graphicaleffects
+# qt5imageformats qt5multimedia qt5quickcontrols qt5websockets
+# qt5xmlpatterns
+	help
+	  Die Brummbeere - ownCloud Music Player
+
+	  http://brummbeere.readthedocs.io
diff --git a/package/brummbeere/brummbeere.mk b/package/brummbeere/brummbeere.mk
new file mode 100644
index 000000000..9fd24b178
--- /dev/null
+++ b/package/brummbeere/brummbeere.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# brummbeere
+#
+################################################################################
+
+BRUMMBEERE_VERSION = 64b16a0019d2ae318bf5583e08ac7cf611c30c50
+BRUMMBEERE_SITE = $(call github,pbouda,brummbeere,$(BRUMMBEERE_VERSION))
+BRUMMBEERE_DEPENDENCIES = qt5base qt5declarative qt5graphicaleffects \
+	qt5imageformats qt5multimedia qt5quickcontrols qt5websockets \
+	qt5xmlpatterns
+
+BRUMMBEERE_LICENSE = GPLv3+
+BRUMMBEERE_LICENSE_FILES = LICENSE
+
+define BRUMMBEERE_CONFIGURE_CMDS
+	# ToDo: should not do a download in configure state, maybe move to extra package
+	# or find a option to include in brummbere git download?
+	cd $(@D) && git clone https://github.com/pbouda/beere-qml-components.git
+	cd $(@D)/src && $(TARGET_MAKE_ENV) $(QT5_QMAKE)
+endef
+
+define BRUMMBEERE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src
+endef
+
+define BRUMMBEERE_INSTALL_TARGET_CMDS
+	# copy brummbeere executable
+	cp -dpf $(@D)/src/mainapp/brummbeere  $(TARGET_DIR)/usr/bin
+	# configure hdmi console
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/getty at .service.d
+	echo -e "[Service]\nTTYVTDisallocate=no" > $(TARGET_DIR)/etc/systemd/system/getty at .service.d/nodisallocate.conf
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/getty.target.wants
+	ln -sf /usr/lib/systemd/system/getty at .service $(TARGET_DIR)/etc/systemd/system/getty.target.wants/getty at tty1.service
+	# copy brummbeere systemd files
+	cp -dpf $(@D)/raspi/userland/target/brummbeere.target $(TARGET_DIR)/etc/systemd/system
+	cp -dpf $(@D)/raspi/userland/target/brummbeere.service $(TARGET_DIR)/etc/systemd/system
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/brummbeere.target.wants/
+	ln -sf ../brummbeere.service $(TARGET_DIR)/etc/systemd/system/brummbeere.target.wants/brummbeere.service
+	mkdir -p  $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf /etc/systemd/system/brummbeere.service  $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/brummbeere.service
+endef
+
+$(eval $(generic-package))
-- 
2.11.0
