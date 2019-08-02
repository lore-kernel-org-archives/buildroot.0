From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  2 Aug 2019 23:36:46 +0200
Subject: [Buildroot] [PATCH]
 toolchain/toolchain-external/toolchain-external-custom: be more flexible on
 gcc version
Message-ID: <20190802213646.29444-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The custom external toolchain logic asks the user to specify which gcc
version is provided by the toolchain. The list of gcc versions given
by Buildroot is restricted depending on the selected CPU architecture
using the BR2_ARCH_NEEDS_GCC_AT_LEAST_xyz config options.

However, these config options generally indicate in which upstream gcc
version the support for the selected architecture was introduced. But
in practice, it is possible that an external toolchain uses some
non-upstream gcc code, providing support for a CPU architecture before
it was merged in upstream gcc.

A specific example is that there are pre-built external toolchains for
the C-SKY CPU architecture that are based on gcc 6.x, even if the
support for it was only added in upstream gcc 9.x.

Due to the BR2_ARCH_NEEDS_GCC_AT_LEAST_xyz options, only gcc >= 9.x
can be selected for C-SKY, preventing the use of such a custom
toolchain.

In addition, those dependencies are in fact not really needed:
Buildroot will check that the gcc version provided matches what the
user declared in the configuration. And if the gcc provided by the
toolchain does support that CPU architecture, then well, so be it,
there's no need to restrict the gcc version selected.

So we simply get rid of these dependencies on
BR2_ARCH_NEEDS_GCC_AT_LEAST_xyz, and also don't use them anymore to
chose a default value for the gcc version.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../Config.in.options                         | 20 -------------------
 1 file changed, 20 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index c5e2ce221b..679e727509 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -27,14 +27,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 
 choice
 	bool "External toolchain gcc version"
-	default BR2_TOOLCHAIN_EXTERNAL_GCC_9   if BR2_ARCH_NEEDS_GCC_AT_LEAST_9
-	default BR2_TOOLCHAIN_EXTERNAL_GCC_8   if BR2_ARCH_NEEDS_GCC_AT_LEAST_8
-	default BR2_TOOLCHAIN_EXTERNAL_GCC_7   if BR2_ARCH_NEEDS_GCC_AT_LEAST_7
-	default BR2_TOOLCHAIN_EXTERNAL_GCC_6   if BR2_ARCH_NEEDS_GCC_AT_LEAST_6
-	default BR2_TOOLCHAIN_EXTERNAL_GCC_5   if BR2_ARCH_NEEDS_GCC_AT_LEAST_5
-	default BR2_TOOLCHAIN_EXTERNAL_GCC_4_9 if BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
-	default BR2_TOOLCHAIN_EXTERNAL_GCC_4_8 if BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
-	default BR2_TOOLCHAIN_EXTERNAL_GCC_4_3
 	help
 	  Set to the gcc version that is used by your external
 	  toolchain.
@@ -45,62 +37,50 @@ config BR2_TOOLCHAIN_EXTERNAL_GCC_9
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_8
 	bool "8.x"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_7
 	bool "7.x"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_6
 	bool "6.x"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_5
 	bool "5.x"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_9
 	bool "4.9.x"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_8
 	bool "4.8.x"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_7
 	bool "4.7.x"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_6
 	bool "4.6.x"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_5
 	bool "4.5.x"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_4
 	bool "4.4.x"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_3
 	bool "4.3.x"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_OLD
 	bool "older"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 	help
 	  Use this option if your GCC version is older than any of the
 	  above.
-- 
2.21.0
