From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 23 Jul 2007 01:47:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dnsmasq
Message-ID: <20070723084733.4D627A65DD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-23 01:47:32 -0700 (Mon, 23 Jul 2007)
New Revision: 19206

Log:
Bump version of dnsmasq, with new patches

Added:
   trunk/buildroot/package/dnsmasq/dnsmasq2-100-include-correct-prctl-header.patch

Modified:
   trunk/buildroot/package/dnsmasq/dnsmasq.mk


Changeset:
Modified: trunk/buildroot/package/dnsmasq/dnsmasq.mk
===================================================================
--- trunk/buildroot/package/dnsmasq/dnsmasq.mk	2007-07-23 08:35:06 UTC (rev 19205)
+++ trunk/buildroot/package/dnsmasq/dnsmasq.mk	2007-07-23 08:47:32 UTC (rev 19206)
@@ -6,7 +6,7 @@
 
 DNSMASQ_SITE=http://thekelleys.org.uk/dnsmasq
 ifeq ($(filter $(TARGETS),dnsmasq1),)
-DNSMASQ_UPVER=2.22
+DNSMASQ_UPVER=2.39
 DNSMASQ_VERSION=dnsmasq2
 else
 DNSMASQ_UPVER=1.18
@@ -34,6 +34,8 @@
 	$(MAKE) BINDIR=/usr/sbin MANDIR=/usr/man \
 		DESTDIR=$(TARGET_DIR) -C $(DNSMASQ_DIR) install
 	$(STRIP) $(TARGET_DIR)/$(DNSMASQ_TARGET_BINARY)
+	mkdir -p $(TARGET_DIR)/var/lib/misc
+	ln -sf /tmp/dnsmasq.leases $(TARGET_DIR)/var/lib/misc/dnsmasq.leases
 	rm -rf $(TARGET_DIR)/usr/man
 
 dnsmasq: uclibc $(TARGET_DIR)/$(DNSMASQ_TARGET_BINARY)

Added: trunk/buildroot/package/dnsmasq/dnsmasq2-100-include-correct-prctl-header.patch
===================================================================
--- trunk/buildroot/package/dnsmasq/dnsmasq2-100-include-correct-prctl-header.patch	                        (rev 0)
+++ trunk/buildroot/package/dnsmasq/dnsmasq2-100-include-correct-prctl-header.patch	2007-07-23 08:47:32 UTC (rev 19206)
@@ -0,0 +1,12 @@
+diff -upr dnsmasq-2.39/src/dnsmasq.h dnsmasq-2.39-orig/src/dnsmasq.h
+--- dnsmasq-2.39/src/dnsmasq.h	2007-04-20 12:53:38.000000000 +0200
++++ dnsmasq-2.39-orig/src/dnsmasq.h	2007-06-12 11:12:19.000000000 +0200
+@@ -79,7 +79,7 @@
+ /* There doesn't seem to be a universally-available 
+    userpace header for this. */
+ extern int capset(cap_user_header_t header, cap_user_data_t data);
+-#include <sys/prctl.h>
++#include <linux/prctl.h>
+ #endif
+ 
+ /* Min buffer size: we check after adding each record, so there must be 
