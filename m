From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Dec 2014 23:22:10 +0100
Subject: [Buildroot] [PATCH 4/4] toolchain/external: add option to install
	libssp
In-Reply-To: <cover.1419977553.git.yann.morin.1998@free.fr>
References: <cover.1419977553.git.yann.morin.1998@free.fr>
Message-ID: <15e521114fdad342030ec2a699e44190188a3cd2.1419977553.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While SSP support (guard and handler) is usually provided by the C
library, it is not always true, and can be provided by a third-party
implementation, such as the one from gcc.

Add an option the user can set if their toolchain uses libssp to provide
SSP support.

Also add a sanity check to verify the setting is correct.

Note: we need not add a -lssp or -lssp_nonshared to TARGET_LDFLAGS,
because that is handled automatically by gcc.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk                               | 25 ++++++++++++++++++++--
 toolchain/toolchain-external/Config.in             | 13 +++++++++++
 toolchain/toolchain-external/toolchain-external.mk |  3 +++
 3 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 3121da4..067c450 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -221,7 +221,8 @@ check_glibc = \
 		exit -1; \
 	fi; \
 	$(call check_glibc_feature,BR2_USE_MMU,MMU support) ;\
-	$(call check_glibc_rpc_feature,$${SYSROOT_DIR})
+	$(call check_glibc_rpc_feature,$${SYSROOT_DIR}); \
+	$(call check_libssp,$${SYSROOT_DIR})
 
 #
 # Check that the selected C library really is musl
@@ -281,7 +282,27 @@ check_uclibc = \
 	$(call check_uclibc_feature,__UCLIBC_HAS_THREADS__,BR2_TOOLCHAIN_HAS_THREADS,$${UCLIBC_CONFIG_FILE},Thread support) ;\
 	$(call check_uclibc_feature,__PTHREADS_DEBUG_SUPPORT__,BR2_TOOLCHAIN_HAS_THREADS_DEBUG,$${UCLIBC_CONFIG_FILE},Thread debugging support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_THREADS_NATIVE__,BR2_TOOLCHAIN_HAS_THREADS_NPTL,$${UCLIBC_CONFIG_FILE},NPTL thread support) ;\
-	$(call check_uclibc_feature,__UCLIBC_HAS_SSP__,BR2_TOOLCHAIN_HAS_SSP,$${UCLIBC_CONFIG_FILE},Stack Smashing Protection support)
+	$(call check_uclibc_feature,__UCLIBC_HAS_SSP__,BR2_TOOLCHAIN_HAS_SSP,$${UCLIBC_CONFIG_FILE},Stack Smashing Protection support); \
+	$(call check_libssp,$${SYSROOT_DIR})
+
+#
+# Check if SSP support is provided by an external libssp
+#
+# $1: sysroot directory
+#
+check_libssp = \
+	if test -n "$(BR2_TOOLCHAIN_HAS_SSP)" ; then \
+		SYSROOT_DIR="${strip $1}"; \
+		has_libssp=`find $${SYSROOT_DIR}/ -name 'libssp.so*' |wc -l`; \
+		if test $${has_libssp} -eq 0 -a -n "$(BR2_TOOLCHAIN_HAS_LIBSSP)" ; then \
+			echo "SSP support is not provided by libssp, please disable BR2_TOOLCHAIN_EXTERNAL_HAS_LIBSSP"; \
+			exit 1; \
+		fi; \
+		if test $${has_libssp} -ne 0 -a -z "$(BR2_TOOLCHAIN_HAS_LIBSSP)"; then \
+			echo "SSP support is provided by libssp, please enable BR2_TOOLCHAIN_EXTERNAL_HAS_LIBSSP"; \
+			exit 1; \
+		fi; \
+	fi
 
 #
 # Check that the Buildroot configuration of the ABI matches the
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 50daa66..e2aad19 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -1237,6 +1237,19 @@ config BR2_TOOLCHAIN_EXTERNAL_HAS_SSP
 
 endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 
+config BR2_TOOLCHAIN_EXTERNAL_HAS_LIBSSP
+	bool "SSP support is provided by libssp?"
+	depends on BR2_TOOLCHAIN_HAS_SSP
+	depends on !BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	select BR2_TOOLCHAIN_HAS_LIBSSP
+	help
+	  In most cases, SSP support is provided by the C library.
+	  If this is not the case, it is be provided from gcc's libssp,
+	  in which case you should say 'y' here.
+
+	  If you do not know, leave the default value ('n'), Buildroot
+	  will tell you if it's correct or not.
+
 config BR2_TOOLCHAIN_EXTERNAL_INET_RPC
 	bool "Toolchain has RPC support?"
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index b07b16c..75c356e 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -74,6 +74,9 @@ ifneq ($(BR2_PACKAGE_GDB)$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),)
 LIB_EXTERNAL_LIBS += libthread_db.so.*
 endif # gdbserver
 endif # ! no threads
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_HAS_LIBSSP),y)
+USR_LIB_EXTERNAL_LIBS += libssp.so.*
+endif
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
-- 
1.9.1
