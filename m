From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Jan 2017 18:23:13 +0100
Subject: [Buildroot] [git commit] ifenslave: new package
Message-ID: <20170108172557.9B0DE81844@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d637db1586d9d09bb3f3437d1df5d3539af6928
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: handle busybox applet interaction, add comment explaining no build
	needed]
Signed-off-by: David Bachelart <david.bachelart@bbright.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                |  1 +
 package/ifenslave/Config.in      |  7 +++++++
 package/ifenslave/ifenslave.hash |  3 +++
 package/ifenslave/ifenslave.mk   | 20 ++++++++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 341c77c..3a52a36 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1499,6 +1499,7 @@ menu "Networking applications"
 	source "package/httping/Config.in"
 	source "package/ibrdtn-tools/Config.in"
 	source "package/ibrdtnd/Config.in"
+	source "package/ifenslave/Config.in"
 	source "package/ifplugd/Config.in"
 	source "package/iftop/Config.in"
 	source "package/ifupdown/Config.in"
diff --git a/package/ifenslave/Config.in b/package/ifenslave/Config.in
new file mode 100644
index 0000000..2203284
--- /dev/null
+++ b/package/ifenslave/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_IFENSLAVE
+	bool "ifenslave"
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
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
index 0000000..1b82312
--- /dev/null
+++ b/package/ifenslave/ifenslave.mk
@@ -0,0 +1,20 @@
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
+IFENSLAVE_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
+
+# shell script, so nothing to build
+
+define IFENSLAVE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/ifenslave $(TARGET_DIR)/sbin/ifenslave
+endef
+
+$(eval $(generic-package))
