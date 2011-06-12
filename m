From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 Jun 2011 10:50:34 +0200
Subject: [Buildroot] [git commit] package: add statserial
Message-ID: <20110612110918.AB60585A81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=aae534c504555b35f0ae40898b00106a84e17bec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francis M. de P. Mendes <francis.mendes@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                |    1 +
 package/statserial/Config.in     |   11 +++++++++++
 package/statserial/statserial.mk |   19 +++++++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 package/statserial/Config.in
 create mode 100644 package/statserial/statserial.mk

diff --git a/package/Config.in b/package/Config.in
index a03896a..10d435c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -204,6 +204,7 @@ source "package/squashfs/Config.in"
 source "package/squashfs3/Config.in"
 source "package/sredird/Config.in"
 source "package/sshfs/Config.in"
+source "package/statserial/Config.in"
 source "package/sysstat/Config.in"
 source "package/udev/Config.in"
 source "package/usb_modeswitch/Config.in"
diff --git a/package/statserial/Config.in b/package/statserial/Config.in
new file mode 100644
index 0000000..4db5eb1
--- /dev/null
+++ b/package/statserial/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_STATSERIAL
+	bool "statserial"
+	select BR2_PACKAGE_NCURSES
+	help
+	  Displays a table of the signals on a standard
+	  9-pin or 25-pin serial port, and indicates the
+	  status of the handshaking lines. It can be
+	  useful for debugging problems with serial
+	  ports or modems.
+
+	  https://sites.google.com/site/tranter/software
diff --git a/package/statserial/statserial.mk b/package/statserial/statserial.mk
new file mode 100644
index 0000000..b6a8a0f
--- /dev/null
+++ b/package/statserial/statserial.mk
@@ -0,0 +1,19 @@
+#############################################################
+#
+# statserial
+#
+#############################################################
+STATSERIAL_VERSION = 1.1
+STATSERIAL_SOURCE = statserial-$(STATSERIAL_VERSION).tar.gz
+STATSERIAL_SITE = http://www.ibiblio.org/pub/Linux/system/serial/
+STATSERIAL_DEPENDENCIES = ncurses
+
+define STATSERIAL_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
+endef
+
+define STATSERIAL_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/statserial $(TARGET_DIR)/usr/bin/statserial
+endef
+
+$(eval $(call GENTARGETS,package,statserial))
-- 
1.7.3.4
