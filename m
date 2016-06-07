From: Christian Stewart <christian@paral.in>
Date: Mon,  6 Jun 2016 21:47:19 -0700
Subject: [Buildroot] [PATCH v1 1/1] babeld: new package
Message-ID: <1465274839-27236-1-git-send-email-christian@paral.in>
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
 package/Config.in         |  1 +
 package/babeld/Config.in  |  6 ++++++
 package/babeld/babel.hash |  2 ++
 package/babeld/babel.mk   | 21 +++++++++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/babeld/Config.in
 create mode 100644 package/babeld/babel.hash
 create mode 100644 package/babeld/babel.mk

diff --git a/package/Config.in b/package/Config.in
index 9f6e0d9..3a4a9b8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1113,6 +1113,7 @@ endmenu
 
 menu "Networking"
 	source "package/agentpp/Config.in"
+	source "package/babeld/Config.in"
 	source "package/batman-adv/Config.in"
 	source "package/c-ares/Config.in"
 	source "package/canfestival/Config.in"
diff --git a/package/babeld/Config.in b/package/babeld/Config.in
new file mode 100644
index 0000000..d195fb2
--- /dev/null
+++ b/package/babeld/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_BABELD
+	bool "babeld"
+	help
+	  Babel routing daemon.
+
+	  https://github.com/jech/babeld
diff --git a/package/babeld/babel.hash b/package/babeld/babel.hash
new file mode 100644
index 0000000..0ee64c4
--- /dev/null
+++ b/package/babeld/babel.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 2c955e7d4ad971da1e860e5cedbaf1dd79903468ff6488b3f67102b2a8d087b6  babeld-1.7.1.tar.gz
diff --git a/package/babeld/babel.mk b/package/babeld/babel.mk
new file mode 100644
index 0000000..789aa9f
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
+	$(MAKE) -C $(@D)
+endef
+
+define BABELD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/babeld $(TARGET_DIR)/usr/bin/babeld
+endef
+
+$(eval $(generic-package))
-- 
2.7.3
