From: Frederik Pasch <fpasch@googlemail.com>
Date: Mon, 25 Jul 2011 00:09:33 +0200
Subject: [Buildroot] [git commit] nfs-utils: replace legacy index() function
	by strchr()
Message-ID: <20110724221255.F01378B487@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=82e840e72ec51dbb7058404b046e6fc72a187c04
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #3961

Signed-off-by: Frederik Pasch <fpasch@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    1 +
 .../nfs-utils/nfs-utils-1.2.3-susv3-legacy.patch   |   54 ++++++++++++++++++++
 2 files changed, 55 insertions(+), 0 deletions(-)
 create mode 100644 package/nfs-utils/nfs-utils-1.2.3-susv3-legacy.patch

diff --git a/CHANGES b/CHANGES
index 7f8cb82..8396dce 100644
--- a/CHANGES
+++ b/CHANGES
@@ -33,6 +33,7 @@
 	#3595: patch to add libroxml
 	#3565: libnss: Add new package
 	#3907: 2011.05 - Qt 4.7.3 not building on ARM
+	#3961: Nfs-utils: Remove SUSv3-function index
 	#3985: "help" target's defconfig list needs sort
 
 2011.05, Released May 27th, 2011:
diff --git a/package/nfs-utils/nfs-utils-1.2.3-susv3-legacy.patch b/package/nfs-utils/nfs-utils-1.2.3-susv3-legacy.patch
new file mode 100644
index 0000000..3504e2d
--- /dev/null
+++ b/package/nfs-utils/nfs-utils-1.2.3-susv3-legacy.patch
@@ -0,0 +1,54 @@
+Use the strchr() function instead of the legacy index() function.
+
+Signed-off-by: Frederik Pasch <fpasch@googlemail.com>
+--- 1/utils/mountd/fsloc.c
++++ 2/utils/mountd/fsloc.c
+@@ -126,7 +126,7 @@
+ 	struct servers *rv=NULL;
+ 
+ 	xlog(L_NOTICE, "method_list(%s)\n", data);
+-	for (ptr--, listsize=1; ptr; ptr=index(ptr, ':'), listsize++)
++	for (ptr--, listsize=1; ptr; ptr=strchr(ptr, ':'), listsize++)
+ 		ptr++;
+ 	list = malloc(listsize * sizeof(char *));
+ 	copy = strdup(data);
+--- 1/support/nfs/nfs_mntent.c
++++ 2/support/nfs/nfs_mntent.c
+@@ -9,7 +9,7 @@
+  */
+ 
+ #include <stdio.h>
+-#include <string.h>		/* for index */
++#include <string.h>		/* for strchr */
+ #include <ctype.h>		/* for isdigit */
+ #include <sys/stat.h>		/* for umask */
+ 
+@@ -163,7 +163,7 @@
+ 			return NULL;
+ 
+ 		mfp->mntent_lineno++;
+-		s = index (buf, '\n');
++		s = strchr (buf, '\n');
+ 		if (s == NULL) {
+ 			/* Missing final newline?  Otherwise extremely */
+ 			/* long line - assume file was corrupted */
+@@ -171,7 +171,7 @@
+ 				fprintf(stderr, _("[mntent]: warning: no final "
+ 					"newline at the end of %s\n"),
+ 					mfp->mntent_file);
+-				s = index (buf, 0);
++				s = strchr (buf, 0);
+ 			} else {
+ 				mfp->mntent_errs = 1;
+ 				goto err;
+--- 1/utils/mount/error.c
++++ 2/utils/mount/error.c
+@@ -62,7 +62,7 @@
+ 	char *tmp;
+ 
+ 	if (estr) {
+-		if ((ptr = index(estr, ':')))
++		if ((ptr = strchr(estr, ':')))
+ 			estr = ++ptr;
+ 
+ 		tmp = &errbuf[spos];
-- 
1.7.3.4
