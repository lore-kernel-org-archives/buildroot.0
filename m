From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 17 Sep 2018 23:43:29 +0300
Subject: [Buildroot] [PATCH] libaio: Fix library creation for ARC with -Os
Message-ID: <20180917204329.15787-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On ARC if "-Os" optimization is used compiler prefers to use so-called
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

BTW I guess something similar might happen for PowerPC,
see https://git.buildroot.org/buildroot/commit/?id=ce6536ae500fc4ac0c201d5cb4edf39dd1b4d386
--------------------------->8------------------------
hidden symbol `_rest32gpr_30_x' in libgcc.a(e500crtresx32gpr.o) is referenced by DSO
--------------------------->8------------------------

Fixes: http://autobuild.buildroot.net/?reason=blktrace-1.2.0&arch=arc

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Cc: arc-buildroot at synopsys.com
---
 package/libaio/libaio.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index adb4d1c4b19e..2a452b0296c2 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -22,6 +22,13 @@ ifeq ($(BR2_powerpc),y)
 LIBAIO_CONFIGURE_OPTS += CFLAGS="$(subst -Os,-O2,$(TARGET_CFLAGS))"
 endif
 
+# Make sure millicode functions get their implmentations in final DSO
+# Otherwise later LD will righteously refuse to link an application saying:
+#  "hidden symbol __xxx in libgcc.a is referenced by DSO".
+ifeq ($(BR2_arc),y)
+LIBAIO_CONFIGURE_OPTS += LDFLAGS=-lgcc
+endif
+
 define LIBAIO_BUILD_CMDS
 	$(LIBAIO_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
-- 
2.17.1
