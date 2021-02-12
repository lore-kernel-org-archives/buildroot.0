From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 12 Feb 2021 23:42:38 +0100
Subject: [Buildroot] [PATCH] package/libgeos: fix build failure due to Gcc
 Bug 68485
Message-ID: <20210212224238.1938197-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Package libgeos manifests Microblaze Gcc Bug 68485 resulting in a build
failure due to an Internal Compiler Error.

As done for other packages in Buildroot work around this Gcc Bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_68485=y.

Fixes:
http://autobuild.buildroot.net/results/0da/0daa6b259aea5381fad86d01e6dd026b1c8ad073/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libgeos/libgeos.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index 50c3832c01..a355732af8 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -13,8 +13,16 @@ LIBGEOS_INSTALL_STAGING = YES
 LIBGEOS_CONFIG_SCRIPTS = geos-config
 LIBGEOS_CONF_OPTS = -DBUILD_BENCHMARKS=OFF
 
+LIBGEOS_CXXFLAGS = $(TARGET_CXXCFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
+LIBGEOS_CXXFLAGS += -O0
+endif
+
 ifeq ($(BR2_arm)$(BR2_armeb),y)
 LIBGEOS_CONF_OPTS += -DDISABLE_GEOS_INLINE=ON
 endif
 
+LIBGEOS_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(LIBGEOS_CXXFLAGS)"
+
 $(eval $(cmake-package))
-- 
2.25.1
