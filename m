From: Michael Durrant <mdurrant@ArcturusNetworks.com>
Date: Mon, 26 Oct 2020 11:52:27 -0400
Subject: [Buildroot] [PATCH v2] configs/arcturus_ucp1020: Enabling gcc-8.x &
 support for BR2_powerpc_8548 cores
In-Reply-To: <977a0251-8239-1ec8-268c-4bf9b1c0498a@ArcturusNetworks.com>
References: <977a0251-8239-1ec8-268c-4bf9b1c0498a@ArcturusNetworks.com>
Message-ID: <b5cbb9bf-5507-d5b1-9679-4ea0b5767f99@ArcturusNetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enabling GCC-8.x with support for BR2_powerpc_8548 cores

The GCC-7.x compiler series was the last to support BR2_powerpc_SPE CPUs
within GCC.? After GCC-7.x support was removed as a default in buildroot,
some boards, including the arcturus_ucp1020_defconfig and
freescale_p1025twr_defconfig will fail to compile.

The GCC-8.x compiler series continues to support powerpc_8548 CPU
cores, but only as an --enable-obsoleted instruction set.
This patch is enables the use of GCC-8.x and asserts the required
option to enable the powerpc_8548 instruction set for the
arcturus_ucp1020 platform.

This Patch passes compilation and run tests with the arcturus/ppc-ucp1020
board.? This patch should address a noted job failure on GitLab CI
https://gitlab.com/buildroot.org/buildroot/-/jobs/779210821

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/779210821
Tested-by: Oleksandr G Zhadan <Oleks@ArcturusNetworks.com>
Signed-off-by: Oleksandr G Zhadan <Oleks@ArcturusNetworks.com>
Signed-off-by: Michael Durrant <mdurrant@ArcturusNetworks.com>

---
Changes v1 -> v2:
Changes patch to address a common architecture instead of a specific
platform as recommended by Thomas Petazzoni.

Signed-off-by: Oleksandr G Zhadan <Oleks@ArcturusNetworks.com>
Signed-off-by: Michael Durrant <mdurrant@ArcturusNetworks.com>

---
?package/gcc/Config.in.host | 2 +-
?package/gcc/gcc.mk???????? | 4 ++++
?2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 74999c800b..a21ba006ce 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -27,7 +27,7 @@ config BR2_GCC_VERSION_8_X
??????? depends on !BR2_or1k
??????? # powerpc spe support has been deprecated since gcc 8.x.
??????? # https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
-?????? depends on !BR2_powerpc_SPE
+?????? depends on !BR2_powerpc_SPE || BR2_powerpc_8548
??????? select BR2_TOOLCHAIN_GCC_AT_LEAST_8

?config BR2_GCC_VERSION_9_X
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index f372857916..0c5d30d55c 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -219,6 +219,10 @@ ifeq ($(BR2_powerpc_SPE),y)
?HOST_GCC_COMMON_CONF_OPTS += \
??????? --enable-e500_double \
??????? --with-long-double-128
+ifeq ($(BR2_powerpc_8548),y)
+HOST_GCC_COMMON_CONF_OPTS += \
+?????? --enable-obsolete
+endif
?endif

?# Set default to Secure-PLT to prevent run-time
-- 
2.26.2
