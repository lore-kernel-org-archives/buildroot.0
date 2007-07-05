From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Wed,  4 Jul 2007 22:13:20 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070705051320.03A63A610D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-04 22:13:20 -0700 (Wed, 04 Jul 2007)
New Revision: 19000

Log:
Do not override CFLAGS in uClibc. Instead concatenate with the ARCH_CFLAGS. Also, pass only the TARGET_CONFIGURE options that are necessary for building the utilities so that CFLAGS are not passed.


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-07-05 00:12:55 UTC (rev 18999)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-07-05 05:13:20 UTC (rev 19000)
@@ -113,6 +113,8 @@
 		-e 's,^DEVEL_PREFIX=.*,DEVEL_PREFIX=\"/usr/\",g' \
 		-e 's,^SHARED_LIB_LOADER_PREFIX=.*,SHARED_LIB_LOADER_PREFIX=\"/lib\",g' \
 		$(UCLIBC_DIR)/.config
+	$(SED) 's,^ARCH_CFLAGS=",ARCH_CFLAGS="$(TARGET_CFLAGS) ,g' \
+		$(UCLIBC_DIR)/.config
 ifeq ($(UCLIBC_TARGET_ARCH),arm)
 	$(SED) 's/^\(CONFIG_[^_]*[_]*ARM[^=]*\)=.*/# \1 is not set/g' \
 		 $(UCLIBC_DIR)/.config
@@ -346,7 +348,8 @@
 	touch -c $@
 
 $(TARGET_DIR)/usr/bin/ldd:
-	$(MAKE1) -C $(UCLIBC_DIR) $(TARGET_CONFIGURE_OPTS) \
+	$(MAKE1) -C $(UCLIBC_DIR) CC=$(TARGET_CROSS)gcc \
+		CPP=$(TARGET_CROSS)cpp LD=$(TARGET_CROSS)ld \
 		PREFIX=$(TARGET_DIR) utils install_utils
 ifeq ($(strip $(BR2_CROSS_TOOLCHAIN_TARGET_UTILS)),y)
 	mkdir -p $(STAGING_DIR)/$(REAL_GNU_TARGET_NAME)/target_utils
