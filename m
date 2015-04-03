From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Apr 2015 14:36:52 +0200
Subject: [Buildroot] [git commit] drbd-utils: new package
Message-ID: <20150403124757.EC136819B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b47ab6cd45fe383c14cb3a2e5426c87477f14db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

DRBD utilities to manage the DRBD kernel module.

[Thomas: remove largefile dependency.]

Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |    1 +
 package/drbd-utils/Config.in     |    7 +++++++
 package/drbd-utils/drbd-utils.mk |   34 ++++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f00a18f..65e2683 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1114,6 +1114,7 @@ endif
 	source "package/dhcpcd/Config.in"
 	source "package/dhcpdump/Config.in"
 	source "package/dnsmasq/Config.in"
+	source "package/drbd-utils/Config.in"
 	source "package/dropbear/Config.in"
 	source "package/ebtables/Config.in"
 	source "package/ejabberd/Config.in"
diff --git a/package/drbd-utils/Config.in b/package/drbd-utils/Config.in
new file mode 100644
index 0000000..be68619
--- /dev/null
+++ b/package/drbd-utils/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_DRBD_UTILS
+	bool "drbd-utils"
+	depends on BR2_USE_MMU # needs fork()
+	help
+	  DRBD utilities to manage the DRBD kernel module.
+
+	  http://oss.linbit.com/drbd/
diff --git a/package/drbd-utils/drbd-utils.mk b/package/drbd-utils/drbd-utils.mk
new file mode 100644
index 0000000..0da4b1f
--- /dev/null
+++ b/package/drbd-utils/drbd-utils.mk
@@ -0,0 +1,34 @@
+################################################################################
+#
+# drbd-utils
+#
+################################################################################
+
+DRBD_UTILS_VERSION = 8.9.1
+DRBD_UTILS_SITE = http://oss.linbit.com/drbd/
+DRBD_UTILS_LICENSE = GPLv2+
+DRBD_UTILS_LICENSE_FILES = COPYING
+
+DRBD_UTILS_CONF_OPTS = --with-distro=generic
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+DRBD_UTILS_CONF_OPTS += --with-initscripttype=systemd
+DRDB_UTILS_DEPENDENCIES += systemd
+else
+DRBD_UTILS_CONF_OPTS += --with-initscripttype=sysv
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+DRBD_UTILS_CONF_OPTS += --with-udev=yes
+DRDB_UTILS_DEPENDENCIES += udev
+else
+DRBD_UTILS_CONF_OPTS += --with-udev=no
+endif
+
+# Do not build the documentation because it requires docbook
+define DRBD_UTILS_DISABLE_DOCS
+	$(SED) 's/user scripts documentation/user scripts/' $(@D)/Makefile.in
+endef
+DRBD_UTILS_POST_PATCH_HOOKS += DRBD_UTILS_DISABLE_DOCS
+
+$(eval $(autotools-package))
