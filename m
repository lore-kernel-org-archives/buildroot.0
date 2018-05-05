From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri,  4 May 2018 23:34:28 -0300
Subject: [Buildroot] [PATCH] nasm: Fix compilation with GCC 8
Message-ID: <20180505023428.32414-1-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-nasm fails to compile with GCC 8:

In file included from ./include/nasm.h:46,
                 from asm/nasm.c:47:
./include/nasmlib.h:194:1: error: ?pure? attribute on function returning ?void? [-Werror=attributes]
 void pure_func seg_init(void);
 ^~~~

Pull a patch from upstream that removes the stale declaration of
seg_init, which was eliminated a long time ago.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 .../0001-nasmlib-Drop-unused-seg_init.patch   | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/nasm/0001-nasmlib-Drop-unused-seg_init.patch

diff --git a/package/nasm/0001-nasmlib-Drop-unused-seg_init.patch b/package/nasm/0001-nasmlib-Drop-unused-seg_init.patch
new file mode 100644
index 0000000000..a18d121bfb
--- /dev/null
+++ b/package/nasm/0001-nasmlib-Drop-unused-seg_init.patch
@@ -0,0 +1,32 @@
+From 5eb1838b4d3752fd863d19442943983a2a5ee87c Mon Sep 17 00:00:00 2001
+From: Cyrill Gorcunov <gorcunov@gmail.com>
+Date: Sat, 10 Feb 2018 00:33:41 +0300
+Subject: [PATCH] nasmlib: Drop unused seg_init
+
+The helper has been eliminated in 2c4a4d5810d0a59b033a07876a2648ef5d4c2859
+
+https://bugzilla.nasm.us/show_bug.cgi?id=3392461
+
+Signed-off-by: Cyrill Gorcunov <gorcunov@gmail.com>
+---
+ include/nasmlib.h | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/include/nasmlib.h b/include/nasmlib.h
+index 79e866b5..fee1b5ea 100644
+--- a/include/nasmlib.h
++++ b/include/nasmlib.h
+@@ -188,10 +188,8 @@ int64_t readnum(char *str, bool *error);
+ int64_t readstrnum(char *str, int length, bool *warn);
+ 
+ /*
+- * seg_init: Initialise the segment-number allocator.
+  * seg_alloc: allocate a hitherto unused segment number.
+  */
+-void pure_func seg_init(void);
+ int32_t pure_func seg_alloc(void);
+ 
+ /*
+-- 
+2.17.0
+
-- 
2.17.0
