From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sun,  6 May 2007 21:01:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tftpd
Message-ID: <20070507040158.92D4E48573@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-05-06 21:01:58 -0700 (Sun, 06 May 2007)
New Revision: 18577

Log:
Install the default script only if one was not found from the platform.


Modified:
   trunk/buildroot/package/tftpd/tftpd.mk


Changeset:
Modified: trunk/buildroot/package/tftpd/tftpd.mk
===================================================================
--- trunk/buildroot/package/tftpd/tftpd.mk	2007-05-07 04:01:24 UTC (rev 18576)
+++ trunk/buildroot/package/tftpd/tftpd.mk	2007-05-07 04:01:58 UTC (rev 18577)
@@ -58,13 +58,15 @@
 	    set -x; \
 	    rm -f $(TARGET_DIR)/$(TFTP_HPA_TARGET_BINARY); \
 	    cp -a $(TFTP_HPA_DIR)/$(TFTP_HPA_BINARY) $(TARGET_DIR)/$(TFTP_HPA_TARGET_BINARY); fi ;
-	$(INSTALL) -D -m 0755 package/tftpd/init-tftpd $(TARGET_DIR)/etc/init.d/S80tftpd-hpa
+	@if [ ! -f $(TARGET_DIR)/etc/init.d/S80tftpd-hpa ] ; then \
+		$(INSTALL) -m 0755 -D package/tftpd/init-tftpd $(TARGET_DIR)/etc/init.d/S80tftpd-hpa; \
+	fi;
 
 tftpd: uclibc $(TARGET_DIR)/$(TFTP_HPA_TARGET_BINARY)
 
 tftpd-clean:
-	rm -rf $(TARGET_DIR)/etc/init.d/S80tftpd-hpa
-	rm -rf $(TARGET_DIR)/usr/sbin/in.tftpd
+	rm -f $(TARGET_DIR)/etc/init.d/S80tftpd-hpa
+	rm -f $(TARGET_DIR)/usr/sbin/in.tftpd
 	-$(MAKE) -C $(TFTP_HPA_DIR) clean
 
 tftpd-dirclean:
