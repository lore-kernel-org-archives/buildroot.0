From: Jens Zettelmeyer <zettelmeyerj@gmail.com>
Date: Mon,  9 Feb 2015 20:22:18 +0000
Subject: [Buildroot] [PATCH 1/1] batctl: new package
Message-ID: <1423513338-3958-1-git-send-email-zettelmeyerj@goooglemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jens Zettelmeyer <zettelmeyerj@goooglemail.com>
---
 package/Config.in          |  1 +
 package/batctl/Config.in   | 12 ++++++++++++
 package/batctl/batctl.hash |  2 ++
 package/batctl/batctl.mk   | 21 +++++++++++++++++++++
 4 files changed, 36 insertions(+)
 create mode 100644 package/batctl/Config.in
 create mode 100644 package/batctl/batctl.hash
 create mode 100644 package/batctl/batctl.mk

diff --git a/package/Config.in b/package/Config.in
index fe3d3d0..b9d6753 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1055,6 +1055,7 @@ menu "Networking applications"
 	source "package/avahi/Config.in"
 	source "package/axel/Config.in"
 	source "package/bandwidthd/Config.in"
+	source "package/batctl/Config.in"
 	source "package/bcusdk/Config.in"
 	source "package/bind/Config.in"
 	source "package/bluez_utils/Config.in"
diff --git a/package/batctl/Config.in b/package/batctl/Config.in
new file mode 100644
index 0000000..03ee991
--- /dev/null
+++ b/package/batctl/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_BATCTL
+	bool "batctl"
+	depends on BR2_INET_IPV6 
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libnl
+	select BR2_PACKAGE_LIBNL
+	help
+	  Batctl is the configuration and debugging tool for batman-adv.
+	  
+	  http://www.open-mesh.org/projects/batman-adv/wiki/Using-batctl
+
+comment "batctl needs a toolchain w/ IPv6, threads"
+	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS # libnl
diff --git a/package/batctl/batctl.hash b/package/batctl/batctl.hash
new file mode 100644
index 0000000..663e602
--- /dev/null
+++ b/package/batctl/batctl.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	77509ed70232ebc0b73e2fa9471ae13b12d6547d167dda0a82f7a7fad7252c36  batctl-2014.4.0.tar.gz
diff --git a/package/batctl/batctl.mk b/package/batctl/batctl.mk
new file mode 100644
index 0000000..9974e29
--- /dev/null
+++ b/package/batctl/batctl.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# batctl
+#
+################################################################################
+
+BATCTL_VERSION = 2014.4.0
+BATCTL_SOURCE = batctl-$(BATCTL_VERSION).tar.gz
+BATCTL_SITE = http://downloads.open-mesh.org/batman/releases/batman-adv-$(BATCTL_VERSION)
+BATCTL_LICENSE = GPLv2
+BATCTL_DEPENDENCIES = libnl host-pkgconf
+
+define BATCTL_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS)  -C $(@D) all 
+endef
+
+define BATCTL_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.0.5
