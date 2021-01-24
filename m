From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2021 16:41:52 +0100
Subject: [Buildroot] [git commit] package/libgeos: disable inlining on arm
Message-ID: <20210124152345.B193B817B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbd84d55ce32dbd8924f5e92902cde4d0a0bdf3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable inlining which raise build failures on arm.
It should be noted that inlining is already disabled by usptream on
arm64: https://github.com/libgeos/geos/issues/353

Fixes:
 - http://autobuild.buildroot.org/results/52024b2ccc5d17612731809a5dabcc29a4a1170b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libgeos/libgeos.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index 7b4ace122d..d7905cbb21 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -12,4 +12,8 @@ LIBGEOS_LICENSE_FILES = COPYING
 LIBGEOS_INSTALL_STAGING = YES
 LIBGEOS_CONFIG_SCRIPTS = geos-config
 
+ifeq ($(BR2_arm)$(BR2_armeb),y)
+LIBGEOS_CONF_OPTS += -DDISABLE_GEOS_INLINE=ON
+endif
+
 $(eval $(cmake-package))
