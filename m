From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 31 Dec 2019 16:09:57 +0100
Subject: [Buildroot] [PATCH] package/proj: fix build failure due to gcc bug
 68485(C++)
Message-ID: <20191231150957.122179-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The proj package exhibits gcc bug 68485 when building for the Microblaze
architecture C files(already fixed), but also for C++ files.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 when compiling C++ files too if
BR2_TOOLCHAIN_HAS_GCC_BUG_68485=y.

Fixes:
http://autobuild.buildroot.net/results/dc9/dc9bc52ff3d5a83dcfe4a86a391590bef57e1cf0/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/proj/proj.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index ca943141ce..6b3d219953 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -19,4 +19,12 @@ endif
 
 PROJ_CONF_ENV = CFLAGS="$(PROJ_CFLAGS)"
 
+PROJ_CXXFLAGS = $(TARGET_CXXFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
+PROJ_CXXFLAGS += -O0
+endif
+
+PROJ_CONF_ENV += CXXFLAGS="$(PROJ_CXXFLAGS)"
+
 $(eval $(autotools-package))
-- 
2.20.1
