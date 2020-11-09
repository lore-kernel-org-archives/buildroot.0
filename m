From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Nov 2020 17:02:48 +0100
Subject: [Buildroot] [git commit] package/guile: disable jit on ARM with gcc
 < 5
Message-ID: <20201109155530.BDDA888279@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d8dad069c861468b17397f01875b95e7375891d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

jit is enabled by default since version 3.0.0 on x86-64, i686, ARMv7 and
AArch64 targets however it raises the following build failure on ARM
with gcc 4.8:

jit.c:232:1: error: initializer element is not constant
 static const jit_gpr_t THREAD = JIT_V0;
 ^

This build failure was also reported with ARM on gcc 4.9:
https://www.mail-archive.com/guile-user at gnu.org/msg11497.html

So just disable jit with ARM and gcc < 5

Fixes:
 - http://autobuild.buildroot.org/results/ba051bb00a6cad3cfd5ffeb197de20ea0eaef33e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/guile/guile.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index 5750b85f49..f1623008c8 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -38,6 +38,11 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM)$(BR2_OPTIMIZE_S),yy)
 GUILE_CFLAGS += -O2
 endif
 
+# jit triggers build failures on ARM and gcc < 5
+ifeq ($(BR2_arm):$(BR2_TOOLCHAIN_GCC_AT_LEAST_5),y:)
+GUILE_CONF_OPTS += --disable-jit
+endif
+
 # It can use readline, but on the condition that it was build against
 # ncurses. If both aren't present disable readline support since the
 # host readline/ncurses support can poison the build.
