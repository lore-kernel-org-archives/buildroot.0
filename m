From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 16 Mar 2010 20:00:20 +0000 (UTC)
Subject: [Buildroot] Packages won't build after update to 2010.2
References: <hnom3e$46n$1@dough.gmane.org>
Message-ID: <hnoo0k$9t2$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-03-16, Grant Edwards <grant.b.edwards@gmail.com> wrote:

> After updating to 2010.2, the updated versions of a several packages
> won't build.  For example, busybox-1.16 fails like this:
[...]
>    /home/nextgen/buildroot/toolchain/usr/bin/arm-linux-gcc -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -$
>    ==========
>    /home/nextgen/buildroot/toolchain/usr/bin/../lib/gcc/arm-linux-uclibc/4.4.3/../../../../arm-linux-uclibc/bin/ld: crt1.o: No such file: No such file or directory
>    collect2: ld returned 1 exit status

> I believe the failure is due to the fact that no --sysroot option is
> being specified in the link command.

The patch below seems to fix the problem.  I don't really understand
why it worked before. That was with gcc 4.3 instead of gcc 4.4, so it
could be that 4.4 is pickier about locating library files.

I'll file a bug report and submit the patch.


Index: busybox.mk
===================================================================
--- busybox.mk	(revision 11)
+++ busybox.mk	(working copy)
@@ -101,12 +101,14 @@
 	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
 		ARCH=$(KERNEL_ARCH) \
+		EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
 		EXTRA_CFLAGS="$(BUSYBOX_CFLAGS)" -C $(BUSYBOX_DIR)
 ifeq ($(BR2_PREFER_IMA)$(BR2_PACKAGE_BUSYBOX_SNAPSHOT),yy)
 	rm -f $@
 	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
 		ARCH=$(KERNEL_ARCH) STRIP="$(STRIPCMD)" \
+		EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
 		EXTRA_CFLAGS="$(BUSYBOX_CFLAGS)" -C $(BUSYBOX_DIR) \
 		-f scripts/Makefile.IMA
 endif
@@ -116,6 +118,7 @@
 	$(MAKE) CC=$(TARGET_CC) CROSS_COMPILE="$(TARGET_CROSS)" \
 		CROSS="$(TARGET_CROSS)" PREFIX="$(TARGET_DIR)" \
 		ARCH=$(KERNEL_ARCH) \
+		EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
 		EXTRA_CFLAGS="$(BUSYBOX_CFLAGS)" -C $(BUSYBOX_DIR) install
 else
 	install -D -m 0755 $(BUSYBOX_DIR)/busybox $(TARGET_DIR)/bin/busybox
