From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Oct 2009 13:46:29 +0200
Subject: [Buildroot] [git commit master] mdadm: fix build without largefile
	support
Message-ID: <20091003114651.899D977728@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=88f6a98479819267699d310cbde16b02d22889f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...adm-2.6.1-003.uclibc-dont-force-largefile.patch |   27 ++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 package/mdadm/mdadm-2.6.1-003.uclibc-dont-force-largefile.patch

diff --git a/package/mdadm/mdadm-2.6.1-003.uclibc-dont-force-largefile.patch b/package/mdadm/mdadm-2.6.1-003.uclibc-dont-force-largefile.patch
new file mode 100644
index 0000000..c671437
--- /dev/null
+++ b/package/mdadm/mdadm-2.6.1-003.uclibc-dont-force-largefile.patch
@@ -0,0 +1,27 @@
+[PATCH] mdadm: don't enable largefile support unconditionally on uClibc
+
+uClibc can be compiled without largefile support (and errors out if
+_FILE_OFFSET_BITS is set to 64), so don't define it if that combination
+is detected.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ mdadm.h |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+Index: mdadm-2.6.7.1/mdadm.h
+===================================================================
+--- mdadm-2.6.7.1.orig/mdadm.h
++++ mdadm-2.6.7.1/mdadm.h
+@@ -28,7 +28,11 @@
+  */
+ 
+ #define	_GNU_SOURCE
++#include <features.h>
++/* uclibc without largefile support #errors on _FILE_OFFSET_BITS=64 */
++#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_LFS__))
+ #define _FILE_OFFSET_BITS 64
++#endif
+ #include	<unistd.h>
+ #if !defined(__dietlibc__) && !defined(__KLIBC__)
+ extern __off64_t lseek64 __P ((int __fd, __off64_t __offset, int __whence));
-- 
1.6.3.3
