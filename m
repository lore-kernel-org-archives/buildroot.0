From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Apr 2017 10:37:27 +0200
Subject: [Buildroot] [PATCH v7 07/31] package/kodi-texturepacker: new host
	package
In-Reply-To: <20170429083751.19625-1-bernd.kuhls@t-online.de>
References: <20170429083751.19625-1-bernd.kuhls@t-online.de>
Message-ID: <20170429083751.19625-8-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for upcoming kodi version bump to 17.1-Krypton which will also
switch the kodi build system to CMake.

"-std=c++0x" is needed to maintain compatability with host-gcc 4.6.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-texturepacker/kodi-texturepacker.hash |  1 +
 package/kodi-texturepacker/kodi-texturepacker.mk   | 41 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 120000 package/kodi-texturepacker/kodi-texturepacker.hash
 create mode 100644 package/kodi-texturepacker/kodi-texturepacker.mk

diff --git a/package/kodi-texturepacker/kodi-texturepacker.hash b/package/kodi-texturepacker/kodi-texturepacker.hash
new file mode 120000
index 0000000000..a575750997
--- /dev/null
+++ b/package/kodi-texturepacker/kodi-texturepacker.hash
@@ -0,0 +1 @@
+../kodi/kodi.hash
\ No newline at end of file
diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
new file mode 100644
index 0000000000..6b445cef2e
--- /dev/null
+++ b/package/kodi-texturepacker/kodi-texturepacker.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# kodi-texturepacker
+#
+################################################################################
+
+# Not possible to directly refer to kodi variables, because of
+# first/second expansion trickery...
+KODI_TEXTUREPACKER_VERSION = 17.1-Krypton
+KODI_TEXTUREPACKER_SITE = $(call github,xbmc,xbmc,$(KODI_TEXTUREPACKER_VERSION))
+KODI_TEXTUREPACKER_SOURCE = kodi-$(KODI_TEXTUREPACKER_VERSION).tar.gz
+KODI_TEXTUREPACKER_LICENSE = GPLv2
+KODI_TEXTUREPACKER_LICENSE_FILES = LICENSE.GPL
+HOST_KODI_TEXTUREPACKER_SUBDIR = tools/depends/native/TexturePacker
+HOST_KODI_TEXTUREPACKER_DEPENDENCIES += \
+	host-giflib \
+	host-libjpeg \
+	host-libpng \
+	host-lzo
+
+HOST_KODI_TEXTUREPACKER_CXXFLAGS = \
+	"$(HOST_CXXFLAGS) \
+	-std=c++0x \
+	-DTARGET_POSIX \
+	-DTARGET_LINUX \
+	-D_LINUX \
+	-I$(@D)/xbmc/linux"
+
+HOST_KODI_TEXTUREPACKER_CONF_OPTS += \
+	-DCMAKE_CXX_FLAGS=$(HOST_KODI_TEXTUREPACKER_CXXFLAGS) \
+	-DCMAKE_MODULE_PATH=$(@D)/project/cmake/modules \
+	-DCORE_SOURCE_DIR=$(@D) \
+	-Wno-dev
+
+define HOST_KODI_TEXTUREPACKER_INSTALL_CMDS
+	$(INSTALL) -m 755 -D \
+		$(@D)/tools/depends/native/TexturePacker/TexturePacker \
+		$(HOST_DIR)/usr/bin/TexturePacker
+endef
+
+$(eval $(host-cmake-package))
-- 
2.11.0
