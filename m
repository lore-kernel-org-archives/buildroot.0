From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 21 May 2019 15:39:22 +0200
Subject: [Buildroot] [PATCH v2 02/12] package/atop: fix BUG_85180 build
 timeout
In-Reply-To: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
References: <20190521133932.81841-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190521133932.81841-3-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x build hangs on compiling last files
before linking. This is due to bug 85180:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
Bug shows up building atop with optimization but not when building with
-O0.

If BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y force using -O0 passing it to
CFLAGS.

Fixes:
http://autobuild.buildroot.net/results/94a/94aa00f776b8a3491ac0b3212c95f5e666c5a29a/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
V1 -> V2:
* use -O0 instead of -g1

 package/atop/atop.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index aaf02908c4..afce71f6cb 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -10,8 +10,13 @@ ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
 ATOP_DEPENDENCIES = ncurses zlib
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+ATOP_CFLAGS += $(TARGET_CFLAGS) -O0
+endif
+
 define ATOP_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(ATOP_CFLAGS)" \
+	-C $(@D)
 endef
 
 define ATOP_INSTALL_TARGET_CMDS
-- 
2.17.1
