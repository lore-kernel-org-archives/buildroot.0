From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 26 May 2015 10:32:36 +0300
Subject: [Buildroot] [PATCH] gcc/gcc-final: pass TARGET_ABI flags to
	configure with --enable-cxx-flags
Message-ID: <1432625556-14611-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libstdc++ is in all regards a normal library, it needs to be built with
TARGET_ABI flags, otherwise linking it with other C++ code may fail.

Pass TARGET_ABI flags to gcc-final configure script in the
--enable-cxx-flags parameter.

Fixes:
  http://autobuild.buildroot.net/results/81a3bca5cbcf789c7ce1aa221a6a4154dd7c3917/
  http://autobuild.buildroot.net/results/4943b214c29951ecc7af0a1f360b6454485c0b9b/

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/gcc/gcc-final/gcc-final.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index d873aa6..8d7009b 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -185,4 +185,8 @@ endef
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_USR_LIBS
 endif
 
+ifeq ($(BR2_xtensa),y)
+HOST_GCC_FINAL_CONF_OPTS += --enable-cxx-flags="$(TARGET_ABI)"
+endif
+
 $(eval $(host-autotools-package))
-- 
1.8.1.4
