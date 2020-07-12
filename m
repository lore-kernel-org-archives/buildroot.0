From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 23:47:06 +0200
Subject: [Buildroot] [git commit] package/parprouted: new package
Message-ID: <20200712215008.50B6D86BA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fce71d09fb139ed2b29ad1f3158da50731c7ca48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

parprouted is a daemon for transparent IP (Layer 3) proxy ARP
bridging. This is useful for creation of transparent firewalls
and bridging networks with different MAC protocols. Also,
unlike standard bridging, proxy ARP bridging allows to bridge
Ethernet networks behind wireless nodes without using WDS or
layer 2 bridging.

https://www.hazard.maks.net/parprouted

Signed-off-by: Owen Walpole <owen@walpole.dev>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  3 +++
 package/Config.in                  |  1 +
 package/parprouted/Config.in       | 17 +++++++++++++++++
 package/parprouted/parprouted.hash |  3 +++
 package/parprouted/parprouted.mk   | 20 ++++++++++++++++++++
 5 files changed, 44 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0723fe24f0..efbb676b48 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1932,6 +1932,9 @@ F:	package/openjpeg/
 N:	Olivier Singla <olivier.singla@gmail.com>
 F:	package/shellinabox/
 
+N:	Owen Walpole <owen@walpole.dev>
+F:	package/parprouted/
+
 N:	Parnell Springmeyer <parnell@digitalmentat.com>
 F:	package/scrypt/
 
diff --git a/package/Config.in b/package/Config.in
index 1cab73d122..aafaa312a1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2155,6 +2155,7 @@ endif
 	source "package/openswan/Config.in"
 	source "package/openvpn/Config.in"
 	source "package/p910nd/Config.in"
+	source "package/parprouted/Config.in"
 	source "package/phidgetwebservice/Config.in"
 	source "package/phytool/Config.in"
 	source "package/pimd/Config.in"
diff --git a/package/parprouted/Config.in b/package/parprouted/Config.in
new file mode 100644
index 0000000000..7cf839da3c
--- /dev/null
+++ b/package/parprouted/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_PARPROUTED
+	bool "parprouted"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  parprouted is a daemon for transparent IP (Layer 3) proxy ARP
+	  bridging. This is useful for creation of transparent firewalls
+	  and bridging networks with different MAC protocols. Also,
+	  unlike standard bridging, proxy ARP bridging allows to bridge
+	  Ethernet networks behind wireless nodes without using WDS or
+	  layer 2 bridging.
+
+	  https://www.hazard.maks.net/parprouted
+
+comment "parprouted needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/parprouted/parprouted.hash b/package/parprouted/parprouted.hash
new file mode 100644
index 0000000000..ec73f92168
--- /dev/null
+++ b/package/parprouted/parprouted.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  4b8cb2c801047f26b63aefaa8d69adc8552fb7c8a8f5d851798a48f841948d36  parprouted-0.65.tar.gz
+sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/parprouted/parprouted.mk b/package/parprouted/parprouted.mk
new file mode 100644
index 0000000000..09565787c2
--- /dev/null
+++ b/package/parprouted/parprouted.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# parprouted
+#
+################################################################################
+
+PARPROUTED_VERSION = 0.65
+PARPROUTED_SITE = https://www.hazard.maks.net/parprouted
+PARPROUTED_LICENSE = GPL-2.0
+PARPROUTED_LICENSE_FILES = COPYING
+
+define PARPROUTED_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
+endef
+
+define PARPROUTED_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/parprouted $(TARGET_DIR)/usr/sbin/parprouted
+endef
+
+$(eval $(generic-package))
