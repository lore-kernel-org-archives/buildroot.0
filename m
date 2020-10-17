From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 17 Oct 2020 15:46:23 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/opencv3: fix build with atomic
Message-ID: <20201017134623.3457333-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Restore the atomic workaround that was wrongly removed when bumping to
version 3.4.9 in commit f6fb2cae0691d25b034b12a16261ee26096db7d1 as it
seems that opencv3 still needs help to detect atomic library

Fixes:
 - http://autobuild.buildroot.org/results/9162b29725f8d9b891eb74fcb8078f211140a841

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Restore workaround instead of setting -DHAVE_CXX_ATOMICS_WITHOUT_LIB

 package/opencv3/opencv3.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index de89aebca4..648cc66af3 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -13,6 +13,11 @@ OPENCV3_SUPPORTS_IN_SOURCE_BUILD = NO
 
 OPENCV3_CXXFLAGS = $(TARGET_CXXFLAGS)
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+OPENCV3_CXXFLAGS += -latomic
+endif
+
 # Fix c++11 build with missing std::exception_ptr
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_64735),y)
 OPENCV3_CXXFLAGS += -DCV__EXCEPTION_PTR=0
-- 
2.28.0
