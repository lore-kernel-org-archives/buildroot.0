From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Nov 2012 18:47:48 +0100
Subject: [Buildroot] [PATCH 03/18] toolchain-crosstool-ng: use the
	Crosstool-ng config options instead of the common hidden ones
In-Reply-To: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1351964808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <cfe1f812fb80ad1cdbd18ea18cf08e0557773d96.1351964808.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we are some day going to finally rename the badly named common
toolchain options (BR2_USE_WCHAR, BR2_ENABLE_LOCALE, BR2_INET_RPC,
etc.) into something more logical, let's start using the Crosstool-NG
toolchain options in the Crosstool-NG code.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index e46bb20..5f9119d 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -268,7 +268,7 @@ CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_SYSROOT_DIR_PREFIX)=.*:\1="":;
 ifeq ($(BR2_TOOLCHAIN_CTNG_uClibc),y)
 
 # Handle the locales option
-ifneq ($(call qstrip,$(BR2_ENABLE_LOCALE)),)
+ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_LOCALE)),)
 CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_LIBC_UCLIBC_LOCALES) is not set:\1=y\n\# CT_LIBC_UCLIBC_LOCALES_PREGEN_DATA is not set:;
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_LOCALES_PREGEN_DATA)=.*:\# \1 is not set:;
 else
@@ -276,28 +276,28 @@ CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_LOCALES)=.*:\# \1 is not set:;
 endif
 
 # Handle the wide-char option
-ifneq ($(call qstrip,$(BR2_USE_WCHAR)),)
+ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_WCHAR)),)
 CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_LIBC_UCLIBC_WCHAR) is not set:\1=y:;
 else
 CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_WCHAR)=.*:\# \1 is not set:;
 endif
 
 # Handle the LFS option
-ifneq ($(call qstrip,$(BR2_LARGEFILE)),)
+ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_LARGEFILE)),)
 CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_LFS) is not set:\1=y:;
 else
 CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^(UCLIBC_HAS_LFS)=.*:\# \1 is not set:;
 endif
 
 # Handle the IPv6 option
-ifneq ($(call qstrip,$(BR2_INET_IPV6)),)
+ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_INET_IPV6)),)
 CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_IPV6) is not set:\1=y:;
 else
 CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^(UCLIBC_HAS_IPV6)=.*:\# \1 is not set:;
 endif
 
 # Handle the RPC option
-ifneq ($(call qstrip,$(BR2_INET_RPC)),)
+ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_INET_RPC)),)
 CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_RPC) is not set:\1=y\nUCLIBC_HAS_FULL_RPC=y\nUCLIBC_HAS_REENTRANT_RPC=y:;
 CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_FULL_RPC) is not set:\1=y:;
 CTNG_FIX_DOT_CONFIG_LIBC_SED += s:^\# (UCLIBC_HAS_REENTRANT_RPC) is not set:\1=y:;
-- 
1.7.9.5
