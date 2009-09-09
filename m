From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Sep 2009 16:40:19 +0200
Subject: [Buildroot] [git commit master] kismet: bump version and convert to
	Makefile.autotools.in format
Message-ID: <20090909153148.35B8A776AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=57f3b11d111fb5f7fd48d64a43a83e25d69bdb4c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #487

* Bump kismet from 2007-10-R1 to 2009-06-R1 (newcore: nicer, more features)
* Migrate to Makefile.autotools.in
* Introduce new options to just install the server, client, drone or
  combination

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                       |    1 +
 package/kismet/Config.in                      |   23 +++++-
 package/kismet/kismet-2007-10-R1-memset.patch |   45 ----------
 package/kismet/kismet-ncurses.patch           |   11 +++
 package/kismet/kismet-nobsd.patch             |   44 ++++++++++
 package/kismet/kismet.mk                      |  107 ++++++++-----------------
 6 files changed, 111 insertions(+), 120 deletions(-)
 delete mode 100644 package/kismet/kismet-2007-10-R1-memset.patch
 create mode 100644 package/kismet/kismet-ncurses.patch
 create mode 100644 package/kismet/kismet-nobsd.patch

diff --git a/CHANGES b/CHANGES
index 9180864..2197022 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,6 +4,7 @@
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#487: Make kismet package sexier
 	#527: misc fixes for dnsmasq package
 
 2009.08, Released August 31th, 2009:
diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index 276c252..5674fbc 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -1,12 +1,15 @@
-comment "kismet has no inherent support for AVR32" 
+comment "Kismet has no inherent support for AVR32"
 	depends on BR2_avr32 && BR2_PACKAGE_KISMET
 
+comment "Kismet requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_KISMET
 	bool "kismet"
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_TARGET_PANEL
 	select BR2_PACKAGE_LIBPCAP
-	select BR2_PACKAGE_DBUS
-	select BR2_PACKAGE_DBUS_GLIB
 	help
 	  Kismet - 802.11 layer2 wireless network detector, sniffer,
 	  and intrusion detection system.
@@ -21,3 +24,17 @@ config BR2_PACKAGE_KISMET
 	  of nonbeaconing networks via data traffic.
 
 	  http://www.kismetwireless.net
+
+config BR2_PACKAGE_KISMET_CLIENT
+	bool "Install client"
+	depends on BR2_PACKAGE_KISMET
+
+config BR2_PACKAGE_KISMET_DRONE
+	bool "Install drone"
+	depends on BR2_PACKAGE_KISMET
+
+config BR2_PACKAGE_KISMET_SERVER
+	bool "Install server"
+	default y
+	depends on BR2_PACKAGE_KISMET
+
diff --git a/package/kismet/kismet-2007-10-R1-memset.patch b/package/kismet/kismet-2007-10-R1-memset.patch
deleted file mode 100644
index 71a3757..0000000
--- a/package/kismet/kismet-2007-10-R1-memset.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-diff -urN kismet-2007-10-R1-0rig//kismet_wrapper.cc kismet-2007-10-R1/kismet_wrapper.cc
---- kismet-2007-10-R1-0rig//kismet_wrapper.cc	2007-10-06 23:50:03.000000000 +0200
-+++ kismet-2007-10-R1/kismet_wrapper.cc	2009-01-21 01:12:42.000000000 +0100
-@@ -27,6 +27,7 @@
- #include <unistd.h>
- 
- #include "config.h"
-+#include <string.h>
- 
- /* Blob of globals since sighandler needs them */
- vector<string> postcli_err;
-diff -urN kismet-2007-10-R1-0rig//ringbuf.cc kismet-2007-10-R1/ringbuf.cc
---- kismet-2007-10-R1-0rig//ringbuf.cc	2005-12-11 20:14:39.000000000 +0100
-+++ kismet-2007-10-R1/ringbuf.cc	2009-01-21 01:12:26.000000000 +0100
-@@ -17,6 +17,7 @@
- */
- 
- #include "ringbuf.h"
-+#include <string.h>
- 
- RingBuffer::RingBuffer(int in_size) {
-     ring_len = in_size;
-diff -urN kismet-2007-10-R1-0rig//util.cc kismet-2007-10-R1/util.cc
---- kismet-2007-10-R1-0rig//util.cc	2006-08-28 22:37:29.000000000 +0200
-+++ kismet-2007-10-R1/util.cc	2009-01-21 01:12:26.000000000 +0100
-@@ -22,6 +22,7 @@
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <fcntl.h>
-+#include <string.h>
- 
- // We need this to make uclibc happy since they don't even have rintf...
- #ifndef rintf
-diff -urN kismet-2007-10-R1-0rig//util.h kismet-2007-10-R1/util.h
---- kismet-2007-10-R1-0rig//util.h	2006-08-28 22:37:29.000000000 +0200
-+++ kismet-2007-10-R1/util.h	2009-01-21 01:12:26.000000000 +0100
-@@ -65,7 +65,7 @@
-         end = op.end;
-         return *this;
-     }
--};
-+} swt;
- vector<smart_word_token> SmartStrTokenize(string in_str, string in_split, int return_partial = 1);
- 
- vector<string> LineWrap(string in_txt, unsigned int in_hdr_len, unsigned int in_maxlen);
diff --git a/package/kismet/kismet-ncurses.patch b/package/kismet/kismet-ncurses.patch
new file mode 100644
index 0000000..af8fba5
--- /dev/null
+++ b/package/kismet/kismet-ncurses.patch
@@ -0,0 +1,11 @@
+--- kismet-2009-06-R1/configure	2009-06-12 04:26:32.000000000 +0100
++++ kismet-2009-06-R1.mod/configure	2009-08-05 11:27:43.000000000 +0100
+@@ -6981,7 +6981,7 @@
+ 
+ 
+ # Add additional cflags since some distros bury panel.h
+-CPPFLAGS="$CPPFLAGS -I/usr/include/ncurses"
++#CPPFLAGS="$CPPFLAGS -I/usr/include/ncurses"
+ 
+ termcontrol="none";
+ 
diff --git a/package/kismet/kismet-nobsd.patch b/package/kismet/kismet-nobsd.patch
new file mode 100644
index 0000000..451d9ce
--- /dev/null
+++ b/package/kismet/kismet-nobsd.patch
@@ -0,0 +1,44 @@
+diff -Nura kismet-2009-06-R1/ifcontrol.cc kismet-2009-06-R1-nobsd/ifcontrol.cc
+--- kismet-2009-06-R1/ifcontrol.cc	2009-04-08 16:57:44.000000000 -0300
++++ kismet-2009-06-R1-nobsd/ifcontrol.cc	2009-09-01 12:54:44.000000000 -0300
+@@ -148,7 +148,7 @@
+ 	devlinklen = readlink(devlink.c_str(), devlinktarget, 511);
+ 	if (devlinklen > 0) {
+ 		devlinktarget[devlinklen] = '\0';
+-		rind = rindex(devlinktarget, '/');
++		rind = strrchr(devlinktarget, '/');
+ 		// If we found it and not at the end of the line
+ 		if (rind != NULL && (rind - devlinktarget) + 1 < devlinklen)
+ 			return string(rind + 1);
+diff -Nura kismet-2009-06-R1/iwcontrol.cc kismet-2009-06-R1-nobsd/iwcontrol.cc
+--- kismet-2009-06-R1/iwcontrol.cc	2009-04-20 00:22:55.000000000 -0300
++++ kismet-2009-06-R1-nobsd/iwcontrol.cc	2009-09-01 12:54:44.000000000 -0300
+@@ -697,7 +697,7 @@
+ 		return -1;
+ 	}
+ 
+-	bzero(buffer, sizeof(buffer));
++	memset(buffer, 0, sizeof(buffer));
+ 
+ 	memset(&wrq, 0, sizeof(struct iwreq));
+ 
+@@ -732,7 +732,7 @@
+ 		memcpy((char *) &range, buffer, sizeof(iw_range));
+ 	} else {
+ 		/* Zero unknown fields */
+-		bzero((char *) &range, sizeof(struct iw_range));
++		memset((char *) &range, 0, sizeof(struct iw_range));
+ 
+ 		/* Initial part unmoved */
+ 		memcpy((char *) &range, buffer, iwr15_off(num_channels));
+diff -Nura kismet-2009-06-R1/madwifing_control.cc kismet-2009-06-R1-nobsd/madwifing_control.cc
+--- kismet-2009-06-R1/madwifing_control.cc	2009-03-22 23:19:19.000000000 -0300
++++ kismet-2009-06-R1-nobsd/madwifing_control.cc	2009-09-01 12:54:42.000000000 -0300
+@@ -34,7 +34,6 @@
+ #include <stdint.h>
+ #include <ctype.h>
+ #include <getopt.h>
+-#include <err.h>
+ #include <dirent.h>
+ #include <fcntl.h>
+ #include <errno.h>
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 7b9c0dd..edc46e4 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -3,83 +3,46 @@
 # kismet
 #
 #############################################################
-KISMET_VERSION:=2007-10-R1
-KISMET_SOURCE:=kismet-$(KISMET_VERSION).tar.gz
-KISMET_SITE:=http://www.kismetwireless.net/code/
-KISMET_DIR:=$(BUILD_DIR)/kismet-$(KISMET_VERSION)
-KISMET_CAT:=$(ZCAT)
-KISMET_BINARY:=kismet
-KISMET_TARGET_DIRECTORY=usr/bin/
 
-$(DL_DIR)/$(KISMET_SOURCE):
-	$(call DOWNLOAD,$(KISMET_SITE),$(KISMET_SOURCE))
+KISMET_VERSION = 2009-06-R1
+KISMET_SOURCE = kismet-$(KISMET_VERSION).tar.gz
+KISMET_SITE = http://www.kismetwireless.net/code
+KISMET_DEPENDENCIES = libpcap ncurses
 
-kismet-source: $(DL_DIR)/$(KISMET_SOURCE)
-
-$(KISMET_DIR)/.patched: $(DL_DIR)/$(KISMET_SOURCE)
-	$(KISMET_CAT) $(DL_DIR)/$(KISMET_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(KISMET_DIR) package/kismet/ kismet\*.patch
-	touch $@
-
-$(KISMET_DIR)/.configured: $(KISMET_DIR)/.patched
-	(cd $(KISMET_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		DBUS_CFLAGS="-I$(STAGING_DIR)/usr/include/dbus-1.0 -I$(STAGING_DIR)/usr/lib/dbus-1.0/include" \
-		DBUS_LIBS="$(STAGING_DIR)/usr/lib/libdbus-1.so" \
-		DBUS_GLIB_CFLAGS="-I$(STAGING_DIR)/usr/include/glib-2.0 -I$(STAGING_DIR)/usr/lib/glib-2.0/include" \
-		DBUS_GLIB_LIBS="$(STAGING_DIR)/lib/libglib-2.0.so $(STAGING_DIR)/lib/libgobject-2.0.so $(STAGING_DIR)/lib/libgmodule-2.0.so $(STAGING_DIR)/lib/libgthread-2.0.so" \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
-		$(DISABLE_NLS) \
-		$(DISABLE_LARGEFILE) \
-	)
-	touch $@
-
-$(KISMET_DIR)/$(KISMET_BINARY): $(KISMET_DIR)/.configured
-	$(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" \
-		-C $(KISMET_DIR)
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(KISMET_DIR)/kismet
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(KISMET_DIR)/kismet_client
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(KISMET_DIR)/kismet_drone
-	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(KISMET_DIR)/kismet_server
-
-$(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/$(KISMET_BINARY): $(KISMET_DIR)/$(KISMET_BINARY)
-	install -m 755 $(KISMET_DIR)/kismet $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet
-	install -m 755 $(KISMET_DIR)/kismet_client $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet_client
-	install -m 755 $(KISMET_DIR)/kismet_drone $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet_drone
-	install -m 755 $(KISMET_DIR)/kismet_server $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet_server
-	install -m 755 $(KISMET_DIR)/conf/kismet.conf $(TARGET_DIR)/etc/kismet.conf
+ifeq ($(BR2_PACKAGE_LIBNL),y)
+	KISMET_DEPENDENCIES += libnl
+endif
+ifeq ($(BR2_PACKAGE_PCRE),y)
+	KISMET_DEPENDENCIES += pcre
+endif
 
-kismet: ncurses libpcap dbus $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/$(KISMET_BINARY)
+ifeq ($(BR2_PACKAGE_KISMET_CLIENT),y)
+	KISMET_TARGET_BINARIES += kismet_client
+endif
 
-kismet-unpacked: $(KISMET_DIR)/.patched
+ifeq ($(BR2_PACKAGE_KISMET_SERVER),y)
+	KISMET_TARGET_BINARIES += kismet_server
+	KISMET_TARGET_CONFIGS += kismet.conf
+endif
 
-kismet-clean:
-	rm -f $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet
-	rm -f $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet_client
-	rm -f $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet_drone
-	rm -f $(TARGET_DIR)/$(KISMET_TARGET_DIRECTORY)/kismet_server
-	rm -f $(KISMET_DIR)/conf/kismet.conf $(TARGET_DIR)/etc/kismet.conf
-	-$(MAKE) -C $(KISMET_DIR) clean
+ifeq ($(BR2_PACKAGE_KISMET_DRONE),y)
+	KISMET_TARGET_BINARIES += kismet_drone
+	KISMET_TARGET_CONFIGS += kismet_drone.conf
+endif
 
-kismet-dirclean:
-	rm -rf $(KISMET_DIR)
+$(eval $(call AUTOTARGETS,package,kismet))
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_KISMET),y)
-TARGETS+=kismet
+$(KISMET_TARGET_INSTALL_TARGET):
+	$(call MESSAGE,"Installing")
+	$(INSTALL) -m 755 $(addprefix $(KISMET_DIR)/, $(KISMET_TARGET_BINARIES)) $(TARGET_DIR)/usr/bin
+	$(INSTALL) -m 644 $(addprefix $(KISMET_DIR)/conf/, $(KISMET_TARGET_CONFIGS)) $(TARGET_DIR)/etc
+ifeq ($(BR2_ENABLE_DEBUG),)
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(addprefix $(TARGET_DIR)/usr/bin/, $(KISMET_TARGET_BINARIES))
 endif
+	touch $@
+
+$(KISMET_TARGET_UNINSTALL):
+	$(call MESSAGE,"Uninstalling")
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(KISMET_TARGET_BINARIES))
+	rm -f $(addprefix $(TARGET_DIR)/etc/, $(KISMET_TARGET_CONFIGS))
+	rm -f $(KISMET_TARGET_INSTALL_TARGET) $(KISMET_HOOK_POST_INSTALL)
-- 
1.6.3.3
