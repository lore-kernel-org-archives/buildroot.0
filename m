From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Oct 2014 19:22:13 +0200
Subject: [Buildroot] [git commit] freerdp: Add support for uClibc
Message-ID: <20141001173557.5BE449D7EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ebba9aeda9313c802c75c6ed156c5170fed8b855
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The stable-1.1 branch of freerdp fails to build when using a uClibc
toolchain because it's using functions which are not implemented in
uClibc, like eventfd_read, eventfd_write and futimes. That is causing
build failures like these ones:

../../libwinpr/synch/libwinpr-synch.so.0.1.0: undefined reference to
`eventfd_read'
../../libwinpr/synch/libwinpr-synch.so.0.1.0: undefined reference to
`eventfd_write'

../../common/libfreerdp-client.so.1.1.0: undefined reference to
`futimes'

Backport upstream patch, with non-applicable parts (new files from
master, but not in the stable-1.1 branch) trimmed down.

Upstream patch:
  https://github.com/FreeRDP/FreeRDP/commit/5f9c36da5d5cd3c5dce49f7b32fe011cb293f9ec/

Fixes:
  http://autobuild.buildroot.net/results/a66/a66e1ab18cd12904a64afcbf54116ceef889e966/build-end.log

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freerdp/Config.in                          |    5 -
 .../freerdp-0001-add-support-for-uclibc.patch      |   93 ++++++++++++++++++++
 2 files changed, 93 insertions(+), 5 deletions(-)

diff --git a/package/freerdp/Config.in b/package/freerdp/Config.in
index 2a876b2..c5ff769 100644
--- a/package/freerdp/Config.in
+++ b/package/freerdp/Config.in
@@ -7,13 +7,8 @@ config BR2_PACKAGE_FREERDP
 	select BR2_PACKAGE_XLIB_LIBXCURSOR
 	select BR2_PACKAGE_ZLIB
 	depends on BR2_PACKAGE_XORG7
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # evenft_{read,write}
 	help
 	  FreeRDP is a free implementation of the Remote Desktop
 	  Protocol (RDP), released under the Apache license
 
 	  http://www.freerdp.com/
-
-comment "freerdp needs an (e)glibc or musl toolchain"
-	depends on BR2_PACKAGE_XORG7
-	depends on BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/freerdp/freerdp-0001-add-support-for-uclibc.patch b/package/freerdp/freerdp-0001-add-support-for-uclibc.patch
new file mode 100644
index 0000000..73f9807
--- /dev/null
+++ b/package/freerdp/freerdp-0001-add-support-for-uclibc.patch
@@ -0,0 +1,93 @@
+From be615daf41b4bcc61322a987088ee209b5e66c19 Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Wed, 24 Sep 2014 13:54:15 +0100
+Subject: [PATCH] Add support for uClibc
+
+The stable-1.1 branch of freerdp fails to build when using a uClibc
+toolchain because it's using functions which are not implemented in
+uClibc, like eventfd_read, eventfd_write and futimes. That is causing
+build failures like these ones:
+
+../../libwinpr/synch/libwinpr-synch.so.0.1.0: undefined reference to
+`eventfd_read'
+../../libwinpr/synch/libwinpr-synch.so.0.1.0: undefined reference to
+`eventfd_write'
+
+../../common/libfreerdp-client.so.1.1.0: undefined reference to
+`futimes'
+
+This patch is based on this upstream patch:
+
+  https://github.com/FreeRDP/FreeRDP/commit/5f9c36da5d5cd3c5dce49f7b32fe011cb293f9ec/
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ channels/drive/client/drive_file.c |   12 +++++++++---
+ winpr/libwinpr/synch/event.c       |   14 ++++++++++++++
+ 2 files changed, 23 insertions(+), 3 deletions(-)
+
+diff --git a/channels/drive/client/drive_file.c b/channels/drive/client/drive_file.c
+index 376b4fe..b20f408 100644
+--- a/channels/drive/client/drive_file.c
++++ b/channels/drive/client/drive_file.c
+@@ -480,7 +480,11 @@ BOOL drive_file_set_information(DRIVE_FILE* file, UINT32 FsInformationClass, UIN
+ 	int status;
+ 	char* fullpath;
+ 	struct STAT st;
++#if defined(ANDROID)
+ 	struct timeval tv[2];
++#else
++	struct timespec tv[2];
++#endif
+ 	UINT64 LastWriteTime;
+ 	UINT32 FileAttributes;
+ 	UINT32 FileNameLength;
+@@ -501,15 +505,17 @@ BOOL drive_file_set_information(DRIVE_FILE* file, UINT32 FsInformationClass, UIN
+ 				return FALSE;
+ 
+ 			tv[0].tv_sec = st.st_atime;
+-			tv[0].tv_usec = 0;
+ 			tv[1].tv_sec = (LastWriteTime > 0 ? FILE_TIME_RDP_TO_SYSTEM(LastWriteTime) : st.st_mtime);
+-			tv[1].tv_usec = 0;
+ #ifndef WIN32
+ /* TODO on win32 */                        
+ #ifdef ANDROID
++			tv[0].tv_usec = 0;
++			tv[1].tv_usec = 0;
+ 			utimes(file->fullpath, tv);
+ #else
+-			futimes(file->fd, tv);
++			tv[0].tv_nsec = 0;
++			tv[1].tv_nsec = 0;
++			futimens(file->fd, tv);
+ #endif
+ 
+ 			if (FileAttributes > 0)
+diff --git a/winpr/libwinpr/synch/event.c b/winpr/libwinpr/synch/event.c
+index 173afaf..943cccb 100644
+--- a/winpr/libwinpr/synch/event.c
++++ b/winpr/libwinpr/synch/event.c
+@@ -115,6 +115,20 @@ HANDLE OpenEventA(DWORD dwDesiredAccess, BOOL bInheritHandle, LPCSTR lpName)
+ 	return NULL;
+ }
+ 
++#ifdef HAVE_EVENTFD_H
++#if defined(__UCLIBC__)
++static int eventfd_read(int fd, eventfd_t* value)
++{
++	return (read(fd, value, sizeof(*value)) == sizeof(*value)) ? 0 : -1;
++}
++
++static int eventfd_write(int fd, eventfd_t value)
++{
++	return (write(fd, &value, sizeof(value)) == sizeof(value)) ? 0 : -1;
++}
++#endif
++#endif
++
+ BOOL SetEvent(HANDLE hEvent)
+ {
+ 	ULONG Type;
+-- 
+1.7.1
+
