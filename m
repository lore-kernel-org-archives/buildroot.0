From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 23 Sep 2012 20:52:56 +0200
Subject: [Buildroot] [git commit] xl2tp: bump to version 1.3.1
Message-ID: <20120923193050.49BC799649@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=31b45a8c72b365c09100a7cb99c82c8e63d1b479
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/xl2tp/xl2tp-1.2.7-makefile-flags.patch     |   33 --------------------
 ...xl2tp-1.2.7-legacy.patch => xl2tp-legacy.patch} |    0
 package/xl2tp/xl2tp.mk                             |   21 ++----------
 3 files changed, 4 insertions(+), 50 deletions(-)

diff --git a/package/xl2tp/xl2tp-1.2.7-makefile-flags.patch b/package/xl2tp/xl2tp-1.2.7-makefile-flags.patch
deleted file mode 100644
index 68a56a6..0000000
--- a/package/xl2tp/xl2tp-1.2.7-makefile-flags.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Make sure that the CFLAGS passed on the command line are taken into
-account.
-
---- xl2tp-1.2.7/Makefile-orig	2010-08-05 15:33:46.000000000 -0700
-+++ xl2tp-1.2.7/Makefile	2010-09-30 22:34:54.000000000 -0700
-@@ -90,7 +90,7 @@ OSFLAGS?= -DLINUX -I$(KERNELSRC)/include
- 
- IPFLAGS?= -DIP_ALLOCATION
- 
--CFLAGS+= $(DFLAGS) -O2 -fno-builtin -Wall -DSANITY $(OSFLAGS) $(IPFLAGS)
-+COMPILE_FLAGS+= $(DFLAGS) -fno-builtin -Wall -DSANITY $(OSFLAGS) $(IPFLAGS)
- HDRS=l2tp.h avp.h misc.h control.h call.h scheduler.h file.h aaa.h md5.h
- OBJS=xl2tpd.o pty.o misc.o control.o avp.o call.o network.o avpsend.o scheduler.o file.o aaa.o md5.o
- SRCS=${OBJS:.o=.c} ${HDRS}
-@@ -105,6 +105,9 @@ MANDIR?=$(DESTDIR)${PREFIX}/share/man
- 
- all: $(EXEC) pfc
- 
-+%.o: %.c
-+	$(CC) $(COMPILE_FLAGS) $(CFLAGS) -c -o $@ -shared $<
-+
- clean:
- 	rm -f $(OBJS) $(EXEC) pfc.o pfc
- 
-@@ -112,7 +115,7 @@ $(EXEC): $(OBJS) $(HDRS)
- 	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(LDLIBS)
- 
- pfc:
--	$(CC) $(CFLAGS) -c contrib/pfc.c
-+	$(CC) $(COMPILE_FLAGS) $(CFLAGS) -c contrib/pfc.c
- 	$(CC) $(LDFLAGS) -lpcap $(LDLIBS) -o pfc pfc.o
- 
- romfs:
diff --git a/package/xl2tp/xl2tp-1.2.7-legacy.patch b/package/xl2tp/xl2tp-legacy.patch
similarity index 100%
rename from package/xl2tp/xl2tp-1.2.7-legacy.patch
rename to package/xl2tp/xl2tp-legacy.patch
diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index 768e6ec..cf0576d 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -3,31 +3,18 @@
 # xl2tp
 #
 #############################################################
-XL2TP_VERSION = 1.2.7
-XL2TP_SOURCE = xl2tpd-$(XL2TP_VERSION).tar.gz
-XL2TP_SITE = ftp://ftp.xelerance.com/xl2tpd/
 
+XL2TP_VERSION = v1.3.1
+XL2TP_SITE = http://github.com/xelerance/xl2tpd/tarball/$(XL2TP_VERSION)
 XL2TP_DEPENDENCIES = libpcap
 
 define XL2TP_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(SED) 's/ -O2 //' $(@D)/Makefile
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
 endef
 
 define XL2TP_INSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D) install
 endef
 
-define XL2TP_UNINSTALL_TARGET_CMDS
-	rm -f $(TARGET_DIR)/usr/bin/pfc
-	rm -f $(TARGET_DIR)/usr/sbin/xl2tpd
-	rm -f $(TARGET_DIR)/usr/share/man/man1/pfc.1
-	rm -f $(TARGET_DIR)/usr/share/man/man8/xl2tpd.8
-	rm -f $(TARGET_DIR)/usr/share/man/man5/xl2tpd.conf.5
-	rm -f $(TARGET_DIR)/usr/share/man/man5/l2tp-secrets.5
-endef
-
-define XL2TP_CLEAN_CMDS
-	-$(MAKE) -C $(@D) clean
-endef
-
 $(eval $(generic-package))
