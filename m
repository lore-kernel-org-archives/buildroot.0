From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Jan 2018 21:17:28 +0100
Subject: [Buildroot] [git commit branch/2017.11.x]
 toolchain/toolchain-external: libatomic should also be copied for musl
 toolchains
Message-ID: <20180121210851.4719583DF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0cf9b6cebd4ee18d201b495c071fc140d1976cd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.11.x

libatomic, like libgcc_s, is provided by gcc, so there is no reason to
copy it over only for the glibc and uclibc cases, it should also be
copied for the musl case. Without this, a program linked with
libatomic on a musl system will fail to run due to the missing
library.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit ece9385523351d20e314bddc1f277aef8de7fb40)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index dc0588c..83486de 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -108,10 +108,10 @@ endif
 # Definitions of the list of libraries that should be copied to the target.
 #
 
-TOOLCHAIN_EXTERNAL_LIBS += ld*.so* libgcc_s.so.*
+TOOLCHAIN_EXTERNAL_LIBS += ld*.so* libgcc_s.so.* libatomic.so.*
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_GLIBC)$(BR2_TOOLCHAIN_EXTERNAL_UCLIBC),y)
-TOOLCHAIN_EXTERNAL_LIBS += libatomic.so.* libc.so.* libcrypt.so.* libdl.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
+TOOLCHAIN_EXTERNAL_LIBS += libc.so.* libcrypt.so.* libdl.so.* libm.so.* libnsl.so.* libresolv.so.* librt.so.* libutil.so.*
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 TOOLCHAIN_EXTERNAL_LIBS += libpthread.so.*
 ifneq ($(BR2_PACKAGE_GDB)$(BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY),)
