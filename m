From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon,  3 Feb 2020 17:10:27 -0700
Subject: [Buildroot] [PATCH 1/1] package/gcc: pass -Wno-error to debug builds
Message-ID: <20200204001027.126863-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
../../../../libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: ?st.st_mode? may be used uninitialized in this function [-Werror=maybe-uninitialized]
   return S_ISLNK (st.st_mode);
                     ^

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gcc/gcc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 527f30bf22..badf358707 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -103,6 +103,10 @@ HOST_GCC_COMMON_CONF_ENV = \
 GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
 GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
 
+ifeq ($(BR2_ENABLE_DEBUG),y)
+GCC_COMMON_TARGET_CFLAGS += -Wno-error
+endif
+
 # Propagate options used for target software building to GCC target libs
 HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS)"
 HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
-- 
2.20.1
