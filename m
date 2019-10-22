From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 21:38:25 +0200
Subject: [Buildroot] [git commit] package/lxc: fix compilation with stub
 memfd_create
Message-ID: <20191022193204.15C8383C9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d6b305e52fb57b831333afd68f44f2001c6fa15
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes compilation issue in case memfd_create is a stub in libc.
Patch already merged in lxc master branch
(344b8ee293f4d3730a70a6ccaa03d7e4a516ae95).

Copy of the original commit log:

In case the internal memfd_create has to be used, make sure we don't
clash with the already existing memfd_create function from glibc.

This can happen if this glibc function is a stub. In this case, at
./configure time, the test for this function will return false, however
the declaration of that function is still available. This leads to
compilation errors.

Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ppers-rename-internal-memfd_create-to-mem.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/lxc/0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch b/package/lxc/0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch
new file mode 100644
index 0000000000..6210591c09
--- /dev/null
+++ b/package/lxc/0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch
@@ -0,0 +1,43 @@
+From 2b23a1313f501423aecbe4ad4a988a9f6f832f1f Mon Sep 17 00:00:00 2001
+From: Patrick Havelange <patrick.havelange@essensium.com>
+Date: Tue, 22 Oct 2019 12:29:54 +0200
+Subject: [PATCH 1/1] syscall_wrappers: rename internal memfd_create to
+ memfd_create_lxc
+
+In case the internal memfd_create has to be used, make sure we don't
+clash with the already existing memfd_create function from glibc.
+
+This can happen if this glibc function is a stub. In this case, at
+./configure time, the test for this function will return false, however
+the declaration of that function is still available. This leads to
+compilation errors.
+
+Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
+---
+ src/lxc/syscall_wrappers.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/lxc/syscall_wrappers.h b/src/lxc/syscall_wrappers.h
+index 42d94db..bddf01b 100644
+--- a/src/lxc/syscall_wrappers.h
++++ b/src/lxc/syscall_wrappers.h
+@@ -59,7 +59,7 @@ static inline long __keyctl(int cmd, unsigned long arg2, unsigned long arg3,
+ #endif
+ 
+ #ifndef HAVE_MEMFD_CREATE
+-static inline int memfd_create(const char *name, unsigned int flags) {
++static inline int memfd_create_lxc(const char *name, unsigned int flags) {
+ 	#ifndef __NR_memfd_create
+ 		#if defined __i386__
+ 			#define __NR_memfd_create 356
+@@ -98,6 +98,7 @@ static inline int memfd_create(const char *name, unsigned int flags) {
+ 	return -1;
+ 	#endif
+ }
++#define memfd_create memfd_create_lxc
+ #else
+ extern int memfd_create(const char *name, unsigned int flags);
+ #endif
+-- 
+2.20.1
+
