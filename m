From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 22:55:29 +0200
Subject: [Buildroot] [git commit] toolchain-external: remove useless shell
	continuations
Message-ID: <20160425211729.A3DCA81E21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed2a15b79136db815e034aa9e5aa0635e91222ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When a message with MESSAGE, we can print it as the first command of
the command sequence, and in this case, we don't need to use a shell
continuation.

In one case, the call to MESSAGE is moved a few lines up in the
sequence of commands.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 94ec0da..2620fb8 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -622,8 +622,8 @@ endef
 
 ifeq ($(BR2_STATIC_LIBS),)
 define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
-	$(Q)$(call MESSAGE,"Copying external toolchain libraries to target...") ; \
-	for libs in $(TOOLCHAIN_EXTERNAL_LIBS); do \
+	$(Q)$(call MESSAGE,"Copying external toolchain libraries to target...")
+	$(Q)for libs in $(TOOLCHAIN_EXTERNAL_LIBS); do \
 		$(call copy_toolchain_lib_root,$$libs); \
 	done
 endef
@@ -631,9 +631,9 @@ endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),y)
 define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_GDBSERVER
+	$(Q)$(call MESSAGE,"Copying gdbserver")
 	$(Q)ARCH_SYSROOT_DIR="$(call toolchain_find_sysroot,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
 	ARCH_LIB_DIR="$(call toolchain_find_libdir,$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
-	$(call MESSAGE,"Copying gdbserver") ; \
 	gdbserver_found=0 ; \
 	for d in $${ARCH_SYSROOT_DIR}/usr \
 		 $${ARCH_SYSROOT_DIR}/../debug-root/usr \
@@ -678,8 +678,8 @@ endef
 # target filesystem.
 ifeq ($(BR2_BFIN_INSTALL_FDPIC_SHARED),y)
 define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC
-	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to staging...") ; \
-	FDPIC_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))/../../bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc ; \
+	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to staging...")
+	$(Q)FDPIC_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))/../../bfin-linux-uclibc/bin/bfin-linux-uclibc-gcc ; \
 	FDPIC_SYSROOT_DIR="$(call toolchain_find_sysroot,$${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
 	FDPIC_LIB_DIR="$(call toolchain_find_libdir,$${FDPIC_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS))" ; \
 	FDPIC_SUPPORT_LIB_DIR="" ; \
@@ -692,8 +692,8 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC
 	$(call copy_toolchain_sysroot,$${FDPIC_SYSROOT_DIR},$${FDPIC_SYSROOT_DIR},,$${FDPIC_LIB_DIR},$${FDPIC_SUPPORT_LIB_DIR})
 endef
 define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FDPIC
-	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to target...") ; \
-	for libs in $(TOOLCHAIN_EXTERNAL_LIBS); do \
+	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to target...")
+	$(Q)for libs in $(TOOLCHAIN_EXTERNAL_LIBS); do \
 		$(call copy_toolchain_lib_root,$$libs); \
 	done
 endef
@@ -707,8 +707,8 @@ endif
 # the standard C library. Customer libraries can use 4 and above.
 ifeq ($(BR2_BFIN_INSTALL_FLAT_SHARED),y)
 define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_BFIN_FLAT
-	$(Q)$(call MESSAGE,"Install external toolchain FLAT libraries to target...") ; \
-	FLAT_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))../../bfin-uclinux/bin/bfin-uclinux-gcc ; \
+	$(Q)$(call MESSAGE,"Install external toolchain FLAT libraries to target...")
+	$(Q)FLAT_EXTERNAL_CC=$(dir $(TOOLCHAIN_EXTERNAL_CC))../../bfin-uclinux/bin/bfin-uclinux-gcc ; \
 	FLAT_LIBC_A_LOCATION=`$${FLAT_EXTERNAL_CC} $(TOOLCHAIN_EXTERNAL_CFLAGS) -mid-shared-library -print-file-name=libc`; \
 	if [ -f $${FLAT_LIBC_A_LOCATION} -a ! -h $${FLAT_LIBC_A_LOCATION} ] ; then \
 	        $(INSTALL) -D $${FLAT_LIBC_A_LOCATION} $(TARGET_DIR)/lib/lib1.so; \
