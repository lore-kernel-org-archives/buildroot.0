From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 8 Oct 2011 23:22:50 +0200
Subject: [Buildroot] [git commit] noip: new package
Message-ID: <20111009201001.47BD38E185@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cec7128dc1a30880523011a115ff52d7a27c403d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use install -D / proper permissions]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in      |    1 +
 package/noip/Config.in |    6 ++++++
 package/noip/noip.mk   |   30 ++++++++++++++++++++++++++++++
 3 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 904ebb6..7dc8887 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -443,6 +443,7 @@ endif
 source "package/netplug/Config.in"
 source "package/netsnmp/Config.in"
 source "package/netstat-nat/Config.in"
+source "package/noip/Config.in"
 source "package/nfs-utils/Config.in"
 source "package/ngircd/Config.in"
 source "package/ngrep/Config.in"
diff --git a/package/noip/Config.in b/package/noip/Config.in
new file mode 100644
index 0000000..02039dd
--- /dev/null
+++ b/package/noip/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_NOIP
+	bool "noip"
+	help
+	  Dynamic DNS update client for no-ip.com
+
+	  http://www.no-ip.com/downloads.php
diff --git a/package/noip/noip.mk b/package/noip/noip.mk
new file mode 100644
index 0000000..0fe427a
--- /dev/null
+++ b/package/noip/noip.mk
@@ -0,0 +1,30 @@
+#############################################################
+#
+# noip
+#
+#############################################################
+
+NOIP_VERSION = 2.1.9
+NOIP_SITE = http://www.no-ip.com/client/linux
+NOIP_SOURCE = noip-duc-linux.tar.gz
+
+define NOIP_BUILD_CMDS
+	sed -i -e "s:\(#define CONFIG_FILENAME\).*:\1 \"/etc/no-ip2.conf\":" \
+		$(@D)/noip2.c
+	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+		PREFIX=/usr CONFDIR=/etc
+endef
+
+define NOIP_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/noip2 $(TARGET_DIR)/usr/sbin/noip2
+endef
+
+define NOIP_UNINSTALL_TARGET_CMDS
+	rm -f "$(TARGET_DIR)/usr/sbin/noip2"
+endef
+
+define NOIP_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(call GENTARGETS))
