From: David Bachelart <david.bachelart@bbright.com>
Date: Mon,  2 Jan 2017 16:45:22 +0100
Subject: [Buildroot] [PATCH v2] ifenslave: new package
Message-ID: <1483371929-13907-1-git-send-email-david.bachelart@bbright.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: David Bachelart <david.bachelart@bbright.com>
---
Changes v1 -> v2:
  - download tarball from snapshot.debian.org
  - use upstream SHA256 sum in hash file
---
 package/Config.in                |  1 +
 package/ifenslave/Config.in      |  6 ++++++
 package/ifenslave/ifenslave.hash |  3 +++
 package/ifenslave/ifenslave.mk   | 17 +++++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/ifenslave/Config.in
 create mode 100644 package/ifenslave/ifenslave.hash
 create mode 100644 package/ifenslave/ifenslave.mk

diff --git a/package/Config.in b/package/Config.in
index 59fa851..5c4e969 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1497,6 +1497,7 @@ menu "Networking applications"
 	source "package/httping/Config.in"
 	source "package/ibrdtn-tools/Config.in"
 	source "package/ibrdtnd/Config.in"
+	source "package/ifenslave/Config.in"
 	source "package/ifplugd/Config.in"
 	source "package/iftop/Config.in"
 	source "package/ifupdown/Config.in"
diff --git a/package/ifenslave/Config.in b/package/ifenslave/Config.in
new file mode 100644
index 0000000..357e870
--- /dev/null
+++ b/package/ifenslave/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_IFENSLAVE
+	bool "ifenslave"
+	help
+	  Configure network interfaces for parallel routing (bonding)
+
+	  http://anonscm.debian.org/cgit/collab-maint/ifenslave.git
diff --git a/package/ifenslave/ifenslave.hash b/package/ifenslave/ifenslave.hash
new file mode 100644
index 0000000..dcf31d0
--- /dev/null
+++ b/package/ifenslave/ifenslave.hash
@@ -0,0 +1,3 @@
+# From http://snapshot.debian.org/archive/debian/20170102T091407Z/pool/main/i/ifenslave/ifenslave_2.9.dsc
+sha1 a17e88fa298ef337e872c8aa5d7a390921239d1a   ifenslave_2.9.tar.xz
+sha256  e5666c0b61347bd06f2394c16eca6895fcb5e5cc83d0a1c596a975274de5a3c9    ifenslave_2.9.tar.xz
diff --git a/package/ifenslave/ifenslave.mk b/package/ifenslave/ifenslave.mk
new file mode 100644
index 0000000..f808406
--- /dev/null
+++ b/package/ifenslave/ifenslave.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# ifenslave
+#
+################################################################################
+
+IFENSLAVE_VERSION = 2.9
+IFENSLAVE_SOURCE = ifenslave_$(IFENSLAVE_VERSION).tar.xz
+IFENSLAVE_SITE = http://snapshot.debian.org/archive/debian/20170102T091407Z/pool/main/i/ifenslave
+IFENSLAVE_LICENSE = GPLv3+
+IFENSLAVE_LICENSE_FILES = debian/copyright
+
+define IFENSLAVE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/ifenslave $(TARGET_DIR)/sbin/ifenslave
+endef
+
+$(eval $(generic-package))
-- 
2.1.4
