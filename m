From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sun,  6 May 2007 21:07:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070507040706.9235548598@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-05-06 21:07:06 -0700 (Sun, 06 May 2007)
New Revision: 18581

Log:
This patch increases the maximum host name length for 'dnsd' to 40 characters in length and fixes a resolving bug. For example, if there are two entries in the 'dnsd.conf' file of 'foo1' and 'foo2'. Doing a 'nslookup foo2' the 'dnsd' will always return the IP address of 'foo1' because the string comparison is faulty.


Added:
   trunk/buildroot/package/busybox/busybox-1.2.2.1-max_host_len_40.patch
   trunk/buildroot/package/busybox/busybox-1.4.0-max_host_len_40.patch
   trunk/buildroot/package/busybox/busybox-1.5.0-max_host_len_40.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.2.2.1-max_host_len_40.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.2.2.1-max_host_len_40.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.2.2.1-max_host_len_40.patch	2007-05-07 04:07:06 UTC (rev 18581)
@@ -0,0 +1,61 @@
+diff -ur busybox-1.2.2.1/networking/dnsd.c busybox-1.2.2.1-patched/networking/dnsd.c
+--- busybox-1.2.2.1/networking/dnsd.c	2006-10-24 15:21:17.000000000 -0500
++++ busybox-1.2.2.1-patched/networking/dnsd.c	2007-04-12 12:49:53.000000000 -0500
+@@ -31,11 +31,11 @@
+ 
+ #define is_daemon()  (flags&16)
+ #define is_verbose() (flags&32)
+-//#define DEBUG 
++#undef DEBUG 
+ 
+ 
+ enum {
+-	MAX_HOST_LEN = 16,      // longest host name allowed is 15
++	MAX_HOST_LEN = 41,      // longest host name allowed is 40
+ 	IP_STRING_LEN = 18,     // .xxx.xxx.xxx.xxx\0
+ 
+ //must be strlen('.in-addr.arpa') larger than IP_STRING_LEN
+@@ -229,19 +229,23 @@
+ {
+ 	int i;
+ 	struct dns_entry *d = dnsentry;
++	char *p,*q;
++
++	q = (char *)&(qs[1]);
++	p = &(d->name[1]);
+ 
+ 	if(d) do {
+ #ifdef DEBUG
+ 		if(qs && d) {
+-			char *p,*q;
+-			q = (char *)&(qs[1]);
+-			p = &(d->name[1]);
+ 			fprintf(stderr, "\n%s: %d/%d p:%s q:%s %d", 
+ 				__FUNCTION__, strlen(p), (int)(d->name[0]), 
+ 				p, q, strlen(q));
+ 		}
+ #endif
+ 		if (type == REQ_A) { 			/* search by host name */
++			p = &(d->name[1]);
++			if(strlen(q) != strlen(p))
++				continue;
+ 			for(i = 1; i <= (int)(d->name[0]); i++)
+ 				if(tolower(qs[i]) != d->name[i])
+ 					break;
+@@ -398,13 +402,15 @@
+ 		fprintf(stderr,"fileconf: %s\n", fileconf);
+ 	}
+ 
+-	if(is_daemon())
++	if(is_daemon()) {
+ #ifdef BB_NOMMU
+ 		/* reexec for vfork() do continue parent */
+ 		vfork_daemon_rexec(1, 0, argc, argv, "-d");
+ #else
+ 		bb_xdaemon(1, 0);
+ #endif
++		daemonmode = 1;
++	}
+ 
+ 	dnsentryinit(is_verbose());
+ 

Added: trunk/buildroot/package/busybox/busybox-1.4.0-max_host_len_40.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.4.0-max_host_len_40.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.4.0-max_host_len_40.patch	2007-05-07 04:07:06 UTC (rev 18581)
@@ -0,0 +1,61 @@
+diff -ur busybox-1.2.2.1/networking/dnsd.c busybox-1.2.2.1-patched/networking/dnsd.c
+--- busybox-1.2.2.1/networking/dnsd.c	2006-10-24 15:21:17.000000000 -0500
++++ busybox-1.2.2.1-patched/networking/dnsd.c	2007-04-12 12:49:53.000000000 -0500
+@@ -31,11 +31,11 @@
+ 
+ #define is_daemon()  (flags&16)
+ #define is_verbose() (flags&32)
+-//#define DEBUG 
++#undef DEBUG 
+ 
+ 
+ enum {
+-	MAX_HOST_LEN = 16,      // longest host name allowed is 15
++	MAX_HOST_LEN = 41,      // longest host name allowed is 40
+ 	IP_STRING_LEN = 18,     // .xxx.xxx.xxx.xxx\0
+ 
+ //must be strlen('.in-addr.arpa') larger than IP_STRING_LEN
+@@ -229,19 +229,23 @@
+ {
+ 	int i;
+ 	struct dns_entry *d = dnsentry;
++	char *p,*q;
++
++	q = (char *)&(qs[1]);
++	p = &(d->name[1]);
+ 
+ 	if(d) do {
+ #ifdef DEBUG
+ 		if(qs && d) {
+-			char *p,*q;
+-			q = (char *)&(qs[1]);
+-			p = &(d->name[1]);
+ 			fprintf(stderr, "\n%s: %d/%d p:%s q:%s %d", 
+ 				__FUNCTION__, strlen(p), (int)(d->name[0]), 
+ 				p, q, strlen(q));
+ 		}
+ #endif
+ 		if (type == REQ_A) { 			/* search by host name */
++			p = &(d->name[1]);
++			if(strlen(q) != strlen(p))
++				continue;
+ 			for(i = 1; i <= (int)(d->name[0]); i++)
+ 				if(tolower(qs[i]) != d->name[i])
+ 					break;
+@@ -398,13 +402,15 @@
+ 		fprintf(stderr,"fileconf: %s\n", fileconf);
+ 	}
+ 
+-	if(is_daemon())
++	if(is_daemon()) {
+ #ifdef BB_NOMMU
+ 		/* reexec for vfork() do continue parent */
+ 		vfork_daemon_rexec(1, 0, argc, argv, "-d");
+ #else
+ 		bb_xdaemon(1, 0);
+ #endif
++		daemonmode = 1;
++	}
+ 
+ 	dnsentryinit(is_verbose());
+ 

Added: trunk/buildroot/package/busybox/busybox-1.5.0-max_host_len_40.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.5.0-max_host_len_40.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.5.0-max_host_len_40.patch	2007-05-07 04:07:06 UTC (rev 18581)
@@ -0,0 +1,37 @@
+diff -ur busybox-1.5.0/networking/dnsd.c busybox-1.5.0-patched/networking/dnsd.c
+--- busybox-1.5.0/networking/dnsd.c	2007-03-22 15:21:23.000000000 -0500
++++ busybox-1.5.0-patched/networking/dnsd.c	2007-04-13 06:53:49.000000000 -0500
+@@ -30,7 +30,7 @@
+ #define DEBUG 0
+ 
+ enum {
+-	MAX_HOST_LEN = 16,      // longest host name allowed is 15
++	MAX_HOST_LEN = 41,      // longest host name allowed is 40
+ 	IP_STRING_LEN = 18,     // .xxx.xxx.xxx.xxx\0
+ 
+ //must be strlen('.in-addr.arpa') larger than IP_STRING_LEN
+@@ -186,17 +186,21 @@
+ {
+ 	int i;
+ 	struct dns_entry *d=dnsentry;
++	char *p,*q;
++
++	q = (char *)&(qs[1]);
++	p = &(d->name[1]);
+ 
+ 	do {
+ #if DEBUG
+-		char *p,*q;
+-		q = (char *)&(qs[1]);
+-		p = &(d->name[1]);
+ 		fprintf(stderr, "\n%s: %d/%d p:%s q:%s %d",
+ 			__FUNCTION__, (int)strlen(p), (int)(d->name[0]),
+ 			p, q, (int)strlen(q));
+ #endif
+ 		if (type == REQ_A) { /* search by host name */
++			p = &(d->name[1]);
++			if(strlen(q) != strlen(p))
++				continue;
+ 			for (i = 1; i <= (int)(d->name[0]); i++)
+ 				if (tolower(qs[i]) != d->name[i])
+ 					break;
