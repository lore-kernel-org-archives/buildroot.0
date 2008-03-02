From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  2 Mar 2008 06:36:35 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dnsmasq
Message-ID: <20080302143635.02C9D12C5CC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-02 06:36:35 -0800 (Sun, 02 Mar 2008)
New Revision: 21151

Log:
dnsmasq: remove dnsmasq1 support

Remove ancient dnsmasq1 support, which couldn't even be selected in
menuconfig.


Removed:
   trunk/buildroot/package/dnsmasq/dnsmasq1-100-bugfix.patch

Modified:
   trunk/buildroot/package/dnsmasq/dnsmasq.mk


Changeset:
Modified: trunk/buildroot/package/dnsmasq/dnsmasq.mk
===================================================================
--- trunk/buildroot/package/dnsmasq/dnsmasq.mk	2008-03-02 14:33:26 UTC (rev 21150)
+++ trunk/buildroot/package/dnsmasq/dnsmasq.mk	2008-03-02 14:36:35 UTC (rev 21151)
@@ -5,13 +5,7 @@
 #############################################################
 
 DNSMASQ_SITE:=http://thekelleys.org.uk/dnsmasq
-ifeq ($(filter $(TARGETS),dnsmasq1),)
 DNSMASQ_UPVER:=2.40
-DNSMASQ_VERSION:=dnsmasq2
-else
-DNSMASQ_UPVER:=1.18
-DNSMASQ_VERSION:=dnsmasq1
-endif
 DNSMASQ_SOURCE:=dnsmasq-$(DNSMASQ_UPVER).tar.gz
 DNSMASQ_DIR:=$(BUILD_DIR)/dnsmasq-$(DNSMASQ_UPVER)
 DNSMASQ_BINARY:=dnsmasq
@@ -28,8 +22,7 @@
 
 $(DNSMASQ_DIR)/.source: $(DL_DIR)/$(DNSMASQ_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(DNSMASQ_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(DNSMASQ_DIR) package/dnsmasq/ \
-		$(DNSMASQ_VERSION)\*.patch
+	toolchain/patch-kernel.sh $(DNSMASQ_DIR) package/dnsmasq/ \*.patch
 	touch $@
 
 $(DNSMASQ_DIR)/src/$(DNSMASQ_BINARY): $(DNSMASQ_DIR)/.source
@@ -40,7 +33,7 @@
 	$(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(DNSMASQ_DIR) install
 	$(STRIPCMD) $(TARGET_DIR)/$(DNSMASQ_TARGET_BINARY)
 	mkdir -p $(TARGET_DIR)/var/lib/misc
-	# Isn't this vulverable to symlink attacks?
+	# Isn't this vulnerable to symlink attacks?
 	ln -sf /tmp/dnsmasq.leases $(TARGET_DIR)/var/lib/misc/dnsmasq.leases
 ifneq ($(BR2_HAVE_MANPAGES),y)
 	rm -rf $(TARGET_DIR)/usr/share/man

Deleted: trunk/buildroot/package/dnsmasq/dnsmasq1-100-bugfix.patch
===================================================================
--- trunk/buildroot/package/dnsmasq/dnsmasq1-100-bugfix.patch	2008-03-02 14:33:26 UTC (rev 21150)
+++ trunk/buildroot/package/dnsmasq/dnsmasq1-100-bugfix.patch	2008-03-02 14:36:35 UTC (rev 21151)
@@ -1,25 +0,0 @@
---- dnsmasq-1.18/config.h.dist	2004-03-01 22:25:12.000000000 -0600
-+++ dnsmasq-1.18/config.h	2004-03-01 22:26:50.000000000 -0600
-@@ -126,7 +126,9 @@
- 
- /* Must preceed __linux__ since uClinux defines __linux__ too. */
- #if defined(__uClinux__) || defined(__UCLIBC__)
-+#ifndef __UCLIBC_HAS_IPV6__
- #undef HAVE_LINUX_IPV6_PROC
-+#endif
- #define HAVE_GETOPT_LONG
- #undef HAVE_ARC4RANDOM
- #define HAVE_RANDOM
-diff -x CVS -urN dnsmasq-1.18/option.c dnsmasq.old/option.c
---- dnsmasq-1.18/option.c	2003-11-05 08:22:18.000000000 -0600
-+++ dnsmasq.old/option.c	2004-01-05 23:40:11.000000000 -0600
-@@ -578,8 +578,8 @@
- #ifdef HAVE_IPV6
- 	    else if (tmp->source_addr.sa.sa_family == AF_INET6)
- 	      tmp->source_addr.in6.sin6_port = htons(*query_port);
--	  }
- #endif  
-+	  }
-     }
-   
-   if (*if_addrs)
