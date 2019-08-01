From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Aug 2019 15:36:00 +0200
Subject: [Buildroot] [git commit] package/proj: fix build failure due to gcc
 bug 68485
Message-ID: <20190801133438.7BDD581518@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c99665cde7e47e6eee0aa6ced2d5fed92f716a51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The proj package exhibits gcc bug 68485 when built for the Microblaze
architecture with optimization enabled, which causes a build failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_68485=y.

Fixes:

http://autobuild.buildroot.net/results/e61/e61bd55067071415223e523a81de3c2e9cafea6f/

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Tested-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Acked-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/proj/proj.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index 0b239b2bbe..2969eb57ac 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -10,4 +10,12 @@ PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
 PROJ_INSTALL_STAGING = YES
 
+PROJ_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
+PROJ_CFLAGS += -O0
+endif
+
+PROJ_CONF_ENV = CFLAGS="$(PROJ_CFLAGS)"
+
 $(eval $(autotools-package))
