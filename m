From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Jan 2011 11:21:31 -0300
Subject: [Buildroot] [PATCH 6/9] procps: convert to gentargets and bump to
	version 3.2.8
In-Reply-To: <1296138094-502-1-git-send-email-gustavo@zacarias.com.ar>
References: <1296138094-502-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1296138094-502-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/procps/procps-make-3.82.patch |   19 ++++++++++
 package/procps/procps.mk              |   61 ++++++++++-----------------------
 2 files changed, 37 insertions(+), 43 deletions(-)
 create mode 100644 package/procps/procps-make-3.82.patch

diff --git a/package/procps/procps-make-3.82.patch b/package/procps/procps-make-3.82.patch
new file mode 100644
index 0000000..a4d49eb
--- /dev/null
+++ b/package/procps/procps-make-3.82.patch
@@ -0,0 +1,19 @@
+ps/module.mk depends on vars set up in proc/module.mk, so make sure we always
+include the .mk files in the right order
+
+Patch from gentoo's portage tree, http://bugs.gentoo.org/show_bug.cgi?id=333299
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- procps-3.2.8/Makefile
++++ procps-3.2.8/Makefile
+@@ -174,7 +174,8 @@
+ # want this rule first, use := on ALL, and ALL not filled in yet
+ all: do_all
+ 
+--include */module.mk
++-include proc/module.mk
++-include ps/module.mk
+ 
+ do_all:    $(ALL)
+ 
diff --git a/package/procps/procps.mk b/package/procps/procps.mk
index 3add243..2cee119 100644
--- a/package/procps/procps.mk
+++ b/package/procps/procps.mk
@@ -3,51 +3,26 @@
 # procps
 #
 #############################################################
-PROCPS_VERSION:=3.2.7
-PROCPS_SOURCE:=procps-$(PROCPS_VERSION).tar.gz
-PROCPS_SITE:=http://procps.sourceforge.net/
-PROCPS_DIR:=$(BUILD_DIR)/procps-$(PROCPS_VERSION)
-PROCPS_BINARY:=ps/ps
-PROCPS_TARGET_BINARY:=usr/bin/vmstat
 
-$(DL_DIR)/$(PROCPS_SOURCE):
-	$(call DOWNLOAD,$(PROCPS_SITE),$(PROCPS_SOURCE))
+PROCPS_VERSION = 3.2.8
+PROCPS_SITE = http://procps.sourceforge.net/
+PROCPS_DEPENDENCIES = ncurses
 
-$(PROCPS_DIR)/.source: $(DL_DIR)/$(PROCPS_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(PROCPS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(PROCPS_DIR) package/procps/ procps\*.patch
-	touch $(PROCPS_DIR)/.source
-
-$(PROCPS_DIR)/$(PROCPS_BINARY): $(PROCPS_DIR)/.source
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(PROCPS_DIR)
-
-$(TARGET_DIR)/$(PROCPS_TARGET_BINARY): $(PROCPS_DIR)/$(PROCPS_BINARY)
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) \
-		install='install -D' -C $(PROCPS_DIR) lib64=/lib \
-		ldconfig='/bin/true' install
-	rm -Rf $(TARGET_DIR)/usr/share/man
-
-procps: ncurses $(TARGET_DIR)/$(PROCPS_TARGET_BINARY)
-
-procps-source: $(DL_DIR)/$(PROCPS_SOURCE)
+# build after busybox, we prefer fat versions while we're at it
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+PROCPS_DEPENDENCIES += busybox
+endif
 
-procps-clean:
-	for bin in uptime tload free w \
-		   top vmstat watch skill \
-		   snice kill sysctl pmap \
-		   pgrep pkill slabtop; do \
-		rm -f $(TARGET_DIR)/usr/bin/$${bin}; \
-	done
-	rm -f $(TARGET_DIR)/lib/libproc*
+define PROCPS_BUILD_CMDS
+	$(SED) "s/ --owner 0 --group 0//" $(@D)/Makefile
+	$(SED) "s/ ldconfig/echo/" $(@D)/Makefile
+	$(SED) "s/[$$][(]lib64[)]/lib/" $(@D)/Makefile
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) LDFLAGS="$(TARGET_LDFLAGS)" \
+		CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
+endef
 
-procps-dirclean:
-	rm -rf $(PROCPS_DIR)
+define PROCPS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_PROCPS),y)
-TARGETS+=procps
-endif
+$(eval $(call GENTARGETS,package,procps))
-- 
1.7.3.4
