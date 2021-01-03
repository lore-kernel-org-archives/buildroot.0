From: Peter Seiderer <ps.report@gmx.net>
Date: Sun,  3 Jan 2021 21:19:58 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/quickjs: needs host gcc >= 4.9
 (C11/stdatomic.h)
Message-ID: <20210103201959.4035-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  - http://autobuild.buildroot.net/results/c7882cc2d66984350f54d619f39cfee5065d941a

  gcc -g -Wall -MMD -MF .obj/libregexp.host.o.d -Wno-array-bounds -Wno-format-truncation -D_GNU_SOURCE -DCONFIG_VERSION=\"2020-11-08\" -DCONFIG_BIGNUM -O2 -flto -c -o .obj/libregexp.host.o libregexp.c
  quickjs.c:112:23: fatal error: stdatomic.h: No such file or directory
   #include <stdatomic.h>
                         ^
  compilation terminated.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/quickjs/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/quickjs/Config.in b/package/quickjs/Config.in
index 886cbd4db6..5c3b068c3a 100644
--- a/package/quickjs/Config.in
+++ b/package/quickjs/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_QUICKJS
 	# No way to check for fenv support.
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	depends on BR2_USE_MMU # fork()
 	help
 	  QuickJS is a small and embeddable Javascript engine.
@@ -12,6 +13,7 @@ config BR2_PACKAGE_QUICKJS
 
 	  https://bellard.org/quickjs/
 
-comment "quickjs needs a glibc or musl toolchain w/ gcc >= 4.9, dynamic library"
+comment "quickjs needs a glibc or musl toolchain w/ gcc >= 4.9, host gcc >= 4.9, dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_UCLIBC || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_UCLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_HOST_GCC_AT_LEAST_4_9
-- 
2.29.2
