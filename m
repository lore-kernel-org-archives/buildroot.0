From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 22 Jan 2013 15:56:57 +0100
Subject: [Buildroot] [git commit] package: add bustle dbus monitor package
Message-ID: <20130122145723.30BF98FAB4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db7a831da184e2fa2ed1f43ef528b81d2023d986
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only builds the capture tool, not the (host) graphical viewer.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/bustle/Config.in |   22 ++++++++++++++++++++++
 package/bustle/bustle.mk |   23 +++++++++++++++++++++++
 3 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 39e2ec7..c4e5ad5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -53,6 +53,7 @@ source "package/automake/Config.in"
 source "package/binutils/Config.in"
 source "package/bison/Config.in"
 source "package/bsdiff/Config.in"
+source "package/bustle/Config.in"
 source "package/ccache/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/coreutils/Config.in"
diff --git a/package/bustle/Config.in b/package/bustle/Config.in
new file mode 100644
index 0000000..2a2a2c1
--- /dev/null
+++ b/package/bustle/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_BUSTLE
+	bool "bustle"
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_PACKAGE_DBUS # runtime
+	help
+	  Bustle is a better dbus-monitor! It records and draws
+	  sequence diagrams of D-Bus activity, showing signal
+	  emissions, method calls and their corresponding returns,
+	  with timestamps for each individual event and the duration
+	  of each method call. This can help you check for unwanted
+	  D-Bus traffic, and pinpoint why your D-Bus-based application
+	  isn't performing as well as you like.
+
+	  This only installs the command line bustle-pcap tool, not
+	  the graphical viewer.
+
+	  http://www.willthompson.co.uk/bustle/
+
+comment "bustle requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/bustle/bustle.mk b/package/bustle/bustle.mk
new file mode 100644
index 0000000..88d49b6
--- /dev/null
+++ b/package/bustle/bustle.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# bustle
+#
+#############################################################
+
+BUSTLE_VERSION = 0.4.2
+BUSTLE_SITE = http://www.willthompson.co.uk/bustle/releases/$(BUSTLE_VERSION)/
+BUSTLE_LICENSE = LGPLv2.1+
+BUSTLE_LICENSE_FILES = LICENSE
+BUSTLE_DEPENDENCIES = libglib2 libpcap host-pkgconf
+
+define BUSTLE_BUILD_CMDS
+	PATH=$(TARGET_PATH) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		PCAP_FLAGS='-lpcap' -C $(@D) dist/build/bustle-pcap
+endef
+
+define BUSTLE_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/dist/build/bustle-pcap \
+		$(TARGET_DIR)/usr/bin/bustle-pcap
+endef
+
+$(eval $(generic-package))
