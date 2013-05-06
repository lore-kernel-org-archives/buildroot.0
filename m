From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 May 2013 13:44:59 +0200
Subject: [Buildroot] [git commit] crda: new package
Message-ID: <20130506115310.EF7B399C41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9a5820465e79497a1304dcbce9a835dfb1197e6c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on the one from Dimitrios Siganos <dimitris@siganos.org> but with
a proper host-python-m2crypto instead of patching.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in      |    1 +
 package/crda/Config.in |   15 +++++++++++++++
 package/crda/crda.mk   |   23 +++++++++++++++++++++++
 3 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b7f2e4b..fe4f56b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -671,6 +671,7 @@ source "package/bmon/Config.in"
 source "package/bridge-utils/Config.in"
 source "package/can-utils/Config.in"
 source "package/connman/Config.in"
+source "package/crda/Config.in"
 source "package/ctorrent/Config.in"
 source "package/conntrack-tools/Config.in"
 source "package/cups/Config.in"
diff --git a/package/crda/Config.in b/package/crda/Config.in
new file mode 100644
index 0000000..66baf14
--- /dev/null
+++ b/package/crda/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_CRDA
+	bool "crda"
+	select BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_LIBNL
+	# regdb is a runtime dependency
+	select BR2_PACKAGE_WIRELESS_REGDB
+	help
+	  Central Regulatory Domain Agent.
+
+	  This package provides a Central Regulatory Domain Agent (CRDA)
+	  to be used by the Linux kernel cf80211 wireless subsystem to
+	  query and apply the regulatory domain settings wireless devices
+	  may operate within for a given location.
+
+	  http://linuxwireless.org/en/developers/Regulatory/CRDA
diff --git a/package/crda/crda.mk b/package/crda/crda.mk
new file mode 100644
index 0000000..0c9391d
--- /dev/null
+++ b/package/crda/crda.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# crda
+#
+#############################################################
+
+CRDA_VERSION = 1.1.3
+CRDA_SOURCE = crda-$(CRDA_VERSION).tar.bz2
+CRDA_SITE = http://wireless.kernel.org/download/crda
+CRDA_DEPENDENCIES = host-pkgconf host-python-m2crypto \
+	libnl libgcrypt
+CRDA_LICENSE = ISC
+CRDA_LICENSE_FILES = LICENSE
+
+define CRDA_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) all_noverify -C $(@D)
+endef
+
+define CRDA_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) install -C $(@D) DESTDIR=$(TARGET_DIR)
+endef
+
+$(eval $(generic-package))
