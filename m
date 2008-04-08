From: Michel (BusError) <buildroot.atmel.com@pollet.net>
Date: Tue,  8 Apr 2008 20:41:41 +0100
Subject: [Buildroot] [PATCH] IPTRAF: Added Interactive Colorful IP LAN
	Monitor
In-Reply-To: <1207683703-14842-2-git-send-email-buildroot.atmel.com@pollet.net>
References: <1207683703-14842-1-git-send-email-buildroot.atmel.com@pollet.net>
	<1207683703-14842-2-git-send-email-buildroot.atmel.com@pollet.net>
Message-ID: <1207683703-14842-3-git-send-email-buildroot.atmel.com@pollet.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michel <michel.git@pollet.net>

IPTraf is an ncurses-based IP LAN monitor that generates various network statistics
including TCP info, UDP counts, ICMP and OSPF information, Ethernet load info, node
stats, IP checksum errors, and others.
---
 package/Config.in                                  |    1 +
 package/iptraf/Config.in                           |   14 ++++
 .../iptraf/iptraf-3.0.1-100-cross-compile.patch    |   83 ++++++++++++++++++++
 package/iptraf/iptraf.mk                           |   49 ++++++++++++
 4 files changed, 147 insertions(+), 0 deletions(-)
 create mode 100644 package/iptraf/Config.in
 create mode 100644 package/iptraf/iptraf-3.0.1-100-cross-compile.patch
 create mode 100644 package/iptraf/iptraf.mk

diff --git a/package/Config.in b/package/Config.in
index 3ca06ff..751623c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -314,6 +314,7 @@ source "package/slang/Config.in"
 comment "text rendering applications"
 source "package/dialog/Config.in"
 source "package/screen/Config.in"
+source "package/iptraf/Config.in"
 
 comment "graphic libraries"
 source "package/directfb/Config.in"
diff --git a/package/iptraf/Config.in b/package/iptraf/Config.in
new file mode 100644
index 0000000..ce0d3f8
--- /dev/null
+++ b/package/iptraf/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_IPTRAF
+    bool "iptraf"
+    default n
+    select BR2_PACKAGE_NCURSES
+    select BR2_PACKAGE_NCURSES_TARGET_PANEL
+    help
+	iptraf - Interactive Colorful IP LAN Monitor
+
+	IPTraf is an ncurses-based IP LAN monitor that generates various 
+	network statistics including TCP info, UDP counts, ICMP and OSPF 
+	information, Ethernet load info, node stats, IP checksum errors, 
+	and others.
+	This package depends on ncurses's libpanel library
+
diff --git a/package/iptraf/iptraf-3.0.1-100-cross-compile.patch b/package/iptraf/iptraf-3.0.1-100-cross-compile.patch
new file mode 100644
index 0000000..5cf8469
--- /dev/null
+++ b/package/iptraf/iptraf-3.0.1-100-cross-compile.patch
@@ -0,0 +1,83 @@
+diff -ru iptraf-3.0.1/src/Makefile iptraf-3.0.1.buildroot/src/Makefile
+--- iptraf-3.0.1/src/Makefile	2005-09-13 10:11:17.000000000 +0100
++++ iptraf-3.0.1.buildroot/src/Makefile	2008-04-05 20:23:14.000000000 +0100
+@@ -5,9 +5,9 @@
+ #
+ # Architecture determination string borrowed from the kernel makefile.
+ #
+-ARCH 		:= $(shell uname -m | sed -e s/i.86/i386/ -e s/sun4u/sparc64/ \
++ARCH 		:= $(shell $(GCC) -dumpmachine | sed -e s/i.86/i386/ -e s/sun4u/sparc64/ \
+ 			-e s/arm.*/arm/ -e s/sa110/arm/)
+-PLATFORM 	= -DPLATFORM=\"$(shell uname -s)/$(ARCH)\"
++PLATFORM 	= -DPLATFORM=\"$(ARCH)\"
+ VERNUMBER	:= $(shell cat version)
+ VERSION 	= -DVERSION=\"$(VERNUMBER)\"
+ 
+@@ -17,7 +17,7 @@
+ #
+ BINDIR		= ../../iptraf-$(VERNUMBER).bin.$(ARCH)
+ 
+-CC		= gcc
++CC		= $(GCC)
+ LIBS		= -L../support -ltextbox -lpanel -lncurses   # in this order!
+ 
+ # comment this one out to omit debug code when done.
+@@ -39,7 +39,7 @@
+ # you may want to change this to point to your ncurses include directory
+ # if the ncurses include files are not in the default location.
+ 
+-INCLUDEDIR	= -I/usr/include/ncurses -I../support
++INCLUDEDIR	= -I../support
+ 
+ # You can uncomment this one to disable the backspace key in input fields.
+ # This means you must use the Del key or Ctrl+H combination to erase the
+@@ -68,12 +68,12 @@
+ # installation target directory.  The iptraf and rvnamed programs get
+ # stored here.  iptraf also exec's rvnamed from this directory.
+ 
+-TARGET		= /usr/local/bin
++TARGET		= /usr/bin
+ 
+ # The IPTraf working directory; if you change this.  Starting with this
+ # version, this definition overrides dirs.h.
+ 
+-WORKDIR		= /var/local/iptraf
++WORKDIR		= /var/run/iptraf
+ 
+ # The IPTraf log file directory.  IPTraf log files are placed here.
+ # This definition overrides dirs.h
+diff -ru iptraf-3.0.1/src/tr.c iptraf-3.0.1.buildroot/src/tr.c
+--- iptraf-3.0.1/src/tr.c	2005-09-13 07:42:54.000000000 +0100
++++ iptraf-3.0.1.buildroot/src/tr.c	2008-04-05 20:31:18.000000000 +0100
+@@ -6,9 +6,9 @@
+  * Copyright (c) Gerard Paul Java 2002
+  */
+ 
+-#include <asm/types.h>
+-#include <linux/if_tr.h>
+-#include <netinet/in.h>
++/*#include <asm/types.h> */
++#include <linux/if_tr.h> 
++/*#include <netinet/in.h> */
+ 
+ unsigned int get_tr_ip_offset(unsigned char *pkt)
+ {
+diff -ru iptraf-3.0.1/support/Makefile iptraf-3.0.1.buildroot/support/Makefile
+--- iptraf-3.0.1/support/Makefile	2002-07-19 17:31:48.000000000 +0100
++++ iptraf-3.0.1.buildroot/support/Makefile	2008-04-05 20:35:16.000000000 +0100
+@@ -7,12 +7,12 @@
+ 
+ libtextbox.a: $(OBJS)
+ 	rm -rf libtextbox.a
+-	ar cq libtextbox.a $(OBJS)
+-	ranlib libtextbox.a
++	$(AR) cq libtextbox.a $(OBJS)
++	$(RANLIB) libtextbox.a
+ #	gcc -shared -o libtextbox.so $(OBJS)
+ 
+ %.o: %.c *.h
+-	gcc -O2 -g -Wall -fPIC $(INCLUDEDIR) -c -o $*.o $<
++	$(GCC) $(CFLAGS) $(INCLUDEDIR) -c -o $*.o $<
+ 
+ clean:
+ 	rm -rf *.o *~ libtextbox.a libtextbox.so
diff --git a/package/iptraf/iptraf.mk b/package/iptraf/iptraf.mk
new file mode 100644
index 0000000..990a071
--- /dev/null
+++ b/package/iptraf/iptraf.mk
@@ -0,0 +1,49 @@
+#############################################################
+#
+# iptraf
+#
+#############################################################
+IPTRAF_VERSION:=3.0.1
+IPTRAF_SOURCE:=iptraf-$(IPTRAF_VERSION).tar.gz
+IPTRAF_SITE:=ftp://iptraf.seul.org/pub/iptraf/
+IPTRAF_DIR:=$(BUILD_DIR)/iptraf-$(IPTRAF_VERSION)
+IPTRAF_BINARY:=src/iptraf
+IPTRAF_TARGET_BINARY:=usr/bin/iptraf
+
+$(DL_DIR)/$(IPTRAF_SOURCE):
+	$(WGET) -P $(DL_DIR) $(IPTRAF_SITE)/$(IPTRAF_SOURCE)
+
+$(IPTRAF_DIR)/.source: $(DL_DIR)/$(IPTRAF_SOURCE)
+	$(ZCAT) $(DL_DIR)/$(IPTRAF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(IPTRAF_DIR) package/iptraf/ iptraf-$(IPTRAF_VERSION)\*.patch
+	if [ ! -f $(IPTRAF_DIR)/Makefile ]; then printf "\nall:\n\nuninstall:\n\n">$(IPTRAF_DIR)/Makefile ; fi
+	$(CONFIG_UPDATE) $(IPTRAF_DIR)
+	touch $@
+
+$(IPTRAF_DIR)/$(IPTRAF_BINARY): $(IPTRAF_DIR)/.source
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(IPTRAF_DIR)/src 
+	touch -c $@
+
+$(TARGET_DIR)/$(IPTRAF_TARGET_BINARY): $(IPTRAF_DIR)/$(IPTRAF_BINARY)
+	cp -a $(IPTRAF_DIR)/src/{iptraf,rvnamed,rawtime} $(TARGET_DIR)/usr/bin/
+
+iptraf: uclibc ncurses $(TARGET_DIR)/$(IPTRAF_TARGET_BINARY)
+
+iptraf-source: $(DL_DIR)/$(IPTRAF_SOURCE)
+
+iptraf-clean:
+	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(IPTRAF_DIR) uninstall
+	-$(MAKE) -C $(IPTRAF_DIR)/src clean
+
+iptraf-dirclean:
+	rm -rf $(IPTRAF_DIR)
+
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_IPTRAF)),y)
+TARGETS+=iptraf
+endif
-- 
1.5.4.3
