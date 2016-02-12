From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 12 Feb 2016 20:20:26 +0100
Subject: [Buildroot] [PATCH 5/5] toolchain-external: unify LIB_EXTERNAL_LIBS
	and USR_LIB_EXTERNAL_LIBS
In-Reply-To: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
References: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1455304826-10557-6-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

With the alignment of toolchain library location in target and staging,
there is no need anymore for the distinction between LIB_EXTERNAL_LIBS and
USR_LIB_EXTERNAL_LIBS. Unify them into TOOLCHAIN_EXTERNAL_LIBS.

Related, update the help text of
BR2_TOOLCHAIN_EXTRA_TOOLCHAIN_EXTERNAL_LIBS.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 toolchain/toolchain-external/Config.in             |  3 +--
 toolchain/toolchain-external/toolchain-external.mk | 22 +++++++++++-----------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 7ba3929..9d81a2e 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -1006,8 +1006,7 @@ config BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
 	help
 	  If your external toolchain provides extra libraries that
 	  need to be copied to the target filesystem, enter them
-	  here, separated by spaces. They will be copied to the
-	  target's /lib directory.
+	  here, separated by spaces.
 
 endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index a333c32..bd1a807 100644
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
@@ -593,7 +593,7 @@ endef
 define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS
 	$(Q)if test -z "$(BR2_STATIC_LIBS)" ; then \
 		$(call MESSAGE,"Copying external toolchain libraries to target...") ; \
-		for libs in $(LIB_EXTERNAL_LIBS) $(USR_LIB_EXTERNAL_LIBS); do \
+		for libs in $(TOOLCHAIN_EXTERNAL_LIBS); do \
 			$(call copy_toolchain_lib_root,$$libs); \
 		done ; \
 	fi
@@ -663,7 +663,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS_BFIN_FDPIC
 endef
 define TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC
 	$(Q)$(call MESSAGE,"Install external toolchain FDPIC libraries to target...") ; \
-	for libs in $(LIB_EXTERNAL_LIBS) $(USR_LIB_EXTERNAL_LIBS); do \
+	for libs in $(TOOLCHAIN_EXTERNAL_LIBS); do \
 		$(call copy_toolchain_lib_root,$$libs); \
 	done
 endef
-- 
2.4.10
