From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 May 2016 22:21:33 +0200
Subject: [Buildroot] [git commit] package/mpd: bump to version 0.19.15
Message-ID: <20160501202148.5DE127FA9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21e611273851d503dd3145fa9564c71c461808c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches applied upstream:
 - 0001: notify: Don't use constexpr on Haiku
 - 0002: notify: use "constexpr" only with glibc

Renumber remaining patches.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...onfigure.ac-check-if-libatomic-is-needed.patch} |  0
 .../0001-notify-Don-t-use-constexpr-on-Haiku.patch | 28 -------------------
 ...0002-notify-use-constexpr-only-with-glibc.patch | 31 ----------------------
 ...d-Name-include-stdio.h-for-prctl-as-well.patch} |  0
 package/mpd/mpd.hash                               |  2 +-
 package/mpd/mpd.mk                                 |  2 +-
 6 files changed, 2 insertions(+), 61 deletions(-)

diff --git a/package/mpd/0003-configure.ac-check-if-libatomic-is-needed.patch b/package/mpd/0001-configure.ac-check-if-libatomic-is-needed.patch
similarity index 100%
rename from package/mpd/0003-configure.ac-check-if-libatomic-is-needed.patch
rename to package/mpd/0001-configure.ac-check-if-libatomic-is-needed.patch
diff --git a/package/mpd/0001-notify-Don-t-use-constexpr-on-Haiku.patch b/package/mpd/0001-notify-Don-t-use-constexpr-on-Haiku.patch
deleted file mode 100644
index 2685578..0000000
--- a/package/mpd/0001-notify-Don-t-use-constexpr-on-Haiku.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From f7d5081b727f69ae3a894a4a3310670a5d9ab077 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Fran=C3=A7ois=20Revol?= <revol@free.fr>
-Date: Thu, 17 Sep 2015 22:18:10 +0200
-Subject: [PATCH] notify: Don't use constexpr on Haiku
-
-[Thomas: taken from upstream commit bf73d0f9051fd5740c22bf6e5114ceb4535d548f.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/notify.hxx | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/notify.hxx b/src/notify.hxx
-index 3e62a01..1ee413f 100644
---- a/src/notify.hxx
-+++ b/src/notify.hxx
-@@ -28,7 +28,8 @@ struct notify {
- 	Cond cond;
- 	bool pending;
- 
--#if !defined(WIN32) && !defined(__NetBSD__) && !defined(__BIONIC__)
-+#if !defined(WIN32) && !defined(__NetBSD__) && !defined(__BIONIC__) && \
-+	!defined(__HAIKU__)
- 	constexpr
- #endif
- 	notify():pending(false) {}
--- 
-2.6.4
-
diff --git a/package/mpd/0002-notify-use-constexpr-only-with-glibc.patch b/package/mpd/0002-notify-use-constexpr-only-with-glibc.patch
deleted file mode 100644
index e50f598..0000000
--- a/package/mpd/0002-notify-use-constexpr-only-with-glibc.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 09830d448d6299a47fbccf39af6f325be5f2b514 Mon Sep 17 00:00:00 2001
-From: Max Kellermann <max@duempel.org>
-Date: Thu, 17 Sep 2015 22:56:35 +0200
-Subject: [PATCH] notify: use "constexpr" only with glibc
-
-The Mutex and Cond constructors are only "constexpr" with glibc, and
-this is what this #ifdef is about.
-
-[Thomas: taken from upstream commit 459a812a54509ebfd634a3df2998395c9cb5b98f.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/notify.hxx | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/src/notify.hxx b/src/notify.hxx
-index 1ee413f..c96390b 100644
---- a/src/notify.hxx
-+++ b/src/notify.hxx
-@@ -28,8 +28,7 @@ struct notify {
- 	Cond cond;
- 	bool pending;
- 
--#if !defined(WIN32) && !defined(__NetBSD__) && !defined(__BIONIC__) && \
--	!defined(__HAIKU__)
-+#ifdef __GLIBC__
- 	constexpr
- #endif
- 	notify():pending(false) {}
--- 
-2.6.4
-
diff --git a/package/mpd/0004-thread-Name-include-stdio.h-for-prctl-as-well.patch b/package/mpd/0002-thread-Name-include-stdio.h-for-prctl-as-well.patch
similarity index 100%
rename from package/mpd/0004-thread-Name-include-stdio.h-for-prctl-as-well.patch
rename to package/mpd/0002-thread-Name-include-stdio.h-for-prctl-as-well.patch
diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index e47cefd..2d35aae 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	2fd23805132e5002a4d24930001a7c7d3aaf55e3bd0cd71af5385895160e99e7	mpd-0.19.14.tar.xz
+sha256  0cb9a223894b038ce966ce6d651d9b3ea3bdc7d7b9bec8d1e9e7e091cbc29b8b  mpd-0.19.15.tar.xz
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 9a1c957..6247d15 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.19
-MPD_VERSION = $(MPD_VERSION_MAJOR).14
+MPD_VERSION = $(MPD_VERSION_MAJOR).15
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = http://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost libglib2
