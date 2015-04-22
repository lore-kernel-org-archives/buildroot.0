From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 22:59:31 +0200
Subject: [Buildroot] [git commit] toolchain: make IPv6 mandatory for
	external toolchains
Message-ID: <20150422210724.DC37281D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=51eaa2ca15e25169ab6c18b068e9c6e05856bd04
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove BR2_INET_IPV6 select for predefined external toolchains.

Remove the (non)IPv6 option prompt since it's now mandatory.

And force the toolchain check now that internal uclibc is always built
with IPv6 support and external non-IPv6 toolchains are disallowed.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/Config.in                    |    2 --
 toolchain/helpers.mk                   |    2 +-
 toolchain/toolchain-common.in          |    1 +
 toolchain/toolchain-external/Config.in |   11 -----------
 4 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 32a00a9..a851ce4 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -9,7 +9,6 @@ config BR2_TOOLCHAIN
 # Should be selected for glibc or eglibc
 config BR2_TOOLCHAIN_USES_GLIBC
 	bool
-	select BR2_INET_IPV6
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -23,7 +22,6 @@ config BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_TOOLCHAIN_USES_MUSL
 	bool
-	select BR2_INET_IPV6
 	select BR2_USE_WCHAR
 	select BR2_ENABLE_LOCALE
 	select BR2_TOOLCHAIN_HAS_THREADS
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 257fab2..cb3b61a 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -284,7 +284,7 @@ check_uclibc = \
 	UCLIBC_CONFIG_FILE=$${SYSROOT_DIR}/usr/include/bits/uClibc_config.h ; \
 	$(call check_uclibc_feature,__ARCH_USE_MMU__,BR2_USE_MMU,$${UCLIBC_CONFIG_FILE},MMU support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_LFS__,,$${UCLIBC_CONFIG_FILE},Large file support) ;\
-	$(call check_uclibc_feature,__UCLIBC_HAS_IPV6__,BR2_INET_IPV6,$${UCLIBC_CONFIG_FILE},IPv6 support) ;\
+	$(call check_uclibc_feature,__UCLIBC_HAS_IPV6__,,$${UCLIBC_CONFIG_FILE},IPv6 support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_RPC__,BR2_TOOLCHAIN_HAS_NATIVE_RPC,$${UCLIBC_CONFIG_FILE},RPC support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_WCHAR__,BR2_USE_WCHAR,$${UCLIBC_CONFIG_FILE},Wide char support) ;\
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 1b25cf1..28fb53a 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -7,6 +7,7 @@ source "package/gdb/Config.in.host"
 
 config BR2_INET_IPV6
 	bool
+	default y
 
 config BR2_TOOLCHAIN_HAS_GCC_BUG_58595
 	bool
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 440de18..d2b99cc 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -742,7 +742,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_INET_IPV6
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_USE_WCHAR
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -759,7 +758,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_INET_IPV6
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_USE_WCHAR
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -776,7 +774,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_INET_IPV6
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_USE_WCHAR
 	select BR2_TOOLCHAIN_HAS_THREADS
@@ -1111,14 +1108,6 @@ endchoice
 
 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
 
-config BR2_TOOLCHAIN_EXTERNAL_INET_IPV6
-	bool "Toolchain has IPv6 support?"
-	select BR2_INET_IPV6
-	help
-	  Select this option if your external toolchain supports
-	  IPv6. If you don't know, leave the default value, Buildroot
-	  will tell you if it's correct or not.
-
 config BR2_TOOLCHAIN_EXTERNAL_WCHAR
 	bool "Toolchain has WCHAR support?"
 	select BR2_USE_WCHAR
