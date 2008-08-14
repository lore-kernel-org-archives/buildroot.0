From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Thu, 14 Aug 2008 22:51:49 +0200
Subject: [Buildroot] GDB attempting to apply patches severla times
In-Reply-To: <2590773a0808141256m12ee7203i5597833fa132c05@mail.gmail.com>
References: <2590773a0808141241u4210fa5bh114585858cff6080@mail.gmail.com>
	<2590773a0808141245y57fe1166n3d1646ab285b9824@mail.gmail.com>
	<2590773a0808141256m12ee7203i5597833fa132c05@mail.gmail.com>
Message-ID: <200808142251.50196.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christopher Taylor, 14.08.2008:
> 
> does the attached patch work for anyone besides me?

I think there is another issue in the file: when building for the server or
the host, then it's not patched anymore now. Only when building for the
target, the source would have been patched. Perhaps the patching in the
configuring target was a bad fix?

Here's the patch without having tested anything:

fixes:
* remove patching in the unpacking target (your change)
* also patch before configuring the server or host
* correct prerequisite for target gdb-patched

diff --git a/toolchain/gdb/gdb.mk b/toolchain/gdb/gdb.mk
index 6220cd9..d156758 100644
--- a/toolchain/gdb/gdb.mk
+++ b/toolchain/gdb/gdb.mk
@@ -57,11 +57,8 @@ ifeq ($(GDB_VERSION),snapshot)
 		tar jtf $(DL_DIR)/$(GDB_SOURCE) | head -1 | cut -d"/" -f1)
 	ln -sf $(TOOL_BUILD_DIR)/$(shell tar jtf $(DL_DIR)/$(GDB_SOURCE) | head -1 | cut -d"/" -f1) $(GDB_DIR)
 endif
-	toolchain/patch-kernel.sh $(GDB_DIR) $(GDB_PATCH_DIR) \*.patch
-	$(CONFIG_UPDATE) $(GDB_DIR)
-	touch $@
 
-gdb-patched: $(GDB_DIR)/.unpacked
+gdb-patched: $(GDB_DIR)/.patched
 $(GDB_DIR)/.patched: $(GDB_DIR)/.unpacked
 	toolchain/patch-kernel.sh $(GDB_DIR) $(GDB_PATCH_DIR) \*.patch
 	$(CONFIG_UPDATE) $(GDB_DIR)
@@ -140,7 +137,7 @@ gdb_target-dirclean:
 
 GDB_SERVER_DIR:=$(BUILD_DIR)/gdbserver-$(GDB_VERSION)
 
-$(GDB_SERVER_DIR)/.configured: $(GDB_DIR)/.unpacked
+$(GDB_SERVER_DIR)/.configured: $(GDB_DIR)/.patched
 	mkdir -p $(GDB_SERVER_DIR)
 	(cd $(GDB_SERVER_DIR); \
 		$(TARGET_CONFIGURE_OPTS) \
@@ -198,7 +195,7 @@ gdbserver-dirclean:
 
 GDB_HOST_DIR:=$(TOOL_BUILD_DIR)/gdbhost-$(GDB_VERSION)
 
-$(GDB_HOST_DIR)/.configured: $(GDB_DIR)/.unpacked
+$(GDB_HOST_DIR)/.configured: $(GDB_DIR)/.patched
 	mkdir -p $(GDB_HOST_DIR)
 	(cd $(GDB_HOST_DIR); \
 		gdb_cv_func_sigsetjmp=yes \
