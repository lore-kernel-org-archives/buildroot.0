From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Apr 2016 22:48:56 +0200
Subject: [Buildroot] [git commit] toolchain-external: unify
	LIB_EXTERNAL_LIBS and USR_LIB_EXTERNAL_LIBS
Message-ID: <20160425211729.8FB747FF24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=919b4f9eab3e6dcd18cf9220af2c9bb2ca3e5098
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the alignment of toolchain library location in target and staging,
there is no need anymore for the distinction between LIB_EXTERNAL_LIBS and
USR_LIB_EXTERNAL_LIBS. Unify them into TOOLCHAIN_EXTERNAL_LIBS.

Related, update the help text of
BR2_TOOLCHAIN_EXTRA_TOOLCHAIN_EXTERNAL_LIBS.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in             |  3 +--
 toolchain/toolchain-external/toolchain-external.mk | 22 +++++++++++-----------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index f497694..cd86176 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -1052,8 +1052,7 @@ config BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
 	help
 	  If your external toolchain provides extra libraries that
 	  need to be copied to the target filesystem, enter them
-	  here, separated by spaces. They will be copied to the
-	  target's /lib directory.
+	  here, separated by spaces.
 
 endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 906001a..3553745 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -64,33 +64,33 @@
 #  of Buildroot is handled identical for the 2 toolchain types.
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
-LIB_EXTERNAL_LIBS += libatomic.so.* libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
+TOOLCHAIN_EXTERNAL_LIBS += libatomic.so.* libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_ARM_EABIHF),yy)
-LIB_EXTERNAL_LIBS += ld-linux-armhf.so.*
+TOOLCHAIN_EXTERNAL_LIBS += ld-linux-armhf.so.*
 else
-LIB_EXTERNAL_LIBS += ld*.so.*
+TOOLCHAIN_EXTERNAL_LIBS += ld*.so.*
 endif
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-LIB_EXTERNAL_LIBS += libpthread.so.*
+TOOLCHAIN_EXTERNAL_LIBS += libpthread.so.*
 ifneq ($(BR2_PACKAGE_GDB)$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),)
-LIB_EXTERNAL_LIBS += libthread_db.so.*
+TOOLCHAIN_EXTERNAL_LIBS += libthread_db.so.*
 endif # gdbserver
 endif # ! no threads
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
-LIB_EXTERNAL_LIBS += libnss_files.so.* libnss_dns.so.*
+TOOLCHAIN_EXTERNAL_LIBS += libnss_files.so.* libnss_dns.so.*
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
-LIB_EXTERNAL_LIBS += libc.so libgcc_s.so.*
+TOOLCHAIN_EXTERNAL_LIBS += libc.so libgcc_s.so.*
 endif
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-USR_LIB_EXTERNAL_LIBS += libstdc++.so.*
+TOOLCHAIN_EXTERNAL_LIBS += libstdc++.so.*
 endif
 
-LIB_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS))
+TOOLCHAIN_EXTERNAL_LIBS += $(call qstrip,$(BR2_TOOLCHAIN_EXTRA_TOOLCHAIN_EXTERNAL_LIBS))
 
 # Details about sysroot directory selection.
 #
@@ -623,7 +623,7 @@ endef
 ifeq ($(BR2_STATIC_LIBS),)
 define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
 	$(Q)$(call MESSAGE,"Copying external toolchain libraries to target...") ; \
-	for libs in $(LIB_EXTERNAL_LIBS) $(USR_LIB_EXTERNAL_LIBS); do \
+	for libs in $(TOOLCHAIN_EXTERNAL_LIBS); do \
 		$(call copy_toolchain_lib_root,$$libs); \
 	done
 endef
@@ -693,7 +693,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC
 endef
 define TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC
 	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to target...") ; \
-	for libs in $(LIB_EXTERNAL_LIBS) $(USR_LIB_EXTERNAL_LIBS); do \
+	for libs in $(TOOLCHAIN_EXTERNAL_LIBS); do \
 		$(call copy_toolchain_lib_root,$$libs); \
 	done
 endef
