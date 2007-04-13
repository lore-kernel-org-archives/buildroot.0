From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Thu, 12 Apr 2007 19:43:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/file
Message-ID: <20070413024329.24C704808A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-04-12 19:43:28 -0700 (Thu, 12 Apr 2007)
New Revision: 18423

Log:
Need the target LDFLAGS for this to link using external toolchain.


Modified:
   trunk/buildroot/package/file/file.mk


Changeset:
Modified: trunk/buildroot/package/file/file.mk
===================================================================
--- trunk/buildroot/package/file/file.mk	2007-04-13 02:04:32 UTC (rev 18422)
+++ trunk/buildroot/package/file/file.mk	2007-04-13 02:43:28 UTC (rev 18423)
@@ -86,10 +86,10 @@
 	touch $(FILE_DIR2)/.configured
 
 $(FILE_DIR2)/$(FILE_BINARY): $(FILE_DIR2)/.configured $(TOOL_BUILD_DIR)/bin/file
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) LDFLAGS="-static" -C $(FILE_DIR2)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) LDFLAGS="$(TARGET_LDFLAGS) -static" -C $(FILE_DIR2)
 
 $(TARGET_DIR)/$(FILE_TARGET_BINARY): $(FILE_DIR2)/$(FILE_BINARY)
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) -C $(FILE_DIR2) install
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) LDFLAGS="$(TARGET_LDFLAGS)" DESTDIR=$(TARGET_DIR) -C $(FILE_DIR2) install
 	-($(STRIP) $(TARGET_DIR)/usr/lib/libmagic.so.*.* > /dev/null 2>&1)
 	rm -rf $(TARGET_DIR)/share/locale $(TARGET_DIR)/usr/info \
 		$(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/doc
