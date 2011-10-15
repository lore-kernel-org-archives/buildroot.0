From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 15 Oct 2011 00:07:34 -0300
Subject: [Buildroot] [PATCH 20/25] ifplugd: misc fixes
In-Reply-To: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318648059-30431-20-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Busybox provides ifplugd, so build after it and make the menu option
  conditional on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
* Style cleanup

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ifplugd/ifplugd.mk |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

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
-- 
1.7.3.4
