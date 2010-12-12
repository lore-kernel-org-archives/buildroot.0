From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Dec 2010 22:54:05 +0100
Subject: [Buildroot] [PATCH 19/19] l2tp: convert to gentargets and change to
	xl2tp
In-Reply-To: <cover.1292190675.git.thomas.petazzoni@free-electrons.com>
References: <cover.1292190675.git.thomas.petazzoni@free-electrons.com>
Message-ID: <fa0641ad271ccd371ba9ec8bceebeb2ed0c38f33.1292190675.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Martin Banky <martin.banky@gmail.com>

l2tp is no longer being developed, and xl2tpd is forked from l2tpd and is
maintained by Xelerance Corporation.

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    2 +-
 package/l2tp/Config.in                             |    7 --
 package/l2tp/l2tp-no-gnu-extensions.patch          |   33 -----------
 package/l2tp/l2tp-sanity.patch                     |   49 ----------------
 package/l2tp/l2tp.mk                               |   60 --------------------
 package/xl2tp/Config.in                            |   11 ++++
 .../xl2tp-1.2.7-legacy.patch}                      |    3 +
 package/xl2tp/xl2tp-1.2.7-makefile-flags.patch     |   33 +++++++++++
 package/xl2tp/xl2tp.mk                             |   33 +++++++++++
 package/{l2tp/l2tpd => xl2tp/xl2tpd}               |    6 +-
 10 files changed, 84 insertions(+), 153 deletions(-)
 delete mode 100644 package/l2tp/Config.in
 delete mode 100644 package/l2tp/l2tp-no-gnu-extensions.patch
 delete mode 100644 package/l2tp/l2tp-sanity.patch
 delete mode 100644 package/l2tp/l2tp.mk
 create mode 100644 package/xl2tp/Config.in
 rename package/{l2tp/l2tp-legacy.patch => xl2tp/xl2tp-1.2.7-legacy.patch} (86%)
 create mode 100644 package/xl2tp/xl2tp-1.2.7-makefile-flags.patch
 create mode 100644 package/xl2tp/xl2tp.mk
 rename package/{l2tp/l2tpd => xl2tp/xl2tpd} (76%)

diff --git a/package/Config.in b/package/Config.in
index 1d85af1..bf78baa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -379,7 +379,7 @@ source "package/ipsec-tools/Config.in"
 source "package/iptables/Config.in"
 source "package/iw/Config.in"
 source "package/kismet/Config.in"
-source "package/l2tp/Config.in"
+source "package/xl2tp/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/lighttpd/Config.in"
 endif
diff --git a/package/l2tp/Config.in b/package/l2tp/Config.in
deleted file mode 100644
index da4f589..0000000
--- a/package/l2tp/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_L2TP
-	bool "l2tp"
-	help
-	  Layer 2 Tunnelling Protocol (RFC2661).
-
-	  http://sourceforge.net/projects/l2tpd/
-
diff --git a/package/l2tp/l2tp-no-gnu-extensions.patch b/package/l2tp/l2tp-no-gnu-extensions.patch
deleted file mode 100644
index ef07e26..0000000
--- a/package/l2tp/l2tp-no-gnu-extensions.patch
+++ /dev/null
@@ -1,33 +0,0 @@
---- l2tpd-0.70-pre20031121.oorig/avpsend.c	2006-12-28 16:00:26.000000000 +0100
-+++ l2tpd-0.70-pre20031121/avpsend.c	2006-12-28 16:21:06.000000000 +0100
-@@ -98,19 +98,26 @@ int add_hostname_avp(struct buffer *buf,
- 	int sz = 0;
- 	if(t->lac && t->lac->hostname[0]) {
- 		strncpy(n,t->lac->hostname, sizeof(n));
--		sz = strnlen(t->lac->hostname, sizeof(t->lac->hostname));
-+		sz = strlen(t->lac->hostname);
-+		if (sz > sizeof(t->lac->hostname))
-+			sz = sizeof(t->lac->hostname);
- 	}
- 	else if(t->lns && t->lns->hostname[0]) {
- 		strncpy(n,t->lns->hostname, sizeof(n));
--		sz = strnlen(t->lns->hostname, sizeof(t->lns->hostname));
-+		sz = strlen(t->lns->hostname);
-+		if (sz > sizeof(t->lns->hostname))
-+			sz = sizeof(t->lns->hostname);
- 	}
- 	else {
- 		if(gethostname(n, STRLEN)) {
- 			strcpy(n,"eriwan");
- 			sz = 6;
- 		}
--		else
--			sz = strnlen(n, sizeof(n));
-+		else {
-+			sz = strlen(n);
-+			if (sz > sizeof(n))
-+				sz = sizeof(n);
-+		}
- 	}
- 	if(add_avp(buf, HOSTNAME_AVP, n, sz, 1))
- 		return 1;
diff --git a/package/l2tp/l2tp-sanity.patch b/package/l2tp/l2tp-sanity.patch
deleted file mode 100644
index 1d0533d..0000000
--- a/package/l2tp/l2tp-sanity.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-diff -rdup l2tpd-0.70-pre20031121.oorig/avp.c l2tpd-0.70-pre20031121/avp.c
---- l2tpd-0.70-pre20031121.oorig/avp.c	2006-12-28 16:00:26.000000000 +0100
-+++ l2tpd-0.70-pre20031121/avp.c	2006-12-28 16:06:43.000000000 +0100
-@@ -146,6 +146,7 @@ int validate_msgtype_avp(int attr,  stru
- 	u_int8_t *p = data + sizeof(struct avp_hdr);
- 	c->msgtype = get16(p);
- 
-+#ifdef SANITY
-     if (t->sanity)
-     {
-         /*
-@@ -293,6 +294,7 @@ int validate_msgtype_avp(int attr,  stru
-             return -EINVAL;
-         }
-     }
-+#endif
- 	return 0;
- }
- 
-@@ -301,7 +303,7 @@ int validate_gen_avp(int attr,  struct t
- 					 void *data, int datalen) {
- 	(void)data; (void)datalen;
- 	int i = 0, found = 0;
--
-+#ifdef SANITY
-     if(t->sanity) {
- 		for(i = 0; i < 8; i++) {
- 			if(c->msgtype == avps[attr].allowed_states[i])
-@@ -310,6 +312,7 @@ int validate_gen_avp(int attr,  struct t
- 		if(!found) 
- 			return -EINVAL;
- 	}
-+#endif
- 	return 0;
- }
- 
-diff -rdup l2tpd-0.70-pre20031121.oorig/l2tpd.c l2tpd-0.70-pre20031121/l2tpd.c
---- l2tpd-0.70-pre20031121.oorig/l2tpd.c	2006-12-28 16:00:26.000000000 +0100
-+++ l2tpd-0.70-pre20031121/l2tpd.c	2006-12-28 16:04:15.000000000 +0100
-@@ -748,7 +748,9 @@ struct tunnel *new_tunnel ()
-     tmp->peer.sin_family = AF_INET;
-     tmp->peer.sin_port = 0;
-     bzero (&(tmp->peer.sin_addr), sizeof (tmp->peer.sin_addr));
-+#ifdef SANITY
-     tmp->sanity = -1;
-+#endif
-     tmp->qtid = -1;
-     tmp->ourfc = ASYNC_FRAMING | SYNC_FRAMING;
-     tmp->ourbc = 0;
diff --git a/package/l2tp/l2tp.mk b/package/l2tp/l2tp.mk
deleted file mode 100644
index e8b4c79..0000000
--- a/package/l2tp/l2tp.mk
+++ /dev/null
@@ -1,60 +0,0 @@
-#############################################################
-#
-# l2tp
-#
-#############################################################
-L2TP_VERSION:=0.70-pre20031121
-L2TP_SOURCE:=l2tpd_$(L2TP_VERSION).orig.tar.gz
-L2TP_PATCH:=l2tpd_$(L2TP_VERSION)-2.2.diff.gz
-L2TP_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/l/l2tpd/
-L2TP_DIR:=$(BUILD_DIR)/l2tpd-$(L2TP_VERSION)
-L2TP_CAT:=$(ZCAT)
-L2TP_BINARY:=l2tpd
-L2TP_TARGET_BINARY:=usr/sbin/l2tpd
-
-$(DL_DIR)/$(L2TP_SOURCE):
-	$(call DOWNLOAD,$(L2TP_SITE),$(L2TP_SOURCE))
-
-$(DL_DIR)/$(L2TP_PATCH):
-	$(call DOWNLOAD,$(L2TP_SITE),$(L2TP_PATCH))
-
-l2tp-source: $(DL_DIR)/$(L2TP_SOURCE) $(DL_DIR)/$(L2TP_PATCH)
-
-$(L2TP_DIR)/.unpacked: $(DL_DIR)/$(L2TP_SOURCE) $(DL_DIR)/$(L2TP_PATCH)
-	$(L2TP_CAT) $(DL_DIR)/$(L2TP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	-mv -f $(L2TP_DIR).orig $(L2TP_DIR)
-ifneq ($(L2TP_PATCH),)
-	(cd $(L2TP_DIR) && $(L2TP_CAT) $(DL_DIR)/$(L2TP_PATCH) | patch -p1)
-	if [ -d $(L2TP_DIR)/debian/patches ]; then \
-		toolchain/patch-kernel.sh $(L2TP_DIR) $(L2TP_DIR)/debian/patches \*.patch; \
-	fi
-endif
-	toolchain/patch-kernel.sh $(L2TP_DIR) package/l2tp/ l2tp\*.patch
-	touch $(L2TP_DIR)/.unpacked
-
-$(L2TP_DIR)/$(L2TP_BINARY): $(L2TP_DIR)/.unpacked
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(L2TP_DIR) \
-		DFLAGS= \
-		OSFLAGS="-DLINUX -UUSE_KERNEL $(TARGET_CFLAGS) -USANITY"
-
-$(TARGET_DIR)/$(L2TP_TARGET_BINARY): $(L2TP_DIR)/$(L2TP_BINARY)
-	cp -dpf $(L2TP_DIR)/$(L2TP_BINARY) $@
-	cp -dpf package/l2tp/l2tpd $(TARGET_DIR)/etc/init.d/
-	$(STRIPCMD) $@
-
-l2tp: $(TARGET_DIR)/$(L2TP_TARGET_BINARY)
-
-l2tp-clean:
-	-$(MAKE) -C $(L2TP_DIR) clean
-	rm -f $(TARGET_DIR)/$(L2TP_TARGET_BINARY)
-
-l2tp-dirclean:
-	rm -rf $(L2TP_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_L2TP),y)
-TARGETS+=l2tp
-endif
diff --git a/package/xl2tp/Config.in b/package/xl2tp/Config.in
new file mode 100644
index 0000000..8f9d9b1
--- /dev/null
+++ b/package/xl2tp/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_XL2TP
+	bool "xl2tp"
+	select BR2_PACKAGE_LIBPCAP
+	help
+	  Layer 2 Tunnelling Protocol (RFC2661).
+
+	  xl2tpd is an open source implementation of the L2TP tunneling
+	  protocol. xl2tpd is forked from l2tpd and is maintained by
+	  Xelerance Corporation.
+
+	  http://www.xelerance.com/software/xl2tpd/
diff --git a/package/l2tp/l2tp-legacy.patch b/package/xl2tp/xl2tp-1.2.7-legacy.patch
similarity index 86%
rename from package/l2tp/l2tp-legacy.patch
rename to package/xl2tp/xl2tp-1.2.7-legacy.patch
index 39506d8..5279fd7 100644
--- a/package/l2tp/l2tp-legacy.patch
+++ b/package/xl2tp/xl2tp-1.2.7-legacy.patch
@@ -1,3 +1,6 @@
+Replace SUSV3-specific functions index, bcopy, bzero and bcmp by their
+POSIX variants.
+
 --- l2tpd-0.70-pre20031121.oorig/osport.h	2004-07-08 22:47:52.000000000 +0200
 +++ l2tpd-0.70-pre20031121/osport.h	2006-12-28 15:32:50.000000000 +0100
 @@ -37,4 +37,11 @@
diff --git a/package/xl2tp/xl2tp-1.2.7-makefile-flags.patch b/package/xl2tp/xl2tp-1.2.7-makefile-flags.patch
new file mode 100644
index 0000000..68a56a6
--- /dev/null
+++ b/package/xl2tp/xl2tp-1.2.7-makefile-flags.patch
@@ -0,0 +1,33 @@
+Make sure that the CFLAGS passed on the command line are taken into
+account.
+
+--- xl2tp-1.2.7/Makefile-orig	2010-08-05 15:33:46.000000000 -0700
++++ xl2tp-1.2.7/Makefile	2010-09-30 22:34:54.000000000 -0700
+@@ -90,7 +90,7 @@ OSFLAGS?= -DLINUX -I$(KERNELSRC)/include
+ 
+ IPFLAGS?= -DIP_ALLOCATION
+ 
+-CFLAGS+= $(DFLAGS) -O2 -fno-builtin -Wall -DSANITY $(OSFLAGS) $(IPFLAGS)
++COMPILE_FLAGS+= $(DFLAGS) -fno-builtin -Wall -DSANITY $(OSFLAGS) $(IPFLAGS)
+ HDRS=l2tp.h avp.h misc.h control.h call.h scheduler.h file.h aaa.h md5.h
+ OBJS=xl2tpd.o pty.o misc.o control.o avp.o call.o network.o avpsend.o scheduler.o file.o aaa.o md5.o
+ SRCS=${OBJS:.o=.c} ${HDRS}
+@@ -105,6 +105,9 @@ MANDIR?=$(DESTDIR)${PREFIX}/share/man
+ 
+ all: $(EXEC) pfc
+ 
++%.o: %.c
++	$(CC) $(COMPILE_FLAGS) $(CFLAGS) -c -o $@ -shared $<
++
+ clean:
+ 	rm -f $(OBJS) $(EXEC) pfc.o pfc
+ 
+@@ -112,7 +115,7 @@ $(EXEC): $(OBJS) $(HDRS)
+ 	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(LDLIBS)
+ 
+ pfc:
+-	$(CC) $(CFLAGS) -c contrib/pfc.c
++	$(CC) $(COMPILE_FLAGS) $(CFLAGS) -c contrib/pfc.c
+ 	$(CC) $(LDFLAGS) -lpcap $(LDLIBS) -o pfc pfc.o
+ 
+ romfs:
diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
new file mode 100644
index 0000000..fcde559
--- /dev/null
+++ b/package/xl2tp/xl2tp.mk
@@ -0,0 +1,33 @@
+#############################################################
+#
+# xl2tp
+#
+#############################################################
+XL2TP_VERSION = 1.2.7
+XL2TP_SOURCE = xl2tpd-$(XL2TP_VERSION).tar.gz
+XL2TP_SITE = ftp://ftp.xelerance.com/xl2tpd/
+
+XL2TP_DEPENDENCIES = pppd libpcap
+
+define XL2TP_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define XL2TP_INSTALL_TARGET_CMDS
+	$(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D) install
+endef
+
+define XL2TP_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/bin/pfc
+	rm -f $(TARGET_DIR)/usr/sbin/xl2tpd
+	rm -f $(TARGET_DIR)/usr/share/man/man1/pfc.1
+	rm -f $(TARGET_DIR)/usr/share/man/man8/xl2tpd.8
+	rm -f $(TARGET_DIR)/usr/share/man/man5/xl2tpd.conf.5
+	rm -f $(TARGET_DIR)/usr/share/man/man5/l2tp-secrets.5
+endef
+
+define XL2TP_CLEAN_CMDS
+	-$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(call GENTARGETS,package,xl2tp))
diff --git a/package/l2tp/l2tpd b/package/xl2tp/xl2tpd
similarity index 76%
rename from package/l2tp/l2tpd
rename to package/xl2tp/xl2tpd
index 8bed72d..36c12a2 100755
--- a/package/l2tp/l2tpd
+++ b/package/xl2tp/xl2tpd
@@ -1,8 +1,8 @@
 #!/bin/sh
 #
 PATH=/bin:/usr/bin:/sbin:/usr/sbin
-DAEMON=/usr/sbin/l2tpd
-PIDFILE=/var/run/l2tpd.pid
+DAEMON=/usr/sbin/xl2tpd
+PIDFILE=/var/run/xl2tpd.pid
 
 test -f $DAEMON || exit 0
 
@@ -19,7 +19,7 @@ case "$1" in
     start-stop-daemon -S  -p $PIDFILE -x $DAEMON
     ;;
   *)
-    echo "Usage: /etc/init.d/l2tdp {start|stop|restart|force-reload}"
+    echo "Usage: /etc/init.d/xl2tdp {start|stop|restart|force-reload}"
     exit 1
     ;;
 esac
-- 
1.7.0.4
