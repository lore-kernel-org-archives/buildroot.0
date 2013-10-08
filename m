From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Oct 2013 20:17:09 +0200
Subject: [Buildroot] [PATCHv3 12/20] toolchain-external: add support for
	musl C library
In-Reply-To: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1381256237-27948-13-git-send-email-thomas.petazzoni@free-electrons.com>
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
 toolchain/Config.in                                |  9 +++++++++
 toolchain/helpers.mk                               | 11 +++++++++++
 toolchain/toolchain-external/Config.in             | 12 ++++++++++++
 toolchain/toolchain-external/toolchain-external.mk | 18 +++++++++++++++++-
 4 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 0f9a7dd..3980d79 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -15,6 +15,15 @@ config BR2_TOOLCHAIN_USES_GLIBC
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
index b530a02..dfeef76 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -210,6 +210,17 @@ check_glibc = \
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
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 2bfe64a..b2266b6 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -68,6 +68,10 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC),y)
 LIB_EXTERNAL_LIBS+=libnss_files.so.* libnss_dns.so.*
 endif
 
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
+LIB_EXTERNAL_LIBS += libc.so libgcc_s.so.*
+endif
+
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 USR_LIB_EXTERNAL_LIBS+=libstdc++.so.*
 endif
@@ -353,7 +357,7 @@ endif
 define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 	$(Q)$(call check_cross_compiler_exists,$(TOOLCHAIN_EXTERNAL_CC))
 	$(Q)LIBC_A_LOCATION=`readlink -f $$(LANG=C $(TOOLCHAIN_EXTERNAL_CC) -print-file-name=libc.a)` ; \
-	SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:usr/lib(32|64)?/(.*/)?libc\.a::'` ; \
+	SYSROOT_DIR=`echo $${LIBC_A_LOCATION} | sed -r -e 's:(usr/)?lib(32|64)?/(.*/)?libc\.a::'` ; \
 	if test -z "$${SYSROOT_DIR}" ; then \
 		@echo "External toolchain doesn't support --sysroot. Cannot use." ; \
 		exit 1 ; \
@@ -368,11 +372,23 @@ define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 	fi ; \
 	if test "$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC)" = "y" ; then \
 		$(call check_uclibc,$${SYSROOT_DIR}) ; \
+	elif test "$(BR2_TOOLCHAIN_EXTERNAL_MUSL)" = "y" ; then \
+		$(call check_musl,$${SYSROOT_DIR}) ; \
 	else \
 		$(call check_glibc,$${SYSROOT_DIR}) ; \
 	fi
 endef
 
+# With the musl C library, the libc.so library directly plays the role
+# of the dynamic library loader. We just need to create a symbolic
+# link to libc.so with the appropriate name.
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
+define TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
+	ln -sf libc.so $(TARGET_DIR)/lib/ld-musl-$(ARCH).so.1
+endef
+TOOLCHAIN_EXTERNAL_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
+endif
+
 # Integration of the toolchain into Buildroot: find the main sysroot
 # and the variant-specific sysroot, then copy the needed libraries to
 # the $(TARGET_DIR) and copy the whole sysroot (libraries and headers)
-- 
1.8.1.2
