From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon,  1 Jun 2015 17:37:07 +0300
Subject: [Buildroot] [PATCH] gcc/gcc-final: pass TARGET_CFLAGS flags to
	configure with --enable-cxx-flags
Message-ID: <1433169427-7527-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently only TARGET_ABI flags are passed to the final compiler
configure script and only when building for Xtensa. Since libstdc++ is a
normal library it should be built with full TARGET_CFLAGS on all
targets.

Pass TARGET_CFLAGS flags to gcc-final configure script for all targets
in the --enable-cxx-flags parameter.

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/gcc/gcc-final/gcc-final.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 8d7009b..59c8708 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -185,8 +185,6 @@ endef
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_USR_LIBS
 endif
 
-ifeq ($(BR2_xtensa),y)
-HOST_GCC_FINAL_CONF_OPTS += --enable-cxx-flags="$(TARGET_ABI)"
-endif
+HOST_GCC_FINAL_CONF_OPTS += --enable-cxx-flags="$(TARGET_CFLAGS)"
 
 $(eval $(host-autotools-package))
-- 
1.8.1.4
