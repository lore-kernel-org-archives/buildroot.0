From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 23 Dec 2009 14:49:54 +0100
Subject: [Buildroot] [git commit master] Bump mtd-utils to 1.2.0
Message-ID: <20091223135034.0518877716@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9400c73582326c543fae82120af3904836145655
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #827.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    1 +
 ...ils-1.1.0-all-mkfs.jffs2-device_table-fix.patch |   23 -------------------
 ...all-acl.patch => mtd-utils-1.2.0-all-acl.patch} |    0
 .../mtd-utils-1.2.0-all-disable-ubi.patch          |   24 ++++++++++++++++++++
 ... mtd-utils-1.2.0-all-flashcp-npow2-erase.patch} |    0
 .../mtd-utils/mtd-utils-1.2.0-all-no-errorh.patch  |   22 ++++++++++++++++++
 ...ets.patch => mtd-utils-1.2.0-all-targets.patch} |    0
 package/mtd/mtd-utils/mtd.mk                       |    2 +-
 8 files changed, 48 insertions(+), 24 deletions(-)
 delete mode 100644 package/mtd/mtd-utils/mtd-utils-1.1.0-all-mkfs.jffs2-device_table-fix.patch
 rename package/mtd/mtd-utils/{mtd-utils-1.1.0-all-acl.patch => mtd-utils-1.2.0-all-acl.patch} (100%)
 create mode 100644 package/mtd/mtd-utils/mtd-utils-1.2.0-all-disable-ubi.patch
 rename package/mtd/mtd-utils/{mtd-utils-1.1.0-all-flashcp-npow2-erase.patch => mtd-utils-1.2.0-all-flashcp-npow2-erase.patch} (100%)
 create mode 100644 package/mtd/mtd-utils/mtd-utils-1.2.0-all-no-errorh.patch
 rename package/mtd/mtd-utils/{mtd-utils-1.1.0-all-targets.patch => mtd-utils-1.2.0-all-targets.patch} (100%)

diff --git a/CHANGES b/CHANGES
index 6b6a6e8..9894db9 100644
--- a/CHANGES
+++ b/CHANGES
@@ -25,6 +25,7 @@
 	#773: [SECURITY] Update bind to 9.5.2-P1
 	#795: Minor edits to fix typos, grammar, spelling, usage in documen...
 	#823: Editor backup files (~) is copied from the target_skeleton
+	#827: Bump mtd-utils package to version 1.2.0
 
 2009.11, Released December 1st, 2009:
 
diff --git a/package/mtd/mtd-utils/mtd-utils-1.1.0-all-mkfs.jffs2-device_table-fix.patch b/package/mtd/mtd-utils/mtd-utils-1.1.0-all-mkfs.jffs2-device_table-fix.patch
deleted file mode 100644
index 1fe23c8..0000000
--- a/package/mtd/mtd-utils/mtd-utils-1.1.0-all-mkfs.jffs2-device_table-fix.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-mkfs.jffs2.c: fix device_table handling
-
-find_filesystem_entry would ignore device_table entries for existing elements
-if the device type / permissions weren't exactly the same, effectively
-rendering device_table useless.
----
- mkfs.jffs2.c |    3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-Index: mtd-utils-1.1.0/mkfs.jffs2.c
-===================================================================
---- mtd-utils-1.1.0.orig/mkfs.jffs2.c
-+++ mtd-utils-1.1.0/mkfs.jffs2.c
-@@ -246,8 +246,7 @@
- 		e = dir->files;
- 	}
- 	while (e) {
--		/* Only bother to do the expensive strcmp on matching file types */
--		if (type == (e->sb.st_mode & S_IFMT)) {
-+		if (1) {
- 			if (S_ISDIR(e->sb.st_mode)) {
- 				int len = strlen(e->fullname);
- 
diff --git a/package/mtd/mtd-utils/mtd-utils-1.1.0-all-acl.patch b/package/mtd/mtd-utils/mtd-utils-1.2.0-all-acl.patch
similarity index 100%
rename from package/mtd/mtd-utils/mtd-utils-1.1.0-all-acl.patch
rename to package/mtd/mtd-utils/mtd-utils-1.2.0-all-acl.patch
diff --git a/package/mtd/mtd-utils/mtd-utils-1.2.0-all-disable-ubi.patch b/package/mtd/mtd-utils/mtd-utils-1.2.0-all-disable-ubi.patch
new file mode 100644
index 0000000..606cb46
--- /dev/null
+++ b/package/mtd/mtd-utils/mtd-utils-1.2.0-all-disable-ubi.patch
@@ -0,0 +1,24 @@
+diff -Nura mtd-utils-1.2.0/Makefile mtd-utils-1.2.0-noubi/Makefile
+--- mtd-utils-1.2.0/Makefile	2008-06-27 13:21:28.000000000 -0300
++++ mtd-utils-1.2.0-noubi/Makefile	2009-12-23 10:26:25.000000000 -0300
+@@ -45,7 +45,6 @@
+ .SUFFIXES:
+ 
+ all: $(TARGETS)
+-	make -C $(BUILDDIR)/ubi-utils
+ 
+ IGNORE=${wildcard $(BUILDDIR)/.*.c.dep}
+ -include ${IGNORE}
+@@ -53,7 +52,6 @@
+ clean:
+ 	rm -f $(BUILDDIR)/*.o $(TARGETS) $(BUILDDIR)/.*.c.dep $(SYMLINKS)
+ 	if [ "$(BUILDDIR)x" != ".x" ]; then rm -rf $(BUILDDIR); fi
+-	make -C $(BUILDDIR)/ubi-utils clean
+ 
+ $(SYMLINKS):
+ 	ln -sf ../fs/jffs2/$@ $@
+@@ -95,4 +93,3 @@
+ 	install -m0755 ${TARGETS} ${DESTDIR}/${SBINDIR}/
+ 	mkdir -p ${DESTDIR}/${MANDIR}/man1
+ 	gzip -9c mkfs.jffs2.1 > ${DESTDIR}/${MANDIR}/man1/mkfs.jffs2.1.gz
+-	make -C $(BUILDDIR)/ubi-utils install
diff --git a/package/mtd/mtd-utils/mtd-utils-1.1.0-all-flashcp-npow2-erase.patch b/package/mtd/mtd-utils/mtd-utils-1.2.0-all-flashcp-npow2-erase.patch
similarity index 100%
rename from package/mtd/mtd-utils/mtd-utils-1.1.0-all-flashcp-npow2-erase.patch
rename to package/mtd/mtd-utils/mtd-utils-1.2.0-all-flashcp-npow2-erase.patch
diff --git a/package/mtd/mtd-utils/mtd-utils-1.2.0-all-no-errorh.patch b/package/mtd/mtd-utils/mtd-utils-1.2.0-all-no-errorh.patch
new file mode 100644
index 0000000..1fde16b
--- /dev/null
+++ b/package/mtd/mtd-utils/mtd-utils-1.2.0-all-no-errorh.patch
@@ -0,0 +1,22 @@
+diff -Nura mtd-utils-1.2.0/recv_image.c mtd-utils-1.2.0-noerror/recv_image.c
+--- mtd-utils-1.2.0/recv_image.c	2008-06-27 13:21:28.000000000 -0300
++++ mtd-utils-1.2.0-noerror/recv_image.c	2009-12-23 10:19:22.000000000 -0300
+@@ -2,7 +2,6 @@
+ #define _XOPEN_SOURCE 500
+ 
+ #include <errno.h>
+-#include <error.h>
+ #include <stdio.h>
+ #define __USE_GNU
+ #include <netdb.h>
+diff -Nura mtd-utils-1.2.0/serve_image.c mtd-utils-1.2.0-noerror/serve_image.c
+--- mtd-utils-1.2.0/serve_image.c	2008-06-27 13:21:28.000000000 -0300
++++ mtd-utils-1.2.0-noerror/serve_image.c	2009-12-23 10:19:33.000000000 -0300
+@@ -3,7 +3,6 @@
+ #include <time.h>
+ 
+ #include <errno.h>  	
+-#include <error.h> 	
+ #include <netdb.h> 	
+ #include <stdio.h> 	
+ #include <stdlib.h> 	
diff --git a/package/mtd/mtd-utils/mtd-utils-1.1.0-all-targets.patch b/package/mtd/mtd-utils/mtd-utils-1.2.0-all-targets.patch
similarity index 100%
rename from package/mtd/mtd-utils/mtd-utils-1.1.0-all-targets.patch
rename to package/mtd/mtd-utils/mtd-utils-1.2.0-all-targets.patch
diff --git a/package/mtd/mtd-utils/mtd.mk b/package/mtd/mtd-utils/mtd.mk
index 6647373..9b114de 100644
--- a/package/mtd/mtd-utils/mtd.mk
+++ b/package/mtd/mtd-utils/mtd.mk
@@ -3,7 +3,7 @@
 # mtd provides jffs2 utilities
 #
 #############################################################
-MTD_VERSION:=1.1.0
+MTD_VERSION:=1.2.0
 MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE:=ftp://ftp.infradead.org/pub/mtd-utils
 MTD_HOST_DIR:= $(TOOLCHAIN_DIR)/mtd_orig
-- 
1.6.3.3
