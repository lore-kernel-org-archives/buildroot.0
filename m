From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 00:02:04 +0100
Subject: [Buildroot] [git commit master 1/1] pptp: bump to version 1.7.2,
	convert to gentargets
Message-ID: <20101104230333.D4AAF8DB53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7c949cb2a23791e8baeeac32ae3d90869b07617d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../pptp-linux/pptp-linux-1.7.2-drop-stropts.patch |   26 ++++++
 package/pptp-linux/pptp-linux-1.7.2-ip-path.patch  |   44 ++++++++++
 package/pptp-linux/pptp-linux.mk                   |   86 ++++---------------
 3 files changed, 88 insertions(+), 68 deletions(-)
 create mode 100644 package/pptp-linux/pptp-linux-1.7.2-drop-stropts.patch
 create mode 100644 package/pptp-linux/pptp-linux-1.7.2-ip-path.patch

diff --git a/package/pptp-linux/pptp-linux-1.7.2-drop-stropts.patch b/package/pptp-linux/pptp-linux-1.7.2-drop-stropts.patch
new file mode 100644
index 0000000..bc53cc2
--- /dev/null
+++ b/package/pptp-linux/pptp-linux-1.7.2-drop-stropts.patch
@@ -0,0 +1,26 @@
+From ae214f5103dfaa92ecb0b1953d4c9dd059e620ca Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Thu, 21 Oct 2010 10:59:02 -0300
+Subject: [PATCH] Drop stropts.h, it's deprecated and unneeded
+
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ pptp_compat.c |    1 -
+ 1 files changed, 0 insertions(+), 1 deletions(-)
+
+diff --git a/pptp_compat.c b/pptp_compat.c
+index 1760a3b..e98cbf0 100644
+--- a/pptp_compat.c
++++ b/pptp_compat.c
+@@ -7,7 +7,6 @@
+ #include <fcntl.h>
+ #include <sys/types.h>
+ #include <unistd.h>
+-#include <stropts.h>
+ #include <stdlib.h>
+ #include <strings.h>
+ #include "pptp_compat.h"
+-- 
+1.7.2.2
+
diff --git a/package/pptp-linux/pptp-linux-1.7.2-ip-path.patch b/package/pptp-linux/pptp-linux-1.7.2-ip-path.patch
new file mode 100644
index 0000000..6d8f3c8
--- /dev/null
+++ b/package/pptp-linux/pptp-linux-1.7.2-ip-path.patch
@@ -0,0 +1,44 @@
+From 00b9e2615191439a6c7db960d169129479ac633b Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Thu, 21 Oct 2010 11:01:25 -0300
+Subject: [PATCH] The ip tool is in /sbin rather that /bin, fix it
+
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+ routing.c |    6 +++---
+ 1 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/routing.c b/routing.c
+index ab20a03..7fb4277 100644
+--- a/routing.c
++++ b/routing.c
+@@ -55,7 +55,7 @@ regardless (not yet implemented).
+ 
+ void routing_init(char *ip) {
+   char buf[256];
+-  snprintf(buf, 255, "/bin/ip route get %s", ip);
++  snprintf(buf, 255, "/sbin/ip route get %s", ip);
+   FILE *p = popen(buf, "r");
+   fgets(buf, 255, p);
+   /* TODO: check for failure of fgets */
+@@ -66,14 +66,14 @@ void routing_init(char *ip) {
+ 
+ void routing_start() {
+   char buf[256];
+-  snprintf(buf, 255, "/bin/ip route replace %s", route);
++  snprintf(buf, 255, "/sbin/ip route replace %s", route);
+   FILE *p = popen(buf, "r");
+   pclose(p);
+ }
+ 
+ void routing_end() {
+   char buf[256];
+-  snprintf(buf, 255, "/bin/ip route delete %s", route);
++  snprintf(buf, 255, "/sbin/ip route delete %s", route);
+   FILE *p = popen(buf, "r");
+   pclose(p);
+ }
+-- 
+1.7.2.2
+
diff --git a/package/pptp-linux/pptp-linux.mk b/package/pptp-linux/pptp-linux.mk
index 8de0832..605f30d 100644
--- a/package/pptp-linux/pptp-linux.mk
+++ b/package/pptp-linux/pptp-linux.mk
@@ -3,76 +3,26 @@
 # pptp-linux
 #
 #############################################################
-PPTP_LINUX_VERSION:=1.7.0
-PPTP_LINUX_SOURCE:=pptp-linux_$(PPTP_LINUX_VERSION).orig.tar.gz
-#PPTP_LINUX_PATCH:=pptp-linux_$(PPTP_LINUX_VERSION)-2.diff.gz
-PPTP_LINUX_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/p/pptp-linux
-PPTP_LINUX_DIR:=$(BUILD_DIR)/pptp-linux-$(PPTP_LINUX_VERSION).orig
-PPTP_LINUX_CAT:=$(ZCAT)
-PPTP_LINUX_BINARY:=pptp
-PPTP_LINUX_TARGET_BINARY:=usr/sbin/pptp
 
-$(DL_DIR)/$(PPTP_LINUX_SOURCE):
-	$(call DOWNLOAD,$(PPTP_LINUX_SITE),$(PPTP_LINUX_SOURCE))
+PPTP_LINUX_VERSION = 1.7.2
+PPTP_LINUX_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/pptpclient
+PPTP_LINUX_SOURCE = pptp-$(PPTP_LINUX_VERSION).tar.gz
 
-ifneq ($(PPTP_LINUX_PATCH),)
-PPTP_LINUX_PATCH_FILE:=$(DL_DIR)/$(PPTP_LINUX_PATCH)
-$(PPTP_LINUX_PATCH_FILE):
-	$(call DOWNLOAD,$(PPTP_LINUX_SITE),$(PPTP_LINUX_PATCH))
-endif
+define PPTP_LINUX_BUILD_CMDS
+	$(MAKE) -C $(@D) OPTIMIZE= DEBUG= \
+		CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)"
+endef
 
-$(PPTP_LINUX_DIR)/.unpacked: $(DL_DIR)/$(PPTP_LINUX_SOURCE) $(PPTP_LINUX_PATCH_FILE)
-	$(PPTP_LINUX_CAT) $(DL_DIR)/$(PPTP_LINUX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-ifneq ($(PPTP_LINUX_PATCH),)
-	(cd $(PPTP_LINUX_DIR) && $(PPTP_LINUX_CAT) $(DL_DIR)/$(PPTP_LINUX_PATCH) | patch -p1)
-	if [ -d $(PPTP_LINUX_DIR)/debian/patches ]; then \
-		toolchain/patch-kernel.sh $(PPTP_LINUX_DIR) $(PPTP_LINUX_DIR)/debian/patches \*.patch; \
-	fi
-endif
-	toolchain/patch-kernel.sh $(PPTP_LINUX_DIR) package/pptp-linux/ pptp-linux\*.patch
-	touch $@
+define PPTP_LINUX_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/pptp $(TARGET_DIR)/usr/sbin/pptp
+	$(INSTALL) -m 0644 -D $(@D)/pptp.8 $(TARGET_DIR)/usr/share/man/man8/pptp.8
+endef
 
-$(PPTP_LINUX_DIR)/.configured: $(PPTP_LINUX_DIR)/.unpacked
-	(cd $(PPTP_LINUX_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		$(DISABLE_LARGEFILE) \
-	)
-	touch $@
+define PPTP_LINUX_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/sbin/pptp
+	rm -f $(TARGET_DIR)/usr/share/man/man8/pptp.8
+endef
 
-$(PPTP_LINUX_DIR)/$(PPTP_LINUX_BINARY): $(PPTP_LINUX_DIR)/.unpacked
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) OPTIMIZE="$(TARGET_CFLAGS)" \
-		-C $(PPTP_LINUX_DIR)
-
-$(TARGET_DIR)/$(PPTP_LINUX_TARGET_BINARY): $(PPTP_LINUX_DIR)/$(PPTP_LINUX_BINARY)
-	cp -dpf $(PPTP_LINUX_DIR)/$(PPTP_LINUX_BINARY) $@
-ifeq ($(BR2_HAVE_DOCUMENTATION),y)
-	mkdir -p $(TARGET_DIR)/usr/share/man/man8
-	$(INSTALL) -m 644 $(PPTP_LINUX_DIR)/pptp.8 $(TARGET_DIR)/usr/share/man/man8/pptp.8
-endif
-	$(STRIPCMD) $(STRIP_STRIP_ALL) $@
-
-pptp-linux: $(TARGET_DIR)/$(PPTP_LINUX_TARGET_BINARY)
-
-pptp-linux-source: $(DL_DIR)/$(PPTP_LINUX_SOURCE) $(PPTP_LINUX_PATCH_FILE)
-
-pptp-linux-clean:
-	-$(MAKE) -C $(PPTP_LINUX_DIR) distclean
-	rm -f $(TARGET_DIR)/$(PPTP_LINUX_TARGET_BINARY) \
-		$(TARGET_DIR)/usr/share/man/man8/pptp.8*
-
-pptp-linux-dirclean:
-	rm -rf $(PPTP_LINUX_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_PPTP_LINUX),y)
-TARGETS+=pptp-linux
-endif
+$(eval $(call GENTARGETS,package,pptp-linux))
-- 
1.7.1
