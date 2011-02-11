From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 11 Feb 2011 10:26:24 +0100
Subject: [Buildroot] [git commit master 1/1] libcue: fix build on uClibc
	with locale support enabled
Message-ID: <20110211093539.B13B688E7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7beeb2f820d5d5dfc8ce60b48234d855412bc135
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Caused by a name clash between cue_scanner.c and stdio.h.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../libcue/libcue-1.4.0-__unused-fix.patch         |   50 ++++++++++++++++++++
 1 files changed, 50 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/libcue/libcue-1.4.0-__unused-fix.patch

diff --git a/package/multimedia/libcue/libcue-1.4.0-__unused-fix.patch b/package/multimedia/libcue/libcue-1.4.0-__unused-fix.patch
new file mode 100644
index 0000000..8a58919
--- /dev/null
+++ b/package/multimedia/libcue/libcue-1.4.0-__unused-fix.patch
@@ -0,0 +1,50 @@
+[PATCH] fix build on uClibc
+
+Use cue_unused / cue_dead2 for the unused/non-returning annotation macros,
+as uClibc defines a struct member called __unused in stdio.h when built
+with locale support, breaking the build.
+
+According to ANSI C 4.1.2.1, defines beginning with '__' are reserved
+for the implementation, so shouldn't be used in user code.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ src/libcue/cue_scanner.c |   10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+Index: libcue-1.4.0/src/libcue/cue_scanner.c
+===================================================================
+--- libcue-1.4.0.orig/src/libcue/cue_scanner.c
++++ libcue-1.4.0/src/libcue/cue_scanner.c
+@@ -7,9 +7,11 @@
+ 
+ #if defined(__FreeBSD__)
+ #include <sys/cdefs.h>
++#define cue_unused __unused
++#define cue_dead2 __dead2
+ #else
+-#define __unused
+-#define __dead2
++#define cue_unused
++#define cue_dead2
+ #endif
+ 
+ #define FLEX_SCANNER
+@@ -248,7 +250,7 @@
+ YY_BUFFER_STATE yy_scan_bytes YY_PROTO(( yyconst char *bytes, int len ));
+ 
+ static void *yy_flex_alloc YY_PROTO(( yy_size_t ));
+-static void *yy_flex_realloc YY_PROTO(( void *, yy_size_t )) __unused;
++static void *yy_flex_realloc YY_PROTO(( void *, yy_size_t )) cue_unused;
+ static void yy_flex_free YY_PROTO(( void * ));
+ 
+ #define yy_new_buffer yy_create_buffer
+@@ -285,7 +287,7 @@
+ static yy_state_type yy_get_previous_state YY_PROTO(( void ));
+ static yy_state_type yy_try_NUL_trans YY_PROTO(( yy_state_type current_state ));
+ static int yy_get_next_buffer YY_PROTO(( void ));
+-static void yy_fatal_error YY_PROTO(( yyconst char msg[] )) __dead2;
++static void yy_fatal_error YY_PROTO(( yyconst char msg[] )) cue_dead2;
+ 
+ /* Done after the current pattern has been matched and before the
+  * corresponding action - sets up yytext.
-- 
1.7.3.4
