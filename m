From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Fri, 19 Oct 2007 10:51:01 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20071019175101.D1169A6851@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-10-19 10:51:00 -0700 (Fri, 19 Oct 2007)
New Revision: 20298

Log:
fix libmudflap build failure for 4.1.2 gcc - pass CPP=<target_cpp>, thanks to Hamish Moffatt

Modified:
   trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk


Changeset:
Modified: trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk
===================================================================
--- trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-10-19 17:41:58 UTC (rev 20297)
+++ trunk/buildroot/toolchain/gcc/gcc-uclibc-3.x.mk	2007-10-19 17:51:00 UTC (rev 20298)
@@ -242,6 +242,7 @@
 	(cd $(GCC_BUILD_DIR2); rm -rf config.cache; \
 		$(HOST_CONFIGURE_OPTS) \
 		GCC=$(TARGET_CROSS)gcc \
+		CPP=$(TARGET_CROSS)cpp \
 		LDFLAGS_FOR_TARGET="$(patsubst %,LDFLAGS+=-Wl$(comma)%,$(TARGET_LDFLAGS)) -L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" \
 		$(GCC_DIR)/configure \
 		--prefix=$(STAGING_DIR) \
@@ -267,7 +268,7 @@
 	touch $@
 
 $(GCC_BUILD_DIR2)/.compiled: $(GCC_BUILD_DIR2)/.configured
-	PATH=$(TARGET_PATH) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(GCC_BUILD_DIR2) all
+	PATH=$(TARGET_PATH) $(MAKE) $(HOST_CONFIGURE_OPTS) CPP=$(TARGET_CROSS)cpp -C $(GCC_BUILD_DIR2) all
 	touch $@
 
 $(GCC_BUILD_DIR2)/.installed: $(GCC_BUILD_DIR2)/.compiled
