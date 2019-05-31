From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 31 May 2019 18:26:45 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/opencv3: fix build due to gcc bug 68485
Message-ID: <20190531162645.5108-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version <= 9.x the build fails due to gcc bug 68485:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. The bug show up when
building opencv3 with optimization but not when building with -O0. To
work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_68458=y, we force using
-O0.

Fixes:
 - http://autobuild.buildroot.org/results/c78eac84d1c5a6702e7759cd5364da1c3e399b4b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Giulio Benetti):
 - Improve commit log

 package/opencv3/opencv3.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 292ce81432..49b29d9f1e 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -23,6 +23,10 @@ ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_64735),y)
 OPENCV3_CXXFLAGS += -DCV__EXCEPTION_PTR=0
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
+OPENCV3_CXXFLAGS += -O0
+endif
+
 # OpenCV component options
 OPENCV3_CONF_OPTS += \
 	-DCMAKE_CXX_FLAGS="$(OPENCV3_CXXFLAGS)" \
-- 
2.20.1
