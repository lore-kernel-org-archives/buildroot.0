From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 22:57:14 +0100
Subject: [Buildroot] [git commit] bcusdk: new package
Message-ID: <20130324220053.CAE759AE30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=94e147012bd45a5b95d257af1589d5d368b2614d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: tweak comment]
[Thomas: various fixes/improvements]
Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/bcusdk/Config.in |   22 ++++++++++++++++++++++
 package/bcusdk/bcusdk.mk |   26 ++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 1ba356c..be1aa99 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -633,6 +633,7 @@ source "package/argus/Config.in"
 source "package/arptables/Config.in"
 source "package/avahi/Config.in"
 source "package/axel/Config.in"
+source "package/bcusdk/Config.in"
 source "package/bluez_utils/Config.in"
 source "package/boa/Config.in"
 source "package/bind/Config.in"
diff --git a/package/bcusdk/Config.in b/package/bcusdk/Config.in
new file mode 100644
index 0000000..cf082e7
--- /dev/null
+++ b/package/bcusdk/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_BCUSDK
+	bool "bcusdk"
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBPTHSEM
+	help
+	  A free development environment for the Bus Coupling Units of
+	  the European Installation Bus.
+
+	  The European Installation Bus EIB is a home and building
+	  automation bus system. It is optimized for low-speed control
+	  applications like lighting and blinds control.
+
+	  BCUs (Bus Coupling Units) are standardized, generic
+	  platforms for embedded EIB devices. They include the entire
+	  physical layer network interface, power supply and a
+	  microcontroller with an implementation of the EIB protocol
+	  stack stored in the ROM.
+
+	  http://www.auto.tuwien.ac.at/~mkoegler/eib/
+
+comment "bcusdk requires a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/bcusdk/bcusdk.mk b/package/bcusdk/bcusdk.mk
new file mode 100644
index 0000000..3e07143
--- /dev/null
+++ b/package/bcusdk/bcusdk.mk
@@ -0,0 +1,26 @@
+#############################################################
+#
+# bcusck
+#
+#############################################################
+
+BCUSDK_VERSION = 0.0.5
+BCUSDK_SOURCE = bcusdk_$(BCUSDK_VERSION).tar.gz
+BCUSDK_SITE = http://www.auto.tuwien.ac.at/~mkoegler/eib/
+BCUSDK_LICENSE = GPLv2+
+BCUSDK_LICENSE_FILES = COPYING
+BCUSDK_INSTALL_STAGING = YES
+BCUSDK_CONF_OPT =  --enable-onlyeibd --enable-ft12 --enable-pei16 \
+		 --enable-eibnetip --enable-eibnetipserver \
+		 --enable-eibnetiptunnel --without-pth-test \
+		 --with-pth=$(STAGING_DIR)/usr
+
+BCUSDK_DEPENDENCIES = libpthsem
+
+define BCUSDK_REMOVE_EXAMPLES
+	$(RM) -rf $(TARGET_DIR)/usr/share/bcusdk
+endef
+
+BCUSDK_POST_INSTALL_TARGET_HOOKS += BCUSDK_REMOVE_EXAMPLES
+
+$(eval $(autotools-package))
