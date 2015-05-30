From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 May 2015 23:56:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/nmap: Fix static linking
Message-ID: <1433022977-18011-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/040/040129539257d88d9437d113752bc8634fd9b2b2/
http://autobuild.buildroot.net/results/73a/73a562a3a1f356c1a39b2fb57f0848c4b99fe8b1/
http://autobuild.buildroot.net/results/767/767b8eafe7a204327eaa182c065ca5cfff18096f/
http://autobuild.buildroot.net/results/0f7/0f7f3a56815dc6422a466fe9b4357ace98f78e11/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/nmap/nmap.mk |   15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index c8c16e6..e4d695b 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -14,6 +14,21 @@ NMAP_CONF_OPTS = --without-liblua --without-zenmap \
 NMAP_LICENSE = GPLv2
 NMAP_LICENSE_FILES = COPYING
 
+# needed by libpcap
+NMAP_LIBS_FOR_STATIC_LINK += -lz
+
+ifeq ($(BR2_PACKAGE_DBUS),y)
+NMAP_LIBS_FOR_STATIC_LINK += $(shell $(PKG_CONFIG_HOST_BINARY) --libs dbus-1)
+endif
+ifeq ($(BR2_PACKAGE_LIBUSB),y)
+NMAP_LIBS_FOR_STATIC_LINK += $(shell $(PKG_CONFIG_HOST_BINARY) --libs libusb-1.0)
+endif
+NMAP_LIBS_FOR_STATIC_LINK += -lpthread
+
+ifeq ($(BR2_STATIC_LIBS),y)
+NMAP_CONF_ENV += LIBS='$(NMAP_LIBS_FOR_STATIC_LINK)'
+endif
+
 # for 0001-libdnet-wrapper-configure.patch
 define NMAP_WRAPPER_EXEC
 	chmod +x $(@D)/libdnet-stripped/configure.gnu
-- 
1.7.10.4
