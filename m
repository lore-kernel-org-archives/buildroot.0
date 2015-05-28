From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 28 May 2015 10:23:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/shairport-sync: Add musl patches
Message-ID: <1432801431-16986-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patches to fix the following issues:
  - shairport-sync crashes on musl libc because of a stack overflow
  - warning about incorrect header includes for poll.h and signal.h

Both patches PR'ed upstream:
https://github.com/mikebrady/shairport-sync/pull/78

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 .../0001-Fix-segfault-with-musl-libc.patch         | 63 ++++++++++++++++++++++
 ...x-redirection-of-incorrect-system-headers.patch | 56 +++++++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 package/shairport-sync/0001-Fix-segfault-with-musl-libc.patch
 create mode 100644 package/shairport-sync/0002-Fix-redirection-of-incorrect-system-headers.patch

diff --git a/package/shairport-sync/0001-Fix-segfault-with-musl-libc.patch b/package/shairport-sync/0001-Fix-segfault-with-musl-libc.patch
new file mode 100644
index 0000000..7307729
--- /dev/null
+++ b/package/shairport-sync/0001-Fix-segfault-with-musl-libc.patch
@@ -0,0 +1,63 @@
+From e12d7ad23ee3c40b61c31543737dd1b929e08a53 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Thu, 28 May 2015 09:10:59 +0200
+Subject: [PATCH 1/1] Fix segfault with musl libc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+shairport-sync crashes on musl libc when accessing the `statistics` array in
+`player_thread_func()`. This array is quite large (60128 bytes) and the data
+for this thread exceed the the default stack size on musl libc of 80k [1].
+
+Safe and portable programs should not depend upon the default stack limit, but
+instead, explicitly allocate enough stack for each thread by using the
+pthread_attr_setstacksize routine [2].
+
+So, lets set the stack size for the `player_thread` to 128k. A follow-up patch
+may set the stack sizes for the other threads, too. The difficulty here is to
+decide how much memory to allocate for the stack.
+
+[1]
+http://wiki.musl-libc.org/wiki/Functional_differences_from_glibc#Thread_stack_size
+
+[2]
+https://computing.llnl.gov/tutorials/pthreads/#Stack
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ player.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/player.c b/player.c
+index fcca348..561c3f2 100644
+--- a/player.c
++++ b/player.c
+@@ -42,6 +42,7 @@
+ #include <fcntl.h>
+ #include <stdlib.h>
+ #include <errno.h>
++#include <limits.h>
+ 
+ #include "config.h"
+ 
+@@ -1104,7 +1105,15 @@ int player_play(stream_cfg *stream) {
+   if (rc)
+     debug(1,"Error initialising condition variable.");
+   config.output->start(sampling_rate);
+-  pthread_create(&player_thread, NULL, player_thread_func, NULL);
++
++  size_t size = (PTHREAD_STACK_MIN + 128 * 1024);
++  pthread_attr_t tattr;
++  pthread_attr_init(&tattr);
++  rc = pthread_attr_setstacksize(&tattr, size);
++  if (rc)
++    debug(1, "Error setting stack size for player_thread: %s", strerror(errno));
++  pthread_create(&player_thread, &tattr, player_thread_func, NULL);
++  pthread_attr_destroy(&tattr);
+ 
+   return 0;
+ }
+-- 
+2.4.2
+
diff --git a/package/shairport-sync/0002-Fix-redirection-of-incorrect-system-headers.patch b/package/shairport-sync/0002-Fix-redirection-of-incorrect-system-headers.patch
new file mode 100644
index 0000000..4e48dae
--- /dev/null
+++ b/package/shairport-sync/0002-Fix-redirection-of-incorrect-system-headers.patch
@@ -0,0 +1,56 @@
+From 8a122426c654ce87568b6be78af7e66df4a1b4c0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Thu, 28 May 2015 09:54:46 +0200
+Subject: [PATCH 2/2] Fix redirection of incorrect system headers
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The POSIX correct header include is `<poll.h>` [1] and `<signal.h>`
+
+The glibc silently redirects these incorrect includes, musl libc prints
+a warning:
+  #warning redirecting incorrect #include <sys/poll.h> to <poll.h>
+  #warning redirecting incorrect #include <sys/signal.h> to <signal.h>
+
+[1]
+http://pubs.opengroup.org/onlinepubs/7908799/xsh/poll.h.html
+
+[2]
+http://pubs.opengroup.org/onlinepubs/7908799/xsh/signal.h.html
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ player.c | 2 +-
+ rtsp.c   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/player.c b/player.c
+index 561c3f2..3b28eee 100644
+--- a/player.c
++++ b/player.c
+@@ -36,7 +36,7 @@
+ #include <pthread.h>
+ #include <math.h>
+ #include <sys/stat.h>
+-#include <sys/signal.h>
++#include <signal.h>
+ #include <sys/syslog.h>
+ #include <assert.h>
+ #include <fcntl.h>
+diff --git a/rtsp.c b/rtsp.c
+index 91e0728..379662a 100644
+--- a/rtsp.c
++++ b/rtsp.c
+@@ -39,7 +39,7 @@
+ #include <errno.h>
+ #include <fcntl.h>
+ #include <pthread.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ 
+ #include "config.h"
+ 
+-- 
+2.4.2
+
-- 
2.4.2
