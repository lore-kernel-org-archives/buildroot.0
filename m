From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 10 Nov 2015 00:05:44 +0100
Subject: [Buildroot] [RFC v1] directfb: fix musl compile
Message-ID: <1447110344-1446-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- use 'union sigval' instead of sigval_t (same as suggested
  for canfestival by Yann E. MORIN, see [2])

- delete DIRECT_RECURSIVE_MUTEX_INITIALIZER define (which uses unknown
  PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP)

- use DIRECT_MUTEX_INITIALIZER instead for trace.c (no recursive
  mutex needed)

- use pthread_once and direct_recursive_mutex_init instead for
  directfb.c

Fixes [1]:

  system.c:114:6: error: unknown type name 'sigval_t'

and

  ../lib/direct/os/linux/glibc/mutex.h:49:53: error: ?PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP? undeclared (first use in this function)

[1] http://autobuild.buildroot.net/results/548/548bf7b800a946e97135c0ba66363f388e517d6f
[2] https://patchwork.ozlabs.org/patch/509731

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
RFC: not yet runtime tested
---
 ...6-Fix-musl-sigval_t-related-compile-error.patch | 39 ++++++++++
 ...HREAD_RECURSIVE_MUTEX_INITIALIZER_NP-comp.patch | 84 ++++++++++++++++++++++
 2 files changed, 123 insertions(+)
 create mode 100644 package/directfb/0006-Fix-musl-sigval_t-related-compile-error.patch
 create mode 100644 package/directfb/0007-Fix-musl-PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP-comp.patch

diff --git a/package/directfb/0006-Fix-musl-sigval_t-related-compile-error.patch b/package/directfb/0006-Fix-musl-sigval_t-related-compile-error.patch
new file mode 100644
index 0000000..2a78833
--- /dev/null
+++ b/package/directfb/0006-Fix-musl-sigval_t-related-compile-error.patch
@@ -0,0 +1,39 @@
+From fdc648277b65e657cebb5c1095a82445d6c2c914 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 9 Nov 2015 22:57:42 +0100
+Subject: [PATCH] Fix musl/sigval_t related compile error.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Use 'union sigval' instead of sigval_t (same as suggested
+for canfestival by Yann E. MORIN, see [1]).
+
+Fixes the following compile error with musl libc:
+
+  system.c:114:6: error: unknown type name ?sigval_t?
+      sigval_t val;
+
+[1] https://patchwork.ozlabs.org/patch/509731
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ lib/direct/os/linux/glibc/system.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/direct/os/linux/glibc/system.c b/lib/direct/os/linux/glibc/system.c
+index 32086a2..373a711 100644
+--- a/lib/direct/os/linux/glibc/system.c
++++ b/lib/direct/os/linux/glibc/system.c
+@@ -111,7 +111,7 @@ direct_tgkill( int tgid, int tid, int sig )
+ void
+ direct_trap( const char *domain, int sig )
+ {
+-     sigval_t val;
++     union sigval val;
+ 
+      if (direct_config->delay_trap_ms) {
+           D_LOG( Direct_Trap, VERBOSE, "NOT RAISING signal %d from %s, waiting for %dms... attach gdb --pid=%d\n", sig, domain, direct_config->delay_trap_ms, getpid() );
+-- 
+2.1.4
+
diff --git a/package/directfb/0007-Fix-musl-PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP-comp.patch b/package/directfb/0007-Fix-musl-PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP-comp.patch
new file mode 100644
index 0000000..702b03e
--- /dev/null
+++ b/package/directfb/0007-Fix-musl-PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP-comp.patch
@@ -0,0 +1,84 @@
+From 85057029179c65bb31a1fdf44121773178e33cf4 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 9 Nov 2015 23:40:28 +0100
+Subject: [PATCH] Fix musl PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP compile
+ error.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+- delete DIRECT_RECURSIVE_MUTEX_INITIALIZER define (which uses unknown
+  PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP)
+- use DIRECT_MUTEX_INITIALIZER instead for trace.c (no recursive
+  mutex needed)
+- use pthread_once and direct_recursive_mutex_init instead for
+  directfb.c
+
+Fixes:
+
+  ../lib/direct/os/linux/glibc/mutex.h:49:53: error: ?PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP? undeclared (first use in this function)
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ lib/direct/os/linux/glibc/mutex.h |  1 -
+ lib/direct/trace.c                |  2 +-
+ src/directfb.c                    | 11 ++++++++++-
+ 3 files changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/lib/direct/os/linux/glibc/mutex.h b/lib/direct/os/linux/glibc/mutex.h
+index 1049c14..37573b2 100644
+--- a/lib/direct/os/linux/glibc/mutex.h
++++ b/lib/direct/os/linux/glibc/mutex.h
+@@ -46,7 +46,6 @@ struct __D_DirectMutex {
+ /**********************************************************************************************************************/
+ 
+ #define DIRECT_MUTEX_INITIALIZER(name)            { PTHREAD_MUTEX_INITIALIZER }
+-#define DIRECT_RECURSIVE_MUTEX_INITIALIZER(name)  { PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP }
+ 
+ #endif
+ 
+diff --git a/lib/direct/trace.c b/lib/direct/trace.c
+index cb43954..88d8e5d 100644
+--- a/lib/direct/trace.c
++++ b/lib/direct/trace.c
+@@ -89,7 +89,7 @@ struct __D_DirectTraceBuffer {
+ /**************************************************************************************************/
+ 
+ static DirectLink  *buffers;
+-static DirectMutex  buffers_lock = DIRECT_RECURSIVE_MUTEX_INITIALIZER(buffers_lock);
++static DirectMutex  buffers_lock = DIRECT_MUTEX_INITIALIZER(buffers_lock);
+ 
+ /**************************************************************************************************/
+ 
+diff --git a/src/directfb.c b/src/directfb.c
+index 713f6c4..d060e58 100644
+--- a/src/directfb.c
++++ b/src/directfb.c
+@@ -163,6 +163,15 @@ DirectFBSetOption( const char *name, const char *value )
+      return DFB_OK;
+ }
+ 
++
++static pthread_once_t lock_init_once = PTHREAD_ONCE_INIT;
++static DirectMutex lock;
++
++static void lock_init(void)
++{
++    direct_recursive_mutex_init(&lock);
++}
++
+ /*
+  * Programs have to call this to get the super interface
+  * which is needed to access other functions
+@@ -215,7 +224,7 @@ DirectFBCreate( IDirectFB **interface_ptr )
+      if (dfb_config->remote.host)
+           return CreateRemote( dfb_config->remote.host, dfb_config->remote.port, interface_ptr );
+ 
+-     static DirectMutex lock = DIRECT_RECURSIVE_MUTEX_INITIALIZER(lock);
++     pthread_once(&lock_init_once, lock_init);
+ 
+      direct_mutex_lock( &lock );
+ 
+-- 
+2.1.4
+
-- 
2.1.4
