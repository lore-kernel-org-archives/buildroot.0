From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 11:36:04 +0200
Subject: [Buildroot] [git commit] package/kodi-texturepacker: new host
	package
Message-ID: <20170429101426.3DD65818B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e81839aff14f0b61af557c7054318297cbeb7b94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for upcoming kodi version bump to 17.1-Krypton which will also
switch the kodi build system to CMake.

"-std=c++0x" is needed to maintain compatability with host-gcc 4.6.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: move texturepacker patch from Kodi package, use SPDX license
code, minor tweaks.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-texturepacker.patch}                      |  0
 package/kodi-texturepacker/kodi-texturepacker.hash |  1 +
 package/kodi-texturepacker/kodi-texturepacker.mk   | 41 ++++++++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/package/kodi/0002-texturepacker.patch b/package/kodi-texturepacker/0001-texturepacker.patch
similarity index 100%
rename from package/kodi/0002-texturepacker.patch
rename to package/kodi-texturepacker/0001-texturepacker.patch
diff --git a/package/kodi-texturepacker/kodi-texturepacker.hash b/package/kodi-texturepacker/kodi-texturepacker.hash
new file mode 120000
index 0000000..a575750
--- /dev/null
+++ b/package/kodi-texturepacker/kodi-texturepacker.hash
@@ -0,0 +1 @@
+../kodi/kodi.hash
\ No newline at end of file
diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
new file mode 100644
index 0000000..c6d3b05
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
+KODI_TEXTUREPACKER_LICENSE = GPL-2.0
+KODI_TEXTUREPACKER_LICENSE_FILES = LICENSE.GPL
+HOST_KODI_TEXTUREPACKER_SUBDIR = tools/depends/native/TexturePacker
+HOST_KODI_TEXTUREPACKER_DEPENDENCIES = \
+	host-giflib \
+	host-libjpeg \
+	host-libpng \
+	host-lzo
+
+HOST_KODI_TEXTUREPACKER_CXXFLAGS = \
+	$(HOST_CXXFLAGS) \
+	-std=c++0x \
+	-DTARGET_POSIX \
+	-DTARGET_LINUX \
+	-D_LINUX \
+	-I$(@D)/xbmc/linux
+
+HOST_KODI_TEXTUREPACKER_CONF_OPTS += \
+	-DCMAKE_CXX_FLAGS="$(HOST_KODI_TEXTUREPACKER_CXXFLAGS)" \
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
