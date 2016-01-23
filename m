From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 13:30:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/gamin: Fix musl build
Message-ID: <1453552227-30435-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/ff2/ff242b771b9ab690c12022d10a76270551733a64/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gamin/0003-fix-pthread-mutex.patch | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 package/gamin/0003-fix-pthread-mutex.patch

diff --git a/package/gamin/0003-fix-pthread-mutex.patch b/package/gamin/0003-fix-pthread-mutex.patch
new file mode 100644
index 0000000..be5cef0
--- /dev/null
+++ b/package/gamin/0003-fix-pthread-mutex.patch
@@ -0,0 +1,19 @@
+Fix musl build
+
+Patch downloaded from
+
+https://cgit.gentoo.org/proj/musl.git/tree/dev-libs/libgamin/files/libgamin-0.1.10-fix-pthread-mutex.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- gamin-0.1.10.orig/libgamin/gam_data.c
++++ gamin-0.1.10/libgamin/gam_data.c
+@@ -470,7 +470,7 @@
+     }
+     if (is_threaded > 0) {
+ 	pthread_mutexattr_init(&attr);
+-#if defined(linux) || defined(PTHREAD_MUTEX_RECURSIVE_NP)
++#if defined(linux) && defined(PTHREAD_MUTEX_RECURSIVE_NP)
+ 	pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE_NP);
+ #else
+ 	pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
-- 
2.7.0.rc3
