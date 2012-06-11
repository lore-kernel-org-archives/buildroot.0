From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 11 Jun 2012 22:48:19 +0200
Subject: [Buildroot] [git commit] flashrom: new package
Message-ID: <20120611205424.7670496D5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a4e44fc9042a578cc78d1fff213491d8fb1e32f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: Install into /usr/sbin]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    1 +
 package/flashrom/Config.in   |   11 +++++++++++
 package/flashrom/flashrom.mk |   20 ++++++++++++++++++++
 3 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 4915b67..fecc336 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -179,6 +179,7 @@ source "package/dmraid/Config.in"
 source "package/dosfstools/Config.in"
 source "package/e2fsprogs/Config.in"
 source "package/eeprog/Config.in"
+source "package/flashrom/Config.in"
 source "package/fconfig/Config.in"
 source "package/fis/Config.in"
 source "package/fmtools/Config.in"
diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
new file mode 100644
index 0000000..956500f
--- /dev/null
+++ b/package/flashrom/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_FLASHROM
+	bool "flashrom"
+	select BR2_PACKAGE_PCIUTILS
+	# dmidecode is only a runtime dependency
+	select BR2_PACKAGE_DMIDECODE
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  BIOS-updating utility.
+	  Requires PCIUtils libraries.
+
+	  http://flashrom.org/
diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
new file mode 100644
index 0000000..c019f2d
--- /dev/null
+++ b/package/flashrom/flashrom.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# flashrom
+#
+#############################################################
+FLASHROM_VERSION = 0.9.3
+FLASHROM_SOURCE  = flashrom-$(FLASHROM_VERSION).tar.bz2
+FLASHROM_SITE    = http://download.flashrom.org/releases
+
+FLASHROM_DEPENDENCIES = pciutils
+
+define FLASHROM_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define FLASHROM_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/flashrom $(TARGET_DIR)/usr/sbin/flashrom
+endef
+
+$(eval $(call GENTARGETS))
