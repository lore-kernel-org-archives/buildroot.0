From: Christophe Vu-Brugier <cvubrugier@lacie.com>
Date: Thu,  7 Mar 2013 11:21:05 +0100
Subject: [Buildroot] [PATCH 1/2] package/mdadm: update to v3.2.6
Message-ID: <1362651666-21225-1-git-send-email-cvubrugier@lacie.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Christophe Vu-Brugier <cvubrugier@lacie.com>
---
 package/mdadm/Config.in                            |    4 +--
 ...0-add-install-targets-for-mdadm-and-mdmon.patch |   32 ++++++++++++++++++++
 ...=> mdadm-020-uclibc-dont-force-largefile.patch} |    8 ++---
 ...redefine-off64_t-as-off_t-if-no-largefile.patch |   27 +++++++++++++++++
 .../mdadm-2.6.9-002.install-without-manpages.patch |   15 ---------
 package/mdadm/mdadm.mk                             |    2 +-
 6 files changed, 66 insertions(+), 22 deletions(-)
 create mode 100644 package/mdadm/mdadm-010-add-install-targets-for-mdadm-and-mdmon.patch
 rename package/mdadm/{mdadm-2.6.9-001.uclibc-dont-force-largefile.patch => mdadm-020-uclibc-dont-force-largefile.patch} (88%)
 create mode 100644 package/mdadm/mdadm-030-uclibc-redefine-off64_t-as-off_t-if-no-largefile.patch
 delete mode 100644 package/mdadm/mdadm-2.6.9-002.install-without-manpages.patch

diff --git a/package/mdadm/Config.in b/package/mdadm/Config.in
index 6426453..c513348 100644
--- a/package/mdadm/Config.in
+++ b/package/mdadm/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_MDADM
 	bool "mdadm"
 	help
-	  Utility for managing RAID hardware.
+	  Utility for managing Linux Software RAID arrays.
 
-	  http://cgi.cse.unsw.edu.au/~neilb/mdadm
+	  http://neil.brown.name/blog/mdadm
diff --git a/package/mdadm/mdadm-010-add-install-targets-for-mdadm-and-mdmon.patch b/package/mdadm/mdadm-010-add-install-targets-for-mdadm-and-mdmon.patch
new file mode 100644
index 0000000..15df755
--- /dev/null
+++ b/package/mdadm/mdadm-010-add-install-targets-for-mdadm-and-mdmon.patch
@@ -0,0 +1,32 @@
+From a1a9243671b1e23123f57e879890325154b8e00d Mon Sep 17 00:00:00 2001
+From: Christophe Vu-Brugier <cvubrugier@lacie.com>
+Date: Wed, 6 Mar 2013 16:03:14 +0100
+Subject: [PATCH] Add install targets for mdadm and mdmon
+
+
+Signed-off-by: Christophe Vu-Brugier <cvubrugier@lacie.com>
+---
+ Makefile |    6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 315455b..27d8eeb 100644
+--- a/Makefile
++++ b/Makefile
+@@ -231,8 +231,12 @@ $(MON_OBJS) : $(INCL) mdmon.h
+ sha1.o : sha1.c sha1.h md5.h
+ 	$(CC) $(CFLAGS) -DHAVE_STDINT_H -o sha1.o -c sha1.c
+ 
+-install : mdadm mdmon install-man install-udev
++install : install-mdadm install-mdmon install-man install-udev
++
++install-mdadm :
+ 	$(INSTALL) -D $(STRIP) -m 755 mdadm $(DESTDIR)$(BINDIR)/mdadm
++
++install-mdmon :
+ 	$(INSTALL) -D $(STRIP) -m 755 mdmon $(DESTDIR)$(BINDIR)/mdmon
+ 
+ install-static : mdadm.static install-man
+-- 
+1.7.10.4
+
diff --git a/package/mdadm/mdadm-2.6.9-001.uclibc-dont-force-largefile.patch b/package/mdadm/mdadm-020-uclibc-dont-force-largefile.patch
similarity index 88%
rename from package/mdadm/mdadm-2.6.9-001.uclibc-dont-force-largefile.patch
rename to package/mdadm/mdadm-020-uclibc-dont-force-largefile.patch
index c671437..fe3ab47 100644
--- a/package/mdadm/mdadm-2.6.9-001.uclibc-dont-force-largefile.patch
+++ b/package/mdadm/mdadm-020-uclibc-dont-force-largefile.patch
@@ -9,11 +9,11 @@ Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
  mdadm.h |    4 ++++
  1 file changed, 4 insertions(+)
 
-Index: mdadm-2.6.7.1/mdadm.h
+Index: mdadm-3.2.6/mdadm.h
 ===================================================================
---- mdadm-2.6.7.1.orig/mdadm.h
-+++ mdadm-2.6.7.1/mdadm.h
-@@ -28,7 +28,11 @@
+--- mdadm-3.2.6.orig/mdadm.h
++++ mdadm-3.2.6/mdadm.h
+@@ -23,7 +23,11 @@
   */
  
  #define	_GNU_SOURCE
diff --git a/package/mdadm/mdadm-030-uclibc-redefine-off64_t-as-off_t-if-no-largefile.patch b/package/mdadm/mdadm-030-uclibc-redefine-off64_t-as-off_t-if-no-largefile.patch
new file mode 100644
index 0000000..d958ab8
--- /dev/null
+++ b/package/mdadm/mdadm-030-uclibc-redefine-off64_t-as-off_t-if-no-largefile.patch
@@ -0,0 +1,27 @@
+From 9c63360a2db71882cc548305774ce87af5f52b6e Mon Sep 17 00:00:00 2001
+From: Christophe Vu-Brugier <cvubrugier@lacie.com>
+Date: Thu, 7 Mar 2013 10:37:09 +0100
+Subject: [PATCH] uClibc: redefine off64_t as off_t if largefile support is
+ disabled
+
+
+Signed-off-by: Christophe Vu-Brugier <cvubrugier@lacie.com>
+---
+ mdadm.h |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/mdadm.h b/mdadm.h
+index 216c31d..1c72cc4 100644
+--- a/mdadm.h
++++ b/mdadm.h
+@@ -1008,6 +1008,7 @@ struct stat64;
+ # include <features.h>
+ # ifndef __UCLIBC_HAS_LFS__
+ #  define lseek64 lseek
++#  define off64_t off_t
+ # endif
+ # ifndef  __UCLIBC_HAS_FTW__
+ #  undef HAVE_FTW
+-- 
+1.7.10.4
+
diff --git a/package/mdadm/mdadm-2.6.9-002.install-without-manpages.patch b/package/mdadm/mdadm-2.6.9-002.install-without-manpages.patch
deleted file mode 100644
index 7ab1a7b..0000000
--- a/package/mdadm/mdadm-2.6.9-002.install-without-manpages.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-diff -Naur mdadm-2.6.9/Makefile mdadm-2.6.9-patched/Makefile
---- mdadm-2.6.9/Makefile	2009-03-10 07:01:17.000000000 +0100
-+++ mdadm-2.6.9-patched/Makefile	2009-10-10 15:53:13.329068128 +0200
-@@ -161,7 +161,9 @@
- sha1.o : sha1.c sha1.h md5.h
- 	$(CC) $(CFLAGS) -DHAVE_STDINT_H -o sha1.o -c sha1.c
- 
--install : mdadm install-man
-+install : install-mdadm install-man
-+
-+install-mdadm : mdadm
- 	$(INSTALL) -D $(STRIP) -m 755 mdadm $(DESTDIR)$(BINDIR)/mdadm
- 
- install-static : mdadm.static install-man
-
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index dd2b49f..d5d1766 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-MDADM_VERSION = 2.6.9
+MDADM_VERSION = 3.2.6
 MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.bz2
 MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
 
-- 
1.7.10.4
