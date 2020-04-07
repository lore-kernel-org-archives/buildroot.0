From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue,  7 Apr 2020 13:26:22 -0600
Subject: [Buildroot] [PATCH v3 1/1] package/gcc: pass -Wno-error to debug
 builds
Message-ID: <20200407192622.46151-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
../../../../libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: ?st.st_mode? may be used uninitialized in this function [-Werror=maybe-uninitialized]
   return S_ISLNK (st.st_mode);
                     ^
Upstream has been unable to reproduce/fix properly, details:
https://gcc.gnu.org/legacy-ml/gcc-patches/2019-03/threads.html#00827

Upstream recommends passing -Wno-error as a workaround, see:
https://gcc.gnu.org/pipermail/gcc-patches/2019-April/519867.html

Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - add more details to message
Changes v1 -> v2:
  - add comment from Yocto recipes
---
 package/gcc/gcc.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 524ca83db0..fe7167b2f3 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -100,6 +100,11 @@ HOST_GCC_COMMON_CONF_ENV = \
 GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
 GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
 
+# used to fix ../../../../libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: ?st.st_mode? may be used uninitialized in this function [-Werror=maybe-uninitialized]
+ifeq ($(BR2_ENABLE_DEBUG),y)
+GCC_COMMON_TARGET_CFLAGS += -Wno-error
+endif
+
 # Propagate options used for target software building to GCC target libs
 HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS)"
 HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
-- 
2.20.1
