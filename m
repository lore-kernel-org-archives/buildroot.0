From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Nov 2013 13:32:37 +0100
Subject: [Buildroot] [git commit] qt5base: add missing hunk in
	posix_fallocate patch
Message-ID: <20131112124633.E44C99BBFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3a740799a967592a262b7c9658e9a07f37bf8662
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-detect-posix_fallocate-at-configure-time.patch |   17 +++++++++++++++--
 1 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5base/qt5base-0007-detect-posix_fallocate-at-configure-time.patch b/package/qt5/qt5base/qt5base-0007-detect-posix_fallocate-at-configure-time.patch
index 7c45696..b0011f6 100644
--- a/package/qt5/qt5base/qt5base-0007-detect-posix_fallocate-at-configure-time.patch
+++ b/package/qt5/qt5base/qt5base-0007-detect-posix_fallocate-at-configure-time.patch
@@ -1,4 +1,4 @@
-From 6fe9c6b8a2815dc5d412c1714be0adaa9681a129 Mon Sep 17 00:00:00 2001
+From 46e632e2555b6b8abe6b8d8ad7d255e27c128e25 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
 Date: Mon, 11 Nov 2013 17:04:46 +0200
 Subject: [PATCH] Detect posix_fallocate at configure time
@@ -13,8 +13,9 @@ Reported-Upstream: https://codereview.qt-project.org/70935
  .../unix/posix_fallocate/posix_fallocate.cpp       | 53 ++++++++++++++++++++++
  .../unix/posix_fallocate/posix_fallocate.pro       |  2 +
  configure                                          | 14 ++++++
+ src/3rdparty/sqlite.pri                            |  1 +
  src/3rdparty/sqlite/sqlite3.c                      |  7 ---
- 4 files changed, 69 insertions(+), 7 deletions(-)
+ 5 files changed, 70 insertions(+), 7 deletions(-)
  create mode 100644 config.tests/unix/posix_fallocate/posix_fallocate.cpp
  create mode 100644 config.tests/unix/posix_fallocate/posix_fallocate.pro
 
@@ -131,6 +132,18 @@ index 81e2a93..b67ed89 100755
  [ "$CFG_MREMAP" = "no" ]     && QCONFIG_FLAGS="$QCONFIG_FLAGS QT_NO_MREMAP"
  [ "$CFG_GETADDRINFO" = "no" ]&& QCONFIG_FLAGS="$QCONFIG_FLAGS QT_NO_GETADDRINFO"
  [ "$CFG_IPV6IFNAME" = "no" ] && QCONFIG_FLAGS="$QCONFIG_FLAGS QT_NO_IPV6IFNAME"
+diff --git a/src/3rdparty/sqlite.pri b/src/3rdparty/sqlite.pri
+index 58d4ddd..072502c 100644
+--- a/src/3rdparty/sqlite.pri
++++ b/src/3rdparty/sqlite.pri
+@@ -1,6 +1,7 @@
+ CONFIG(release, debug|release):DEFINES *= NDEBUG
+ DEFINES += SQLITE_OMIT_LOAD_EXTENSION SQLITE_OMIT_COMPLETE SQLITE_ENABLE_FTS3 SQLITE_ENABLE_FTS3_PARENTHESIS SQLITE_ENABLE_RTREE
+ !contains(CONFIG, largefile):DEFINES += SQLITE_DISABLE_LFS
++contains(QT_CONFIG, posix_fallocate):DEFINES += HAVE_POSIX_FALLOCATE=1
+ winrt: DEFINES += SQLITE_OS_WINRT
+ INCLUDEPATH +=  $$PWD/sqlite
+ SOURCES +=      $$PWD/sqlite/sqlite3.c
 diff --git a/src/3rdparty/sqlite/sqlite3.c b/src/3rdparty/sqlite/sqlite3.c
 index 03fa649..1ae9be2 100644
 --- a/src/3rdparty/sqlite/sqlite3.c
