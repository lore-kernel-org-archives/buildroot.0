From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 15 May 2007 04:24:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: libpcap tcpdump
Message-ID: <20070515112428.56FAD48029@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-05-15 04:24:27 -0700 (Tue, 15 May 2007)
New Revision: 18622

Log:
- bump version


Added:
   trunk/buildroot/package/tcpdump/tcpdump.00-extern-inline-fixup.patch

Modified:
   trunk/buildroot/package/libpcap/libpcap.mk
   trunk/buildroot/package/tcpdump/tcpdump.mk


Changeset:
Modified: trunk/buildroot/package/libpcap/libpcap.mk
===================================================================
--- trunk/buildroot/package/libpcap/libpcap.mk	2007-05-15 11:23:46 UTC (rev 18621)
+++ trunk/buildroot/package/libpcap/libpcap.mk	2007-05-15 11:24:27 UTC (rev 18622)
@@ -21,7 +21,7 @@
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
 # USA
 
-LIBPCAP_VER:=0.9.4
+LIBPCAP_VER:=0.9.5
 LIBPCAP_DIR:=$(BUILD_DIR)/libpcap-$(LIBPCAP_VER)
 LIBPCAP_SITE:=http://www.tcpdump.org/release
 LIBPCAP_SOURCE:=libpcap-$(LIBPCAP_VER).tar.gz
@@ -35,7 +35,7 @@
 $(LIBPCAP_DIR)/.unpacked: $(DL_DIR)/$(LIBPCAP_SOURCE)
 	$(LIBPCAP_CAT) $(DL_DIR)/$(LIBPCAP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(LIBPCAP_DIR) package/libpcap/ *.patch
-	touch $(LIBPCAP_DIR)/.unpacked
+	touch $@
 
 $(LIBPCAP_DIR)/.configured: $(LIBPCAP_DIR)/.unpacked
 	( \
@@ -66,7 +66,7 @@
 		--prefix=/usr \
 		--with-pcap=linux \
 	)
-	touch $(LIBPCAP_DIR)/.configured
+	touch $@
 
 $(LIBPCAP_DIR)/libpcap.a: $(LIBPCAP_DIR)/.configured
 	$(MAKE) CC="$(TARGET_CC)" \

Added: trunk/buildroot/package/tcpdump/tcpdump.00-extern-inline-fixup.patch
===================================================================
--- trunk/buildroot/package/tcpdump/tcpdump.00-extern-inline-fixup.patch	                        (rev 0)
+++ trunk/buildroot/package/tcpdump/tcpdump.00-extern-inline-fixup.patch	2007-05-15 11:24:27 UTC (rev 18622)
@@ -0,0 +1,30 @@
+--- tcpdump-3.9.5.oorig/tcpdump-stdinc.h	2006-06-23 04:07:27.000000000 +0200
++++ tcpdump-3.9.5/tcpdump-stdinc.h	2007-05-14 10:26:25.000000000 +0200
+@@ -149,15 +149,15 @@ typedef char* caddr_t;
+   #undef htonl
+   #undef htons
+ 
+-  extern __inline__ unsigned long __ntohl (unsigned long x);
+-  extern __inline__ unsigned short __ntohs (unsigned short x);
++  static __inline__ unsigned long __ntohl (unsigned long x);
++  static __inline__ unsigned short __ntohs (unsigned short x);
+ 
+   #define ntohl(x)  __ntohl(x)
+   #define ntohs(x)  __ntohs(x)
+   #define htonl(x)  __ntohl(x)
+   #define htons(x)  __ntohs(x)
+ 
+-  extern __inline__ unsigned long __ntohl (unsigned long x)
++  static __inline__ unsigned long __ntohl (unsigned long x)
+   {
+     __asm__ ("xchgb %b0, %h0\n\t"   /* swap lower bytes  */
+              "rorl  $16, %0\n\t"    /* swap words        */
+@@ -166,7 +166,7 @@ typedef char* caddr_t;
+     return (x);
+   }
+ 
+-  extern __inline__ unsigned short __ntohs (unsigned short x)
++  static __inline__ unsigned short __ntohs (unsigned short x)
+   {
+     __asm__ ("xchgb %b0, %h0"       /* swap bytes */
+             : "=q" (x) : "0" (x));

Modified: trunk/buildroot/package/tcpdump/tcpdump.mk
===================================================================
--- trunk/buildroot/package/tcpdump/tcpdump.mk	2007-05-15 11:23:46 UTC (rev 18621)
+++ trunk/buildroot/package/tcpdump/tcpdump.mk	2007-05-15 11:24:27 UTC (rev 18622)
@@ -6,7 +6,7 @@
 # Copyright (C) 2001-2003 by Erik Andersen <andersen@codepoet.org>
 # Copyright (C) 2002 by Tim Riker <Tim@Rikers.org>
 
-TCPDUMP_VER:=3.9.4
+TCPDUMP_VER:=3.9.5
 TCPDUMP_DIR:=$(BUILD_DIR)/tcpdump-$(TCPDUMP_VER)
 TCPDUMP_SITE:=http://www.tcpdump.org/release
 TCPDUMP_SOURCE:=tcpdump-$(TCPDUMP_VER).tar.gz
@@ -19,7 +19,8 @@
 
 $(TCPDUMP_DIR)/.unpacked: $(DL_DIR)/$(TCPDUMP_SOURCE)
 	$(TCPDUMP_CAT) $(DL_DIR)/$(TCPDUMP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(TCPDUMP_DIR)/.unpacked
+	toolchain/patch-kernel.sh $(TCPDUMP_DIR) package/tcpdump tcpdump*\.patch
+	touch $@
 
 $(TCPDUMP_DIR)/.configured: $(TCPDUMP_DIR)/.unpacked
 	( \
@@ -47,9 +48,10 @@
 		--infodir=/usr/info \
 		--with-build-cc="$(HOSTCC)" \
 		--without-crypto \
+		--disable-smb \
 	)
 	$(SED) '/HAVE_PCAP_DEBUG/d' $(TCPDUMP_DIR)/config.h
-	touch $(TCPDUMP_DIR)/.configured
+	touch $@
 
 $(TCPDUMP_DIR)/tcpdump: $(TCPDUMP_DIR)/.configured
 	$(MAKE) CC="$(TARGET_CC)" \
@@ -59,7 +61,8 @@
 		-C $(TCPDUMP_DIR)
 
 $(TARGET_DIR)/sbin/tcpdump: $(TCPDUMP_DIR)/tcpdump
-	cp -af $< $@
+	cp -f $< $@
+	$(STRIP) -s $@
 
 tcpdump: uclibc zlib libpcap $(TARGET_DIR)/sbin/tcpdump
 
