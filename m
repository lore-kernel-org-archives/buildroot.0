From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 Dec 2010 01:35:41 +0100
Subject: [Buildroot] [git commit master 1/1] netplug: convert to gentargets
	and bump to 1.2.9.2
Message-ID: <20101214003643.C860982927@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=20d4792e5ba878962a135057bff7ee658c264911
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    2 +-
 package/netplug/netplug-1.2.9-disable-werror.patch |   22 --------
 .../netplug/netplug-1.2.9.2-makefile-flags.patch   |   21 ++++++++
 package/netplug/netplug-socklen-type.patch         |   12 -----
 package/netplug/netplug.mk                         |   53 +++++--------------
 5 files changed, 36 insertions(+), 74 deletions(-)
 delete mode 100644 package/netplug/netplug-1.2.9-disable-werror.patch
 create mode 100644 package/netplug/netplug-1.2.9.2-makefile-flags.patch
 delete mode 100644 package/netplug/netplug-socklen-type.patch

diff --git a/CHANGES b/CHANGES
index bbdc873..98af6f5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -7,7 +7,7 @@
 	direcfb-examples, dmalloc, cloop, cups, ffmpeg, gdk-pixbuf,
 	hostapd, i2c-tools, input-tools, libconfig, lsof,
 	ltp-testsuite, lvm2, m4, memtester, mii-diag, mrouted,
-	openssh, openssl, openvpn, pango, qt, rsync, sdl_gfx,
+	netplug, openssh, openssl, openvpn, pango, qt, rsync, sdl_gfx,
 	sdl_sound, sysklogd, sysvinit, udev, usbutils, xz, zlib
 
 	New packages: dhrystone, fbgrab, lsuio, rsh-redone, whetstone
diff --git a/package/netplug/netplug-1.2.9-disable-werror.patch b/package/netplug/netplug-1.2.9-disable-werror.patch
deleted file mode 100644
index d8a3e15..0000000
--- a/package/netplug/netplug-1.2.9-disable-werror.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-netplug uses nested functions, and gcc generates a warning that
-is turned into an error:
-
-cc1: warnings being treated as errors
-if_info.c: In function 'ifsm_scriptdone':
-if_info.c:289: error: generating trampoline in object (requires executable stack)
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: netplug-1.2.9/Makefile
-===================================================================
---- netplug-1.2.9.orig/Makefile	2010-05-09 21:07:40.000000000 +0200
-+++ netplug-1.2.9/Makefile	2010-05-09 21:09:32.000000000 +0200
-@@ -9,7 +9,7 @@
- 
- install_opts :=
- 
--CFLAGS += -Wall -Werror -std=gnu99 -DNP_ETC_DIR='"$(etcdir)"' \
-+CFLAGS += -Wall -std=gnu99 -DNP_ETC_DIR='"$(etcdir)"' \
- 	-DNP_SCRIPT_DIR='"$(scriptdir)"' -ggdb3 -O3 -DNP_VERSION='"$(version)"'
- 
- netplugd: config.o netlink.o lib.o if_info.o main.o
diff --git a/package/netplug/netplug-1.2.9.2-makefile-flags.patch b/package/netplug/netplug-1.2.9.2-makefile-flags.patch
new file mode 100644
index 0000000..b2468f8
--- /dev/null
+++ b/package/netplug/netplug-1.2.9.2-makefile-flags.patch
@@ -0,0 +1,21 @@
+Preserve the cflags settings, because buildroot clobbers them.
+
+--- a/Makefile	2010-10-05 00:06:38.000000000 -0700
++++ b/Makefile	2010-10-05 00:15:27.000000000 -0700
+@@ -11,11 +11,14 @@ mandir ?= $(prefix)/usr/share/man
+ 
+ install_opts :=
+ 
+-CFLAGS += -Wall -std=gnu99 -DNP_ETC_DIR='"$(etcdir)"' \
++NETPLUG_CFLAGS += -Wall -std=gnu99 -DNP_ETC_DIR='"$(etcdir)"' \
+ 	-DNP_SCRIPT_DIR='"$(scriptdir)"' -ggdb3 -O3 -DNP_VERSION='"$(version)"'
+ 
++%.o: %.c
++	$(CC) $(NETPLUG_CFLAGS) $(CFLAGS) -c -o $@ $<
++
+ netplugd: config.o netlink.o lib.o if_info.o main.o
+-	$(CC) $(LDFLAGS) -o $@ $^
++	$(CC) $(LDFLAGS) -o $@ $(NETPLUG_CFLAGS) $^
+ 
+ install:
+ 	install -d $(install_opts) -m 755 \
diff --git a/package/netplug/netplug-socklen-type.patch b/package/netplug/netplug-socklen-type.patch
deleted file mode 100644
index 1e36988..0000000
--- a/package/netplug/netplug-socklen-type.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -ur netplug-1.2.9/netlink.c netplug-1.2.9-patched/netlink.c
---- netplug-1.2.9/netlink.c	2005-01-07 23:57:09.000000000 -0600
-+++ netplug-1.2.9-patched/netlink.c	2008-02-27 20:18:09.855767996 -0600
-@@ -284,7 +284,7 @@
-         exit(1);
-     }
- 
--    int addr_len = sizeof(addr);
-+    socklen_t addr_len = sizeof(addr);
- 
-     if (getsockname(fd, (struct sockaddr *) &addr, &addr_len) == -1) {
-         do_log(LOG_ERR, "Could not get socket details: %m");
diff --git a/package/netplug/netplug.mk b/package/netplug/netplug.mk
index 74fa0c5..98d1504 100644
--- a/package/netplug/netplug.mk
+++ b/package/netplug/netplug.mk
@@ -3,51 +3,26 @@
 # netplug
 #
 #############################################################
-NETPLUG_VERSION=1.2.9
+NETPLUG_VERSION=1.2.9.2
 NETPLUG_SOURCE=netplug-$(NETPLUG_VERSION).tar.bz2
 NETPLUG_SITE=http://www.red-bean.com/~bos/netplug
-NETPLUG_DIR=$(BUILD_DIR)/netplug-$(NETPLUG_VERSION)
-NETPLUG_CAT:=$(BZCAT)
-NETPLUG_BINARY:=netplugd
-NETPLUG_TARGET_BINARY:=sbin/netplugd
 
-$(DL_DIR)/$(NETPLUG_SOURCE):
-	$(call DOWNLOAD,$(NETPLUG_SITE),$(NETPLUG_SOURCE))
+define NETPLUG_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
 
-netplug-source: $(DL_DIR)/$(NETPLUG_SOURCE)
+define NETPLUG_INSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(@D) install
+endef
 
-$(NETPLUG_DIR)/.unpacked: $(DL_DIR)/$(NETPLUG_SOURCE)
-	$(NETPLUG_CAT) $(DL_DIR)/$(NETPLUG_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(NETPLUG_DIR) package/netplug/ netplug\*.patch
-	touch $(NETPLUG_DIR)/.unpacked
-
-$(NETPLUG_DIR)/$(NETPLUG_BINARY): $(NETPLUG_DIR)/.unpacked
-	$(MAKE) CC="$(TARGET_CC)" -C $(NETPLUG_DIR)
-	$(STRIPCMD) $(NETPLUG_DIR)/$(NETPLUG_BINARY)
-
-$(TARGET_DIR)/$(NETPLUG_TARGET_BINARY): $(NETPLUG_DIR)/$(NETPLUG_BINARY)
-	$(INSTALL) -m 644 -D $(NETPLUG_DIR)/etc/netplugd.conf $(TARGET_DIR)/etc/netplug/netplugd.conf
-	$(INSTALL) -m 755 -D package/netplug/netplug-script $(TARGET_DIR)/etc/netplug.d/netplug
-	$(INSTALL) -m 755 -D package/netplug/S29netplug $(TARGET_DIR)/etc/init.d
-	$(INSTALL) -m 755 -D $(NETPLUG_DIR)/$(NETPLUG_BINARY) $(TARGET_DIR)/$(NETPLUG_TARGET_BINARY)
-	touch -c $(TARGET_DIR)/$(NETPLUG_TARGET_BINARY)
-
-netplug: $(TARGET_DIR)/$(NETPLUG_TARGET_BINARY)
-
-netplug-clean:
-	rm -f $(TARGET_DIR)/$(NETPLUG_TARGET_BINARY)
+define NETPLUG_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/sbin/netplugd
 	rm -rf $(TARGET_DIR)/etc/netplug*
 	rm -f $(TARGET_DIR)/etc/init.d/S*netplug
-	-$(MAKE) -C $(NETPLUG_DIR) clean
+endef
 
-netplug-dirclean:
-	rm -rf $(NETPLUG_DIR)
+define NETPLUG_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_NETPLUG),y)
-TARGETS+=netplug
-endif
+$(eval $(call GENTARGETS,package,netplug))
-- 
1.7.2.2
