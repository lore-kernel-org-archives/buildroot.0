From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 29 May 2019 16:51:30 +0200
Subject: [Buildroot] [PATCH v3 1/3] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_63261
In-Reply-To: <20190529145132.57042-1-giulio.benetti@micronovasrl.com>
References: <20190529145132.57042-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190529145132.57042-2-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GCC hangs while building fxload for the Microblaze Arch using following
defconfig:
'
BR2_microblazeel=y
BR2_OPTIMIZE_2=y
BR2_KERNEL_HEADERS_5_0=y
BR2_GCC_VERSION_7_X=y
BR2_PACKAGE_FXLOAD=y
'

Reported:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63261

This bug has been fixed on Gcc 8.x.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
Changes:
V1->V2:
* add 'depends on BR2_ENABLE_DEBUG' to BR2_TOOLCHAIN_HAS_GCC_BUG_63261
V2->V3:
* remove 'depends on BR2_ENABLE_DEBUG' from BR2_TOOLCHAIN_HAS_GCC_BUG_63261
* modified commit log on defconfig section by removing
  'BR2_ENABLE_DEBUG=y'

 toolchain/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 2d39ee4039..d01a96f8a8 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -113,6 +113,13 @@ config BR2_TOOLCHAIN_SUPPORTS_VARIADIC_MI_THUNK
 	depends on !BR2_or1k
 	depends on !BR2_xtensa
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63261. This bug no
+# longer exists in gcc 8.x.
+config BR2_TOOLCHAIN_HAS_GCC_BUG_63261
+	bool
+	default y if BR2_microblaze
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
+
 # Prior to gcc 7.x, exception_ptr, nested_exception and future from
 # libstdc++ would only be provided on architectures that support
 # always lock-free atomic ints. See
-- 
2.17.1
