From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Oct 2018 23:49:10 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] package/gcc: glibc >=
 2.27 needs gcc >= 5 on aarch64
Message-ID: <20181001214856.8FF388B572@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c890f7418864c35e215b8cfcef06cae67a2c659
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

With the following defconfig:
BR2_aarch64=y
BR2_BINUTILS_VERSION_2_28_X=y
BR2_GCC_VERSION_4_9_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y

The build fail with this error:
In file included from ../sysdeps/ieee754/flt-32/math_config.h:23:0,
                 from ../sysdeps/ieee754/flt-32/e_expf.c:29:
../sysdeps/aarch64/fpu/math_private.h: In function 'roundtoint':
../sysdeps/aarch64/fpu/math_private.h:311:3: error: implicit declaration of function 'vrndn_f64' [-Werror=implicit-function-declaration]
   return vget_lane_f64 (vrndn_f64 (vld1_f64 (&x)), 0);
   ^
cc1: all warnings being treated as errors

vrndn_f64 function has been introduced in glibc code since version 2.27 [1].
So we can't build a glibc based toolchain with gcc 4.9 anymore.

Add a new dependency in the toolchain infra to avoid selecting
glibc toolchain using gcc 4.9.

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=72aa623345ada1276ed89dbc00fdff9639cb8eaf

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1380f4c9a67f44a2fc172a1b8845f0ecc10beb90)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/Config.in.host | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 01bf8fa561..5a8f684a4c 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -32,6 +32,8 @@ config BR2_GCC_VERSION_4_9_X
 	depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_mips64 || BR2_mips64el))
 	# glibc >= 2.26 needs gcc >= 6.2
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC && BR2_powerpc64le)
+	# glibc >= 2.27 needs gcc >= 5
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC && (BR2_aarch64 || BR2_aarch64_be))
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_GCC_VERSION_5_X
