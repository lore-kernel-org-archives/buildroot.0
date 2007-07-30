From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 30 Jul 2007 05:37:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/ext2
Message-ID: <20070730123717.74805A4607@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-30 05:37:16 -0700 (Mon, 30 Jul 2007)
New Revision: 19339

Log:
- test if dir exists before trying to rmdir it.
  Fixes failure due to non-existing usr/share dir on the target.


Modified:
   trunk/buildroot/target/ext2/ext2root.mk


Changeset:
Modified: trunk/buildroot/target/ext2/ext2root.mk
===================================================================
--- trunk/buildroot/target/ext2/ext2root.mk	2007-07-30 12:32:37 UTC (rev 19338)
+++ trunk/buildroot/target/ext2/ext2root.mk	2007-07-30 12:37:16 UTC (rev 19339)
@@ -91,7 +91,8 @@
 	@rm -rf $(TARGET_DIR)/usr/man
 	@rm -rf $(TARGET_DIR)/usr/share/man
 	@rm -rf $(TARGET_DIR)/usr/info
-	@rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
+	@test -d $(TARGET_DIR)/usr/share && \
+		rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
 	-/sbin/ldconfig -r $(TARGET_DIR) 2>/dev/null
 	# Use fakeroot to pretend all target binaries are owned by root
 	rm -f $(STAGING_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))
