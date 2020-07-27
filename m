From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jul 2020 10:13:06 +0200
Subject: [Buildroot] [git commit] package/mbpfan: new package
Message-ID: <20200727080816.C59C380FFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1640b0c1f967e394f87eb7a0ca04ae40aade11b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding mbpfan, a fan control daemon for MacBook laptops.

Signed-off-by: Christian Stewart <christian@paral.in>
[Peter: add hash file, drop Debian init script, drop systemd symlinks, add
 DEVELOPERS entry]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/mbpfan/Config.in   |  9 +++++++++
 package/mbpfan/mbpfan.hash |  3 +++
 package/mbpfan/mbpfan.mk   | 29 +++++++++++++++++++++++++++++
 5 files changed, 43 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9105626083..b9cef9185f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -553,6 +553,7 @@ F:	package/docker-engine/
 F:	package/docker-proxy/
 F:	package/fuse-overlayfs/
 F:	package/go/
+F:	package/mbpfan/
 F:	package/mosh/
 F:	package/pkg-golang.mk
 F:	package/rtl8821au/
diff --git a/package/Config.in b/package/Config.in
index 178b4da98a..5c30d27b7a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -490,6 +490,7 @@ endmenu
 	source "package/luksmeta/Config.in"
 	source "package/lvm2/Config.in"
 	source "package/mali-t76x/Config.in"
+	source "package/mbpfan/Config.in"
 	source "package/mdadm/Config.in"
 	source "package/mdevd/Config.in"
 	source "package/memtest86/Config.in"
diff --git a/package/mbpfan/Config.in b/package/mbpfan/Config.in
new file mode 100644
index 0000000000..231faa2b15
--- /dev/null
+++ b/package/mbpfan/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_MBPFAN
+	bool "mbpfan"
+	depends on BR2_USE_MMU
+	help
+	  Mbpfan is a daemon for MacBook laptops which monitors the
+	  CPU temperature with the coretemp module, and sets the fan
+	  speeds with the applesmc module.
+
+	  https://github.com/linux-on-mac/mbpfan
diff --git a/package/mbpfan/mbpfan.hash b/package/mbpfan/mbpfan.hash
new file mode 100644
index 0000000000..eafd313b4e
--- /dev/null
+++ b/package/mbpfan/mbpfan.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  52a3a79d99f775fe90917a0958e527ea14ff5b83d010164bd91f7cc3ce046b6a  mbpfan-2.2.1.tar.gz
+sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  COPYING
diff --git a/package/mbpfan/mbpfan.mk b/package/mbpfan/mbpfan.mk
new file mode 100644
index 0000000000..2455b0a4ca
--- /dev/null
+++ b/package/mbpfan/mbpfan.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# mbpfan
+#
+################################################################################
+
+MBPFAN_VERSION = 2.2.1
+MBPFAN_SITE = $(call github,linux-on-mac,mbpfan,v$(MBPFAN_VERSION))
+MBPFAN_LICENSE = GPL-3.0+
+MBPFAN_LICENSE_FILES = COPYING
+
+define MBPFAN_BUILD_CMDS
+	$(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		$(MAKE) CC="$(TARGET_CC)" -C $(@D)
+endef
+
+define MBPFAN_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/mbpfan.conf \
+		$(TARGET_DIR)/etc/mbpfan.conf
+	$(INSTALL) -m 0755 $(@D)/bin/mbpfan $(TARGET_DIR)/usr/sbin/mbpfan
+endef
+
+define MBPFAN_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(@D)/mbpfan.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/mbpfan.service
+endef
+
+$(eval $(generic-package))
