From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Nov 2020 13:22:32 +0100
Subject: [Buildroot] [git commit branch/next] package/ghostscript: fix build
 with freetype >= 2.10.3
Message-ID: <20201117203825.5F5ED7FB95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5177f726a08f77f669d763e762cf663449131ab2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch is needed to fix the build with freetype >= 2.10.3.

https://www.freetype.org/index.html#news
"A warning for distribution maintainers: Version 2.10.3 and later may
 break the build of ghostscript, due to ghostscript's use of a with-
 drawn macro that wasn't intended for external usage."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...01-bug-702985-drop-use-of-FT_CALLBACK_DEF.patch | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/package/ghostscript/0001-bug-702985-drop-use-of-FT_CALLBACK_DEF.patch b/package/ghostscript/0001-bug-702985-drop-use-of-FT_CALLBACK_DEF.patch
new file mode 100644
index 0000000000..044dcc72f1
--- /dev/null
+++ b/package/ghostscript/0001-bug-702985-drop-use-of-FT_CALLBACK_DEF.patch
@@ -0,0 +1,55 @@
+From 41ef9a0bc36b9db7115fbe9623f989bfb47bbade Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Tue, 20 Oct 2020 09:49:45 +0100
+Subject: [PATCH] Bug 702985: drop use of FT_CALLBACK_DEF() def
+
+From 2.10.3, Freetype disappeared the FT_CALLBACK_DEF() macro, which is what
+we used when defining our callbacks from Freetype.
+
+No guidance forthcoming from the Freetype developer who made those changes,
+so change to explicitly declaring the callbacks file static.
+
+Should fix the reported build failures.
+
+Downloaded from upstream commit:
+https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=41ef9a0bc36b
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ base/fapi_ft.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/base/fapi_ft.c b/base/fapi_ft.c
+index 65fa6dcf4..21aef2f06 100644
+--- a/base/fapi_ft.c
++++ b/base/fapi_ft.c
+@@ -125,7 +125,7 @@ static void
+ delete_inc_int_info(gs_fapi_server * a_server,
+                     FT_IncrementalRec * a_inc_int_info);
+ 
+-FT_CALLBACK_DEF(void *)
++static void *
+ FF_alloc(FT_Memory memory, long size)
+ {
+     gs_memory_t *mem = (gs_memory_t *) memory->user;
+@@ -133,7 +133,7 @@ FF_alloc(FT_Memory memory, long size)
+     return (gs_malloc(mem, size, 1, "FF_alloc"));
+ }
+ 
+-FT_CALLBACK_DEF(void *)
++static void *
+     FF_realloc(FT_Memory memory, long cur_size, long new_size, void *block)
+ {
+     gs_memory_t *mem = (gs_memory_t *) memory->user;
+@@ -153,7 +153,7 @@ FT_CALLBACK_DEF(void *)
+     return (tmp);
+ }
+ 
+-FT_CALLBACK_DEF(void)
++static void
+     FF_free(FT_Memory memory, void *block)
+ {
+     gs_memory_t *mem = (gs_memory_t *) memory->user;
+-- 
+2.17.1
+
