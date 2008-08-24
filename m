From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 24 Aug 2008 00:48:22 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gdb
Message-ID: <20080824074822.948193C2BA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-24 00:48:22 -0700 (Sun, 24 Aug 2008)
New Revision: 23193

Log:
toolchain/gdb: unbreak target gdb support

r22624 (Ulf: Add prepatched AVR32 gcc-4.2.2 toolchain) broke target gdb
support as it tries to apply gdb patches twice. Unbreak it.

Closes #3954.

Modified:
   trunk/buildroot/toolchain/gdb/gdb.mk


Changeset:
Modified: trunk/buildroot/toolchain/gdb/gdb.mk
===================================================================
--- trunk/buildroot/toolchain/gdb/gdb.mk	2008-08-24 07:48:15 UTC (rev 23192)
+++ trunk/buildroot/toolchain/gdb/gdb.mk	2008-08-24 07:48:22 UTC (rev 23193)
@@ -62,10 +62,6 @@
 	touch $@
 
 gdb-patched: $(GDB_DIR)/.unpacked
-$(GDB_DIR)/.patched: $(GDB_DIR)/.unpacked
-	toolchain/patch-kernel.sh $(GDB_DIR) $(GDB_PATCH_DIR) \*.patch
-	$(CONFIG_UPDATE) $(GDB_DIR)
-	touch $@
 
 gdb-dirclean:
 	rm -rf $(GDB_DIR)
@@ -88,7 +84,7 @@
 	bash_cv_func_sigsetjmp=present \
 	bash_cv_have_mbstate_t=yes
 
-$(GDB_TARGET_DIR)/.configured: $(GDB_DIR)/.patched
+$(GDB_TARGET_DIR)/.configured: $(GDB_DIR)/.unpacked
 	mkdir -p $(GDB_TARGET_DIR)
 	(cd $(GDB_TARGET_DIR); \
 		gdb_cv_func_sigsetjmp=yes \
