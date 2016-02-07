From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 22:02:47 +0100
Subject: [Buildroot] [git commit] mpd: use upstream patches
Message-ID: <20160207210346.EA4527FCC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb444002409b677de22e54bf97030ef9121bd188
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit replaces 0002-musl-gcc5-fixes.patch by a backport of 3
upstream commits. It also renames
0001-thread-Name-include-stdio.h-for-prctl-as-well.patch to have the
sequence number 0004, so that it applies after the backported upstream
patches (since this patch is not upstream yet).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-notify-Don-t-use-constexpr-on-Haiku.patch | 28 +++++++
 package/mpd/0002-musl-gcc5-fixes.patch             | 56 -------------
 ...0002-notify-use-constexpr-only-with-glibc.patch | 31 +++++++
 ...x-Mutex-Cond-use-constexpr-only-with-glib.patch | 97 ++++++++++++++++++++++
 ...d-Name-include-stdio.h-for-prctl-as-well.patch} | 10 +--
 5 files changed, 161 insertions(+), 61 deletions(-)

diff --git a/package/mpd/0001-notify-Don-t-use-constexpr-on-Haiku.patch b/package/mpd/0001-notify-Don-t-use-constexpr-on-Haiku.patch
new file mode 100644
index 0000000..2685578
--- /dev/null
+++ b/package/mpd/0001-notify-Don-t-use-constexpr-on-Haiku.patch
@@ -0,0 +1,28 @@
+From f7d5081b727f69ae3a894a4a3310670a5d9ab077 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Fran=C3=A7ois=20Revol?= <revol@free.fr>
+Date: Thu, 17 Sep 2015 22:18:10 +0200
+Subject: [PATCH] notify: Don't use constexpr on Haiku
+
+[Thomas: taken from upstream commit bf73d0f9051fd5740c22bf6e5114ceb4535d548f.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/notify.hxx | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/notify.hxx b/src/notify.hxx
+index 3e62a01..1ee413f 100644
+--- a/src/notify.hxx
++++ b/src/notify.hxx
+@@ -28,7 +28,8 @@ struct notify {
+ 	Cond cond;
+ 	bool pending;
+ 
+-#if !defined(WIN32) && !defined(__NetBSD__) && !defined(__BIONIC__)
++#if !defined(WIN32) && !defined(__NetBSD__) && !defined(__BIONIC__) && \
++	!defined(__HAIKU__)
+ 	constexpr
+ #endif
+ 	notify():pending(false) {}
+-- 
+2.6.4
+
diff --git a/package/mpd/0002-musl-gcc5-fixes.patch b/package/mpd/0002-musl-gcc5-fixes.patch
deleted file mode 100644
index a4c65cc..0000000
--- a/package/mpd/0002-musl-gcc5-fixes.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-musl gcc5 fixes
-
-Fetch from:
-http://git.alpinelinux.org/cgit/aports/plain/main/mpd/musl-gcc5-fixes.patch
-
-Problem has been reported upstream and closed with WONTFIX:
-http://bugs.musicpd.org/view.php?id=4387
-http://bugs.musicpd.org/view.php?id=4110
-
-however...
-
-POSIX does not permit using PTHREAD_COND_INITIALIZER except for static
-initialization, and certainly does not permit using it as a value
-
-also POSIX does not specify the type of the object (it's opaque) so if
-there are any types for which their code would be invalid C++, then their
-code is invalid
-
-also, volatile in the type is necessary. without that, LTO can break the code.
-
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
-
---- ./src/notify.hxx.orig
-+++ ./src/notify.hxx
-@@ -28,7 +28,7 @@
- 	Cond cond;
- 	bool pending;
- 
--#if !defined(WIN32) && !defined(__NetBSD__) && !defined(__BIONIC__)
-+#if defined(__GLIBC__)
- 	constexpr
- #endif
- 	notify():pending(false) {}
---- ./src/thread/PosixCond.hxx.orig
-+++ ./src/thread/PosixCond.hxx
-@@ -41,7 +41,7 @@
- 	pthread_cond_t cond;
- 
- public:
--#if defined(__NetBSD__) || defined(__BIONIC__)
-+#if !defined(__GLIBC__)
- 	/* NetBSD's PTHREAD_COND_INITIALIZER is not compatible with
- 	   "constexpr" */
- 	PosixCond() {
---- ./src/thread/PosixMutex.hxx.orig
-+++ ./src/thread/PosixMutex.hxx
-@@ -41,7 +41,7 @@
- 	pthread_mutex_t mutex;
- 
- public:
--#if defined(__NetBSD__) || defined(__BIONIC__)
-+#if !defined(__GLIBC__)
- 	/* NetBSD's PTHREAD_MUTEX_INITIALIZER is not compatible with
- 	   "constexpr" */
- 	PosixMutex() {
-
diff --git a/package/mpd/0002-notify-use-constexpr-only-with-glibc.patch b/package/mpd/0002-notify-use-constexpr-only-with-glibc.patch
new file mode 100644
index 0000000..e50f598
--- /dev/null
+++ b/package/mpd/0002-notify-use-constexpr-only-with-glibc.patch
@@ -0,0 +1,31 @@
+From 09830d448d6299a47fbccf39af6f325be5f2b514 Mon Sep 17 00:00:00 2001
+From: Max Kellermann <max@duempel.org>
+Date: Thu, 17 Sep 2015 22:56:35 +0200
+Subject: [PATCH] notify: use "constexpr" only with glibc
+
+The Mutex and Cond constructors are only "constexpr" with glibc, and
+this is what this #ifdef is about.
+
+[Thomas: taken from upstream commit 459a812a54509ebfd634a3df2998395c9cb5b98f.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/notify.hxx | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/notify.hxx b/src/notify.hxx
+index 1ee413f..c96390b 100644
+--- a/src/notify.hxx
++++ b/src/notify.hxx
+@@ -28,8 +28,7 @@ struct notify {
+ 	Cond cond;
+ 	bool pending;
+ 
+-#if !defined(WIN32) && !defined(__NetBSD__) && !defined(__BIONIC__) && \
+-	!defined(__HAIKU__)
++#ifdef __GLIBC__
+ 	constexpr
+ #endif
+ 	notify():pending(false) {}
+-- 
+2.6.4
+
diff --git a/package/mpd/0003-thread-Posix-Mutex-Cond-use-constexpr-only-with-glib.patch b/package/mpd/0003-thread-Posix-Mutex-Cond-use-constexpr-only-with-glib.patch
new file mode 100644
index 0000000..26fd7f6
--- /dev/null
+++ b/package/mpd/0003-thread-Posix-Mutex-Cond-use-constexpr-only-with-glib.patch
@@ -0,0 +1,97 @@
+From 42a5f0c4435757505bd515b68c2a27e8f7565f34 Mon Sep 17 00:00:00 2001
+From: Max Kellermann <max@duempel.org>
+Date: Tue, 25 Aug 2015 12:46:12 +0200
+Subject: [PATCH] thread/Posix{Mutex,Cond}: use "constexpr" only with glibc
+
+Apparently all other C libraries are not compatible with "constexpr".
+Those which are not will get a performance penalty, but at least they
+work at all.
+
+[Thomas: taken from upstream commit 75dff6445063d9b49cca126fd661c9abbd680977.]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/thread/PosixCond.hxx  | 16 ++++++++--------
+ src/thread/PosixMutex.hxx | 16 ++++++++--------
+ 2 files changed, 16 insertions(+), 16 deletions(-)
+
+diff --git a/src/thread/PosixCond.hxx b/src/thread/PosixCond.hxx
+index b3fe204..73dbe02 100644
+--- a/src/thread/PosixCond.hxx
++++ b/src/thread/PosixCond.hxx
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (C) 2009-2013 Max Kellermann <max@duempel.org>
++ * Copyright (C) 2009-2015 Max Kellermann <max@duempel.org>
+  *
+  * Redistribution and use in source and binary forms, with or without
+  * modification, are permitted provided that the following conditions
+@@ -41,9 +41,13 @@ class PosixCond {
+ 	pthread_cond_t cond;
+ 
+ public:
+-#if defined(__NetBSD__) || defined(__BIONIC__)
+-	/* NetBSD's PTHREAD_COND_INITIALIZER is not compatible with
+-	   "constexpr" */
++#ifdef __GLIBC__
++	/* optimized constexpr constructor for pthread implementations
++	   that support it */
++	constexpr PosixCond():cond(PTHREAD_COND_INITIALIZER) {}
++#else
++	/* slow fallback for pthread implementations that are not
++	   compatible with "constexpr" */
+ 	PosixCond() {
+ 		pthread_cond_init(&cond, nullptr);
+ 	}
+@@ -51,10 +55,6 @@ public:
+ 	~PosixCond() {
+ 		pthread_cond_destroy(&cond);
+ 	}
+-#else
+-	/* optimized constexpr constructor for sane POSIX
+-	   implementations */
+-	constexpr PosixCond():cond(PTHREAD_COND_INITIALIZER) {}
+ #endif
+ 
+ 	PosixCond(const PosixCond &other) = delete;
+diff --git a/src/thread/PosixMutex.hxx b/src/thread/PosixMutex.hxx
+index 5805158..e0fd614 100644
+--- a/src/thread/PosixMutex.hxx
++++ b/src/thread/PosixMutex.hxx
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (C) 2009-2013 Max Kellermann <max@duempel.org>
++ * Copyright (C) 2009-2015 Max Kellermann <max@duempel.org>
+  *
+  * Redistribution and use in source and binary forms, with or without
+  * modification, are permitted provided that the following conditions
+@@ -41,9 +41,13 @@ class PosixMutex {
+ 	pthread_mutex_t mutex;
+ 
+ public:
+-#if defined(__NetBSD__) || defined(__BIONIC__)
+-	/* NetBSD's PTHREAD_MUTEX_INITIALIZER is not compatible with
+-	   "constexpr" */
++#ifdef __GLIBC__
++	/* optimized constexpr constructor for pthread implementations
++	   that support it */
++	constexpr PosixMutex():mutex(PTHREAD_MUTEX_INITIALIZER) {}
++#else
++	/* slow fallback for pthread implementations that are not
++	   compatible with "constexpr" */
+ 	PosixMutex() {
+ 		pthread_mutex_init(&mutex, nullptr);
+ 	}
+@@ -51,10 +55,6 @@ public:
+ 	~PosixMutex() {
+ 		pthread_mutex_destroy(&mutex);
+ 	}
+-#else
+-	/* optimized constexpr constructor for sane POSIX
+-	   implementations */
+-	constexpr PosixMutex():mutex(PTHREAD_MUTEX_INITIALIZER) {}
+ #endif
+ 
+ 	PosixMutex(const PosixMutex &other) = delete;
+-- 
+2.6.4
+
diff --git a/package/mpd/0001-thread-Name-include-stdio.h-for-prctl-as-well.patch b/package/mpd/0004-thread-Name-include-stdio.h-for-prctl-as-well.patch
similarity index 81%
rename from package/mpd/0001-thread-Name-include-stdio.h-for-prctl-as-well.patch
rename to package/mpd/0004-thread-Name-include-stdio.h-for-prctl-as-well.patch
index 1711da3..1943623 100644
--- a/package/mpd/0001-thread-Name-include-stdio.h-for-prctl-as-well.patch
+++ b/package/mpd/0004-thread-Name-include-stdio.h-for-prctl-as-well.patch
@@ -1,4 +1,4 @@
-From 36139b29cccae008c74924d81ea67d265327f7ac Mon Sep 17 00:00:00 2001
+From a0a9fed68126eb24e04af924c0d46351ff5eeb0f Mon Sep 17 00:00:00 2001
 From: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Date: Mon, 26 Jan 2015 09:55:04 -0300
 Subject: [PATCH] thread/Name: include stdio.h for prctl as well
@@ -12,11 +12,11 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
  1 file changed, 1 insertion(+)
 
 diff --git a/src/thread/Name.hxx b/src/thread/Name.hxx
-index 1576b3f..8d46d33 100644
+index a99208d..8f9d7d3 100644
 --- a/src/thread/Name.hxx
 +++ b/src/thread/Name.hxx
-@@ -26,6 +26,7 @@
- #  include <stdio.h>
+@@ -25,6 +25,7 @@
+ #  include <pthread.h>
  #elif defined(HAVE_PRCTL)
  #  include <sys/prctl.h>
 +#  include <stdio.h>
@@ -24,5 +24,5 @@ index 1576b3f..8d46d33 100644
  #    define HAVE_THREAD_NAME
  #  endif
 -- 
-2.0.5
+2.6.4
 
