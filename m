From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 May 2018 22:39:49 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] nasm: Fix compilation
 with GCC 8
Message-ID: <20180524210450.E68DF825F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a54f8136dc34d7c61b72765d4e7882d9222b1595
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

host-nasm fails to compile with GCC 8:

In file included from ./include/nasm.h:46,
                 from asm/nasm.c:47:
./include/nasmlib.h:194:1: error: ???pure??? attribute on function returning ???void??? [-Werror=attributes]
 void pure_func seg_init(void);
 ^~~~

Pull a patch from upstream that removes the stale declaration of
seg_init, which was eliminated a long time ago.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 3aa64a0e828eca3669cbd1fa3fb9fef69dacf74e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../nasm/0001-nasmlib-Drop-unused-seg_init.patch   | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

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
