From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2012 18:42:54 +0100
Subject: [Buildroot] [PATCH 6/7] openocd: add host variant
In-Reply-To: <cover.1327772556.git.thomas.petazzoni@free-electrons.com>
References: <cover.1327772556.git.thomas.petazzoni@free-electrons.com>
Message-ID: <db5b4b83f1cde44b8d513728eaa0b023c6c1c4f1.1327772556.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/Config.in.host         |    1 +
 package/openocd/Config.in.host |    6 ++++++
 package/openocd/openocd.mk     |   10 ++++++++++
 3 files changed, 17 insertions(+), 0 deletions(-)
 create mode 100644 package/openocd/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index b8f8aab..6bc828b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,5 +1,6 @@
 menu "Host utilities"
 
+source "package/openocd/Config.in.host"
 source "package/uboot-tools/Config.in.host"
 
 endmenu
diff --git a/package/openocd/Config.in.host b/package/openocd/Config.in.host
new file mode 100644
index 0000000..2380942
--- /dev/null
+++ b/package/openocd/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_OPENOCD
+	bool "host openocd"
+	help
+	  OpenOCD - Open On-Chip Debugger
+
+	  http://openocd.berlios.de/web/
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 5f61367..d79b33b 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -29,4 +29,14 @@ ifeq ($(BR2_PACKAGE_OPENOCD_VSLLINK),y)
 OPENOCD_CONF_OPT += --enable-vsllink
 endif
 
+HOST_OPENOCD_DEPENDENCIES = host-libusb-compat host-libftdi
+
+HOST_OPENOCD_CONF_OPT = 	\
+	--disable-doxygen-html 	\
+	--enable-dummy 		\
+	--enable-ft2232_libftdi \
+	--enable-jlink 		\
+	--enable-vsllink
+
 $(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
-- 
1.7.4.1
