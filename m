From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 16:40:07 +0200
Subject: [Buildroot] [git commit] toolchain/external: copy libssp.so if SSP
 is enabled
Message-ID: <20191025143419.29666866DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=971479ed6276782a1768a1b8effec2a34787661c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In Buildroot, the internal toolchain backend uses the SSP support from
the C library, not that of gcc.

Some external toolchains come with SSP suport in gcc, which is
implemented in libssp.so, rather than in the C library.

When a toolchain even has both, it is up to the compiler to decide
whether it will link to libssp or use the support from the C library.

However, in the latter case, a (incorrectly written) package may decide
to explicitly link with libssp.so when it is available (even though the
compiler may have decided otherwise if left by itself). This is the case
for example with sox, which results in runtime failures, such as:

    $ sox
    sox: error while loading shared libraries: libssp.so.0: cannot open
    shared object file: No such file or directory

Even if sox is wrong in doing so, the case for libssp-only toolchains is
still valid, and we must copy it as we copy other libs.

Signed-off-by: Yann Droneaud <ydroneaud@opteya.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index c00211d59c..5eecd2a269 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -114,6 +114,10 @@ endif
 
 TOOLCHAIN_EXTERNAL_LIBS += ld*.so* libgcc_s.so.* libatomic.so.*
 
+ifneq ($(BR2_SSP_NONE),y)
+TOOLCHAIN_EXTERNAL_LIBS += libssp.so.*
+endif
+
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
 TOOLCHAIN_EXTERNAL_LIBS += libc.so.* libcrypt.so.* libdl.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
