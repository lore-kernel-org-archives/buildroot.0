From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Apr 2018 11:55:22 +0200
Subject: [Buildroot] [PATCH] uclibc: backport upstream patch adding fcntl
 definitions on OpenRISC
Message-ID: <20180420095522.30646-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A number of fcntl.h definitions were missing on OpenRISC in uClibc-ng,
causing build failures such as:

gfile.c: In function 'splice_stream_with_progress':
gfile.c:3017:35: error: 'F_SETPIPE_SZ' undeclared (first use in this function)
   buffer_size = fcntl (buffer[1], F_SETPIPE_SZ, 1024 * 1024);

This comit backports a patch that was merged in upstream uClibc-ng,
which addresses this problem.

Fixes:

  http://autobuild.buildroot.net/results/182ebbba6c7466b07e965e5120d919cbcf5e9da6/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...dd-F_-DUPFD_CLOEXEC-SETPIPE_SZ-GETPIPE_SZ.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/uclibc/0002-or1k-add-F_-DUPFD_CLOEXEC-SETPIPE_SZ-GETPIPE_SZ.patch

diff --git a/package/uclibc/0002-or1k-add-F_-DUPFD_CLOEXEC-SETPIPE_SZ-GETPIPE_SZ.patch b/package/uclibc/0002-or1k-add-F_-DUPFD_CLOEXEC-SETPIPE_SZ-GETPIPE_SZ.patch
new file mode 100644
index 0000000000..b81c5921b9
--- /dev/null
+++ b/package/uclibc/0002-or1k-add-F_-DUPFD_CLOEXEC-SETPIPE_SZ-GETPIPE_SZ.patch
@@ -0,0 +1,36 @@
+From f42d18f06084b6db90c104fb5404a91602e9b904 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Thu, 12 Apr 2018 23:24:59 +0200
+Subject: [PATCH] or1k: add F_{DUPFD_CLOEXEC, SETPIPE_SZ, GETPIPE_SZ}
+
+Those definitions exist on all other architectures, but were not
+present in or1k specific headers when or1k support was merged.
+
+On the kernel side, their support is completely architecture
+independent, so we just need those definitions to make those fcntl()
+calls available on or1k.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream-status: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=f42d18f06084b6db90c104fb5404a91602e9b904
+---
+ libc/sysdeps/linux/or1k/bits/fcntl.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/libc/sysdeps/linux/or1k/bits/fcntl.h b/libc/sysdeps/linux/or1k/bits/fcntl.h
+index bd6a8c511..a82ede424 100644
+--- a/libc/sysdeps/linux/or1k/bits/fcntl.h
++++ b/libc/sysdeps/linux/or1k/bits/fcntl.h
+@@ -102,6 +102,10 @@
+ # define F_SETLEASE	1024	/* Set a lease.	 */
+ # define F_GETLEASE	1025	/* Enquire what lease is active.  */
+ # define F_NOTIFY	1026	/* Request notfications on a directory.	 */
++# define F_DUPFD_CLOEXEC 1030	/* Duplicate file descriptor with
++				   close-on-exit set on new fd.  */
++# define F_SETPIPE_SZ	1031    /* Set pipe page size array.  */
++# define F_GETPIPE_SZ	1032    /* Get pipe page size array.  */
+ #endif
+ 
+ /* For F_[GET|SET]FL.  */
+-- 
+2.14.3
+
-- 
2.14.3
