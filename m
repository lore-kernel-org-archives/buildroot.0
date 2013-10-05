From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  5 Oct 2013 16:16:12 +0200
Subject: [Buildroot] [PATCH 3/5] toolchain-external: add support for musl C
	library
In-Reply-To: <1380982574-16628-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1380982574-16628-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1380982574-16628-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds support for external toolchains based on the musl C
library, as available from http://www.musl-libc.org.

Note that the pre-built musl toolchains available from
http://musl.codu.org/ are not working for the moment, since they lack
sysroot support. However, this problem has been reported to the
maintainer, who has already added sysroot support in his scripts at
https://bitbucket.org/GregorR/musl-cross, and therefore the next
version of the pre-built toolchains should work with Buildroot
out-of-the-box. In the mean time, the musl-cross script must be used
to build the toolchain.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/Config.in                      |  9 +++++++++
 toolchain/helpers.mk                     | 11 +++++++++++
 toolchain/toolchain-external/Config.in   | 12 ++++++++++++
 toolchain/toolchain-external/ext-tool.mk | 11 ++++++++++-
 4 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 17be32a..61eb520 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -24,6 +24,15 @@ config BR2_TOOLCHAIN_USES_GLIBC
 config BR2_TOOLCHAIN_USES_UCLIBC
 	bool
 
+config BR2_TOOLCHAIN_USES_MUSL
+	bool
+	select BR2_LARGEFILE
+	select BR2_INET_IPV6
+	select BR2_USE_WCHAR
+	select BR2_ENABLE_LOCALE
+	select BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+
 choice
 	prompt "Toolchain type"
 	help
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index d5443b5..e8d4168 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -214,6 +214,17 @@ check_glibc = \
 	$(call check_glibc_rpc_feature,$${SYSROOT_DIR})
 
 #
+# Check that the selected C library is really musl
+#
+# $1: sysroot directory
+check_musl = \
+	SYSROOT_DIR="$(strip $1)"; \
+	if test ! -f $${SYSROOT_DIR}/lib/libc.so -o -e $${SYSROOT_DIR}/lib/libm.so ; then \
+		echo "Incorrect selection of the C library" ; \
+		exit -1; \
+	fi
+
+#
 # Check the conformity of Buildroot configuration with regard to the
 # uClibc configuration of the external toolchain, for a particular
 # feature.
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index c53577e..89c799e 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -860,6 +860,10 @@ config BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	bool
 	select BR2_TOOLCHAIN_USES_UCLIBC
 
+config BR2_TOOLCHAIN_EXTERNAL_MUSL
+	bool
+	select BR2_TOOLCHAIN_USES_MUSL
+
 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
 choice
@@ -882,6 +886,13 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
 	  eglibc configured to exclude key features may cause build failures to
 	  some packages.
 
+config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL
+	bool "musl"
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	help
+	  Select this option if your external toolchain uses the
+	  'musl' C library, available from http://www.musl-libc.org/.
+
 endchoice
 
 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
@@ -952,6 +963,7 @@ endif # BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 config BR2_TOOLCHAIN_EXTERNAL_INET_RPC
 	bool "Toolchain has RPC support?"
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on !BR2_TOOLCHAIN_EXTERNAL_MUSL
 	default y if BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	help
 	  Select this option if your external toolchain supports
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 8762a46..f642017 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -63,6 +63,10 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
 LIB_EXTERNAL_LIBS+=libnss_files.so.* libnss_dns.so.*
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
+LIB_EXTERNAL_LIBS += libc.so libgcc_s.so.*
+endif
+
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 USR_LIB_EXTERNAL_LIBS+=libstdc++.so.*
 endif
@@ -369,7 +373,7 @@ $(STAMP_DIR)/ext-toolchain-checked: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
 	@$(call MESSAGE,"Checking external toolchain settings")
 	$(Q)$(call check_cross_compiler_exists,$(TOOLCHAIN_EXTERNAL_CC))
 	$(Q)LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a)` ; \
-	SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:usr/lib(32|64)?/(.*/)?libc\.a::'` ; \
+	SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:(usr/)?lib(32|64)?/(.*/)?libc\.a::'` ; \
 	if test -z "$${SYSROOT_DIR}" ; then \
 		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
 		exit 1 ; \
@@ -384,6 +388,8 @@ $(STAMP_DIR)/ext-toolchain-checked: $(TOOLCHAIN_EXTERNAL_DEPENDENCIES)
 	fi ; \
 	if test "$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)" = "y" ; then \
 		$(call check_uclibc,$${SYSROOT_DIR}) ; \
+	elif test "$(BR2_TOOLCHAIN_EXTERNAL_MUSL)" = "y" ; then \
+		$(call check_musl,$${SYSROOT_DIR}) ; \
 	else \
 		$(call check_glibc,$${SYSROOT_DIR}) ; \
 	fi
@@ -464,6 +470,9 @@ $(STAMP_DIR)/ext-toolchain-installed: $(STAMP_DIR)/ext-toolchain-checked
 			$(call copy_toolchain_lib_root,$${ARCH_SYSROOT_DIR},$${SUPPORT_LIB_DIR},$${ARCH_LIB_DIR},$$libs,/usr/lib); \
 		done ; \
 	fi ; \
+	if test "$(BR2_TOOLCHAIN_EXTERNAL_MUSL)" = "y" ; then \
+		ln -sf libc.so $(TARGET_DIR)/lib/ld-musl-arm.so.1 ; \
+	fi ; \
 	$(call MESSAGE,"Copying external toolchain sysroot to staging...") ; \
 	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR}) ; \
 	if test "$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)" = "y"; then \
-- 
1.8.1.2
