From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Mar 2016 14:50:30 -0300
Subject: [Buildroot] [PATCH] mpd: bump to version 0.19.14
Message-ID: <1458928230-10295-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

0003-thread-Posix-Mutex-Cond-use-constexpr-only-with-glib.patch is
upstream so remove it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...onfigure.ac-check-if-libatomic-is-needed.patch} |  0
 ...x-Mutex-Cond-use-constexpr-only-with-glib.patch | 97 ----------------------
 package/mpd/mpd.hash                               |  2 +-
 package/mpd/mpd.mk                                 |  2 +-
 4 files changed, 2 insertions(+), 99 deletions(-)
 rename package/mpd/{0005-configure.ac-check-if-libatomic-is-needed.patch => 0003-configure.ac-check-if-libatomic-is-needed.patch} (100%)
 delete mode 100644 package/mpd/0003-thread-Posix-Mutex-Cond-use-constexpr-only-with-glib.patch

diff --git a/package/mpd/0005-configure.ac-check-if-libatomic-is-needed.patch b/package/mpd/0003-configure.ac-check-if-libatomic-is-needed.patch
similarity index 100%
rename from package/mpd/0005-configure.ac-check-if-libatomic-is-needed.patch
rename to package/mpd/0003-configure.ac-check-if-libatomic-is-needed.patch
diff --git a/package/mpd/0003-thread-Posix-Mutex-Cond-use-constexpr-only-with-glib.patch b/package/mpd/0003-thread-Posix-Mutex-Cond-use-constexpr-only-with-glib.patch
deleted file mode 100644
index 26fd7f6..0000000
--- a/package/mpd/0003-thread-Posix-Mutex-Cond-use-constexpr-only-with-glib.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 42a5f0c4435757505bd515b68c2a27e8f7565f34 Mon Sep 17 00:00:00 2001
-From: Max Kellermann <max@duempel.org>
-Date: Tue, 25 Aug 2015 12:46:12 +0200
-Subject: [PATCH] thread/Posix{Mutex,Cond}: use "constexpr" only with glibc
-
-Apparently all other C libraries are not compatible with "constexpr".
-Those which are not will get a performance penalty, but at least they
-work at all.
-
-[Thomas: taken from upstream commit 75dff6445063d9b49cca126fd661c9abbd680977.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/thread/PosixCond.hxx  | 16 ++++++++--------
- src/thread/PosixMutex.hxx | 16 ++++++++--------
- 2 files changed, 16 insertions(+), 16 deletions(-)
-
-diff --git a/src/thread/PosixCond.hxx b/src/thread/PosixCond.hxx
-index b3fe204..73dbe02 100644
---- a/src/thread/PosixCond.hxx
-+++ b/src/thread/PosixCond.hxx
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (C) 2009-2013 Max Kellermann <max@duempel.org>
-+ * Copyright (C) 2009-2015 Max Kellermann <max@duempel.org>
-  *
-  * Redistribution and use in source and binary forms, with or without
-  * modification, are permitted provided that the following conditions
-@@ -41,9 +41,13 @@ class PosixCond {
- 	pthread_cond_t cond;
- 
- public:
--#if defined(__NetBSD__) || defined(__BIONIC__)
--	/* NetBSD's PTHREAD_COND_INITIALIZER is not compatible with
--	   "constexpr" */
-+#ifdef __GLIBC__
-+	/* optimized constexpr constructor for pthread implementations
-+	   that support it */
-+	constexpr PosixCond():cond(PTHREAD_COND_INITIALIZER) {}
-+#else
-+	/* slow fallback for pthread implementations that are not
-+	   compatible with "constexpr" */
- 	PosixCond() {
- 		pthread_cond_init(&cond, nullptr);
- 	}
-@@ -51,10 +55,6 @@ public:
- 	~PosixCond() {
- 		pthread_cond_destroy(&cond);
- 	}
--#else
--	/* optimized constexpr constructor for sane POSIX
--	   implementations */
--	constexpr PosixCond():cond(PTHREAD_COND_INITIALIZER) {}
- #endif
- 
- 	PosixCond(const PosixCond &other) = delete;
-diff --git a/src/thread/PosixMutex.hxx b/src/thread/PosixMutex.hxx
-index 5805158..e0fd614 100644
---- a/src/thread/PosixMutex.hxx
-+++ b/src/thread/PosixMutex.hxx
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (C) 2009-2013 Max Kellermann <max@duempel.org>
-+ * Copyright (C) 2009-2015 Max Kellermann <max@duempel.org>
-  *
-  * Redistribution and use in source and binary forms, with or without
-  * modification, are permitted provided that the following conditions
-@@ -41,9 +41,13 @@ class PosixMutex {
- 	pthread_mutex_t mutex;
- 
- public:
--#if defined(__NetBSD__) || defined(__BIONIC__)
--	/* NetBSD's PTHREAD_MUTEX_INITIALIZER is not compatible with
--	   "constexpr" */
-+#ifdef __GLIBC__
-+	/* optimized constexpr constructor for pthread implementations
-+	   that support it */
-+	constexpr PosixMutex():mutex(PTHREAD_MUTEX_INITIALIZER) {}
-+#else
-+	/* slow fallback for pthread implementations that are not
-+	   compatible with "constexpr" */
- 	PosixMutex() {
- 		pthread_mutex_init(&mutex, nullptr);
- 	}
-@@ -51,10 +55,6 @@ public:
- 	~PosixMutex() {
- 		pthread_mutex_destroy(&mutex);
- 	}
--#else
--	/* optimized constexpr constructor for sane POSIX
--	   implementations */
--	constexpr PosixMutex():mutex(PTHREAD_MUTEX_INITIALIZER) {}
- #endif
- 
- 	PosixMutex(const PosixMutex &other) = delete;
--- 
-2.6.4
-
diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 85c99be..e47cefd 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	f1014838fa7ab2d5fe2ef7f4c101d58fdec2c4c13cfbd2462ee146c8e4919a55	mpd-0.19.13.tar.xz
+sha256	2fd23805132e5002a4d24930001a7c7d3aaf55e3bd0cd71af5385895160e99e7	mpd-0.19.14.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 170a27f..9a1c957 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.19
-MPD_VERSION = $(MPD_VERSION_MAJOR).13
+MPD_VERSION = $(MPD_VERSION_MAJOR).14
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost libglib2
-- 
2.7.3
