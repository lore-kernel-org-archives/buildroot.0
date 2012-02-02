From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 Feb 2012 21:02:26 +0100
Subject: [Buildroot] [git commit] openocd: add host variant
Message-ID: <20120202201521.BAB979099F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=375d68d110a0548aff7a7e54b65bbb92051911ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in.host         |    1 +
 package/openocd/Config.in.host |    6 ++++++
 package/openocd/openocd.mk     |   10 ++++++++++
 3 files changed, 17 insertions(+), 0 deletions(-)

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
