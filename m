From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 Feb 2012 21:14:48 +0100
Subject: [Buildroot] [git commit] sam-ba: new package with host variant only
Message-ID: <20120202201521.D7AC19099F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a23c0e59684628f69615e25ad1b9dbca972a3815
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sam-ba is a tool needed to reprogram AT91-based systems using an USB
connection or a serial port connection.

[Peter: Add upstream URL]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in.host        |    1 +
 package/sam-ba/Config.in.host |    8 ++++++++
 package/sam-ba/sam-ba.mk      |   22 ++++++++++++++++++++++
 3 files changed, 31 insertions(+), 0 deletions(-)

diff --git a/package/Config.in.host b/package/Config.in.host
index 6bc828b..1f49e79 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,6 +1,7 @@
 menu "Host utilities"
 
 source "package/openocd/Config.in.host"
+source "package/sam-ba/Config.in.host"
 source "package/uboot-tools/Config.in.host"
 
 endmenu
diff --git a/package/sam-ba/Config.in.host b/package/sam-ba/Config.in.host
new file mode 100644
index 0000000..f2ea01f
--- /dev/null
+++ b/package/sam-ba/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_SAM_BA
+	bool "host sam-ba"
+	help
+	  Atmel SAM-BA software provides an open set of tools for
+	  programming the Atmel SAM3, SAM7 and SAM9 ARM-based
+	  microcontrollers.
+
+	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SoftwareTools
diff --git a/package/sam-ba/sam-ba.mk b/package/sam-ba/sam-ba.mk
new file mode 100644
index 0000000..d00575c
--- /dev/null
+++ b/package/sam-ba/sam-ba.mk
@@ -0,0 +1,22 @@
+SAM_BA_SITE    = http://www.atmel.com/dyn/resources/prod_documents/
+SAM_BA_VERSION = 2.10
+SAM_BA_SOURCE  = sam-ba_$(SAM_BA_VERSION).zip
+
+define HOST_SAM_BA_EXTRACT_CMDS
+        unzip -d $(BUILD_DIR) $(DL_DIR)/$(SAM_BA_SOURCE)
+        mv $(BUILD_DIR)/sam-ba_cdc_linux/* $(@D)
+        rmdir $(BUILD_DIR)/sam-ba_cdc_linux/
+endef
+
+# Since it's a prebuilt application and it does not conform to the
+# usual Unix hierarchy, we install it in $(HOST_DIR)/opt/sam-ba and
+# then create a symbolic link from $(HOST_DIR)/usr/bin to the
+# application binary, for easier usage.
+
+define HOST_SAM_BA_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/opt/sam-ba/
+	cp -a $(@D)/* $(HOST_DIR)/opt/sam-ba/
+	ln -s ../../opt/sam-ba/sam-ba $(HOST_DIR)/usr/bin/sam-ba
+endef
+
+$(eval $(call GENTARGETS,host))
