From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 22:10:56 +0200
Subject: [Buildroot] [PATCH 5/5] xenomai: install in /usr
In-Reply-To: <cover.1316463052.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316463052.git.thomas.petazzoni@free-electrons.com>
Message-ID: <eee4c1d4898af5dd12bc695b5a151fd0b7dbeae5.1316463052.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, Xenomai installs everything with --prefix=/usr/xenomai,
and passing --prefix=/usr doesn't work because installing Xenomai
headers in /usr/include creates conflicts with other headers. However,
passing --prefix=/usr and --includedir=/usr/include/xenomai just works
fine. This allows to use the default configure command of the
AUTOTARGETS infrastructure, and allows to install the Xenomai headers
and libraries into more usual locations. Furthermore, it allows to
remove the documentation/headers removal hooks, as well as the
ld.so.conf hook since now everything is installed in standard
locations.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xenomai/xenomai.mk |   54 +++++++++-----------------------------------
 1 files changed, 11 insertions(+), 43 deletions(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 52e0b4e..d2306c4 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -28,34 +28,12 @@ ifeq ($(BR2_PACKAGE_XENOMAI_SMP),y)
 XENOMAI_CONF_OPT += --enable-smp
 endif
 
-# The configure step needs to be overloaded, because Xenomai doesn't
-# support --prefix=/usr and the autotargets infrastructure enforces
-# this.
-define XENOMAI_CONFIGURE_CMDS
-	(cd $(@D); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		CCFLAGS_FOR_BUILD="$(HOST_CFLAGS)" \
-		./configure \
-		$(XENOMAI_CONF_OPT) \
-		--host=$(GNU_TARGET_NAME) \
-	)
-endef
-
-ifeq ($(BR2_HAVE_DOCUMENTATION),)
-define XENOMAI_REMOVE_DOCUMENTATION
-	rm -rf $(TARGET_DIR)/usr/xenomai/share/doc
-	rm -rf $(TARGET_DIR)/usr/xenomai/share/man
-endef
-
-XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_DOCUMENTATION
-endif
+XENOMAI_CONF_OPT += --includedir=/usr/include/xenomai/
 
 ifeq ($(BR2_HAVE_DEVFILES),)
 define XENOMAI_REMOVE_DEVFILES
-	rm -rf $(TARGET_DIR)/usr/xenomai/include
 	for i in xeno-config xeno-info wrap-link.sh ; do \
-		rm -f $(TARGET_DIR)/usr/xenomai/bin/$$i ; \
+		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
 	done
 endef
 
@@ -64,15 +42,13 @@ endif
 
 ifeq ($(BR2_PACKAGE_XENOMAI_TESTSUITE),)
 define XENOMAI_REMOVE_TESTSUITE
-	rm -rf $(TARGET_DIR)/usr/xenomai/share/xenomai/testsuite/
-	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/xenomai/share/xenomai/
-	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/xenomai/share/
+	rm -rf $(TARGET_DIR)/usr/share/xenomai/
 	for i in klatency rtdm xeno xeno-load check-vdso \
 		irqloop cond-torture-posix switchtest arith \
 		sigtest clocktest cyclictest latency wakeup-time \
 		xeno-test cond-torture-native mutex-torture-posix \
 		mutex-torture-native ; do \
-		rm -f $(TARGET_DIR)/usr/xenomai/bin/$$i ; \
+		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
 	done
 endef
 
@@ -82,9 +58,9 @@ endif
 ifeq ($(BR2_PACKAGE_XENOMAI_RTCAN),)
 define XENOMAI_REMOVE_RTCAN_PROGS
 	for i in rtcanrecv rtcansend ; do \
-		rm -f $(TARGET_DIR)/usr/xenomai/bin/$$i ; \
+		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
 	done
-	rm -f $(TARGET_DIR)/usr/xenomai/sbin/rtcanconfig
+	rm -f $(TARGET_DIR)/usr/sbin/rtcanconfig
 endef
 
 XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_RTCAN_PROGS
@@ -94,10 +70,10 @@ ifeq ($(BR2_PACKAGE_XENOMAI_ANALOGY),)
 define XENOMAI_REMOVE_ANALOGY
 	for i in cmd_bits cmd_read cmd_write insn_write \
 		insn_bits insn_read ; do \
-		rm -f $(TARGET_DIR)/usr/xenomai/bin/$$i ; \
+		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
 	done
-	rm -f $(TARGET_DIR)/usr/xenomai/sbin/analogy_config
-	rm -f $(TARGET_DIR)/usr/xenomai/lib/libanalogy.*
+	rm -f $(TARGET_DIR)/usr/sbin/analogy_config
+	rm -f $(TARGET_DIR)/usr/lib/libanalogy.*
 endef
 
 XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_ANALOGY
@@ -113,23 +89,15 @@ XENOMAI_REMOVE_SKIN_LIST += $(if $(BR2_PACKAGE_XENOMAI_VRTX_SKIN),,vrtx)
 
 define XENOMAI_REMOVE_SKINS
 	for i in $(XENOMAI_REMOVE_SKIN_LIST) ; do \
-		rm -f $(TARGET_DIR)/usr/xenomai/lib/lib$$i.* ; \
+		rm -f $(TARGET_DIR)/usr/lib/lib$$i.* ; \
 		if [ $$i == "posix" ] ; then \
-			rm -f $(TARGET_DIR)/usr/xenomai/lib/posix.wrappers ; \
+			rm -f $(TARGET_DIR)/usr/lib/posix.wrappers ; \
 		fi ; \
 	done
 endef
 
 XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_SKINS
 
-define XENOMAI_ADD_LD_SO_CONF
-	# Add /usr/xenomai/lib in the library search path
-	grep -q "^/usr/xenomai/lib" $(TARGET_DIR)/etc/ld.so.conf || \
-		echo "/usr/xenomai/lib" >> $(TARGET_DIR)/etc/ld.so.conf
-endef
-
-XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_ADD_LD_SO_CONF
-
 # If you use static /dev creation don't forget to update your
 #  device_table_dev.txt
 ifeq ($(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),y)
-- 
1.7.4.1
