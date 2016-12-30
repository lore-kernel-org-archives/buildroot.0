From: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
Date: Fri, 30 Dec 2016 13:32:38 -0200
Subject: [Buildroot] [PATCH] eudev: build with older kernels.
In-Reply-To: <CAPdpN3AqMidYkSkAdjUygBzkXfVMELex3wjtsgyxqwiQdrr3zQ@mail.gmail.com>
References: <CAPdpN3AqMidYkSkAdjUygBzkXfVMELex3wjtsgyxqwiQdrr3zQ@mail.gmail.com>
Message-ID: <20161230153238.10458-1-barbieri@profusion.mobi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add missing defines so eudev builds for older kernels such as 2.6

Signed-off-by: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
---
 .../0002-missing-defines-for-old-kernels.patch     | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/eudev/0002-missing-defines-for-old-kernels.patch

diff --git a/package/eudev/0002-missing-defines-for-old-kernels.patch b/package/eudev/0002-missing-defines-for-old-kernels.patch
new file mode 100644
index 000000000..6966b07fe
--- /dev/null
+++ b/package/eudev/0002-missing-defines-for-old-kernels.patch
@@ -0,0 +1,44 @@
+From c0f63850ad29ec978d070a08b816dc2bfca337e3 Mon Sep 17 00:00:00 2001
+From: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
+Date: Fri, 30 Dec 2016 11:28:41 -0200
+Subject: [PATCH] udev-builtin-input_id.c: add missing kernel header defines.
+
+Add missing defines so eudev builds for older kernels such as 2.6
+
+Signed-off-by: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
+---
+ src/shared/missing.h             | 8 ++++++++
+ src/udev/udev-builtin-input_id.c | 1 +
+ 2 files changed, 9 insertions(+)
+
+diff --git a/src/shared/missing.h b/src/shared/missing.h
+index 5ad599795..bebbb42be 100644
+--- a/src/shared/missing.h
++++ b/src/shared/missing.h
+@@ -171,3 +171,11 @@ static inline int name_to_handle_at(int fd, const char *name, struct file_handle
+     (char *)memcpy(__new, __old, __len); \
+   })
+ #endif
++
++#ifndef BTN_TRIGGER_HAPPY
++#define BTN_TRIGGER_HAPPY 0x2c0
++#endif
++
++#ifndef INPUT_PROP_MAX
++#define INPUT_PROP_MAX 0x1f
++#endif
+diff --git a/src/udev/udev-builtin-input_id.c b/src/udev/udev-builtin-input_id.c
+index b14190e42..ca545be5d 100644
+--- a/src/udev/udev-builtin-input_id.c
++++ b/src/udev/udev-builtin-input_id.c
+@@ -32,6 +32,7 @@
+ 
+ #include "udev.h"
+ #include "util.h"
++#include "missing.h"
+ 
+ /* we must use this kernel-compatible implementation */
+ #define BITS_PER_LONG (sizeof(unsigned long) * 8)
+-- 
+2.11.0
+
-- 
2.11.0
