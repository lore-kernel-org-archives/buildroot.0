From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  6 Apr 2007 08:01:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/openssl
Message-ID: <20070406150133.623F2485F6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-04-06 08:01:32 -0700 (Fri, 06 Apr 2007)
New Revision: 18350

Log:
- hit awk on steroids with a clue bait


Modified:
   trunk/buildroot/package/openssl/openssl.mk


Changeset:
Modified: trunk/buildroot/package/openssl/openssl.mk
===================================================================
--- trunk/buildroot/package/openssl/openssl.mk	2007-04-06 14:21:00 UTC (rev 18349)
+++ trunk/buildroot/package/openssl/openssl.mk	2007-04-06 15:01:32 UTC (rev 18350)
@@ -32,9 +32,10 @@
 	$(OPENSSL_CAT) $(DL_DIR)/$(OPENSSL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(OPENSSL_DIR) package/openssl/ openssl\*.patch
 	# sigh... we have to resort to this just to set a gcc flag.
+	# grumble.. and of course make sure to escape any '/' in CFLAGS
 	$(SED) 's,/CFLAG=,/CFLAG= $(TARGET_SOFT_FLOAT) ,g' \
 		$(OPENSSL_DIR)/Configure
-	$(SED) '/CFLAG=/s,/;, $(TARGET_CFLAGS)/;,' \
+	$(SED) '/CFLAG=/s,/;, $(shell echo '$(TARGET_CFLAGS)' | sed -e 's/\//\\\\\//g')/;,' \
 		$(OPENSSL_DIR)/Configure
 	touch $(OPENSSL_DIR)/.unpacked
 
