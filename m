From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Oct 2011 23:21:45 +0200
Subject: [Buildroot] [git commit] ifplugd: misc fixes
Message-ID: <20111015213701.1229D8D520@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=16eb3ed2f1d498533157c11c4b4aabb719dcb9f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Busybox provides ifplugd, so build after it and make the menu option
  conditional on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
* Style cleanup

[Peter: really make it depend on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    2 ++
 package/ifplugd/ifplugd.mk |   13 +++++++------
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 30a9dcb..5a378da 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -417,7 +417,9 @@ source "package/dropbear/Config.in"
 source "package/ebtables/Config.in"
 source "package/ethtool/Config.in"
 source "package/hostapd/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/ifplugd/Config.in"
+endif
 source "package/iperf/Config.in"
 source "package/iproute2/Config.in"
 source "package/ipsec-tools/Config.in"
diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
index 33c4367..cb06b63 100644
--- a/package/ifplugd/ifplugd.mk
+++ b/package/ifplugd/ifplugd.mk
@@ -3,19 +3,20 @@
 # ifplugd
 #
 #############################################################
+
 IFPLUGD_VERSION = 0.28
-IFPLUGD_SOURCE = ifplugd-$(IFPLUGD_VERSION).tar.gz
-IFPLUGD_SITE = http://0pointer.de/lennart/projects/ifplugd/
+IFPLUGD_SITE = http://0pointer.de/lennart/projects/ifplugd
 IFPLUGD_AUTORECONF = YES
-IFPLUGD_INSTALL_STAGING = NO
-IFPLUGD_INSTALL_TARGET = YES
 # install-strip unconditionally overwrites $(TARGET_DIR)/etc/ifplugd/ifplugd.*
 IFPLUGD_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec
-
 IFPLUGD_CONF_OPT = --disable-lynx
-
 IFPLUGD_DEPENDENCIES = libdaemon
 
+# Prefer big ifplugd
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+	IFPLUGD_DEPENDENCIES += busybox
+endif
+
 define IFPLUGD_INSTALL_FIXUP
 	$(INSTALL) -d $(TARGET_DIR)/etc/ifplugd
 	@if [ ! -f $(TARGET_DIR)/etc/ifplugd/ifplugd.conf ]; then \
