From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jun 2019 14:23:17 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/atop: work around
 gcc bug 85180
Message-ID: <20190606124825.D9B0B7FA1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4a803832d92c87322c58e8d85e8718c5a7e24a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

With Microblaze Gcc version < 8.x the build hangs due to gcc bug
85180: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. The bug
shows up when building atop with optimization but not when building
with -O0. To work around this, if BR2_TOOLCHAIN_HAS_GCC_BUG_85180=y
we force using -O0.

Fixes:

  http://autobuild.buildroot.net/results/94aa00f776b8a3491ac0b3212c95f5e666c5a29a/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b0545135e71052daf90dba8c82e6e750c333dde1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/atop/atop.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/atop/atop.mk b/package/atop/atop.mk
index aaf02908c4..4ea1ccf26f 100644
--- a/package/atop/atop.mk
+++ b/package/atop/atop.mk
@@ -10,8 +10,15 @@ ATOP_LICENSE = GPL-2.0+
 ATOP_LICENSE_FILES = COPYING
 ATOP_DEPENDENCIES = ncurses zlib
 
+ATOP_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
+ATOP_CFLAGS += -O0
+endif
+
 define ATOP_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(ATOP_CFLAGS)" \
+		-C $(@D)
 endef
 
 define ATOP_INSTALL_TARGET_CMDS
