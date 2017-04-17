From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 17 Apr 2017 21:54:06 +0200
Subject: [Buildroot] [PATCH v5 07/34] package/kodi-texturepacker: new host
	package
In-Reply-To: <20170417195433.26672-1-bernd.kuhls@t-online.de>
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
Message-ID: <20170417195433.26672-8-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for upcoming kodi version bump to 17.1-Krypton which will also
switch the kodi build system to CMake.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-texturepacker/kodi-texturepacker.hash |  1 +
 package/kodi-texturepacker/kodi-texturepacker.mk   | 34 ++++++++++++++++++++++
 package/kodi/kodi.hash                             |  1 +
 3 files changed, 36 insertions(+)
 create mode 120000 package/kodi-texturepacker/kodi-texturepacker.hash
 create mode 100644 package/kodi-texturepacker/kodi-texturepacker.mk

diff --git a/package/kodi-texturepacker/kodi-texturepacker.hash b/package/kodi-texturepacker/kodi-texturepacker.hash
new file mode 120000
index 000000000..92a75949b
--- /dev/null
+++ b/package/kodi-texturepacker/kodi-texturepacker.hash
@@ -0,0 +1 @@
+/home/bernd/buildroot/br8_ffmpeg3_kodi17_github/package/kodi/kodi.hash
\ No newline at end of file
diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
new file mode 100644
index 000000000..bce73f7f0
--- /dev/null
+++ b/package/kodi-texturepacker/kodi-texturepacker.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# kodi-texturepacker
+#
+################################################################################
+
+# Not possible to directly refer to kodi variables, because of
+# first/second expansion trickery...
+HOST_KODI_TEXTUREPACKER_VERSION = 17.1-Krypton
+HOST_KODI_TEXTUREPACKER_SITE = $(call github,xbmc,xbmc,$(HOST_KODI_TEXTUREPACKER_VERSION))
+HOST_KODI_TEXTUREPACKER_LICENSE = GPLv2
+HOST_KODI_TEXTUREPACKER_LICENSE_FILES = LICENSE.GPL
+HOST_KODI_TEXTUREPACKER_SUBDIR = tools/depends/native/TexturePacker
+HOST_KODI_TEXTUREPACKER_DEPENDENCIES += \
+	host-giflib \
+	host-libjpeg \
+	host-libpng \
+	host-lzo
+
+HOST_KODI_TEXTUREPACKER_HOST_CXXFLAGS = "$(HOST_CXXFLAGS) -std=c++0x \
+	-DTARGET_POSIX -DTARGET_LINUX -D_LINUX -I$(@D)/xbmc/linux"
+
+HOST_KODI_TEXTUREPACKER_CONF_OPTS += \
+	-DCMAKE_CXX_FLAGS=$(HOST_KODI_TEXTUREPACKER_HOST_CXXFLAGS) \
+	-DCMAKE_MODULE_PATH=$(@D)/project/cmake/modules \
+	-DCORE_SOURCE_DIR=$(@D) \
+	-Wno-dev
+
+HOST_KODI_TEXTUREPACKER_INSTALL_CMDS = \
+	$(INSTALL) -m 755 -D \
+		$(@D)/tools/depends/native/TexturePacker/TexturePacker \
+		$(HOST_DIR)/usr/bin/TexturePacker
+
+$(eval $(host-cmake-package))
diff --git a/package/kodi/kodi.hash b/package/kodi/kodi.hash
index b910af2d8..ae47c70c9 100644
--- a/package/kodi/kodi.hash
+++ b/package/kodi/kodi.hash
@@ -1,3 +1,4 @@
 # Locally computed
 sha256	7d82c8aff2715c83deecdf10c566e26105bec0473af530a1356d4c747ebdfd10	kodi-16.1-Jarvis.tar.gz
 sha256 303f3903cbb57ccc2961f09cf3746505542bcb129a464f0687d7ca8601cebbee  kodi-jsonschemabuilder-17.1-Krypton.tar.gz
+sha256 303f3903cbb57ccc2961f09cf3746505542bcb129a464f0687d7ca8601cebbee  kodi-texturepacker-17.1-Krypton.tar.gz
-- 
2.11.0
