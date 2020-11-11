From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Nov 2020 10:07:46 +0100
Subject: [Buildroot] [git commit] package/guile: disable jit for host and
 target gcc < 5
Message-ID: <20201111090020.9DBDC815F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bbfe0858851dae6a203cf0437adea3b056d9137a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

jit also raises build failures with host gcc 4.9.2 and x86_64 so disable
it if host gcc < 5 and update workaround added by commit
d8dad069c861468b17397f01875b95e7375891d7 to apply it for all
architectures and not only ARM

Fixes:
 - http://autobuild.buildroot.org/results/c2c/c2c31ff5c206bd3791d64d953dc1574546644b05

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
