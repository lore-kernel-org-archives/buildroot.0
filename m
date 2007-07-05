From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Thu,  5 Jul 2007 10:52:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ed
Message-ID: <20070705175232.ACD9BA5E2E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-05 10:52:31 -0700 (Thu, 05 Jul 2007)
New Revision: 19004

Log:
Update version of ed and remove obsoleted patch. Submitted by <buraphalinuxserver@gmail.com>.


Removed:
   trunk/buildroot/package/ed/ed-configure-CPP.patch

Modified:
   trunk/buildroot/package/ed/ed.mk


Changeset:
Deleted: trunk/buildroot/package/ed/ed-configure-CPP.patch
===================================================================
--- trunk/buildroot/package/ed/ed-configure-CPP.patch	2007-07-05 15:55:23 UTC (rev 19003)
+++ trunk/buildroot/package/ed/ed-configure-CPP.patch	2007-07-05 17:52:31 UTC (rev 19004)
@@ -1,14 +0,0 @@
-this old configure script has broken CPP logic is CPP is set in the
-host environment
-
---- ed-0.2/configure
-+++ ed-0.2/configure
-@@ -731,6 +731,8 @@
- rm -f conftest*
-   ac_cv_prog_CPP="$CPP"
- fi
-+else
-+  ac_cv_prog_CPP="$CPP"
- fi
- CPP="$ac_cv_prog_CPP"
- echo "$ac_t""$CPP" 1>&4

Modified: trunk/buildroot/package/ed/ed.mk
===================================================================
--- trunk/buildroot/package/ed/ed.mk	2007-07-05 15:55:23 UTC (rev 19003)
+++ trunk/buildroot/package/ed/ed.mk	2007-07-05 17:52:31 UTC (rev 19004)
@@ -3,28 +3,19 @@
 # ed
 #
 #############################################################
-ED_SOURCE:=ed_0.2.orig.tar.gz
-ED_PATCH:=ed_0.2-20.diff.gz
-ED_SITE:=http://ftp.debian.org/debian/pool/main/e/ed
-ED_CAT:=$(ZCAT)
-ED_DIR:=$(BUILD_DIR)/ed-0.2
+ED_VERSION:=0.6
+ED_SOURCE:=ed-$(ED_VERSION).tar.bz2
+ED_SITE:=http://ftp.gnu.org/gnu/ed/
+ED_CAT:=$(BZCAT)
+ED_DIR:=$(BUILD_DIR)/ed-$(ED_VERSION)
 ED_BINARY:=ed
 ED_TARGET_BINARY:=bin/ed
 
 $(DL_DIR)/$(ED_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(ED_SITE)/$(ED_SOURCE)
 
-$(DL_DIR)/$(ED_PATCH):
-	 $(WGET) -P $(DL_DIR) $(ED_SITE)/$(ED_PATCH)
-
-ed-source: $(DL_DIR)/$(ED_SOURCE) $(DL_DIR)/$(ED_PATCH)
-
 $(ED_DIR)/.unpacked: $(DL_DIR)/$(ED_SOURCE) $(DL_DIR)/$(ED_PATCH)
 	$(ED_CAT) $(DL_DIR)/$(ED_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(ED_DIR) $(DL_DIR) $(ED_PATCH)
-	if [ -d $(ED_DIR)/debian/patches ]; then \
-		toolchain/patch-kernel.sh $(ED_DIR) $(ED_DIR)/debian/patches \*.patch ; \
-	fi
 	toolchain/patch-kernel.sh $(ED_DIR) package/ed/ ed-\*.patch
 	touch $@
 
