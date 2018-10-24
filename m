From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 14:35:42 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/gcc: disable
 libcilkrts when there is no thread support
Message-ID: <20181024123403.4417588995@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e2e79824242c122783bf8b71fbcd3641e172dc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The libcilkrts configure script errors out with "Pthreads are required
to build libcilkrts" if the C library doesn't have thread support. To
fix that, we disable libcilkrts when thread support is not available.

This issue was not noticed until now, because we only regularly build
a no-thread toolchain for ARM, and libcilkrts was enabled on ARM only
starting in gcc 7.x.

This fixes the build of no-thread toolchains on architectures where
libcilkrts is supported, i.e x86/x86-64, ARM and Sparc.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 076fd27da721971f44f681d5a06f68496371d96a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/gcc-final/gcc-final.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 213f3d7b66..c27376ad00 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -83,6 +83,11 @@ ifeq ($(BR2_sparc),y)
 HOST_GCC_FINAL_CONF_OPTS += --disable-libcilkrts
 endif
 
+# Pthreads are required to build libcilkrts
+ifeq ($(BR2_PTHREADS_NONE),y)
+HOST_GCC_FINAL_CONF_OPTS += --disable-libcilkrts
+endif
+
 # Disable shared libs like libstdc++ if we do static since it confuses linking
 # In that case also disable libcilkrts as there is no static version
 ifeq ($(BR2_STATIC_LIBS),y)
