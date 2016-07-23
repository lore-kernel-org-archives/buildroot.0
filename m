From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 22:56:24 +0200
Subject: [Buildroot] [git commit] tunctl: new package
Message-ID: <20160723205652.5FB8181E06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=689b2b74effc1d112f43f7ee4f21c757a2312e56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tunctl is a tool for controlling the TUN/TAP driver in Linux.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
[Thomas: use $(TARGET_CONFIGURE_OPTS).]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |  1 +
 package/tunctl/Config.in   |  6 ++++++
 package/tunctl/tunctl.hash |  2 ++
 package/tunctl/tunctl.mk   | 22 ++++++++++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 6b5b011..46ad276 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1575,6 +1575,7 @@ endif
 	source "package/tn5250/Config.in"
 	source "package/tor/Config.in"
 	source "package/transmission/Config.in"
+	source "package/tunctl/Config.in"
 	source "package/tvheadend/Config.in"
 	source "package/udpcast/Config.in"
 	source "package/ulogd/Config.in"
diff --git a/package/tunctl/Config.in b/package/tunctl/Config.in
new file mode 100644
index 0000000..26eed4c
--- /dev/null
+++ b/package/tunctl/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_TUNCTL
+	bool "tunctl"
+	help
+	  Tunctl is a tool for controlling the TUN/TAP driver in Linux.
+
+	  https://sourceforge.net/projects/tunctl/
diff --git a/package/tunctl/tunctl.hash b/package/tunctl/tunctl.hash
new file mode 100644
index 0000000..d3aaeec
--- /dev/null
+++ b/package/tunctl/tunctl.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 aa2a6c4cc6bfacb11e0d9f62334a6638a0d435475c61230116f00b6af8b14fff  tunctl-1.5.tar.gz
diff --git a/package/tunctl/tunctl.mk b/package/tunctl/tunctl.mk
new file mode 100644
index 0000000..81e6c8c
--- /dev/null
+++ b/package/tunctl/tunctl.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# tunctl
+#
+################################################################################
+
+TUNCTL_VERSION = 1.5
+TUNCTL_SOURCE = tunctl-$(TUNCTL_VERSION).tar.gz
+TUNCTL_SITE = http://downloads.sourceforge.net/project/tunctl/tunctl/$(TUNCTL_VERSION)
+
+TUNCTL_LICENSE = GPLv2
+TUNCTL_LICENSE_FILES = tunctl.c
+
+define TUNCTL_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) tunctl
+endef
+
+define TUNCTL_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/tunctl $(TARGET_DIR)/usr/sbin/tunctl
+endef
+
+$(eval $(generic-package))
