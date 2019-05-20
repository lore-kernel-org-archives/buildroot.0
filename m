From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 20 May 2019 23:27:23 +0200
Subject: [Buildroot] [PATCH] package/atop: fix BUG_85180 build timeout
Message-ID: <20190520212723.63754-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With Microblaze Gcc version < 8.x build hangs on compiling last files
before linking. This is due to bug 85180:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
Bug shows up building atop with -g2 and -g3.

If BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y and BR2_ENABLE_DEBUG=y force using
-g1 passing it to CFLAGS.

Fixes:
http://autobuild.buildroot.net/results/94a/94aa00f776b8a3491ac0b3212c95f5e666c5a29a/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/atop/atop.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index aaf02908c4..2e7e364d0e 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -10,8 +10,13 @@ ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
 ATOP_DEPENDENCIES = ncurses zlib
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180)$(BR2_ENABLE_DEBUG),yy)
+ATOP_CFLAGS += $(TARGET_CFLAGS) -g1
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
