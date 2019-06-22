From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 19:31:52 +0200
Subject: [Buildroot] [git commit] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_63261
Message-ID: <20190622175042.5B64A8270E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4adc06b4f80a68ff3d0eb5ad72879b2cf8514659
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dmalloc and fxload fail to build for the Microblaze architecture with
optimization enabled with gcc < 8.x, with the following failure:

  Error: PC relative branch to label logerror which is not in the instruction space
  Error: operation combines symbols in different segments

The following defconfig allows to reproduce the issue:

BR2_microblazeel=y
BR2_OPTIMIZE_2=y
BR2_KERNEL_HEADERS_5_0=y
BR2_GCC_VERSION_7_X=y
BR2_PACKAGE_FXLOAD=y

The gcc bug was reported at
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63261 and is fixed as of
gcc 8.x.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 7cdcb0e514..6d1696ea83 100644
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
