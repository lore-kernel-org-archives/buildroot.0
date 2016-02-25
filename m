From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 22:51:27 +0100
Subject: [Buildroot] [git commit] nfs-utils: fix struct file_handle related
	build failures
Message-ID: <20160225215139.5E56F81909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=021afbffa1bf5a53f95d00f1322f6e4f2bd8f210
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch fixes
http://autobuild.buildroot.net/results/948/948f81d7ed2c080a675ee9fec754f6fda1fd905f/

The patches has been sent upstream:
http://article.gmane.org/gmane.linux.nfs/76139

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
[Thomas: slightly tweak commit title.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...4-mountd-Add-check-for-struct-file_handle.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/nfs-utils/0004-mountd-Add-check-for-struct-file_handle.patch b/package/nfs-utils/0004-mountd-Add-check-for-struct-file_handle.patch
new file mode 100644
index 0000000..7aca266
--- /dev/null
+++ b/package/nfs-utils/0004-mountd-Add-check-for-struct-file_handle.patch
@@ -0,0 +1,46 @@
+From 3c23b3ea7f5069e8fd4d5758704cd968504f1079 Mon Sep 17 00:00:00 2001
+From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+Date: Tue, 2 Feb 2016 10:07:22 +0100
+Subject: [PATCH] mountd: Add check for 'struct file_handle'
+
+The code to check if name_to_handle_at() is implemented generates only a
+warning but with some toolchain it doesn't fail to link (the function must be
+implemented somewhere).
+However the "struct file_handle" type is not available.
+
+So, this patch adds a check for this struct.
+
+Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
+---
+ configure.ac         | 1 +
+ utils/mountd/cache.c | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 25d2ba4..913a86f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -425,6 +425,7 @@ AC_TYPE_PID_T
+ AC_TYPE_SIZE_T
+ AC_HEADER_TIME
+ AC_STRUCT_TM
++AC_CHECK_TYPES([struct file_handle])
+ 
+ dnl *************************************************************
+ dnl Check for functions
+diff --git a/utils/mountd/cache.c b/utils/mountd/cache.c
+index 7847446..dc64f6d 100644
+--- a/utils/mountd/cache.c
++++ b/utils/mountd/cache.c
+@@ -424,7 +424,7 @@ static int same_path(char *child, char *parent, int len)
+ 	if (count_slashes(p) != count_slashes(parent))
+ 		return 0;
+ 
+-#if HAVE_NAME_TO_HANDLE_AT
++#if defined(HAVE_NAME_TO_HANDLE_AT) && defined(HAVE_STRUCT_FILE_HANDLE)
+ 	struct {
+ 		struct file_handle fh;
+ 		unsigned char handle[128];
+-- 
+2.7.0
+
