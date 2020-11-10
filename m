From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 10 Nov 2020 18:41:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/guile: disable jit for host and
 target gcc < 5
Message-ID: <20201110174114.102917-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

jit also raises build failures with host gcc 4.9.2 and x86_64 so disable
it if host gcc < 5 and update workaround added by commit
d8dad069c861468b17397f01875b95e7375891d7 to apply it for all
architectures and not only ARM

Fixes:
 - http://autobuild.buildroot.org/results/c2c/c2c31ff5c206bd3791d64d953dc1574546644b05

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/guile/guile.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 5e901bb10f..0e7328f199 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -38,10 +38,13 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM)$(BR2_OPTIMIZE_S),yy)
 GUILE_CFLAGS += -O2
 endif
 
-# jit triggers build failures on ARM and gcc < 5
-ifeq ($(BR2_arm):$(BR2_TOOLCHAIN_GCC_AT_LEAST_5),y:)
+# jit triggers build failures with gcc < 5
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),)
 GUILE_CONF_OPTS += --disable-jit
 endif
+ifeq ($(BR2_HOST_GCC_AT_LEAST_5),)
+HOST_GUILE_CONF_OPTS += --disable-jit
+endif
 
 # It can use readline, but on the condition that it was build against
 # ncurses. If both aren't present disable readline support since the
-- 
2.28.0
