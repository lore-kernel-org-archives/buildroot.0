From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  3 Feb 2020 17:59:46 +0100
Subject: [Buildroot] [PATCH 3/3] package/lmbench: fix build failure due to
 gcc bug 93532
In-Reply-To: <20200203165946.50232-1-giulio.benetti@benettiengineering.com>
References: <20200203165946.50232-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200203165946.50232-4-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The lmbench package exhibits gcc bug 93532 when built for the Riscv32
architecture with optimization enabled, which causes a build to hang.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_93532=y.

Fixes:
http://autobuild.buildroot.net/results/d47/d47e46889d7bcc5864c738cb948afc168327b612/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/lmbench/lmbench.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index 2f3b19b5f8..09299a0c17 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -28,6 +28,10 @@ define LMBENCH_CONFIGURE_CMDS
 	touch $@
 endef
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_93532),y)
+LMBENCH_CFLAGS += -O0
+endif
+
 # Note: there is a second stage 'make' invocation from the 'scripts/build'
 # script. So the variables override below don't take direct effect in
 # src/Makefile.
-- 
2.20.1
