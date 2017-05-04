From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 23:23:17 +0200
Subject: [Buildroot] [git commit] package/libunwind: disable for x86 with
	musl
Message-ID: <20170504212328.00C9980410@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=60aee0cc5afb85976ca3b346f82b2caadc3a1c21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libunwind use sigreturn() and setcontext() while building for x86 [1]
but this function is not available with musl [2].

This throw a warning during libunwind build:
In file included from x86/Los-linux.c:4:0:
x86/Gos-linux.c: In function ???_ULx86_local_resume???:
x86/Gos-linux.c:298:7: warning: implicit declaration of function ???sigreturn??? [-Wimplicit-function-declaration]
      sigreturn (sc);
      ^
But any program trying to link against libunwind-generic.so or
libunwind.so fail to build:
[...]/usr/lib/libunwind-generic.so: undefined reference to `sigreturn'
[...]/usr/lib/libunwind-generic.so: undefined reference to `setcontext'
collect2: error: ld returned 1 exit status

Disable libunwind for x86 target when musl is used.

Reported upstream by Waldemar [3]

[1] http://git.savannah.gnu.org/gitweb/?p=libunwind.git;a=blob;f=src/x86/Gos-linux.c;h=17aebc2974af50eb0bf8292689b2ed22a4c97866;hb=HEAD#l299
[2] http://openwall.com/lists/musl/2016/02/04/3
[3] http://lists.nongnu.org/archive/html/libunwind-devel/2017-04/msg00030.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Waldemar Brodkorb <wbx@openadk.org>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libunwind/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libunwind/Config.in b/package/libunwind/Config.in
index 2003e96..1a25317 100644
--- a/package/libunwind/Config.in
+++ b/package/libunwind/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
 		(BR2_ARM_CPU_HAS_ARM || BR2_mips || BR2_mipsel || \
 		 BR2_mips64 || BR2_mips64el || BR2_x86_64)
 	default y if BR2_TOOLCHAIN_USES_MUSL && \
-		(BR2_ARM_CPU_HAS_ARM || BR2_i386 || BR2_x86_64)
+		(BR2_ARM_CPU_HAS_ARM || BR2_x86_64)
 
 config BR2_PACKAGE_LIBUNWIND
 	bool "libunwind"
