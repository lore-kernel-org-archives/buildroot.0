From: andersen at uclibc.org <andersen@uclibc.org>
Date: Thu, 24 Aug 2006 19:13:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lsof
Message-ID: <20060825021347.7224EC8101@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-08-24 19:13:46 -0700 (Thu, 24 Aug 2006)
New Revision: 15990

Log:
fixup lsof so it will apply patches, and compile when rpc is disabled


Added:
   trunk/buildroot/package/lsof/lsof-noportmap.patch

Modified:
   trunk/buildroot/package/lsof/lsof.mk


Changeset:
Added: trunk/buildroot/package/lsof/lsof-noportmap.patch
===================================================================
--- trunk/buildroot/package/lsof/lsof-noportmap.patch	2006-08-24 23:47:02 UTC (rev 15989)
+++ trunk/buildroot/package/lsof/lsof-noportmap.patch	2006-08-25 02:13:46 UTC (rev 15990)
@@ -0,0 +1,18 @@
+--- lsof_4.77/lsof_4.77_src/print.orig.c	2006-08-23 13:37:43.000000000 -0600
++++ lsof_4.77/lsof_4.77_src/print.c	2006-08-23 13:38:29.000000000 -0600
+@@ -148,6 +148,7 @@
+ static void
+ fill_portmap()
+ {
++#if !defined __UCLIBC__ || (defined __UCLIBC__ && defined __UCLIBC_HAS_RPC__)
+ 	char buf[128], *cp, *nm;
+ 	CLIENT *c;
+ 	int h, port, pr;
+@@ -266,6 +267,7 @@
+ 	    Pth[pr][h] = pt;
+ 	}
+ 	clnt_destroy(c);
++#endif
+ }
+ 
+ 

Modified: trunk/buildroot/package/lsof/lsof.mk
===================================================================
--- trunk/buildroot/package/lsof/lsof.mk	2006-08-24 23:47:02 UTC (rev 15989)
+++ trunk/buildroot/package/lsof/lsof.mk	2006-08-25 02:13:46 UTC (rev 15990)
@@ -20,6 +20,7 @@
 $(LSOF_DIR)/.unpacked: $(DL_DIR)/$(LSOF_SOURCE)
 	$(LSOF_CAT) $(DL_DIR)/$(LSOF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	(cd $(LSOF_DIR);tar xf lsof_4.77_src.tar;rm -f lsof_4.77_src.tar)
+	toolchain/patch-kernel.sh $(LSOF_DIR) package/lsof/ *.patch
 	touch $(LSOF_DIR)/.unpacked
 
 $(LSOF_DIR)/.configured: $(LSOF_DIR)/.unpacked
