From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 01:01:20 +0100
Subject: [Buildroot] [git commit] p910nd: new package
Message-ID: <20131111001018.207F39BB7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f71e73f876e009035f3f8344957bf45b8eb08a0b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in        |    1 +
 package/p910nd/Config.in |    9 +++++++++
 package/p910nd/p910nd.mk |   21 +++++++++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index c0a3f20..d0db7d6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -852,6 +852,7 @@ source "package/openobex/Config.in"
 source "package/openssh/Config.in"
 source "package/openswan/Config.in"
 source "package/openvpn/Config.in"
+source "package/p910nd/Config.in"
 source "package/portmap/Config.in"
 source "package/pppd/Config.in"
 source "package/pptp-linux/Config.in"
diff --git a/package/p910nd/Config.in b/package/p910nd/Config.in
new file mode 100644
index 0000000..33f6cf8
--- /dev/null
+++ b/package/p910nd/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_P910ND
+	bool "p910nd"
+	depends on BR2_USE_MMU # fork()
+	help
+	  p910nd is a small printer daemon intended for diskless
+	  workstations. Using ports 9100-9102, it accepts
+	  print jobs and passes them directly to a USB printer.
+
+	  http://p910nd.sourceforge.net/
diff --git a/package/p910nd/p910nd.mk b/package/p910nd/p910nd.mk
new file mode 100644
index 0000000..48bb7e1
--- /dev/null
+++ b/package/p910nd/p910nd.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# p910nd
+#
+################################################################################
+
+P910ND_VERSION = 0.95
+P910ND_SITE = http://downloads.sourceforge.net/project/p910nd/p910nd/$(P910ND_VERSION)
+P910ND_SOURCE = p910nd-$(P910ND_VERSION).tar.bz2
+P910ND_LICENSE = GPLv2
+P910ND_LICENSE_FILES = COPYING
+
+define P910ND_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define P910ND_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/p910nd $(TARGET_DIR)/usr/sbin/p910nd
+endef
+
+$(eval $(generic-package))
