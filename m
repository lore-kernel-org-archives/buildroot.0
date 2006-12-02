From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Fri,  1 Dec 2006 22:42:26 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ltp-testsuite
Message-ID: <20061202064226.C8DBD485A2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2006-12-01 22:42:25 -0800 (Fri, 01 Dec 2006)
New Revision: 16751

Log:
Bump the revision to the latest release and update the patches. Some idiots decided to use deprecated functions 'bzero' and 'bcmp' so we patch that up. Someone fell free to pass the patch upstream to the LTP persons, I don't have time.


Added:
   trunk/buildroot/package/ltp-testsuite/ltp-testsuite-remove-bzero-bcmp.patch

Removed:
   trunk/buildroot/package/ltp-testsuite/ltp-testsuite-remove-bcopy.patch

Modified:
   trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk
   trunk/buildroot/package/ltp-testsuite/ltp-testsuite.patch


Changeset:
Deleted: trunk/buildroot/package/ltp-testsuite/ltp-testsuite-remove-bcopy.patch
===================================================================
--- trunk/buildroot/package/ltp-testsuite/ltp-testsuite-remove-bcopy.patch	2006-12-02 05:15:27 UTC (rev 16750)
+++ trunk/buildroot/package/ltp-testsuite/ltp-testsuite-remove-bcopy.patch	2006-12-02 06:42:25 UTC (rev 16751)
@@ -1,126 +0,0 @@
---- ltp/testcases/network/multicast/mc_member/member.c.orig	2005-10-03 12:19:46.000000000 -0600
-+++ ltp/testcases/network/multicast/mc_member/member.c	2006-07-04 18:29:28.000000000 -0600
-@@ -80,7 +80,7 @@
-         }
- 
-         if((hp = gethostbyname(interface))) {
--           bcopy(hp->h_addr, &imr.imr_interface.s_addr, hp->h_length);
-+	   memcpy(&imr.imr_interface.s_addr, hp->h_addr, hp->h_length);
-         } else 
-            if((n = sscanf(interface, "%u.%u.%u.%u", &i1, &i2, &i3, &i4)) != 4) {
-               fprintf(stderr, "bad group address\n" ); 
---- ltp/testcases/network/tcp_cmds/echo/echoes.c.orig	2005-10-03 11:58:24.000000000 -0600
-+++ ltp/testcases/network/tcp_cmds/echo/echoes.c	2006-07-04 18:27:06.000000000 -0600
-@@ -133,7 +133,7 @@
- 		exit(1);
- 	}
- 	port=sp->s_port;
--	bcopy(hp->h_addr_list[0],&hostaddr,sizeof(struct in_addr));
-+	memcpy(&hostaddr,hp->h_addr_list[0],sizeof(struct in_addr));
- 	bzero((char *)&sa,sizeof (sa));
- 	sa.sin_port=port;
- 	sa.sin_family=AF_INET;
---- ltp/testcases/network/tcp_cmds/perf_lan/pingpong.c.orig	2006-07-04 18:33:14.000000000 -0600
-+++ ltp/testcases/network/tcp_cmds/perf_lan/pingpong.c	2006-07-04 18:33:44.000000000 -0600
-@@ -118,7 +118,7 @@
- 		hp = gethostbyname(av[1]);
- 		if (hp) {
- 			to->sin_family = hp->h_addrtype;
--			bcopy(hp->h_addr, (caddr_t)&to->sin_addr, hp->h_length);
-+			memcpy((caddr_t)&to->sin_addr, hp->h_addr, hp->h_length);
- 			hostname = hp->h_name;
- 		} else {
-             tst_resm (TINFO, "%s: unknown host, couldn't get address\n",argv[0]);
---- ltp/testcases/network/rpc/rpc01/rpc1.c.orig	2006-07-04 18:34:29.000000000 -0600
-+++ ltp/testcases/network/rpc/rpc01/rpc1.c	2006-07-04 18:34:47.000000000 -0600
-@@ -101,7 +101,7 @@
-     }
-     bzero(&server_sin, sizeof(server_sin));
-     server_sin.sin_family = AF_INET;
--    bcopy(hp->h_addr, (char *) &server_sin.sin_addr, sizeof(hp->h_addr));
-+    memcpy((char *) &server_sin.sin_addr, hp->h_addr, sizeof(hp->h_addr));
- 
-     if (!file_name) {
- 	fprintf(stderr, "file name not given\n");
---- ltp/testcases/network/multicast/mc_commo/mc_recv.c.orig	2006-07-04 18:35:24.000000000 -0600
-+++ ltp/testcases/network/multicast/mc_commo/mc_recv.c	2006-07-04 18:35:59.000000000 -0600
-@@ -45,7 +45,7 @@
-         imr.imr_multiaddr.s_addr = htonl((g1<<24) | (g2<<16) | (g3<<8) | g4);
- 
-         if((hp = gethostbyname(argv[2])))
--           bcopy(hp->h_addr, &imr.imr_interface.s_addr, hp->h_length);
-+           memcpy(&imr.imr_interface.s_addr, hp->h_addr, hp->h_length);
-         else 
-            if((n = sscanf(argv[2], "%u.%u.%u.%u", &i1, &i2, &i3, &i4)) != 4) {
-                fprintf (stderr,"Bad group interface address\n");
---- ltp/testcases/network/multicast/mc_commo/mc_send.c.orig	2006-07-04 18:36:34.000000000 -0600
-+++ ltp/testcases/network/multicast/mc_commo/mc_send.c	2006-07-04 18:36:52.000000000 -0600
-@@ -48,7 +48,7 @@
-         imr.imr_multiaddr.s_addr = htonl((g1<<24) | (g2<<16) | (g3<<8) | g4);
- 
-         if((hp = gethostbyname(argv[2]))) {
--           bcopy(hp->h_addr, &imr.imr_interface.s_addr, hp->h_length);
-+           memcpy(&imr.imr_interface.s_addr, hp->h_addr, hp->h_length);
-         } else 
-            if((n = sscanf(argv[2], "%u.%u.%u.%u", &i1, &i2, &i3, &i4)) != 4) {
-                fprintf (stderr,"Bad interface address\n");
---- ltp/testcases/kernel/ipc/pipeio/pipeio.c.orig	2006-07-04 18:37:26.000000000 -0600
-+++ ltp/testcases/kernel/ipc/pipeio/pipeio.c	2006-07-04 18:38:44.000000000 -0600
-@@ -742,7 +742,7 @@
- 			   /*
- 			    * get the last 2 words printed 
- 			    */
--				bcopy(a-(width*NBPW),c,width*NBPW);
-+				memcpy(c,a-(width*NBPW),width*NBPW);
- 				for (p = c; (p-c) < width*NBPW; ++p) {
- 					if (*p < '!' || *p > '~')
- 						*p = '.';
-@@ -761,7 +761,7 @@
- 				printf("%10.10ld ",*word);
- 				break;
- 			case ASCII:
--				bcopy(a,b,NBPW);
-+				memcpy(b,a,NBPW);
- 				for (p = b; (p-b) < NBPW; ++p) {
- 					if (*p < '!' || *p > '~')
- 						*p = '.';
-@@ -780,7 +780,7 @@
- 	   */
- 		bzero(c,width*NBPW);
- 		if (extra_words) width = extra_words; /* odd number of words */
--		bcopy(a-(width*NBPW),c,width*NBPW);
-+		memcpy(c,a-(width*NBPW),width*NBPW);
- 		for (p = c; (p-c) < width*NBPW; ++p) {
- 			if (*p < '!' || *p > '~')
- 				*p = '.';
---- ltp/testcases/ballista/ballista/serverCommunication.cpp.orig	2006-07-04 18:39:39.000000000 -0600
-+++ ltp/testcases/ballista/ballista/serverCommunication.cpp	2006-07-04 18:40:33.000000000 -0600
-@@ -67,7 +67,7 @@
- #ifdef SUN
- 
- #include <strings.h> 
--//includes bcopy proto
-+//includes memcpy proto
- 
- #endif
- 
-@@ -118,7 +118,7 @@
-       }
- 
- 
--    bcopy ((const char *)hp->h_addr,(char *)&(server_addr.sin_addr.s_addr),hp->h_length);
-+    memcpy ((char *)&(server_addr.sin_addr.s_addr),(const char *)hp->h_addr,hp->h_length);
- 
- 
-     server_addr.sin_family = AF_INET;
---- ltp/tools/netpipe-2.4/TCP.c.orig	2006-07-04 18:41:13.000000000 -0600
-+++ ltp/tools/netpipe-2.4/TCP.c	2006-07-04 18:41:39.000000000 -0600
-@@ -85,7 +85,7 @@
-      }
- 
-      lsin1->sin_family = addr->h_addrtype;
--     bcopy(addr->h_addr, (char*) &(lsin1->sin_addr.s_addr), addr->h_length);
-+     memcpy((char*) &(lsin1->sin_addr.s_addr), addr->h_addr, addr->h_length);
-    }
- 
-    lsin1->sin_port = htons(p->port);

Added: trunk/buildroot/package/ltp-testsuite/ltp-testsuite-remove-bzero-bcmp.patch
===================================================================
--- trunk/buildroot/package/ltp-testsuite/ltp-testsuite-remove-bzero-bcmp.patch	2006-12-02 05:15:27 UTC (rev 16750)
+++ trunk/buildroot/package/ltp-testsuite/ltp-testsuite-remove-bzero-bcmp.patch	2006-12-02 06:42:25 UTC (rev 16751)
@@ -0,0 +1,65 @@
+diff -ur ltp-full-20061121/testcases/kernel/fs/fsx-linux/fsx-linux.c ltp-full-20061121-patched/testcases/kernel/fs/fsx-linux/fsx-linux.c
+--- ltp-full-20061121/testcases/kernel/fs/fsx-linux/fsx-linux.c	2006-11-21 14:31:29.000000000 -0600
++++ ltp-full-20061121-patched/testcases/kernel/fs/fsx-linux/fsx-linux.c	2006-12-02 00:35:42.070475329 -0600
+@@ -322,7 +322,7 @@
+ 	unsigned op = 0;
+ 	unsigned bad = 0;
+ 
+-	if (bcmp(good_buf + offset, temp_buf, size) != 0) {
++	if (memcmp(good_buf + offset, temp_buf, size) != 0) {
+ 		prt("READ BAD DATA: offset = 0x%x, size = 0x%x\n",
+ 		    offset, size);
+ 		prt("OFFSET\tGOOD\tBAD\tRANGE\n");
+diff -ur ltp-full-20061121/testcases/kernel/io/ltp-aiodio/fsx-linux.c ltp-full-20061121-patched/testcases/kernel/io/ltp-aiodio/fsx-linux.c
+--- ltp-full-20061121/testcases/kernel/io/ltp-aiodio/fsx-linux.c	2006-11-21 14:31:27.000000000 -0600
++++ ltp-full-20061121-patched/testcases/kernel/io/ltp-aiodio/fsx-linux.c	2006-12-02 00:36:09.496726421 -0600
+@@ -355,7 +355,7 @@
+ 	unsigned op = 0;
+ 	unsigned bad = 0;
+ 
+-	if (bcmp(good_buf + offset, temp_buf, size) != 0) {
++	if (memcmp(good_buf + offset, temp_buf, size) != 0) {
+ 		prt("READ BAD DATA: offset = 0x%x, size = 0x%x, fname = %s\n",
+ 		    offset, size, fname);
+ 		prt("OFFSET\tGOOD\tBAD\tRANGE\n");
+diff -ur ltp-full-20061121/testcases/kernel/syscalls/symlink/symlink01.c ltp-full-20061121-patched/testcases/kernel/syscalls/symlink/symlink01.c
+--- ltp-full-20061121/testcases/kernel/syscalls/symlink/symlink01.c	2006-11-21 14:31:28.000000000 -0600
++++ ltp-full-20061121-patched/testcases/kernel/syscalls/symlink/symlink01.c	2006-12-02 00:36:18.081430964 -0600
+@@ -904,7 +904,7 @@
+ 	   "stat(2) failed to return inode information for a regular object file");
+        return(0);
+     }
+-    else if (bcmp((char *)&statter, (char *)&asymlink, sizeof(statter)) != 0) {
++    else if (memcmp((char *)&statter, (char *)&asymlink, sizeof(statter)) != 0) {
+        TEST_RESULT=TFAIL;
+        sprintf(test_msg,
+ 	   "lstat(2) and stat(2) do not return same inode information for an object file");
+diff -ur ltp-full-20061121/testcases/network/nfs/fsx-linux/fsx-linux.c ltp-full-20061121-patched/testcases/network/nfs/fsx-linux/fsx-linux.c
+--- ltp-full-20061121/testcases/network/nfs/fsx-linux/fsx-linux.c	2006-11-21 14:31:24.000000000 -0600
++++ ltp-full-20061121-patched/testcases/network/nfs/fsx-linux/fsx-linux.c	2006-12-02 00:35:51.495248935 -0600
+@@ -325,7 +325,7 @@
+ 	unsigned op = 0;
+ 	unsigned bad = 0;
+ 
+-	if (bcmp(good_buf + offset, temp_buf, size) != 0) {
++	if (memcmp(good_buf + offset, temp_buf, size) != 0) {
+ 		prt("READ BAD DATA: offset = 0x%x, size = 0x%x\n",
+ 		    offset, size);
+ 		prt("OFFSET\tGOOD\tBAD\tRANGE\n");
+diff -ur ltp-full-20061121/testcases/network/nfsv4/locks/netsync.c ltp-full-20061121-patched/testcases/network/nfsv4/locks/netsync.c
+--- ltp-full-20061121/testcases/network/nfsv4/locks/netsync.c	2006-11-21 14:31:27.000000000 -0600
++++ ltp-full-20061121-patched/testcases/network/nfsv4/locks/netsync.c	2006-12-02 00:38:03.710097050 -0600
+@@ -57,11 +57,11 @@
+         perror ("socket");
+         exit(1);
+     }
+-    bzero(&local, sizeof(local));
++    memset(&local, 0, sizeof(local));
+     local.sin_family = AF_INET;
+     local.sin_port = htons(PORT);
+     local.sin_addr.s_addr = INADDR_ANY;
+-    bzero(&(local.sin_zero), 8);
++    memset(&(local.sin_zero), 0, 8);
+ 
+     if(bind(sock, (struct sockaddr *)&local, sizeof(struct sockaddr))== -1){
+         perror("bind"); 

Modified: trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk
===================================================================
--- trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk	2006-12-02 05:15:27 UTC (rev 16750)
+++ trunk/buildroot/package/ltp-testsuite/ltp-testsuite.mk	2006-12-02 06:42:25 UTC (rev 16751)
@@ -3,7 +3,7 @@
 # ltp-testsuite
 #
 #############################################################
-LTP_TESTSUITE_VERSION:=20060615
+LTP_TESTSUITE_VERSION:=20061121
 LTP_TESTSUITE_SOURCE:=ltp-full-$(LTP_TESTSUITE_VERSION).tgz
 LTP_TESTSUITE_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ltp
 LTP_TESTSUITE_CAT:=$(ZCAT)

Modified: trunk/buildroot/package/ltp-testsuite/ltp-testsuite.patch
===================================================================
--- trunk/buildroot/package/ltp-testsuite/ltp-testsuite.patch	2006-12-02 05:15:27 UTC (rev 16750)
+++ trunk/buildroot/package/ltp-testsuite/ltp-testsuite.patch	2006-12-02 06:42:25 UTC (rev 16751)
@@ -1,61 +1,66 @@
---- ltp-full-20050707-dist/testcases/kernel/syscalls/fmtmsg/Makefile	2005-07-11 16:28:18.000000000 -0600
-+++ ltp-full-20050707/testcases/kernel/syscalls/fmtmsg/Makefile	2005-08-02 19:56:11.000000000 -0600
-@@ -26,7 +26,7 @@
- LOADLIBES+=	$(if $(UCLINUX),-lc)
+diff -ur ltp-full-20061121/testcases/kernel/syscalls/fmtmsg/Makefile ltp-full-20061121-patched/testcases/kernel/syscalls/fmtmsg/Makefile
+--- ltp-full-20061121/testcases/kernel/syscalls/fmtmsg/Makefile	2006-11-21 14:31:28.000000000 -0600
++++ ltp-full-20061121-patched/testcases/kernel/syscalls/fmtmsg/Makefile	2006-12-02 00:16:36.830948316 -0600
+@@ -20,7 +20,7 @@
+ LDLIBS += -L../../../../lib -lltp
  
- SRCS=$(wildcard *.c)
--TARGETS=$(patsubst %.c,%,$(SRCS))
-+TARGETS=#$(patsubst %.c,%,$(SRCS))
+ SRCS    = $(wildcard *.c)
+-TARGETS = $(patsubst %.c,%,$(SRCS))
++TARGETS =#$(patsubst %.c,%,$(SRCS))
  
  all: $(TARGETS)
  
---- ltp-full-20050707-dist/testcases/kernel/syscalls/getcontext/Makefile	2005-05-26 14:38:47.000000000 -0600
-+++ ltp-full-20050707/testcases/kernel/syscalls/getcontext/Makefile	2005-08-02 19:56:11.000000000 -0600
-@@ -24,7 +24,7 @@
- LOADLIBES+=	-L../../../../lib -lltp
+diff -ur ltp-full-20061121/testcases/kernel/syscalls/getcontext/Makefile ltp-full-20061121-patched/testcases/kernel/syscalls/getcontext/Makefile
+--- ltp-full-20061121/testcases/kernel/syscalls/getcontext/Makefile	2006-11-21 14:31:27.000000000 -0600
++++ ltp-full-20061121-patched/testcases/kernel/syscalls/getcontext/Makefile	2006-12-02 00:16:50.072004501 -0600
+@@ -20,7 +20,7 @@
+ LDLIBS += -L../../../../lib -lltp
  
- SRCS=$(wildcard *.c)
--TARGETS=$(patsubst %.c,%,$(SRCS))
-+TARGETS=#$(patsubst %.c,%,$(SRCS))
+ SRCS    = $(wildcard *.c)
+-TARGETS = $(patsubst %.c,%,$(SRCS))
++TARGETS =#$(patsubst %.c,%,$(SRCS))
  
  all: $(TARGETS)
  
---- ltp-full-20050707-dist/testcases/kernel/syscalls/profil/Makefile	2005-07-11 16:28:53.000000000 -0600
-+++ ltp-full-20050707/testcases/kernel/syscalls/profil/Makefile	2005-08-02 19:56:11.000000000 -0600
-@@ -25,7 +25,7 @@
- LOADLIBES+=	$(if $(UCLINUX),-lc)
+diff -ur ltp-full-20061121/testcases/kernel/syscalls/profil/Makefile ltp-full-20061121-patched/testcases/kernel/syscalls/profil/Makefile
+--- ltp-full-20061121/testcases/kernel/syscalls/profil/Makefile	2006-11-21 14:31:28.000000000 -0600
++++ ltp-full-20061121-patched/testcases/kernel/syscalls/profil/Makefile	2006-12-02 00:17:03.301059744 -0600
+@@ -20,7 +20,7 @@
+ LDLIBS += -L../../../../lib -lltp
  
- SRCS=$(wildcard *.c)
--TARGETS=$(patsubst %.c,%,$(SRCS))
-+TARGETS=#$(patsubst %.c,%,$(SRCS))
+ SRCS    = $(wildcard *.c)
+-TARGETS = $(patsubst %.c,%,$(SRCS))
++TARGETS =#$(patsubst %.c,%,$(SRCS))
  
  all: $(TARGETS)
  
---- ltp-full-20050707-dist/testcases/kernel/syscalls/pselect/Makefile	2005-05-26 09:35:58.000000000 -0600
-+++ ltp-full-20050707/testcases/kernel/syscalls/pselect/Makefile	2005-08-02 19:56:11.000000000 -0600
-@@ -24,7 +24,7 @@
- LOADLIBES+=	-L../../../../lib -lltp
+diff -ur ltp-full-20061121/testcases/kernel/syscalls/pselect/Makefile ltp-full-20061121-patched/testcases/kernel/syscalls/pselect/Makefile
+--- ltp-full-20061121/testcases/kernel/syscalls/pselect/Makefile	2006-11-21 14:31:29.000000000 -0600
++++ ltp-full-20061121-patched/testcases/kernel/syscalls/pselect/Makefile	2006-12-02 00:17:14.661965984 -0600
+@@ -20,7 +20,7 @@
+ LDLIBS += -L../../../../lib -lltp
  
- SRCS=$(wildcard *.c)
--TARGETS=$(patsubst %.c,%,$(SRCS))
-+TARGETS=#$(patsubst %.c,%,$(SRCS))
+ SRCS    = $(wildcard *.c)
+-TARGETS = $(patsubst %.c,%,$(SRCS))
++TARGETS =#$(patsubst %.c,%,$(SRCS))
  
  all: $(TARGETS)
  
---- ltp-full-20050707-dist/testcases/kernel/syscalls/swapon/swapon02.c	2005-07-11 16:29:08.000000000 -0600
-+++ ltp-full-20050707/testcases/kernel/syscalls/swapon/swapon02.c	2005-08-02 19:56:38.000000000 -0600
-@@ -86,9 +86,7 @@
+diff -ur ltp-full-20061121/testcases/kernel/syscalls/swapon/swapon02.c ltp-full-20061121-patched/testcases/kernel/syscalls/swapon/swapon02.c
+--- ltp-full-20061121/testcases/kernel/syscalls/swapon/swapon02.c	2006-11-21 14:31:29.000000000 -0600
++++ ltp-full-20061121-patched/testcases/kernel/syscalls/swapon/swapon02.c	2006-12-02 00:18:12.422573631 -0600
+@@ -85,9 +85,7 @@
+ #include <sys/wait.h>
  #include <sys/stat.h>
  #include <sys/swap.h>
- #include <asm/page.h>
 -#ifdef OLDER_DISTRO_RELEASE
 -#include <linux/swap.h>
 -#endif
-+#define MAX_SWAPFILES 32 
++#define MAX_SWAPFILES 32
  #include <fcntl.h>
  #include <pwd.h>
  #include <string.h>
-@@ -97,10 +95,6 @@
+@@ -96,10 +94,6 @@
  #include "test.h"
  #include "usctest.h"
  
@@ -66,8 +71,9 @@
  static void setup();
  static void cleanup();
  static int setup01();
---- ltp-full-20050804/testcases/kernel/syscalls/sysfs.orig/sysfs01.c	2005-12-08 18:26:07.000000000 -0700
-+++ ltp-full-20050804/testcases/kernel/syscalls/sysfs/sysfs01.c	2005-12-08 18:28:26.000000000 -0700
+diff -ur ltp-full-20061121/testcases/kernel/syscalls/sysfs/sysfs01.c ltp-full-20061121-patched/testcases/kernel/syscalls/sysfs/sysfs01.c
+--- ltp-full-20061121/testcases/kernel/syscalls/sysfs/sysfs01.c	2006-11-21 14:31:29.000000000 -0600
++++ ltp-full-20061121-patched/testcases/kernel/syscalls/sysfs/sysfs01.c	2006-12-02 00:15:34.705993080 -0600
 @@ -72,10 +72,6 @@
  #include <unistd.h>
  #include <syscall.h>
@@ -79,20 +85,9 @@
  static void setup();
  static void cleanup();
  
-@@ -83,11 +79,7 @@
- int TST_TOTAL = 1;	/* Total number of test cases. */
- extern int Tst_count;	/* Test Case counter for tst_* routines */
- 
--#if defined(__ia64__)
- #define sysfs(arg1, arg2) syscall(__NR_sysfs, arg1, arg2)
--#else
--_syscall2(long, sysfs, int, option, const char*, fsname);
--#endif
- 
- int
- main(int ac, char **av)
---- ltp-full-20050804/testcases/kernel/syscalls/sysfs.orig/sysfs02.c	2005-08-04 14:33:06.000000000 -0600
-+++ ltp-full-20050804/testcases/kernel/syscalls/sysfs/sysfs02.c	2005-12-08 18:31:00.000000000 -0700
+diff -ur ltp-full-20061121/testcases/kernel/syscalls/sysfs/sysfs02.c ltp-full-20061121-patched/testcases/kernel/syscalls/sysfs/sysfs02.c
+--- ltp-full-20061121/testcases/kernel/syscalls/sysfs/sysfs02.c	2006-11-21 14:31:29.000000000 -0600
++++ ltp-full-20061121-patched/testcases/kernel/syscalls/sysfs/sysfs02.c	2006-12-02 00:15:34.705993080 -0600
 @@ -70,10 +70,6 @@
  #include <unistd.h>
  #include <syscall.h>
@@ -104,20 +99,9 @@
  static void setup();
  static void cleanup();
  
-@@ -81,11 +77,7 @@
- int TST_TOTAL = 1;	/* Total number of test cases. */
- extern int Tst_count;	/* Test Case counter for tst_* routines */
- 
--#if defined(__ia64__)
- #define sysfs(arg1, arg2, arg3) syscall(__NR_sysfs, arg1, arg2, arg3)
--#else
--_syscall3(long, sysfs, int, option, unsigned int, arg1, char*, buf);
--#endif
- 
- int
- main(int ac, char **av)
---- ltp-full-20050804/testcases/kernel/syscalls/sysfs.orig/sysfs03.c	2005-08-04 14:33:06.000000000 -0600
-+++ ltp-full-20050804/testcases/kernel/syscalls/sysfs/sysfs03.c	2005-12-08 18:31:27.000000000 -0700
+diff -ur ltp-full-20061121/testcases/kernel/syscalls/sysfs/sysfs03.c ltp-full-20061121-patched/testcases/kernel/syscalls/sysfs/sysfs03.c
+--- ltp-full-20061121/testcases/kernel/syscalls/sysfs/sysfs03.c	2006-11-21 14:31:29.000000000 -0600
++++ ltp-full-20061121-patched/testcases/kernel/syscalls/sysfs/sysfs03.c	2006-12-02 00:15:34.705993080 -0600
 @@ -70,10 +70,6 @@
  #include <unistd.h>
  #include <syscall.h>
@@ -129,20 +113,9 @@
  static void setup();
  static void cleanup();
  
-@@ -81,11 +77,7 @@
- int TST_TOTAL = 1;	/* Total number of test cases. */
- extern int Tst_count;	/* Test Case counter for tst_* routines */
- 
--#if defined(__ia64__)
- #define sysfs(arg1) syscall(__NR_sysfs, arg1)
--#else
--_syscall1(long, sysfs, int, option);
--#endif
- 
- int
- main(int ac, char **av)
---- ltp-full-20050804/testcases/kernel/syscalls/sysfs.orig/sysfs04.c	2005-08-04 14:33:06.000000000 -0600
-+++ ltp-full-20050804/testcases/kernel/syscalls/sysfs/sysfs04.c	2005-12-08 18:31:37.000000000 -0700
+diff -ur ltp-full-20061121/testcases/kernel/syscalls/sysfs/sysfs04.c ltp-full-20061121-patched/testcases/kernel/syscalls/sysfs/sysfs04.c
+--- ltp-full-20061121/testcases/kernel/syscalls/sysfs/sysfs04.c	2006-11-21 14:31:29.000000000 -0600
++++ ltp-full-20061121-patched/testcases/kernel/syscalls/sysfs/sysfs04.c	2006-12-02 00:15:34.705993080 -0600
 @@ -73,10 +73,6 @@
  #include "test.h"
  #include "usctest.h"
@@ -154,21 +127,10 @@
  #define INVALID_OPTION 100
  static void setup();
  static void cleanup();
-@@ -86,11 +82,7 @@
- extern int Tst_count;		/* Test Case counter for tst_* routines */
- static int exp_enos[] = {EINVAL, 0};
- 
--#if defined(__ia64__)
- #define sysfs(arg1) syscall(__NR_sysfs, arg1)
--#else
--_syscall1(long, sysfs, int, option);
--#endif
- 
- int
- main(int ac, char **av)
---- ltp-full-20050804/testcases/kernel/syscalls/sysfs.orig/sysfs05.c	2005-08-04 14:33:06.000000000 -0600
-+++ ltp-full-20050804/testcases/kernel/syscalls/sysfs/sysfs05.c	2005-12-08 18:31:45.000000000 -0700
-@@ -74,18 +74,10 @@
+diff -ur ltp-full-20061121/testcases/kernel/syscalls/sysfs/sysfs05.c ltp-full-20061121-patched/testcases/kernel/syscalls/sysfs/sysfs05.c
+--- ltp-full-20061121/testcases/kernel/syscalls/sysfs/sysfs05.c	2006-11-21 14:31:29.000000000 -0600
++++ ltp-full-20061121-patched/testcases/kernel/syscalls/sysfs/sysfs05.c	2006-12-02 00:22:55.657171949 -0600
+@@ -74,10 +74,6 @@
  #include "test.h"
  #include "usctest.h"
  
@@ -179,17 +141,10 @@
  static void setup();
  static void cleanup();
  
--#if defined(__ia64__)
- #define sysfs(arg1, arg2) syscall(__NR_sysfs, arg1, arg2)
--#else
--_syscall2(long, sysfs, int, option, const char*, fsname);
--#endif
- 
- char *TCID = "sysfs05";		/* Test program identifier.    */
- int TST_TOTAL = 3;		/* Total number of test cases. */
---- ltp-full-20050804/testcases/kernel/syscalls/sysfs.orig/sysfs06.c	2005-08-04 14:33:06.000000000 -0600
-+++ ltp-full-20050804/testcases/kernel/syscalls/sysfs/sysfs06.c	2005-12-08 18:31:56.000000000 -0700
-@@ -75,18 +75,10 @@
+diff -ur ltp-full-20061121/testcases/kernel/syscalls/sysfs/sysfs06.c ltp-full-20061121-patched/testcases/kernel/syscalls/sysfs/sysfs06.c
+--- ltp-full-20061121/testcases/kernel/syscalls/sysfs/sysfs06.c	2006-11-21 14:31:29.000000000 -0600
++++ ltp-full-20061121-patched/testcases/kernel/syscalls/sysfs/sysfs06.c	2006-12-02 00:22:47.124491054 -0600
+@@ -75,10 +75,6 @@
  #include "test.h"
  #include "usctest.h"
  
@@ -200,11 +155,3 @@
  static void setup();
  static void cleanup();
  
--#if defined(__ia64__)
- #define sysfs(arg1, arg2, arg3) syscall(__NR_sysfs, arg1, arg2, arg3)
--#else
--_syscall3(long, sysfs, int, option, unsigned int, fs_index, char, bad_addr);
--#endif
- 
- char *TCID = "sysfs06"; 	/* Test program identifier.    */
- int TST_TOTAL = 3;		/* Total number of test cases. */
