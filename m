From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 24 Jan 2021 14:49:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/libgeos: disable inlining on arm
Message-ID: <20210124134959.894937-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable inlining which raise build failures on arm.
It should be noted that inlining is already disabled by usptream on
arm64: https://github.com/libgeos/geos/issues/353

Fixes:
 - http://autobuild.buildroot.org/results/52024b2ccc5d17612731809a5dabcc29a4a1170b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.29.2
