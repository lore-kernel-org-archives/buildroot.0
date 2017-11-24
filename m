From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 22:10:46 +0100
Subject: [Buildroot] [git commit] toolchain/external-custom: hide versions
 too old for the current arch
Message-ID: <20171201205336.4C49F8007A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ae7f68b59e97af86bd43b0e2d454705e8feaa31
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When an architecture expresses a requirement on the gcc version, limit
the version choice in the custom external toolchain.

The rationale being that there is no point in offering that version to
the user if we know before-hand that the gcc version will not work for
that architecture.

All versions below the minimum we support is just made conditional to
that minimum as well, including the "older" entry.

However, this means that the "older" entry is no longer available when
the architecture requires a minimum gcc version. A user who wants to use
a toolchain with a gcc older than the minimum will have no choice but to
realise the toolchain is not suitable (or lie and we would catch that
when checking the gcc version anyway).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../toolchain-external-custom/Config.in.options           | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index b9e7c20..e35ef87 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -18,6 +18,11 @@ config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX
 
 choice
 	bool "External toolchain gcc version"
+	default BR2_TOOLCHAIN_EXTERNAL_GCC_7   if BR2_ARCH_NEEDS_GCC_AT_LEAST_7
+	default BR2_TOOLCHAIN_EXTERNAL_GCC_6   if BR2_ARCH_NEEDS_GCC_AT_LEAST_6
+	default BR2_TOOLCHAIN_EXTERNAL_GCC_5   if BR2_ARCH_NEEDS_GCC_AT_LEAST_5
+	default BR2_TOOLCHAIN_EXTERNAL_GCC_4_9 if BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
+	default BR2_TOOLCHAIN_EXTERNAL_GCC_4_8 if BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 	default BR2_TOOLCHAIN_EXTERNAL_GCC_4_3
 	help
 	  Set to the gcc version that is used by your external
@@ -29,42 +34,52 @@ config BR2_TOOLCHAIN_EXTERNAL_GCC_7
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_6
 	bool "6.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_5
 	bool "5.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_9
 	bool "4.9.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_8
 	bool "4.8.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_7
 	bool "4.7.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_6
 	bool "4.6.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_5
 	bool "4.5.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_4
 	bool "4.4.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_4
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_4_3
 	bool "4.3.x"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_3
 
 config BR2_TOOLCHAIN_EXTERNAL_GCC_OLD
 	bool "older"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_8
 	help
 	  Use this option if your GCC version is older than any of the
 	  above.
