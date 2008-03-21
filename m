From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Fri, 21 Mar 2008 10:57:03 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080321175703.05CD03C31A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-21 10:57:02 -0700 (Fri, 21 Mar 2008)
New Revision: 21441

Log:
kernel 2.6.24 creates a symlink to bzImage, which is copied inplace, symlink and all, this gives an incorrect symlink deref in binaries/uclibc/ and points to ../../x86/bzImage. Do not copy symlink in place, follow it. Patch by Nigel Kukard.


Modified:
   trunk/buildroot/target/linux/Makefile.in


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2008-03-21 17:56:00 UTC (rev 21440)
+++ trunk/buildroot/target/linux/Makefile.in	2008-03-21 17:57:02 UTC (rev 21441)
@@ -191,7 +191,7 @@
 		$(LINUX26_DIR)/.depend_done
 	$(MAKE) $(LINUX26_MAKE_FLAGS) \
 		-C $(LINUX26_DIR) $(LINUX26_FORMAT)
-	cp -dpf $(LINUX26_DIR)/$(LINUX26_BINLOC) $(LINUX26_KERNEL)
+	cp -pf $(LINUX26_DIR)/$(LINUX26_BINLOC) $(LINUX26_KERNEL)
 	touch -c $@
 
 $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep: $(LINUX26_DIR)/.configured
