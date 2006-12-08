From: andersen at uclibc.org <andersen@uclibc.org>
Date: Thu,  7 Dec 2006 21:16:21 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ltp-testsuite
Message-ID: <20061208051621.0A399485C6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-07 21:16:20 -0800 (Thu, 07 Dec 2006)
New Revision: 16808

Log:
stime is a reserved name, don't let ltp use it for a local variable


Added:
   trunk/buildroot/package/ltp-testsuite/ltp-testsuite-stime-is-a-reserved-name.patch


Changeset:
Added: trunk/buildroot/package/ltp-testsuite/ltp-testsuite-stime-is-a-reserved-name.patch
===================================================================
--- trunk/buildroot/package/ltp-testsuite/ltp-testsuite-stime-is-a-reserved-name.patch	2006-12-08 03:39:59 UTC (rev 16807)
+++ trunk/buildroot/package/ltp-testsuite/ltp-testsuite-stime-is-a-reserved-name.patch	2006-12-08 05:16:20 UTC (rev 16808)
@@ -0,0 +1,93 @@
+--- ltp-full-20061121/testcases/misc/math/fptests/fptest01.c.orig	2006-12-07 22:14:38.000000000 -0700
++++ ltp-full-20061121/testcases/misc/math/fptests/fptest01.c	2006-12-07 22:16:08.000000000 -0700
+@@ -84,7 +84,7 @@
+ struct event rtrevent;
+ int waiting[EVENTMX];	/* array of waiting processors */
+ int nwaiting;		/* number of waiting processors */
+-double stime;		/* global clock */
++double xstime;		/* global clock */
+ double lsttime;		/* time used for editing */
+ double dtc, dts, alpha;	/* timing parameters */
+ int nproc;		/* number of processors */
+@@ -133,7 +133,7 @@
+ 	double dtw, dtwsig;
+ 
+ 	ncycle=0;
+-	stime=0;
++	xstime=0;
+ 	lsttime=0;
+ 	barcnt=0;
+ 	nwaiting=0;
+@@ -148,7 +148,7 @@
+ 		}
+ 
+ 	for (p=1; p<=nproc; p++) {
+-		addevent(ENTERWORK,p,stime);
++		addevent(ENTERWORK,p,xstime);
+ 		}
+ 
+ 	return(0);
+@@ -167,7 +167,7 @@
+ 	for (i=0; i < nproc; i++)
+ 		t_total += eventtab[i].time;
+ 
+-	avgspd=ncycle/stime;
++	avgspd=ncycle/xstime;
+ 
+ 	v = t_total - MAGIC1;
+ 	if (v < 0.0)
+@@ -294,33 +294,33 @@
+ 	double nxttime;
+ 	int i, p, proc;
+ 
+-	stime = ev->time;
++	xstime = ev->time;
+ 	proc = ev->proc;
+ 
+ 	switch (ev->type) {
+ 		case TRYCRIT :
+ 			if (critfree==TRUE) 
+-				addevent(ENTERCRIT,proc,stime);
++				addevent(ENTERCRIT,proc,xstime);
+ 			else
+ 				addwaiting(proc);
+ 			break;
+ 		case ENTERCRIT :
+ 			critfree = FALSE;
+-			nxttime=stime+dtcrit();
++			nxttime=xstime+dtcrit();
+ 			addevent(LEAVECRIT,proc,nxttime);
+ 			break;
+ 		case LEAVECRIT :
+ 			critfree = TRUE;
+-			addevent(ATBARRIER,proc,stime);
++			addevent(ATBARRIER,proc,xstime);
+ 			if ((p=getwaiting())!=0) {
+-				nxttime=stime;
++				nxttime=xstime;
+ 				addevent(ENTERCRIT,p,nxttime);
+ 				}
+ 			break;
+ 		case ATBARRIER :
+ 			barcnt++;
+ 			if (barcnt==nproc) {
+-				nxttime=stime;
++				nxttime=xstime;
+ 				for (i=1; i<=nproc; i++) {
+ 					nxttime+=dtspinoff();
+ 					addevent(ENTERWORK,i,nxttime);
+@@ -330,12 +330,12 @@
+ 				}
+ 			break;
+ 		case ENTERWORK :
+-			nxttime=stime+dtwork();
++			nxttime=xstime+dtwork();
+ 			if (ncycle<ncycmax)
+ 				addevent(LEAVEWORK,proc,nxttime);
+ 			break;
+ 		case LEAVEWORK :
+-			addevent(TRYCRIT,proc,stime);
++			addevent(TRYCRIT,proc,xstime);
+ 			break;
+ 		default:
+ 			tst_resm(TBROK,"Illegal event");
