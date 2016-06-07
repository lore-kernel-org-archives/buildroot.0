From: Christian Stewart <christian@paral.in>
Date: Tue,  7 Jun 2016 13:35:32 -0700
Subject: [Buildroot] [PATCH v2 1/1] babeld: new package
Message-ID: <1465331732-8421-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Babel is a loop-avoiding distance-vector routing protocol for IPv6 and
IPv4 with fast convergence properties. It is based on the ideas in DSDV,
AODV and Cisco's EIGRP, but is designed to work well not only in wired
networks but also in wireless mesh networks, and has been extended with
support for overlay networks.

https://www.irif.univ-paris-diderot.fr/~jch/software/babel/

Signed-off-by: Christian Stewart <christian@paral.in>

---

Changes for v2:
 - fix MAKE to actually cross-compile to target
 - use commit message as the help message
 - added note about verifying signature

---
 package/Config.in         |  1 +
 package/babeld/Config.in  | 10 ++++++++++
 package/babeld/babel.hash |  3 +++
 package/babeld/babel.mk   | 21 +++++++++++++++++++++
 4 files changed, 35 insertions(+)
 create mode 100644 package/babeld/Config.in
 create mode 100644 package/babeld/babel.hash
 create mode 100644 package/babeld/babel.mk

diff --git a/package/Config.in b/package/Config.in
index 46d7977..4137828 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1114,6 +1114,7 @@ endmenu
 
 menu "Networking"
 	source "package/agentpp/Config.in"
+	source "package/babeld/Config.in"
 	source "package/batman-adv/Config.in"
 	source "package/c-ares/Config.in"
 	source "package/canfestival/Config.in"
diff --git a/package/babeld/Config.in b/package/babeld/Config.in
new file mode 100644
index 0000000..9dae654
--- /dev/null
+++ b/package/babeld/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_BABELD
+	bool "babeld"
+	help
+	  Babel is a loop-avoiding distance-vector routing protocol for IPv6 and
+	  IPv4 with fast convergence properties. It is based on the ideas in DSDV,
+	  AODV and Cisco's EIGRP, but is designed to work well not only in wired
+	  networks but also in wireless mesh networks, and has been extended with
+	  support for overlay networks.
+
+	  https://www.irif.univ-paris-diderot.fr/~jch/software/babel/
diff --git a/package/babeld/babel.hash b/package/babeld/babel.hash
new file mode 100644
index 0000000..92a65ac
--- /dev/null
+++ b/package/babeld/babel.hash
@@ -0,0 +1,3 @@
+# Verified against:
+# https://www.irif.univ-paris-diderot.fr/~jch/software/files/babeld-1.7.1.tar.gz.asc
+sha256 2c955e7d4ad971da1e860e5cedbaf1dd79903468ff6488b3f67102b2a8d087b6  babeld-1.7.1.tar.gz
diff --git a/package/babeld/babel.mk b/package/babeld/babel.mk
new file mode 100644
index 0000000..edca16b
--- /dev/null
+++ b/package/babeld/babel.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# babeld
+#
+################################################################################
+
+BABELD_VERSION = 1.7.1
+BABELD_SITE = https://www.irif.univ-paris-diderot.fr/~jch/software/files
+BABELD_SOURCE = babeld-$(BABELD_VERSION).tar.gz
+BABELD_LICENSE = as-is
+BABELD_LICENSE_FILES = LICENSE
+
+define BABELD_BUILD_CMDS
+	$(MAKE) -C $(@D) CC="$(HOSTCC)" CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)"
+endef
+
+define BABELD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/babeld $(TARGET_DIR)/usr/bin/babeld
+endef
+
+$(eval $(generic-package))
-- 
2.7.3
