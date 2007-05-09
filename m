From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Wed,  9 May 2007 15:59:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ltp-testsuite
Message-ID: <20070509225900.CF8114800B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-05-09 15:58:59 -0700 (Wed, 09 May 2007)
New Revision: 18599

Log:
Update version of LTP.


Removed:
   trunk/buildroot/package/ltp-testsuite/ltp-testsuite-remove-bzero-bcmp.patch
   trunk/buildroot/package/ltp-testsuite/ltp-testsuite-stime-is-a-reserved-name.patch

Modified:
   trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk
   trunk/buildroot/package/ltp-testsuite/ltp-testsuite.patch


Changeset:
Deleted: trunk/buildroot/package/ltp-testsuite/ltp-testsuite-remove-bzero-bcmp.patch
===================================================================
--- trunk/buildroot/package/ltp-testsuite/ltp-testsuite-remove-bzero-bcmp.patch	2007-05-09 22:48:41 UTC (rev 18598)
+++ trunk/buildroot/package/ltp-testsuite/ltp-testsuite-remove-bzero-bcmp.patch	2007-05-09 22:58:59 UTC (rev 18599)
@@ -1,65 +0,0 @@
-diff -ur ltp-full-20061121/testcases/kernel/fs/fsx-linux/fsx-linux.c ltp-full-20061121-patched/testcases/kernel/fs/fsx-linux/fsx-linux.c
---- ltp-full-20061121/testcases/kernel/fs/fsx-linux/fsx-linux.c	2006-11-21 14:31:29.000000000 -0600
-+++ ltp-full-20061121-patched/testcases/kernel/fs/fsx-linux/fsx-linux.c	2006-12-02 00:35:42.070475329 -0600
-@@ -322,7 +322,7 @@
- 	unsigned op = 0;
- 	unsigned bad = 0;
- 
--	if (bcmp(good_buf + offset, temp_buf, size) != 0) {
-+	if (memcmp(good_buf + offset, temp_buf, size) != 0) {
- 		prt("READ BAD DATA: offset = 0x%x, size = 0x%x\n",
- 		    offset, size);
- 		prt("OFFSET\tGOOD\tBAD\tRANGE\n");
-diff -ur ltp-full-20061121/testcases/kernel/io/ltp-aiodio/fsx-linux.c ltp-full-20061121-patched/testcases/kernel/io/ltp-aiodio/fsx-linux.c
---- ltp-full-20061121/testcases/kernel/io/ltp-aiodio/fsx-linux.c	2006-11-21 14:31:27.000000000 -0600
-+++ ltp-full-20061121-patched/testcases/kernel/io/ltp-aiodio/fsx-linux.c	2006-12-02 00:36:09.496726421 -0600
-@@ -355,7 +355,7 @@
- 	unsigned op = 0;
- 	unsigned bad = 0;
- 
--	if (bcmp(good_buf + offset, temp_buf, size) != 0) {
-+	if (memcmp(good_buf + offset, temp_buf, size) != 0) {
- 		prt("READ BAD DATA: offset = 0x%x, size = 0x%x, fname = %s\n",
- 		    offset, size, fname);
- 		prt("OFFSET\tGOOD\tBAD\tRANGE\n");
-diff -ur ltp-full-20061121/testcases/kernel/syscalls/symlink/symlink01.c ltp-full-20061121-patched/testcases/kernel/syscalls/symlink/symlink01.c
---- ltp-full-20061121/testcases/kernel/syscalls/symlink/symlink01.c	2006-11-21 14:31:28.000000000 -0600
-+++ ltp-full-20061121-patched/testcases/kernel/syscalls/symlink/symlink01.c	2006-12-02 00:36:18.081430964 -0600
-@@ -904,7 +904,7 @@
- 	   "stat(2) failed to return inode information for a regular object file");
-        return(0);
-     }
--    else if (bcmp((char *)&statter, (char *)&asymlink, sizeof(statter)) != 0) {
-+    else if (memcmp((char *)&statter, (char *)&asymlink, sizeof(statter)) != 0) {
-        TEST_RESULT=TFAIL;
-        sprintf(test_msg,
- 	   "lstat(2) and stat(2) do not return same inode information for an object file");
-diff -ur ltp-full-20061121/testcases/network/nfs/fsx-linux/fsx-linux.c ltp-full-20061121-patched/testcases/network/nfs/fsx-linux/fsx-linux.c
---- ltp-full-20061121/testcases/network/nfs/fsx-linux/fsx-linux.c	2006-11-21 14:31:24.000000000 -0600
-+++ ltp-full-20061121-patched/testcases/network/nfs/fsx-linux/fsx-linux.c	2006-12-02 00:35:51.495248935 -0600
-@@ -325,7 +325,7 @@
- 	unsigned op = 0;
- 	unsigned bad = 0;
- 
--	if (bcmp(good_buf + offset, temp_buf, size) != 0) {
-+	if (memcmp(good_buf + offset, temp_buf, size) != 0) {
- 		prt("READ BAD DATA: offset = 0x%x, size = 0x%x\n",
- 		    offset, size);
- 		prt("OFFSET\tGOOD\tBAD\tRANGE\n");
-diff -ur ltp-full-20061121/testcases/network/nfsv4/locks/netsync.c ltp-full-20061121-patched/testcases/network/nfsv4/locks/netsync.c
---- ltp-full-20061121/testcases/network/nfsv4/locks/netsync.c	2006-11-21 14:31:27.000000000 -0600
-+++ ltp-full-20061121-patched/testcases/network/nfsv4/locks/netsync.c	2006-12-02 00:38:03.710097050 -0600
-@@ -57,11 +57,11 @@
-         perror ("socket");
-         exit(1);
-     }
--    bzero(&local, sizeof(local));
-+    memset(&local, 0, sizeof(local));
-     local.sin_family = AF_INET;
-     local.sin_port = htons(PORT);
-     local.sin_addr.s_addr = INADDR_ANY;
--    bzero(&(local.sin_zero), 8);
-+    memset(&(local.sin_zero), 0, 8);
- 
-     if(bind(sock, (struct sockaddr *)&local, sizeof(struct sockaddr))== -1){
-         perror("bind"); 

Deleted: trunk/buildroot/package/ltp-testsuite/ltp-testsuite-stime-is-a-reserved-name.patch
===================================================================
--- trunk/buildroot/package/ltp-testsuite/ltp-testsuite-stime-is-a-reserved-name.patch	2007-05-09 22:48:41 UTC (rev 18598)
+++ trunk/buildroot/package/ltp-testsuite/ltp-testsuite-stime-is-a-reserved-name.patch	2007-05-09 22:58:59 UTC (rev 18599)
@@ -1,93 +0,0 @@
---- ltp-full-20061121/testcases/misc/math/fptests/fptest01.c.orig	2006-12-07 22:14:38.000000000 -0700
-+++ ltp-full-20061121/testcases/misc/math/fptests/fptest01.c	2006-12-07 22:16:08.000000000 -0700
-@@ -84,7 +84,7 @@
- struct event rtrevent;
- int waiting[EVENTMX];	/* array of waiting processors */
- int nwaiting;		/* number of waiting processors */
--double stime;		/* global clock */
-+double xstime;		/* global clock */
- double lsttime;		/* time used for editing */
- double dtc, dts, alpha;	/* timing parameters */
- int nproc;		/* number of processors */
-@@ -133,7 +133,7 @@
- 	double dtw, dtwsig;
- 
- 	ncycle=0;
--	stime=0;
-+	xstime=0;
- 	lsttime=0;
- 	barcnt=0;
- 	nwaiting=0;
-@@ -148,7 +148,7 @@
- 		}
- 
- 	for (p=1; p<=nproc; p++) {
--		addevent(ENTERWORK,p,stime);
-+		addevent(ENTERWORK,p,xstime);
- 		}
- 
- 	return(0);
-@@ -167,7 +167,7 @@
- 	for (i=0; i < nproc; i++)
- 		t_total += eventtab[i].time;
- 
--	avgspd=ncycle/stime;
-+	avgspd=ncycle/xstime;
- 
- 	v = t_total - MAGIC1;
- 	if (v < 0.0)
-@@ -294,33 +294,33 @@
- 	double nxttime;
- 	int i, p, proc;
- 
--	stime = ev->time;
-+	xstime = ev->time;
- 	proc = ev->proc;
- 
- 	switch (ev->type) {
- 		case TRYCRIT :
- 			if (critfree==TRUE) 
--				addevent(ENTERCRIT,proc,stime);
-+				addevent(ENTERCRIT,proc,xstime);
- 			else
- 				addwaiting(proc);
- 			break;
- 		case ENTERCRIT :
- 			critfree = FALSE;
--			nxttime=stime+dtcrit();
-+			nxttime=xstime+dtcrit();
- 			addevent(LEAVECRIT,proc,nxttime);
- 			break;
- 		case LEAVECRIT :
- 			critfree = TRUE;
--			addevent(ATBARRIER,proc,stime);
-+			addevent(ATBARRIER,proc,xstime);
- 			if ((p=getwaiting())!=0) {
--				nxttime=stime;
-+				nxttime=xstime;
- 				addevent(ENTERCRIT,p,nxttime);
- 				}
- 			break;
- 		case ATBARRIER :
- 			barcnt++;
- 			if (barcnt==nproc) {
--				nxttime=stime;
-+				nxttime=xstime;
- 				for (i=1; i<=nproc; i++) {
- 					nxttime+=dtspinoff();
- 					addevent(ENTERWORK,i,nxttime);
-@@ -330,12 +330,12 @@
- 				}
- 			break;
- 		case ENTERWORK :
--			nxttime=stime+dtwork();
-+			nxttime=xstime+dtwork();
- 			if (ncycle<ncycmax)
- 				addevent(LEAVEWORK,proc,nxttime);
- 			break;
- 		case LEAVEWORK :
--			addevent(TRYCRIT,proc,stime);
-+			addevent(TRYCRIT,proc,xstime);
- 			break;
- 		default:
- 			tst_resm(TBROK,"Illegal event");

Modified: trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk
===================================================================
--- trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk	2007-05-09 22:48:41 UTC (rev 18598)
+++ trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk	2007-05-09 22:58:59 UTC (rev 18599)
@@ -3,7 +3,7 @@
 # ltp-testsuite
 #
 #############################################################
-LTP_TESTSUITE_VERSION:=20061121
+LTP_TESTSUITE_VERSION:=20070228
 LTP_TESTSUITE_SOURCE:=ltp-full-$(LTP_TESTSUITE_VERSION).tgz
 LTP_TESTSUITE_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ltp
 LTP_TESTSUITE_CAT:=$(ZCAT)
@@ -37,6 +37,10 @@
 		-C $(LTP_TESTSUITE_DIR) all
 	touch $(LTP_TESTSUITE_DIR)/.compiled
 
+sjh: $(LTP_TESTSUITE_DIR)/Makefile
+	$(MAKE1) $(TARGET_CONFIGURE_OPTS) CROSS_COMPILER=$(TARGET_CROSS) \
+		-C $(LTP_TESTSUITE_DIR) all
+
 $(LTP_TESTSUITE_DIR)/.installed: $(LTP_TESTSUITE_DIR)/.compiled
 	# Use fakeroot to pretend to do 'make install' as root
 	echo "$(MAKE1) $(TARGET_CONFIGURE_OPTS) CROSS_COMPILER=$(TARGET_CROSS) " \

Modified: trunk/buildroot/package/ltp-testsuite/ltp-testsuite.patch
===================================================================
--- trunk/buildroot/package/ltp-testsuite/ltp-testsuite.patch	2007-05-09 22:48:41 UTC (rev 18598)
+++ trunk/buildroot/package/ltp-testsuite/ltp-testsuite.patch	2007-05-09 22:58:59 UTC (rev 18599)
@@ -71,87 +71,3 @@
  static void setup();
  static void cleanup();
  static int setup01();
-diff -ur ltp-full-20061121/testcases/kernel/syscalls/sysfs/sysfs01.c ltp-full-20061121-patched/testcases/kernel/syscalls/sysfs/sysfs01.c
---- ltp-full-20061121/testcases/kernel/syscalls/sysfs/sysfs01.c	2006-11-21 14:31:29.000000000 -0600
-+++ ltp-full-20061121-patched/testcases/kernel/syscalls/sysfs/sysfs01.c	2006-12-02 00:15:34.705993080 -0600
-@@ -72,10 +72,6 @@
- #include <unistd.h>
- #include <syscall.h>
- 
--#ifndef _syscall2
--#include <linux/unistd.h>
--#endif
--
- static void setup();
- static void cleanup();
- 
-diff -ur ltp-full-20061121/testcases/kernel/syscalls/sysfs/sysfs02.c ltp-full-20061121-patched/testcases/kernel/syscalls/sysfs/sysfs02.c
---- ltp-full-20061121/testcases/kernel/syscalls/sysfs/sysfs02.c	2006-11-21 14:31:29.000000000 -0600
-+++ ltp-full-20061121-patched/testcases/kernel/syscalls/sysfs/sysfs02.c	2006-12-02 00:15:34.705993080 -0600
-@@ -70,10 +70,6 @@
- #include <unistd.h>
- #include <syscall.h>
- 
--#ifndef _syscall2
--#include <linux/unistd.h>
--#endif
--
- static void setup();
- static void cleanup();
- 
-diff -ur ltp-full-20061121/testcases/kernel/syscalls/sysfs/sysfs03.c ltp-full-20061121-patched/testcases/kernel/syscalls/sysfs/sysfs03.c
---- ltp-full-20061121/testcases/kernel/syscalls/sysfs/sysfs03.c	2006-11-21 14:31:29.000000000 -0600
-+++ ltp-full-20061121-patched/testcases/kernel/syscalls/sysfs/sysfs03.c	2006-12-02 00:15:34.705993080 -0600
-@@ -70,10 +70,6 @@
- #include <unistd.h>
- #include <syscall.h>
- 
--#ifndef _syscall2
--#include <linux/unistd.h>
--#endif
--
- static void setup();
- static void cleanup();
- 
-diff -ur ltp-full-20061121/testcases/kernel/syscalls/sysfs/sysfs04.c ltp-full-20061121-patched/testcases/kernel/syscalls/sysfs/sysfs04.c
---- ltp-full-20061121/testcases/kernel/syscalls/sysfs/sysfs04.c	2006-11-21 14:31:29.000000000 -0600
-+++ ltp-full-20061121-patched/testcases/kernel/syscalls/sysfs/sysfs04.c	2006-12-02 00:15:34.705993080 -0600
-@@ -73,10 +73,6 @@
- #include "test.h"
- #include "usctest.h"
- 
--#ifndef _syscall2
--#include <linux/unistd.h>
--#endif
--
- #define INVALID_OPTION 100
- static void setup();
- static void cleanup();
-diff -ur ltp-full-20061121/testcases/kernel/syscalls/sysfs/sysfs05.c ltp-full-20061121-patched/testcases/kernel/syscalls/sysfs/sysfs05.c
---- ltp-full-20061121/testcases/kernel/syscalls/sysfs/sysfs05.c	2006-11-21 14:31:29.000000000 -0600
-+++ ltp-full-20061121-patched/testcases/kernel/syscalls/sysfs/sysfs05.c	2006-12-02 00:22:55.657171949 -0600
-@@ -74,10 +74,6 @@
- #include "test.h"
- #include "usctest.h"
- 
--#ifndef _syscall2
--#include <linux/unistd.h>
--#endif
--
- static void setup();
- static void cleanup();
- 
-diff -ur ltp-full-20061121/testcases/kernel/syscalls/sysfs/sysfs06.c ltp-full-20061121-patched/testcases/kernel/syscalls/sysfs/sysfs06.c
---- ltp-full-20061121/testcases/kernel/syscalls/sysfs/sysfs06.c	2006-11-21 14:31:29.000000000 -0600
-+++ ltp-full-20061121-patched/testcases/kernel/syscalls/sysfs/sysfs06.c	2006-12-02 00:22:47.124491054 -0600
-@@ -75,10 +75,6 @@
- #include "test.h"
- #include "usctest.h"
- 
--#ifndef _syscall2
--#include <linux/unistd.h>
--#endif
--
- static void setup();
- static void cleanup();
- 
