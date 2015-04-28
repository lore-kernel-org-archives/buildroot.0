From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 28 Apr 2015 22:40:53 +0300
Subject: [Buildroot] [PATCH] freerdp: fix build with uclibc snapshot and
	uclibc-ng
Message-ID: <6282ca49ebfb65c9399eeedcac6a3d69038d2690.1430250053.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uclibc snapshot and uclibc-ng add support for the eventfd_{read,write} glibc
extensions. Refine our uClibc support patch to take this into account, based
on upstream suggested PR.

Fixes:
http://autobuild.buildroot.net/results/e6c/e6c2ac69682f409f9ee78a3a6155ae356c3368a4/
http://autobuild.buildroot.net/results/558/558ccb0e475bfb434685c580d86f6c634238a084/
http://autobuild.buildroot.net/results/249/24901b2dfc92b516f74054ea7bb71e1ccfc3f12f/

and many more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/freerdp/0001-add-support-for-uclibc.patch | 48 +++++++++++++++++++----
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/package/freerdp/0001-add-support-for-uclibc.patch b/package/freerdp/0001-add-support-for-uclibc.patch
index 73f98074f8f5..8c1f0923b8a5 100644
--- a/package/freerdp/0001-add-support-for-uclibc.patch
+++ b/package/freerdp/0001-add-support-for-uclibc.patch
@@ -1,4 +1,4 @@
-From be615daf41b4bcc61322a987088ee209b5e66c19 Mon Sep 17 00:00:00 2001
+From fdf8e37dbba16e84201107dab6470089ab5cf9c2 Mon Sep 17 00:00:00 2001
 From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 Date: Wed, 24 Sep 2014 13:54:15 +0100
 Subject: [PATCH] Add support for uClibc
@@ -20,14 +20,36 @@ This patch is based on this upstream patch:
 
   https://github.com/FreeRDP/FreeRDP/commit/5f9c36da5d5cd3c5dce49f7b32fe011cb293f9ec/
 
+To support newer versions of uClibc and uclibc-ng this patch also includes a
+backported version of a patch against upstream master branch from the pull
+request at https://github.com/FreeRDP/FreeRDP/pull/2581.
+
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+[baruch: merge in upstream pr #2581]
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 ---
- channels/drive/client/drive_file.c |   12 +++++++++---
- winpr/libwinpr/synch/event.c       |   14 ++++++++++++++
- 2 files changed, 23 insertions(+), 3 deletions(-)
+ CMakeLists.txt                     |  3 +++
+ channels/drive/client/drive_file.c | 12 +++++++++---
+ config.h.in                        |  1 +
+ winpr/libwinpr/synch/event.c       | 14 ++++++++++++++
+ 4 files changed, 27 insertions(+), 3 deletions(-)
 
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 375e2d1b6845..f683da49dc01 100755
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -276,6 +276,9 @@ endif()
+ 
+ if(UNIX OR CYGWIN)
+ 	check_include_files(sys/eventfd.h HAVE_EVENTFD_H)
++	if (HAVE_EVENTFD_H)
++		check_symbol_exists(eventfd_read sys/eventfd.h WITH_EVENTFD_GLIBC_EXT)
++	endif()
+ 	set(X11_FEATURE_TYPE "RECOMMENDED")
+ else()
+ 	set(X11_FEATURE_TYPE "DISABLED")
 diff --git a/channels/drive/client/drive_file.c b/channels/drive/client/drive_file.c
-index 376b4fe..b20f408 100644
+index 376b4fe74be7..b20f408aa356 100644
 --- a/channels/drive/client/drive_file.c
 +++ b/channels/drive/client/drive_file.c
 @@ -480,7 +480,11 @@ BOOL drive_file_set_information(DRIVE_FILE* file, UINT32 FsInformationClass, UIN
@@ -63,8 +85,20 @@ index 376b4fe..b20f408 100644
  #endif
  
  			if (FileAttributes > 0)
+diff --git a/config.h.in b/config.h.in
+index 2b8ec09c2afb..82858f3374cb 100755
+--- a/config.h.in
++++ b/config.h.in
+@@ -33,6 +33,7 @@
+ #cmakedefine WITH_JPEG
+ #cmakedefine WITH_WIN8
+ #cmakedefine WITH_RDPSND_DSOUND
++#cmakedefine WITH_EVENTFD_GLIBC_EXT
+ 
+ /* Plugins */
+ #cmakedefine STATIC_CHANNELS
 diff --git a/winpr/libwinpr/synch/event.c b/winpr/libwinpr/synch/event.c
-index 173afaf..943cccb 100644
+index 173afafb7cc9..47c73fa9927e 100644
 --- a/winpr/libwinpr/synch/event.c
 +++ b/winpr/libwinpr/synch/event.c
 @@ -115,6 +115,20 @@ HANDLE OpenEventA(DWORD dwDesiredAccess, BOOL bInheritHandle, LPCSTR lpName)
@@ -72,7 +106,7 @@ index 173afaf..943cccb 100644
  }
  
 +#ifdef HAVE_EVENTFD_H
-+#if defined(__UCLIBC__)
++#if !defined(WITH_EVENTFD_GLIBC_EXT)
 +static int eventfd_read(int fd, eventfd_t* value)
 +{
 +	return (read(fd, value, sizeof(*value)) == sizeof(*value)) ? 0 : -1;
-- 
2.1.4
