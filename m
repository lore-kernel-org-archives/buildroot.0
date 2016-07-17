From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Jul 2016 14:29:01 +0200
Subject: [Buildroot] [git commit] package/kodi: Add suboption to control
	unrar support
Message-ID: <20160717123353.8B09C81D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2aae80b209de91740fd57a36d42b3801f2793eeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: tweak Config.in description.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in | 6 ++++++
 package/kodi/kodi.mk   | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index a000e79..a4cbab2 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -174,6 +174,12 @@ config BR2_PACKAGE_KODI_LIBNFS
 comment "nfs support needs a toolchain w/ threads support"
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
 
+config BR2_PACKAGE_KODI_NONFREE
+	bool "nonfree components"
+	help
+	  Enable components with non-free licenses. This option
+	  currently only controls support for RAR archives.
+
 config BR2_PACKAGE_KODI_RTMPDUMP
 	bool "rtmp"
 	select BR2_PACKAGE_RTMPDUMP
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 52593aa..da5d1fa 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -86,6 +86,14 @@ else
 KODI_CONF_OPTS += --disable-mysql
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_NONFREE),y)
+KODI_CONF_OPTS += --enable-non-free
+KODI_LICENSE := $(KODI_LICENSE), unrar
+KODI_LICENSE_FILES += lib/UnrarXLib/license.txt
+else
+KODI_CONF_OPTS += --disable-non-free
+endif
+
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
 KODI_DEPENDENCIES += rpi-userland
 KODI_CONF_OPTS += --with-platform=raspberry-pi --enable-player=omxplayer
