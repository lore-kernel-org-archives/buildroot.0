From: Will Newton <will.newton@gmail.com>
Date: Sat, 19 Sep 2009 21:31:57 +0200
Subject: [Buildroot] [git commit master] libevent: Bump version and clean up
	makefile.
Message-ID: <20090919193234.863EB77781@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a07032e11781f8f6e7586eb6261a9189f030f3ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #565

- Bump version from 1.2 to 1.4.12
- Clean up makefile and use Makefile.autotools.in.

Signed-off-by: Will Newton <will.newton@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                |    1 +
 package/libevent/libevent-time_h.patch |   11 -----
 package/libevent/libevent.mk           |   71 ++++----------------------------
 3 files changed, 9 insertions(+), 74 deletions(-)
 delete mode 100644 package/libevent/libevent-time_h.patch

diff --git a/CHANGES b/CHANGES
index f3ecce8..ac747d5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -8,6 +8,7 @@
 
 	#487: Make kismet package sexier
 	#527: misc fixes for dnsmasq package
+	#565: libevent: Bump version and clean up makefile
 	#587: Use iptables multipurpose binaries and bump to 1.4.4
 	#617: netkit/inetd requires RPC and fails to build if RPC is disabled
 	#619: netkittelnet requires netkitbase to install, but there's no dependency
diff --git a/package/libevent/libevent-time_h.patch b/package/libevent/libevent-time_h.patch
deleted file mode 100644
index 49bd217..0000000
--- a/package/libevent/libevent-time_h.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-diff -ur libevent-1.2/event.c libevent-1.2-patched/event.c
---- libevent-1.2/event.c	2006-08-12 12:41:36.000000000 -0500
-+++ libevent-1.2-patched/event.c	2007-01-13 23:33:05.340351152 -0600
-@@ -41,6 +41,7 @@
- #else 
- #include <sys/_time.h>
- #endif
-+#include <time.h>
- #include <sys/queue.h>
- #include <stdio.h>
- #include <stdlib.h>
diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index 51cbd18..c63dbdb 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -3,68 +3,13 @@
 # libevent
 #
 #############################################################
-LIBEVENT_VERSION:=1.2
-LIBEVENT_SOURCE:=libevent-$(LIBEVENT_VERSION).tar.gz
-LIBEVENT_SITE:=http://monkey.org/~provos/
-LIBEVENT_DIR:=$(BUILD_DIR)/libevent-$(LIBEVENT_VERSION)
-LIBEVENT_CAT:=$(ZCAT)
-LIBEVENT_BINARY:=libevent.la
-LIBEVENT_TARGET_BINARY:=usr/lib/libevent.so
+LIBEVENT_VERSION = 1.4.12
+LIBEVENT_SOURCE = libevent-$(LIBEVENT_VERSION)-stable.tar.gz
+LIBEVENT_SITE = http://monkey.org/~provos/
 
-$(DL_DIR)/$(LIBEVENT_SOURCE):
-	$(call DOWNLOAD,$(LIBEVENT_SITE),$(LIBEVENT_SOURCE))
+LIBEVENT_AUTORECONF = NO
+LIBEVENT_LIBTOOL_PATCH = NO
+LIBEVENT_INSTALL_STAGING = YES
+LIBEVENT_INSTALL_TARGET = YES
 
-libevent-source: $(DL_DIR)/$(LIBEVENT_SOURCE)
-
-libevent-unpacked: $(LIBEVENT_DIR)/.unpacked
-$(LIBEVENT_DIR)/.unpacked: $(DL_DIR)/$(LIBEVENT_SOURCE)
-	$(LIBEVENT_CAT) $(DL_DIR)/$(LIBEVENT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBEVENT_DIR) package/libevent/ \*.patch
-	touch $@
-
-$(LIBEVENT_DIR)/.configured: $(LIBEVENT_DIR)/.unpacked
-	(cd $(LIBEVENT_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--mandir=/usr/share/man \
-		--disable-static \
-		--with-gnu-ld \
-	)
-	touch $@
-
-$(LIBEVENT_DIR)/$(LIBEVENT_BINARY): $(LIBEVENT_DIR)/.configured
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LIBEVENT_DIR)
-
-$(STAGING_DIR)/$(LIBEVENT_TARGET_BINARY): $(LIBEVENT_DIR)/$(LIBEVENT_BINARY)
-	$(MAKE) -C $(LIBEVENT_DIR) DESTDIR=$(STAGING_DIR) install
-
-$(TARGET_DIR)/$(LIBEVENT_TARGET_BINARY): $(STAGING_DIR)/$(LIBEVENT_TARGET_BINARY)
-	$(MAKE) -C $(LIBEVENT_DIR) DESTDIR=$(TARGET_DIR) install
-	rm -f $(addprefix $(TARGET_DIR)/usr/,lib/libevent*.la \
-					     include/ev*)
-ifneq ($(BR2_HAVE_MANPAGES),y)
-	rm -fr $(TARGET_DIR)/usr/share/man
-endif
-
-libevent: $(TARGET_DIR)/$(LIBEVENT_TARGET_BINARY)
-
-libevent-clean:
-	rm -f $(TARGET_DIR)/$(LIBEVENT_TARGET_BINARY)*
-	-$(MAKE) -C $(LIBEVENT_DIR) clean
-
-libevent-dirclean:
-	rm -rf $(LIBEVENT_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_LIBEVENT),y)
-TARGETS+=libevent
-endif
+$(eval $(call AUTOTARGETS,package,libevent))
-- 
1.6.3.3
