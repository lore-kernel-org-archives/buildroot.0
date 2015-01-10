From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 15:40:50 +0100
Subject: [Buildroot] [git commit] package/vnstat: New package
Message-ID: <20150110144536.CCBF78019A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bc13478bd2eb877f7333a25b0b497bb642bbaef4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - Rename the VNSTAT_INSTALL_VNSTATI to VNSTAT_INSTALL_VNSTATI_CMDS,
    and use 'define ... endef'.
  - Use full paths for the destinations when using $(INSTALL)]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/vnstat/Config.in   |   11 +++++++++++
 package/vnstat/vnstat.hash |    2 ++
 package/vnstat/vnstat.mk   |   30 ++++++++++++++++++++++++++++++
 4 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 878aa72..9f3f732 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1172,6 +1172,7 @@ endif
 	source "package/ushare/Config.in"
 	source "package/ussp-push/Config.in"
 	source "package/vde2/Config.in"
+	source "package/vnstat/Config.in"
 	source "package/vpnc/Config.in"
 	source "package/vsftpd/Config.in"
 	source "package/vtun/Config.in"
diff --git a/package/vnstat/Config.in b/package/vnstat/Config.in
new file mode 100644
index 0000000..0df4982
--- /dev/null
+++ b/package/vnstat/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_VNSTAT
+	bool "vnstat"
+	depends on BR2_USE_MMU # fork()
+	help
+	  vnStat is a console-based network traffic monitor that keeps a log of
+	  network traffic for the selected interface(s). It uses the network
+	  interface statistics provided by the kernel as information source.
+	  This means that vnStat won't actually be sniffing any traffic and also
+	  ensures light use of system resources.
+
+	  http://humdi.net/vnstat
diff --git a/package/vnstat/vnstat.hash b/package/vnstat/vnstat.hash
new file mode 100644
index 0000000..a3334d6
--- /dev/null
+++ b/package/vnstat/vnstat.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	af1050d9c1b22d4b9742fe0d1818de9eb1037b8e7f9ba67b962e108d8527be69	vnstat-1.12.tar.gz
diff --git a/package/vnstat/vnstat.mk b/package/vnstat/vnstat.mk
new file mode 100644
index 0000000..e0a64d5
--- /dev/null
+++ b/package/vnstat/vnstat.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# vnstat
+#
+################################################################################
+
+VNSTAT_VERSION = 1.12
+VNSTAT_SITE = http://humdi.net/vnstat
+VNSTAT_LICENSE = GPLv2
+VNSTAT_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_PACKAGE_GD)$(BR2_PACKAGE_LIBPNG),yy)
+VNSTAT_DEPENDENCIES = gd
+VNSTAT_GD_MAKE_OPT = all
+define VNSTAT_INSTALL_VNSTATI_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/src/vnstati $(TARGET_DIR)/usr/bin/vnstati
+endef
+endif
+
+define VNSTAT_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(VNSTAT_GD_MAKE_OPT)
+endef
+
+define VNSTAT_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/src/vnstat $(TARGET_DIR)/usr/bin/vnstat
+	$(INSTALL) -D -m 0755 $(@D)/src/vnstatd $(TARGET_DIR)/usr/sbin/vnstatd
+	$(VNSTAT_INSTALL_VNSTATI_CMDS)
+endef
+
+$(eval $(generic-package))
