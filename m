From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  6 Nov 2016 23:53:32 +0100
Subject: [Buildroot] [PATCH v2] package/guile: dont't use -Os for CS 2014.05
	ARM toolchain
Message-ID: <1478472812-30673-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With this toolchain, guile tigger an assembler error with -Os which is
probably caused by the binutils version being used:

arm-none-linux-gnueabi-ld --version
GNU ld (Sourcery CodeBench Lite 2014.05-29) 2.24.51.20140217

arm-none-linux-gnueabi-gcc --version
arm-none-linux-gnueabi-gcc (Sourcery CodeBench Lite 2014.05-29) 4.8.3 20140320 (prerelease)

Nowaday, even with a Buildroot internal toolchain using the oldest
Binutils GCC version (2.25.1 and 4.8.6), guile build fine with -Os.

So, force -O2 when this toolchain is used and BR2_OPTIMIZE_S is set.

Fixes:
http://autobuild.buildroot.net/results/976/976b3477407e64c8c2fc2309ed952d0083903a19

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: force -O2 instead of disaling the toolchain for guile
---
 package/guile/guile.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/guile/guile.mk b/package/guile/guile.mk
index ca54a4d..88c7414 100644
--- a/package/guile/guile.mk
+++ b/package/guile/guile.mk
@@ -32,6 +32,11 @@ ifeq ($(BR2_STATIC_LIBS),y)
 GUILE_CFLAGS += -DGC_NO_DLOPEN
 endif
 
+# Triggers assembler error with -Os
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM)$(BR2_OPTIMIZE_S),yy)
+GUILE_CFLAGS += -O2
+endif
+
 # It can use readline, but on the condition that it was build against
 # ncurses. If both aren't present disable readline support since the
 # host readline/ncurses support can poison the build.
-- 
2.5.5
