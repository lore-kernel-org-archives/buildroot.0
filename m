From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Jul 2010 17:29:01 +0200
Subject: [Buildroot] [git commit master 1/1] iostat: migrate to gentargets
Message-ID: <20100729154312.3E3D8834F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ee77963588b09babfd71befb0b5eb9fd1e776bbc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also make the cpu counting routine more reliable (for ARM it's
"Processor" in cpuinfo rather than "processor").

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                            |    4 +-
 package/iostat/Config.in           |    2 +-
 package/iostat/iostat-cpunum.patch |   27 +++++++++++++++++++
 package/iostat/iostat.mk           |   51 ++++++++++++-----------------------
 package/iostat/iostat.patch        |   11 --------
 5 files changed, 48 insertions(+), 47 deletions(-)
 create mode 100644 package/iostat/iostat-cpunum.patch
 delete mode 100644 package/iostat/iostat.patch

diff --git a/CHANGES b/CHANGES
index 9b2cb0c..b52aaa2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -31,8 +31,8 @@
 	cdrkit, cmake, dash, dhcp, dialog, diffutils, distcc, dmalloc,
 	dnsmasq, dropbear, e2fsprogs, fbv, file, flex, fontconfig,
 	gawk, gmpc, gnuchess, gst-plugins-base, gst-plugins-good,
-	gstreamer, gzip, icu, intltool, ipsec-tools, iptables, iw,
-	libart, libcgi, libdrm, libfuse, libglib2, libgpg-error,
+	gstreamer, gzip, icu, intltool, iostat, ipsec-tools, iptables,
+	iw, libart, libcgi, libdrm, libfuse, libglib2, libgpg-error,
 	libidn, liblockfile, libpng, libsoup, lighttpd, links,
 	linux-fusion, lmbench, lrzsz, ltrace, make, midori,
 	module-init-tools, mplayer, mysql_client, nbd, ncurses, neon,
diff --git a/package/iostat/Config.in b/package/iostat/Config.in
index 8e99df2..1aa1464 100644
--- a/package/iostat/Config.in
+++ b/package/iostat/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_IOSTAT
 	help
 	  An I/O performance monitoring utility.
 
-	  http://linux.inet.hr/
+	  http://www.linuxinsight.com/iostat_utility.html
diff --git a/package/iostat/iostat-cpunum.patch b/package/iostat/iostat-cpunum.patch
new file mode 100644
index 0000000..0e75dbf
--- /dev/null
+++ b/package/iostat/iostat-cpunum.patch
@@ -0,0 +1,27 @@
+From bf646965f75cdad77a45fa3b0046e093b202b2ce Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Thu, 22 Jul 2010 12:42:10 -0300
+Subject: [PATCH] Make cpu number counter more reliable
+
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ iostat.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/iostat.c b/iostat.c
+index 13e2af7..5d74085 100644
+--- a/iostat.c
++++ b/iostat.c
+@@ -140,7 +140,7 @@ void get_number_of_cpus()
+ 
+ 	handle_error("Can't open /proc/cpuinfo", !ncpufp);
+ 	while (fgets(buffer, sizeof(buffer), ncpufp)) {
+-		if (!strncmp(buffer, "processor\t:", 11))
++		if (!strncasecmp(buffer, "processor\t", 10))
+ 			ncpu++;
+ 	}
+ 	fclose(ncpufp);
+-- 
+1.7.1
+
diff --git a/package/iostat/iostat.mk b/package/iostat/iostat.mk
index 651f397..de7e1ff 100644
--- a/package/iostat/iostat.mk
+++ b/package/iostat/iostat.mk
@@ -3,44 +3,29 @@
 # iostat
 #
 #############################################################
-IOSTAT_VERSION:=2.2
-IOSTAT_SOURCE:=iostat-$(IOSTAT_VERSION).tar.gz
-IOSTAT_SITE:=http://linux.inet.hr/files
-IOSTAT_DIR:=$(BUILD_DIR)/iostat-$(IOSTAT_VERSION)
-IOSTAT_BINARY:=iostat
-IOSTAT_TARGET_BINARY:=usr/bin/iostat
 
-$(DL_DIR)/$(IOSTAT_SOURCE):
-	 $(call DOWNLOAD,$(IOSTAT_SITE),$(IOSTAT_SOURCE))
+IOSTAT_VERSION = 2.2
+IOSTAT_SITE = http://www.linuxinsight.com/files
 
 iostat-source: $(DL_DIR)/$(IOSTAT_SOURCE)
 
-$(IOSTAT_DIR)/.unpacked: $(DL_DIR)/$(IOSTAT_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(IOSTAT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(IOSTAT_DIR) package/iostat/ iostat\*.patch
-	touch $(IOSTAT_DIR)/.unpacked
+define IOSTAT_BUILD_CMDS
+	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
+endef
 
-$(IOSTAT_DIR)/$(IOSTAT_BINARY): $(IOSTAT_DIR)/.unpacked
-	$(MAKE) CC="$(TARGET_CC)" -C $(IOSTAT_DIR)
-	$(STRIPCMD) $(IOSTAT_DIR)/$(IOSTAT_BINARY)
+define IOSTAT_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
 
-$(TARGET_DIR)/$(IOSTAT_TARGET_BINARY): $(IOSTAT_DIR)/$(IOSTAT_BINARY)
-	$(INSTALL) -m 0755 -D $(IOSTAT_DIR)/$(IOSTAT_BINARY) $(TARGET_DIR)/$(IOSTAT_TARGET_BINARY)
+define IOSTAT_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(IOSTAT_DIR)/iostat $(TARGET_DIR)/usr/bin/iostat
+	$(INSTALL) -D $(IOSTAT_DIR)/iostat.8 \
+		$(TARGET_DIR)/usr/share/man/man8/iostat.8
+endef
 
-iostat: $(TARGET_DIR)/$(IOSTAT_TARGET_BINARY)
+define IOSTAT_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/iostat
+	rm -f $(TARGET_DIR)/usr/share/man/man8/iostat.8
+endef
 
-iostat-clean:
-	rm -f $(TARGET_DIR)/$(IOSTAT_TARGET_BINARY)
-	-$(MAKE) -C $(IOSTAT_DIR) clean
-
-iostat-dirclean:
-	rm -rf $(IOSTAT_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_IOSTAT),y)
-TARGETS+=iostat
-endif
+$(eval $(call GENTARGETS,package,iostat))                                                   
diff --git a/package/iostat/iostat.patch b/package/iostat/iostat.patch
deleted file mode 100644
index acf2a52..0000000
--- a/package/iostat/iostat.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- iostat-2.2/iostat.c.orig	2005-02-14 12:44:03.000000000 -0800
-+++ iostat-2.2/iostat.c	2005-03-10 15:24:09.000000000 -0800
-@@ -140,7 +140,7 @@
- 
- 	handle_error("Can't open /proc/cpuinfo", !ncpufp);
- 	while (fgets(buffer, sizeof(buffer), ncpufp)) {
--		if (!strncmp(buffer, "processor\t:", 11))
-+		if (!strncmp(buffer, "processor\t", 10))
- 			ncpu++;
- 	}
- 	fclose(ncpufp);
-- 
1.7.1
