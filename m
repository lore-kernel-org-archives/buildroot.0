From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Oct 2020 23:48:51 +0100
Subject: [Buildroot] [git commit] package/gcc: re-enable gcc 8.x for PowerPC
 SPE
Message-ID: <20201031223628.DBEE28626E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96e80ad214ced86c802d561946fa7da88c1595eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The GCC-7.x compiler series was the last to officially support PowerPC
SPE CPUs. Now that GCC-8.x is the default compiler used by Buildroot,
some defconfigs, notably the arcturus_ucp1020_defconfig and
freescale_p1025twr_defconfig ones started to fail building, as they
are PowerPC SPE platforms.

In fact, the GCC-8.x compiler series continues to support PowerPC SPE
CPU cores, but only as an --enable-obsoleted instruction set. This
patch enables the use of GCC-8.x and asserts the required option to
enable the PowerPC SPE instruction set.

This patch passes compilation and run tests with the
arcturus/ppc-ucp1020?? board.

This patch should address a noted job failure on GitLab CI
https://gitlab.com/buildroot.org/buildroot/-/jobs/805461732

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/805461732
Signed-off-by: Michael Durrant <mdurrant@ArcturusNetworks.com>
Signed-off-by: Oleksandr G Zhadan <Oleks@ArcturusNetworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host | 3 ---
 package/gcc/gcc.mk         | 1 +
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 74999c800b..4aa6d3725f 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -25,9 +25,6 @@ config BR2_GCC_VERSION_8_X
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 	# Broken or unsupported architectures
 	depends on !BR2_or1k
-	# powerpc spe support has been deprecated since gcc 8.x.
-	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
-	depends on !BR2_powerpc_SPE
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_GCC_VERSION_9_X
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index f372857916..beac27ede4 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -217,6 +217,7 @@ endif
 # Enable proper double/long double for SPE ABI
 ifeq ($(BR2_powerpc_SPE),y)
 HOST_GCC_COMMON_CONF_OPTS += \
+	--enable-obsolete \
 	--enable-e500_double \
 	--with-long-double-128
 endif
