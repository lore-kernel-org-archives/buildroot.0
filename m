From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 18 Jun 2008 01:51:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20080618085114.0302EF8010@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-18 01:51:10 -0700 (Wed, 18 Jun 2008)
New Revision: 22409

Log:
uclibc: only strip libpthread on 0.9.28.3 / not PTHREAD_DEBUG


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-06-18 08:51:00 UTC (rev 22408)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2008-06-18 08:51:10 UTC (rev 22409)
@@ -524,7 +524,11 @@
 		DEVEL_PREFIX=/usr/ \
 		RUNTIME_PREFIX=/ \
 		install_runtime
-	$(STRIPCMD) $(@D)/lib*.so*
+ifeq ($(BR2_UCLIBC_VERSION_0_9_28_3),y)
+ifneq ($(BR2_PTHREAD_DEBUG),y)
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(@D)/libpthread*.so*
+endif
+endif
 	touch -c $@
 
 $(TARGET_DIR)/usr/bin/ldd: $(cross_compiler)
