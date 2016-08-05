From: Romain Naour <romain.naour@gmail.com>
Date: Fri,  5 Aug 2016 21:31:49 +0200
Subject: [Buildroot] [PATCH] package/enlightenment: fix build issue without
	libuuid
Message-ID: <1470425509-26718-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since enlightenment 0.20 uuid.h is always included in e_pixmap.c but
libuuid is checked at configure time only when wayland support is
enabled.

Include uuid.h must guarded by HAVE_WAYLAND.

Fixes:
  CC       src/bin/src_bin_enlightenment-e_pixmap.o
src/bin/e_pixmap.c:16:18: fatal error: uuid.h: No such file or directory

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...uid.h-only-when-Wayland-support-is-enable.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/enlightenment/0001-E-include-uuid.h-only-when-Wayland-support-is-enable.patch

diff --git a/package/enlightenment/0001-E-include-uuid.h-only-when-Wayland-support-is-enable.patch b/package/enlightenment/0001-E-include-uuid.h-only-when-Wayland-support-is-enable.patch
new file mode 100644
index 0000000..3f33fa3
--- /dev/null
+++ b/package/enlightenment/0001-E-include-uuid.h-only-when-Wayland-support-is-enable.patch
@@ -0,0 +1,39 @@
+From 368c4c7cc5722b2edfe98fb3a8999f8f01bc9b56 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Fri, 5 Aug 2016 21:14:46 +0200
+Subject: [PATCH] E: include uuid.h only when Wayland support is enabled.
+
+libuuid is checked only when Wayland support is enabled and
+uuid_t uuid is guarded by HAVE_WAYLAND.
+
+So move include uuid.h below a HAVE_WAYLAND.
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/bin/e_pixmap.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/bin/e_pixmap.c b/src/bin/e_pixmap.c
+index 2bd94a7..0b01473 100644
+--- a/src/bin/e_pixmap.c
++++ b/src/bin/e_pixmap.c
+@@ -2,6 +2,7 @@
+ 
+ #ifdef HAVE_WAYLAND
+ # include "e_comp_wl.h"
++# include <uuid.h>
+ # ifndef EGL_TEXTURE_FORMAT
+ #  define EGL_TEXTURE_FORMAT		0x3080
+ # endif
+@@ -13,8 +14,6 @@
+ # include "e_comp_x.h"
+ #endif
+ 
+-#include <uuid.h>
+-
+ static Eina_Hash *pixmaps[2] = {NULL};
+ static Eina_Hash *aliases[2] = {NULL};
+ 
+-- 
+2.5.5
+
-- 
2.5.5
