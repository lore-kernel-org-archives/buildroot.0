From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 16 Apr 2017 21:49:06 +0200
Subject: [Buildroot] [PATCH 2/2] package/libunwind: disable for x86 with
	uClibc toolchain
In-Reply-To: <20170416194906.9842-1-romain.naour@gmail.com>
References: <20170416194906.9842-1-romain.naour@gmail.com>
Message-ID: <20170416194906.9842-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libunwind use sigreturn() while building for x86 [1] but this function
is not available with uClibc-ng.

This throw a warning during libunwind build:
In file included from x86/Los-linux.c:4:0:
x86/Gos-linux.c: In function ?_ULx86_local_resume?:
x86/Gos-linux.c:298:7: warning: implicit declaration of function ?sigreturn? [-Wimplicit-function-declaration]
       sigreturn (sc);
       ^

But any program trying to link against libunwind-generic.so fail to build:
[...]usr/lib/libunwind-generic.so: undefined reference to `sigreturn'
collect2: error: ld returned 1 exit status

Disable libunwind for x86 target when uClibc-ng is used.

Fixes:
http://autobuild.buildroot.net/results/54a/54afac8148cff5f3c17e83f80917fd9006948fe0//build-end.log

[1] http://git.savannah.gnu.org/gitweb/?p=libunwind.git;a=blob;f=src/x86/Gos-linux.c;h=17aebc2974af50eb0bf8292689b2ed22a4c97866;hb=HEAD#l299

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/libunwind/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libunwind/Config.in b/package/libunwind/Config.in
index 5527a2b..9007ce5 100644
--- a/package/libunwind/Config.in
+++ b/package/libunwind/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
 		 BR2_mips64el || BR2_powerpc || BR2_sh || BR2_i386 || BR2_x86_64)
 	default y if BR2_TOOLCHAIN_USES_UCLIBC && \
 		(((BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM) || \
-		 BR2_i386 || BR2_mips || BR2_mipsel || \
+		 BR2_mips || BR2_mipsel || \
 		 BR2_mips64 || BR2_mips64el || BR2_x86_64)
 	default y if BR2_TOOLCHAIN_USES_MUSL && \
 		(((BR2_arm || BR2_armeb) && BR2_ARM_CPU_HAS_ARM) || \
-- 
2.9.3
