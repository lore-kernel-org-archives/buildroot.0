From: Floris Bos <bos@je-eigen-domein.nl>
Date: Thu,  8 Sep 2016 16:33:15 +0200
Subject: [Buildroot] [PATCH] gcc/gcc-final: Disable libcilkrts when using
	static libs
Message-ID: <1473345195-10495-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable libcilkrts when building static, as there is no static version:
https://software.intel.com/en-us/articles/intel-cilk-plus-runtime-library-libcilkrts-can-only-be-linked-dynamically/

Fixes the following toolchain build error when building for i386 and
BR2_STATIC_LIBS=y + BR2_TOOLCHAIN_BUILDROOT_CXX=y is set:

../../../libcilkrts/runtime/sysdep-unix.c:603:19:
fatal error: dlfcn.h: No such file or directory

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/gcc/gcc-final/gcc-final.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index eea2f74..36f185e 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -79,8 +79,9 @@ HOST_GCC_FINAL_CONF_OPTS += --disable-symvers
 endif
 
 # Disable shared libs like libstdc++ if we do static since it confuses linking
+# In that case also disable libcilkrts as there is no static version
 ifeq ($(BR2_STATIC_LIBS),y)
-HOST_GCC_FINAL_CONF_OPTS += --disable-shared
+HOST_GCC_FINAL_CONF_OPTS += --disable-shared --disable-libcilkrts
 else
 HOST_GCC_FINAL_CONF_OPTS += --enable-shared
 endif
-- 
2.7.4
