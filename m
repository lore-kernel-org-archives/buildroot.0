From: Brian Beattie <beattie@beattie-home.net>
Date: Tue, 08 Jul 2008 11:42:37 -0700
Subject: [Buildroot] Forcing a kernel rebuild
Message-ID: <1215542557.6277.21.camel@kokopelli>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm doing some kernel module development and need to rebuild the kernel
modules.  Now I can do this by setting the environment to use the
buildroot cross compiler and running make from within the
project_{ARCH}/${BOARD}/linux-2.4.24 directory, but I'd really like to
just run make from the buildroot directory and have all the cross
compile stuff taken care of.

If there is currently a way to force the kernel modules to be rebuilt I
have not found it, so I added some targets to target/linux/Makefile.in*
so that a "make linux26-touch" will touch .configured in the kernel
directory forcing a kernel and kernel modules recompile for the next
"make".  I have attached a patch for this and would be interested is
discussing this approach.  I'm open to any to get this functionality.

-- 
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting a bad thing?

Brian Beattie   LFS12947 | "Honor isn't about making the right choices.
beattie at beattie-home.net | It's about dealing with the consequences."
www.beattie-home.net     | -- Midori Koto

------------- Patch Follows ------------------
Index: target/linux/Makefile.in
===================================================================
--- target/linux/Makefile.in	(revision 22673)
+++ target/linux/Makefile.in	(working copy)
@@ -184,6 +184,9 @@
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) oldconfig
 	touch $@
 
+$(LINUX26_DIR)/.touch:
+	touch $(LINUX26_DIR)/.configured
+
 $(LINUX26_DIR)/.depend_done: $(LINUX26_DIR)/.configured
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) prepare
 	touch $@
@@ -230,6 +233,8 @@
 
 linux26-config: host-sed $(LINUX26_DIR)/.configured
 
+linux26-touch:	 $(LINUX26_DIR)/.touch
+
 linux26-update:
 	cp -dpf $(LINUX26_DIR)/.config $(LINUX26_KCONFIG)
 
Index: target/linux/Makefile.in.advanced
===================================================================
--- target/linux/Makefile.in.advanced	(revision 22673)
+++ target/linux/Makefile.in.advanced	(working copy)
@@ -378,6 +378,9 @@
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) prepare
 	touch $@
 
+$(LINUX26_DIR)/.touch:
+	touch $(LINUX26_DIR)/.configured
+
 $(LINUX26_DIR)/$(LINUX26_BINLOC): $(INITRAMFS_TARGET)
$(BB_INITRAMFS_TARGET) \
 		$(LINUX26_DIR)/.depend_done
 	$(MAKE) $(LINUX26_MAKE_FLAGS) \
@@ -451,6 +454,8 @@
 
 linux26-config: host-sed $(LINUX26_DIR)/.configured
 
+linux26-touch:	$(LINUX26_DIR)/.touch
+
 linux26-update:
 	cp -dpf $(LINUX26_DIR)/.config $(LINUX26_KCONFIG)
 
