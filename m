From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 29 Jan 2013 11:10:19 -0300
Subject: [Buildroot] [PATCH] olsr: bump to version 0.6.4
Message-ID: <1359468619-12256-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump olsrd to version 0.6.4

Fixes:
http://autobuild.buildroot.net/results/553c8157cd83ca60475caacc119779c778806781/
which is due to the old version not being friendly with newer flex
versions.

Enabled more plugins to make it more useful.

Switch to forked mode in the init script to avoid console noise.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/olsr/Config.in                        |  5 +++--
 package/olsr/S50olsr                          |  2 +-
 package/olsr/olsr-configurable-ldconfig.patch | 19 +++++++++++--------
 package/olsr/olsr.mk                          | 18 ++++++++++++------
 4 files changed, 27 insertions(+), 17 deletions(-)

diff --git a/package/olsr/Config.in b/package/olsr/Config.in
index ada82b4..33ef6c1 100644
--- a/package/olsr/Config.in
+++ b/package/olsr/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_OLSR
 	bool "OLSR mesh networking Daemon"
 	depends on BR2_INET_IPV6
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  The Optimized Link State Routing protocol (OLSR) is a
 	  routing protocol that is optimised for mobile ad-hoc
@@ -11,5 +12,5 @@ config BR2_PACKAGE_OLSR
 
 	  http://www.olsr.org/
 
-comment "olsr requires a toolchain with IPv6 support"
-	depends on !BR2_INET_IPV6
+comment "olsr requires a toolchain with IPv6 and threads support"
+	depends on !BR2_INET_IPV6 || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/olsr/S50olsr b/package/olsr/S50olsr
index a8aefd3..9f052da 100755
--- a/package/olsr/S50olsr
+++ b/package/olsr/S50olsr
@@ -6,7 +6,7 @@
 case "$1" in
   start)
   	echo "Starting OLSRd daemon: "
-	/usr/sbin/olsrd -d 0 -nofork & 
+	/usr/sbin/olsrd -d 0
 	;;
   stop)
   	echo "Stopping OLSRd daemon: "
diff --git a/package/olsr/olsr-configurable-ldconfig.patch b/package/olsr/olsr-configurable-ldconfig.patch
index 09e34f1..73fff7e 100644
--- a/package/olsr/olsr-configurable-ldconfig.patch
+++ b/package/olsr/olsr-configurable-ldconfig.patch
@@ -5,26 +5,29 @@ we make the path to ldconfig configurable through the environment/make
 command line. This allows to pass LDCONFIG=/bin/true when doing
 cross-compilation.
 
+[Gustavo: update patch for olsr 0.6.4]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
-Index: b/make/Makefile.linux
-===================================================================
---- a/make/Makefile.linux
-+++ b/make/Makefile.linux
+diff -Nura olsrd-0.6.4.orig/make/Makefile.linux olsrd-0.6.4/make/Makefile.linux
+--- olsrd-0.6.4.orig/make/Makefile.linux	2013-01-29 09:00:18.041356389 -0300
++++ olsrd-0.6.4/make/Makefile.linux	2013-01-29 09:01:51.598226624 -0300
 @@ -3,6 +3,7 @@
  #
  
  ARCH := $(shell uname -m)
 +LDCONFIG ?= /sbin/ldconfig
- DESTDIR ?=
- LIBDIR =	$(DESTDIR)$(shell if [ "$(ARCH)" = "x86_64" -a -d "/usr/lib64" ]; then echo "/usr/lib64"; else echo "/usr/lib"; fi)
- 
-@@ -14,7 +15,7 @@
  
+ DESTDIR ?=
+ prefix ?= /usr/local
+@@ -26,9 +27,9 @@
+ PLUGIN_SONAME ?= lib$(PLUGIN_NAME).so
  PLUGIN_FULLNAME ?= $(PLUGIN_NAME).so.$(PLUGIN_VER)
  INSTALL_LIB =	install -D -m 755 $(PLUGIN_FULLNAME) $(LIBDIR)/$(PLUGIN_FULLNAME); \
 -		/sbin/ldconfig -n $(LIBDIR)
 +		$(LDCONFIG) -n $(LIBDIR)
+ UNINSTALL_LIB =	rm -f $(LIBDIR)/$(PLUGIN_FULLNAME); \
+-		/sbin/ldconfig -n $(LIBDIR)
++		$(LDCONFIG) -n $(LIBDIR)
  
  ifdef OLSRD_PLUGIN
  GENERATE_PIC = true
diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index be1ae1e..97088f3 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -4,13 +4,17 @@
 #
 #############################################################
 
-OLSR_VERSION_MAJOR = 0.5
-OLSR_VERSION_MINOR = 6
+OLSR_VERSION_MAJOR = 0.6
+OLSR_VERSION_MINOR = 4
 OLSR_VERSION = $(OLSR_VERSION_MAJOR).$(OLSR_VERSION_MINOR)
 OLSR_SOURCE = olsrd-$(OLSR_VERSION).tar.bz2
 OLSR_SITE = http://www.olsr.org/releases/$(OLSR_VERSION_MAJOR)
-#OLSR_PLUGINS=httpinfo tas dot_draw nameservice dyn_gw dyn_gw_plain pgraph bmf quagga secure
-OLSR_PLUGINS = dot_draw dyn_gw secure
+OLSR_PLUGINS = arprefresh bmf dot_draw dyn_gw dyn_gw_plain httpinfo jsoninfo \
+	mdns nameservice p2pd pgraph secure txtinfo watchdog
+# Doesn't really need quagga but not very useful without it
+OLSR_PLUGINS += $(if $(BR2_PACKAGE_QUAGGA),quagga)
+OLSR_LICENSE = BSD-3c LGPLv2.1+
+OLSR_LICENSE_FILES = license.txt lib/pud/nmealib/LICENSE
 
 define OLSR_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) ARCH=$(KERNEL_ARCH) -C $(@D) olsrd
@@ -20,10 +24,12 @@ define OLSR_BUILD_CMDS
 endef
 
 define OLSR_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install_bin
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) \
+		prefix="/usr" install_bin
 	for p in $(OLSR_PLUGINS) ; do \
 		$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/lib/$$p \
-			LDCONFIG=/bin/true DESTDIR=$(TARGET_DIR) install ; \
+			LDCONFIG=/bin/true DESTDIR=$(TARGET_DIR) \
+			prefix="/usr" install ; \
 	done
 	$(INSTALL) -D -m 0755 package/olsr/S50olsr $(TARGET_DIR)/etc/init.d/S50olsr
 	test -r $(TARGET_DIR)/etc/olsrd.conf || \
-- 
1.7.12.4
