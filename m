From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 21 Mar 2007 10:53:02 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/microcom
Message-ID: <20070321175302.470B148085@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-21 10:53:00 -0700 (Wed, 21 Mar 2007)
New Revision: 18196

Log:
- support BR2_PREFER_IMA for microcom


Modified:
   trunk/buildroot/package/microcom/microcom.mk


Changeset:
Modified: trunk/buildroot/package/microcom/microcom.mk
===================================================================
--- trunk/buildroot/package/microcom/microcom.mk	2007-03-21 10:55:31 UTC (rev 18195)
+++ trunk/buildroot/package/microcom/microcom.mk	2007-03-21 17:53:00 UTC (rev 18196)
@@ -45,10 +45,14 @@
 	touch $@
 
 $(MICROCOM_DIR)/microcom: $(MICROCOM_DIR)/.configured
+ifeq ($(BR2_PREFER_IMA),y)
+	(cd $(MICROCOM_DIR) ; \
+	 $(TARGET_CC) $(TARGET_CFLAGS) $(CFLAGS_COMBINE) \
+	 	$(CFLAGS_WHOLE_PROGRAM) -o $@ $(wildcard $(MICROCOM_DIR)/*.c); \
+	)
+else
 	$(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS)" $(MAKE) -C $(MICROCOM_DIR)
-	#(cd $(MICROCOM_DIR) ; \
-	# $(TARGET_CC) $(TARGET_CFLAGS) --combine -fwhole-program -o $@ $(wildcard $(MICROCOM_DIR)/*.c); \
-	#)
+endif
 	$(STRIP) -s $@
 
 $(TARGET_DIR)/usr/bin/microcom: $(MICROCOM_DIR)/microcom
