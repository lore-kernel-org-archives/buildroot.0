From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Jan 2020 09:09:04 +0100
Subject: [Buildroot] [git commit] package/gensio: fix build without threads
Message-ID: <20200126075909.0A38383B6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e1a39ff2688455cb390c18c3aa629ae8382f26c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/b5847ac9e818571b746e2a81cf830b6caf50a7d7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...an-issue-compiling-with-pthreads-disabled.patch | 27 ++++++++++++++
 ...selector.c-fix-definition-of-pthread_mute.patch | 42 ++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/package/gensio/0001-Fix-an-issue-compiling-with-pthreads-disabled.patch b/package/gensio/0001-Fix-an-issue-compiling-with-pthreads-disabled.patch
new file mode 100644
index 0000000000..d7af0acb97
--- /dev/null
+++ b/package/gensio/0001-Fix-an-issue-compiling-with-pthreads-disabled.patch
@@ -0,0 +1,27 @@
+From 2e1a982ed0eef1188ad15995e177e7d40746685f Mon Sep 17 00:00:00 2001
+From: Corey Minyard <cminyard@mvista.com>
+Date: Tue, 7 Jan 2020 11:34:33 -0600
+Subject: [PATCH] Fix an issue compiling with pthreads disabled
+
+Define PTHREAD_MUTEX_INITIALIZER in this case.
+
+Signed-off-by: Corey Minyard <cminyard@mvista.com>
+[Retrieved from:
+https://github.com/cminyard/gensio/commit/2e1a982ed0eef1188ad15995e177e7d40746685f]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/gensio_selector.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/gensio_selector.c b/lib/gensio_selector.c
+index c050df0..66ada01 100644
+--- a/lib/gensio_selector.c
++++ b/lib/gensio_selector.c
+@@ -30,6 +30,7 @@
+ #define pthread_mutex_unlock(l) do { } while (0)
+ #define pthread_mutex_init(l, n) do { } while (0)
+ #define pthread_mutex_destroy(l, n) do { } while (0)
++#define PTHREAD_MUTEX_INITIALIZER 0
+ #endif
+ 
+ #include <gensio/gensio_selector.h>
diff --git a/package/gensio/0002-lib-gensio_selector.c-fix-definition-of-pthread_mute.patch b/package/gensio/0002-lib-gensio_selector.c-fix-definition-of-pthread_mute.patch
new file mode 100644
index 0000000000..1c90bf3711
--- /dev/null
+++ b/package/gensio/0002-lib-gensio_selector.c-fix-definition-of-pthread_mute.patch
@@ -0,0 +1,42 @@
+From f1582f417aaf8f4fa7f1828f2504ba2f03909819 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 25 Jan 2020 23:35:54 +0100
+Subject: [PATCH] lib/gensio_selector.c: fix definition of
+ pthread_mutex_destroy
+
+Fix definition of pthread_mutex_destroy otherwise build without threads
+will fail on:
+
+gensio_selector.c: In function 'gensio_sel_free_lock':
+gensio_selector.c:82:38: error: macro "pthread_mutex_destroy" requires 2 arguments, but only 1 given
+     pthread_mutex_destroy(&lock->lock);
+                                      ^
+gensio_selector.c:82:5: error: 'pthread_mutex_destroy' undeclared (first use in this function)
+     pthread_mutex_destroy(&lock->lock);
+     ^~~~~~~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/b5847ac9e818571b746e2a81cf830b6caf50a7d7
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/cminyard/gensio/pull/8]
+---
+ lib/gensio_selector.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/gensio_selector.c b/lib/gensio_selector.c
+index a3bec38..615ab61 100644
+--- a/lib/gensio_selector.c
++++ b/lib/gensio_selector.c
+@@ -29,7 +29,7 @@
+ #define pthread_mutex_lock(l) do { } while (0)
+ #define pthread_mutex_unlock(l) do { } while (0)
+ #define pthread_mutex_init(l, n) do { } while (0)
+-#define pthread_mutex_destroy(l, n) do { } while (0)
++#define pthread_mutex_destroy(l) do { } while (0)
+ #define PTHREAD_MUTEX_INITIALIZER 0
+ #endif
+ 
+-- 
+2.24.1
+
