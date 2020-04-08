From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Apr 2020 16:33:35 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/gcc: pass
 -Wno-error to debug builds
Message-ID: <20200408142044.A08008D5FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a279c559b895cad5a55e1a1127811446ad62024e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

gcc fails to build in debug build with debug optimisations:

BR2_x86_corei7=y
BR2_ENABLE_DEBUG=y
BR2_DEBUG_3=y
BR2_OPTIMIZE_G=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y

which fails with:
    ../../../../libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: ???st.st_mode??? may be used uninitialized in this function [-Werror=maybe-uninitialized]
       return S_ISLNK (st.st_mode);
                     ^
Upstream has been unable to reproduce/fix properly, details:
https://gcc.gnu.org/legacy-ml/gcc-patches/2019-03/threads.html#00827

Upstream recommends passing -Wno-error as a workaround, see:
https://gcc.gnu.org/pipermail/gcc-patches/2019-April/519867.html

Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998 at free.fr: add the reproducing defconfig]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit dcaf6e75acb4d21c2c31c70b054dac8d18710fcb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 524ca83db0..fe7167b2f3 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -100,6 +100,11 @@ HOST_GCC_COMMON_CONF_ENV = \
 GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
 GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
 
+# used to fix ../../../../libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: ???st.st_mode??? may be used uninitialized in this function [-Werror=maybe-uninitialized]
+ifeq ($(BR2_ENABLE_DEBUG),y)
+GCC_COMMON_TARGET_CFLAGS += -Wno-error
+endif
+
 # Propagate options used for target software building to GCC target libs
 HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS)"
 HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
