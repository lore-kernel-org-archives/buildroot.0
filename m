From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Mon, 16 Jul 2007 17:25:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lockfile-progs
Message-ID: <20070717002532.5AB9030095@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-16 17:25:31 -0700 (Mon, 16 Jul 2007)
New Revision: 19124

Log:
Fix build directives and clean target screwed up by me.


Modified:
   trunk/buildroot/package/lockfile-progs/lockfile-progs.mk


Changeset:
Modified: trunk/buildroot/package/lockfile-progs/lockfile-progs.mk
===================================================================
--- trunk/buildroot/package/lockfile-progs/lockfile-progs.mk	2007-07-17 00:24:54 UTC (rev 19123)
+++ trunk/buildroot/package/lockfile-progs/lockfile-progs.mk	2007-07-17 00:25:31 UTC (rev 19124)
@@ -20,14 +20,15 @@
 	touch $(LOCKFILE_PROGS_DIR)/.unpacked
 
 $(TARGET_DIR)/$(LOCKFILE_PROGS_BINARY): $(LOCKFILE_PROGS_DIR)/.unpacked
-	$(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS)" -C $(LOCKFILE_PROGS_DIR)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) LDFLAGS="$(TARGET_LDFLAGS)"	\
+		-C $(LOCKFILE_PROGS_DIR)
 	cp -a $(LOCKFILE_PROGS_DIR)/bin/lockfile* $(TARGET_DIR)/usr/bin
 	$(STRIP) --strip-unneeded $(TARGET_DIR)/$(LOCKFILE_PROGS_BINARY)
 
 lockfile-progs: uclibc liblockfile $(TARGET_DIR)/$(LOCKFILE_PROGS_BINARY)
 
 lockfile-progs-clean:
-	rm -f $(TARGET_DIR)/usr/bin/lockfile*Z
+	rm -f $(TARGET_DIR)/usr/bin/lockfile-*
 	$(MAKE) -C $(LOCKFILE_PROGS_DIR) clean
 
 lockfile-progs-dirclean:
