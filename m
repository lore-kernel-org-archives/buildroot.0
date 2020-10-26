From: Michael Durrant <mdurrant@ArcturusNetworks.com>
Date: Mon, 26 Oct 2020 15:17:35 -0400
Subject: [Buildroot] [PATCH 1/1] package/gcc: Enable gcc-8.x support for
 BR2_powerpc_spe
In-Reply-To: <9aeb0cb1-00e7-702a-0d41-f6471e6f0302@ArcturusNetworks.com>
References: <9aeb0cb1-00e7-702a-0d41-f6471e6f0302@ArcturusNetworks.com>
Message-ID: <8a492cbe-907c-1699-8f6f-eb9c40d8785c@ArcturusNetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The GCC-7.x compiler series was the last to support BR2_powerpc_SPE CPUs
within GCC.? After GCC-7.x support was removed as a default in buildroot,
some boards, including the arcturus_ucp1020_defconfig and
freescale_p1025twr_defconfig will fail to compile.

The GCC-8.x compiler series continues to support powerpc_spe CPU
cores, but only as an --enable-obsoleted instruction set.
This patch enables the use of GCC-8.x and asserts the required
option to enable the powerpc_spe instruction set.

This Patch passes compilation and run tests with the
arcturus/ppc-ucp1020? board.

Tested-by: Oleksandr G Zhadan <Oleks@ArcturusNetworks.com>

This patch should address a noted job failure on GitLab CI
https://gitlab.com/buildroot.org/buildroot/-/jobs/805461732

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/805461732
Signed-off-by: Oleksandr G Zhadan <Oleks@ArcturusNetworks.com>
Signed-off-by: Michael Durrant <mdurrant@ArcturusNetworks.com>
---
?package/gcc/Config.in.host | 2 +-
?package/gcc/gcc.mk???????? | 1 +
?2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 74999c800b..8ae778437b 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -27,7 +27,7 @@ config BR2_GCC_VERSION_8_X
??????? depends on !BR2_or1k
??????? # powerpc spe support has been deprecated since gcc 8.x.
??????? # https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
-?????? depends on !BR2_powerpc_SPE
+?????? # it can still be built with --enable-obsolete
??????? select BR2_TOOLCHAIN_GCC_AT_LEAST_8

?config BR2_GCC_VERSION_9_X
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index f372857916..beac27ede4 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -217,6 +217,7 @@ endif
?# Enable proper double/long double for SPE ABI
?ifeq ($(BR2_powerpc_SPE),y)
?HOST_GCC_COMMON_CONF_OPTS += \
+?????? --enable-obsolete \
??????? --enable-e500_double \
??????? --with-long-double-128
?endif

-- 
2.26.2
