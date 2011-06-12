From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 Jun 2011 10:50:34 +0200
Subject: [Buildroot] [git commit] package: add sredird
Message-ID: <20110612110918.898E785A81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c324cf05be628b5506a1077a711a59a7a501b24d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/sredird/Config.in  |    6 ++++++
 package/sredird/sredird.mk |   27 +++++++++++++++++++++++++++
 3 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 package/sredird/Config.in
 create mode 100644 package/sredird/sredird.mk

diff --git a/package/Config.in b/package/Config.in
index 40f523d..a03896a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -202,6 +202,7 @@ endif
 source "package/smartmontools/Config.in"
 source "package/squashfs/Config.in"
 source "package/squashfs3/Config.in"
+source "package/sredird/Config.in"
 source "package/sshfs/Config.in"
 source "package/sysstat/Config.in"
 source "package/udev/Config.in"
diff --git a/package/sredird/Config.in b/package/sredird/Config.in
new file mode 100644
index 0000000..463269a
--- /dev/null
+++ b/package/sredird/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_SREDIRD
+	bool "sredird"
+	help
+	  Sredird is a serial port redirector that is compliant with
+	  the RFC 2217 "Telnet Com Port Control Option" protocol. This
+	  protocol lets you share a serial port through the network.
diff --git a/package/sredird/sredird.mk b/package/sredird/sredird.mk
new file mode 100644
index 0000000..ad91f6a
--- /dev/null
+++ b/package/sredird/sredird.mk
@@ -0,0 +1,27 @@
+#############################################################
+#
+# sredird
+#
+#############################################################
+
+SREDIRD_VERSION = 2.2.1-1.1
+SREDIRD_SOURCE = sredird_$(SREDIRD_VERSION).tar.gz
+SREDIRD_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sredird
+
+define SREDIRD_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define SREDIRD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/sredird $(TARGET_DIR)/usr/sbin/sredird
+endef
+
+define SREDIRD_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/sbin/sredird
+endef
+
+define SREDIRD_CLEAN_CMDS
+	rm -f $(@D)/sredird
+endef
+
+$(eval $(call GENTARGETS,package,sredird))
-- 
1.7.3.4
