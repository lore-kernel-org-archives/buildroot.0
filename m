From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  3 Feb 2020 17:59:45 +0100
Subject: [Buildroot] [PATCH 2/3] package/bullet: fix build failure due to
 gcc bug 93532
In-Reply-To: <20200203165946.50232-1-giulio.benetti@benettiengineering.com>
References: <20200203165946.50232-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200203165946.50232-3-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The bullet package exhibits gcc bug 93532 when built for the Riscv32
architecture with optimization enabled, which causes a build to hang.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_93532=y.

Fixes:
http://autobuild.buildroot.net/results/9a4/9a405ec6fabfa306c14a671a5e09359ac623c25b/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/bullet/bullet.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bullet/bullet.mk b/package/bullet/bullet.mk
index b25fc5d219..e13dbba0c6 100644
--- a/package/bullet/bullet.mk
+++ b/package/bullet/bullet.mk
@@ -25,7 +25,7 @@ endif
 
 BULLET_CXXFLAGS = $(TARGET_CXXFLAGS)
 
-ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180)$(BR2_TOOLCHAIN_HAS_GCC_BUG_93532),y)
 BULLET_CXXFLAGS += -O0
 endif
 
-- 
2.20.1
