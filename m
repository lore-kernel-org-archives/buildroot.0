From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 18 Sep 2018 11:58:55 +0300
Subject: [Buildroot] [PATCH v2] libaio: Make sure symbols from libgcc.a get
 defined in libaio.so for ARC & PPC
Message-ID: <20180918085855.10148-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On ARC and PowerPC if "-Os" optimization is used compiler prefers to use so-called
millicode (basically function prologue & epilogue) implemented once and for
all in libgcc.a. And if we don't link with libgcc.a on DSO (read libaio.so)
creation those millicode functions won't be included, instead their
symbols will be referenced as they were in libgcc (HIDDEN).

And then when LD is about to link a final application it sees HIDDEN
symbol in libaio.so that is supposed to come from some static
libgcc.a... wait.. what? Shared library has unresolved symbol
implemented in static library? No, that's not right I guess :)

So to resolve that wrong sequence we just make sure libaio.so has
its own copy of used millicode functions implemented locally.

Fixes: http://autobuild.buildroot.net/?reason=blktrace-1.2.0&arch=arc
Improves: https://git.buildroot.org/buildroot/commit/?id=ce6536ae500fc4ac0c201d5cb4edf39dd1b4d386

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Cc: arc-buildroot at synopsys.com
---

Changes v1 -> v2:
 * Apply the same fix for PowerPC

 package/libaio/libaio.mk | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index adb4d1c4b1..bf5623ee15 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -16,10 +16,12 @@ ifeq ($(BR2_STATIC_LIBS),y)
 LIBAIO_CONFIGURE_OPTS += ENABLE_SHARED=0
 endif
 
-# On PowerPC, a weird toolchain issue causes -Os builds to produce
-# references to hidden symbols, so we're forcing -O2
-ifeq ($(BR2_powerpc),y)
-LIBAIO_CONFIGURE_OPTS += CFLAGS="$(subst -Os,-O2,$(TARGET_CFLAGS))"
+# ARC and PowerPC in case of compilation with "-Os"
+# rely on some functions implemented in libgcc.a
+# and we need to make sure all functions from libgcc.a
+# get included in libaio.so
+ifeq ($(BR2_arc)$(BR2_powerpc),y)
+LIBAIO_CONFIGURE_OPTS += LDFLAGS=-lgcc
 endif
 
 define LIBAIO_BUILD_CMDS
-- 
2.16.2
