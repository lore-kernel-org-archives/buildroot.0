From: Martin Banky <martin.banky@gmail.com>
Date: Fri,  8 Oct 2010 01:43:00 -0700
Subject: [Buildroot] [PATCH 1/9] portmap: convert to gentargets and bump to
	6.0.0
Message-ID: <1286527389-29983-1-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

portmap has a new maintainer, Neil Brown, who has made some updates to portmap.
Also, changed the download location to Debian to get the latest patches.

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/portmap/Config.in                          |    2 +-
 package/portmap/portmap-01-5beta.patch             |   80 -----
 package/portmap/portmap-02-4.0-malloc.patch        |  338 --------------------
 package/portmap/portmap-4.0-cleanup.patch          |   85 -----
 package/portmap/portmap-4.0-rpc_user.patch         |   59 ----
 package/portmap/portmap-4.0-sigpipe.patch          |   12 -
 package/portmap/portmap-5b-include-errno_h.patch   |   18 -
 package/portmap/portmap-5b-optional-tcpd.patch     |   38 ---
 package/portmap/portmap-6.0.0-no-tcp-wrapper.patch |   36 ++
 package/portmap/portmap.mk                         |   86 +++---
 10 files changed, 82 insertions(+), 672 deletions(-)
 delete mode 100644 package/portmap/portmap-01-5beta.patch
 delete mode 100644 package/portmap/portmap-02-4.0-malloc.patch
 delete mode 100644 package/portmap/portmap-4.0-cleanup.patch
 delete mode 100644 package/portmap/portmap-4.0-rpc_user.patch
 delete mode 100644 package/portmap/portmap-4.0-sigpipe.patch
 delete mode 100644 package/portmap/portmap-5b-include-errno_h.patch
 delete mode 100644 package/portmap/portmap-5b-optional-tcpd.patch
 create mode 100644 package/portmap/portmap-6.0.0-no-tcp-wrapper.patch

diff --git a/package/portmap/Config.in b/package/portmap/Config.in
index 41b38e9..1f22ab6 100644
--- a/package/portmap/Config.in
+++ b/package/portmap/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_PORTMAP
 	help
 	  The standard portmapper for RPC services.
 
-	  ftp://ftp.porcupine.org/pub/security/index.html
+	  http://neil.brown.name/portmap/
 
 comment "portmap requires a toolchain with 'Enable RPC' selected"
 	depends on !BR2_INET_RPC
diff --git a/package/portmap/portmap-01-5beta.patch b/package/portmap/portmap-01-5beta.patch
deleted file mode 100644
index 7681822..0000000
--- a/package/portmap/portmap-01-5beta.patch
+++ /dev/null
@@ -1,80 +0,0 @@
---- p/from_local.c
-+++ p/from_local.c	2000/02/28 15:10:25
-@@ -46,6 +46,7 @@
- #include <sys/types.h>
- #include <sys/socket.h>
- #include <stdio.h>
-+#include <stdlib.h>
- #include <netdb.h>
- #include <netinet/in.h>
- #include <net/if.h>
---- p/Makefile
-+++ p/Makefile	2000/02/28 15:10:25
-@@ -8,7 +8,7 @@
- # if you disagree. See `man 3 syslog' for examples. Some syslog versions
- # do not provide this flexibility.
- #
--FACILITY=LOG_MAIL
-+FACILITY=LOG_AUTH
- 
- # To disable tcp-wrapper style access control, comment out the following
- # macro definitions.  Access control can also be turned off by providing
-@@ -71,7 +71,7 @@
- # With verbose logging on, HP-UX 9.x and AIX 4.1 leave zombies behind when
- # SIGCHLD is not ignored. Enable next macro for a fix.
- #
--# ZOMBIES = -DIGNORE_SIGCHLD	# AIX 4.x, HP-UX 9.x
-+ZOMBIES = -DIGNORE_SIGCHLD	# AIX 4.x, HP-UX 9.x
- 
- # Uncomment the following macro if your system does not have u_long.
- #
-@@ -81,11 +81,15 @@
- # libwrap.a object library. WRAP_DIR should specify the directory with
- # that library.
- 
--WRAP_DIR= ../tcp_wrappers
-+WRAP_DIR= /usr/lib
- 
- # Auxiliary object files that may be missing from your C library.
- #
--AUX	= daemon.o strerror.o
-+AUX	= # daemon.o strerror.o
-+
-+LIBS	= -lwrap -lutil
-+NSARCHS	= 
-+O	= -Wall -O2 -pipe
- 
- # NEXTSTEP is a little different. The following seems to work with NS 3.2
- #
-@@ -99,7 +103,7 @@
- 
- # Comment out if your compiler talks ANSI and understands const
- #
--CONST   = -Dconst=
-+#CONST   = -Dconst=
- 
- ### End of configurable stuff.
- ##############################
-@@ -109,7 +113,7 @@
- COPT	= $(CONST) -Dperror=xperror $(HOSTS_ACCESS) $(CHECK_PORT) \
- 	$(SYS) -DFACILITY=$(FACILITY) $(ULONG) $(ZOMBIES) $(SA_LEN) \
- 	$(LOOPBACK) $(SETPGRP)
--CFLAGS	= $(COPT) -O $(NSARCHS)
-+CFLAGS	= $(COPT) $(O) $(NSARCHS)
- OBJECTS	= portmap.o pmap_check.o from_local.o $(AUX)
- 
- all:	portmap pmap_dump pmap_set
---- p/portmap.c
-+++ p/portmap.c	2000/02/28 15:10:25
-@@ -182,9 +182,8 @@
- 		exit(1);
- 	}
- 
--#ifdef LOG_MAIL
--	openlog("portmap", debugging ? LOG_PID | LOG_PERROR : LOG_PID,
--	    FACILITY);
-+#ifdef FACILITY
-+	openlog("portmap", debugging ? LOG_PID | LOG_PERROR : LOG_PID, FACILITY);
- #else
- 	openlog("portmap", debugging ? LOG_PID | LOG_PERROR : LOG_PID);
- #endif
diff --git a/package/portmap/portmap-02-4.0-malloc.patch b/package/portmap/portmap-02-4.0-malloc.patch
deleted file mode 100644
index db3bf09..0000000
--- a/package/portmap/portmap-02-4.0-malloc.patch
+++ /dev/null
@@ -1,338 +0,0 @@
-diff -urN portmap_4/daemon.c portmap_4.new/daemon.c
---- portmap_4/daemon.c	Thu Jun 11 13:53:12 1992
-+++ portmap_4.new/daemon.c	Mon Nov 29 18:37:28 1999
-@@ -35,7 +35,9 @@
- static char sccsid[] = "@(#)daemon.c	5.3 (Berkeley) 12/28/90";
- #endif /* LIBC_SCCS and not lint */
- 
-+#include <sys/types.h>
- #include <fcntl.h>
-+#include <unistd.h>
- 
- /* From unistd.h */
- #define STDIN_FILENO	0
-@@ -44,7 +46,7 @@
- 
- /* From paths.h */
- #define _PATH_DEVNULL	"/dev/null"
--
-+int
- daemon(nochdir, noclose)
- 	int nochdir, noclose;
- {
-diff -urN portmap_4/from_local.c portmap_4.new/from_local.c
---- portmap_4/from_local.c	Fri May 31 06:52:58 1996
-+++ portmap_4.new/from_local.c	Tue Nov 30 01:21:27 1999
-@@ -46,12 +46,14 @@
- #include <sys/types.h>
- #include <sys/socket.h>
- #include <stdio.h>
--#include <stdlib.h>
-+#include <unistd.h>
- #include <netdb.h>
- #include <netinet/in.h>
- #include <net/if.h>
- #include <sys/ioctl.h>
- #include <syslog.h>
-+#include <stdlib.h>
-+#include <string.h>
- 
- #ifndef TRUE
- #define	TRUE	1
-@@ -95,7 +98,7 @@
- }
- 
- /* find_local - find all IP addresses for this host */
--
-+int
- find_local()
- {
-     struct ifconf ifc;
-@@ -153,7 +156,7 @@
- }
- 
- /* from_local - determine whether request comes from the local system */
--
-+int
- from_local(addr)
- struct sockaddr_in *addr;
- {
-diff -urN portmap_4/pmap_check.c portmap_4.new/pmap_check.c
---- portmap_4/pmap_check.c	Sun Nov 21 11:59:01 1993
-+++ portmap_4.new/pmap_check.c	Tue Nov 30 01:19:37 1999
-@@ -34,7 +34,7 @@
- #ifndef lint
- static char sccsid[] = "@(#) pmap_check.c 1.6 93/11/21 20:58:59";
- #endif
--
-+#include <unistd.h>
- #include <rpc/rpc.h>
- #include <rpc/pmap_prot.h>
- #include <syslog.h>
-@@ -66,6 +66,9 @@
- 
- /* A handful of macros for "readability". */
- 
-+/* coming from libwrap.a (tcp_wrappers) */
-+extern int hosts_ctl(char *daemon, char *name, char *addr, char *user);
-+
- #define	good_client(a) hosts_ctl("portmap", "", inet_ntoa(a->sin_addr), "")
- 
- #define	legal_port(a,p) \
-@@ -104,6 +107,7 @@
- 
- /* check_default - additional checks for NULL, DUMP, GETPORT and unknown */
- 
-+int
- check_default(addr, proc, prog)
- struct sockaddr_in *addr;
- u_long  proc;
-@@ -121,7 +125,7 @@
- }
- 
- /* check_privileged_port - additional checks for privileged-port updates */
--
-+int
- check_privileged_port(addr, proc, prog, port)
- struct sockaddr_in *addr;
- u_long  proc;
-@@ -147,6 +147,6 @@
- 
- #ifdef LOOPBACK_SETUNSET
--
-+int
- check_setunset(xprt, ludp_xprt, ltcp_xprt, proc, prog, port)
- SVCXPRT *xprt;
- SVCXPRT *ludp_xprt;
-@@ -173,6 +174,6 @@
- 
- #else
--
-+int
- check_setunset(addr, proc, prog, port)
- struct sockaddr_in *addr;
- u_long  proc;
-@@ -160,7 +164,7 @@
- }
- 
- /* check_callit - additional checks for forwarded requests */
--
-+int
- check_callit(addr, proc, prog, aproc)
- struct sockaddr_in *addr;
- u_long  proc;
-@@ -213,13 +217,13 @@
-     };
-     struct proc_map *procp;
-     static struct proc_map procmap[] = {
--	PMAPPROC_CALLIT, "callit",
--	PMAPPROC_DUMP, "dump",
--	PMAPPROC_GETPORT, "getport",
--	PMAPPROC_NULL, "null",
--	PMAPPROC_SET, "set",
--	PMAPPROC_UNSET, "unset",
--	0, 0,
-+	{ PMAPPROC_CALLIT, "callit"},
-+	{ PMAPPROC_DUMP, "dump"},
-+	{ PMAPPROC_GETPORT, "getport"},
-+	{ PMAPPROC_NULL, "null"},
-+	{ PMAPPROC_SET, "set"},
-+	{ PMAPPROC_UNSET, "unset"},
-+	{ 0, 0},
-     };
- 
-     /*
-@@ -233,7 +237,7 @@
- 
- 	if (prognum == 0) {
- 	    progname = "";
--	} else if (rpc = getrpcbynumber((int) prognum)) {
-+	} else if ((rpc = getrpcbynumber((int) prognum))) {
- 	    progname = rpc->r_name;
- 	} else {
- 	    sprintf(progname = progbuf, "%lu", prognum);
-diff -urN portmap_4/pmap_dump.c portmap_4.new/pmap_dump.c
---- portmap_4/pmap_dump.c	Thu Jun 11 13:53:16 1992
-+++ portmap_4.new/pmap_dump.c	Tue Nov 30 01:22:07 1999
-@@ -22,7 +22,7 @@
- #include <rpc/pmap_prot.h>
- 
- static char *protoname();
--
-+int
- main(argc, argv)
- int     argc;
- char  **argv;
-diff -urN portmap_4/pmap_set.c portmap_4.new/pmap_set.c
---- portmap_4/pmap_set.c	Thu Jun 11 13:53:17 1992
-+++ portmap_4.new/pmap_set.c	Tue Nov 30 01:23:49 1999
-@@ -17,6 +17,9 @@
- #include <rpc/rpc.h>
- #include <rpc/pmap_clnt.h>
- 
-+int parse_line(char *buf, u_long *, u_long *, int *, unsigned *); 
-+
-+int
- main(argc, argv)
- int     argc;
- char  **argv;
-@@ -42,7 +45,7 @@
- }
- 
- /* parse_line - convert line to numbers */
--
-+int
- parse_line(buf, prog, vers, prot, port)
- char   *buf;
- u_long *prog;
-diff -urN portmap_4/portmap.c portmap_4.new/portmap.c
---- portmap_4/portmap.c	Fri May 31 06:52:59 1996
-+++ portmap_4.new/portmap.c	Tue Nov 30 01:01:32 1999
-@@ -83,6 +83,7 @@
- #include <rpc/rpc.h>
- #include <rpc/pmap_prot.h>
- #include <stdio.h>
-+#include <unistd.h>
- #include <syslog.h>
- #include <netdb.h>
- #include <sys/socket.h>
-@@ -128,6 +129,7 @@
- 
- #include "pmap_check.h"
- 
-+int
- main(argc, argv)
- 	int argc;
- 	char **argv;
-@@ -229,6 +231,7 @@
- 	svc_run();
- 	syslog(LOG_ERR, "run_svc returned unexpectedly");
- 	abort();
-+	/* never reached */
- }
- 
- #ifndef lint
-@@ -290,7 +293,7 @@
- 		 */
- 		/* remote host authorization check */
- 		check_default(svc_getcaller(xprt), rqstp->rq_proc, (u_long) 0);
--		if (!svc_sendreply(xprt, xdr_void, (caddr_t)0) && debugging) {
-+		if (!svc_sendreply(xprt, (xdrproc_t)xdr_void, (caddr_t)0) && debugging) {
- 			abort();
- 		}
- 		break;
-@@ -299,7 +302,7 @@
- 		/*
- 		 * Set a program,version to port mapping
- 		 */
--		if (!svc_getargs(xprt, xdr_pmap, &reg))
-+		if (!svc_getargs(xprt, (xdrproc_t)xdr_pmap, (caddr_t)&reg))
- 			svcerr_decode(xprt);
- 		else {
- 			/* reject non-local requests, protect priv. ports */
-@@ -341,7 +344,7 @@
- 				ans = 1;
- 			}
- 		done:
--			if ((!svc_sendreply(xprt, xdr_int, (caddr_t)&ans)) &&
-+			if ((!svc_sendreply(xprt, (xdrproc_t)xdr_int, (caddr_t)&ans)) &&
- 			    debugging) {
- 				(void) fprintf(stderr, "svc_sendreply\n");
- 				abort();
-@@ -353,7 +356,7 @@
- 		/*
- 		 * Remove a program,version to port mapping.
- 		 */
--		if (!svc_getargs(xprt, xdr_pmap, &reg))
-+		if (!svc_getargs(xprt, (xdrproc_t)xdr_pmap, (caddr_t)&reg))
- 			svcerr_decode(xprt);
- 		else {
- 			ans = 0;
-@@ -387,7 +390,7 @@
- 					prevpml->pml_next = pml;
- 				free(t);
- 			}
--			if ((!svc_sendreply(xprt, xdr_int, (caddr_t)&ans)) &&
-+			if ((!svc_sendreply(xprt, (xdrproc_t)xdr_int, (caddr_t)&ans)) &&
- 			    debugging) {
- 				(void) fprintf(stderr, "svc_sendreply\n");
- 				abort();
-@@ -399,7 +402,7 @@
- 		/*
- 		 * Lookup the mapping for a program,version and return its port
- 		 */
--		if (!svc_getargs(xprt, xdr_pmap, &reg))
-+		if (!svc_getargs(xprt, (xdrproc_t)xdr_pmap, (caddr_t)&reg))
- 			svcerr_decode(xprt);
- 		else {
- 			/* remote host authorization check */
-@@ -414,7 +417,7 @@
- 				port = fnd->pml_map.pm_port;
- 			else
- 				port = 0;
--			if ((!svc_sendreply(xprt, xdr_int, (caddr_t)&port)) &&
-+			if ((!svc_sendreply(xprt, (xdrproc_t)xdr_int, (caddr_t)&port)) &&
- 			    debugging) {
- 				(void) fprintf(stderr, "svc_sendreply\n");
- 				abort();
-@@ -426,7 +429,7 @@
- 		/*
- 		 * Return the current set of mapped program,version
- 		 */
--		if (!svc_getargs(xprt, xdr_void, NULL))
-+		if (!svc_getargs(xprt, (xdrproc_t)xdr_void, NULL))
- 			svcerr_decode(xprt);
- 		else {
- 			/* remote host authorization check */
-@@ -437,7 +440,7 @@
- 			} else {
- 				p = pmaplist;
- 			}
--			if ((!svc_sendreply(xprt, xdr_pmaplist,
-+			if ((!svc_sendreply(xprt, (xdrproc_t)xdr_pmaplist,
- 			    (caddr_t)&p)) && debugging) {
- 				(void) fprintf(stderr, "svc_sendreply\n");
- 				abort();
-@@ -481,7 +484,7 @@
- 	struct encap_parms *epp;
- {
- 
--	return (xdr_bytes(xdrs, &(epp->args), &(epp->arglen), ARGSIZE));
-+	return (xdr_bytes(xdrs, &(epp->args), (u_int *)&(epp->arglen), ARGSIZE));
- }
- 
- struct rmtcallargs {
-@@ -585,7 +588,7 @@
- 	timeout.tv_sec = 5;
- 	timeout.tv_usec = 0;
- 	a.rmt_args.args = buf;
--	if (!svc_getargs(xprt, xdr_rmtcall_args, &a))
-+	if (!svc_getargs(xprt, (xdrproc_t)xdr_rmtcall_args, (caddr_t)&a))
- 		return;
- 	/* host and service access control */
- 	if (!check_callit(svc_getcaller(xprt), 
-@@ -614,9 +617,9 @@
- 			   au->aup_uid, au->aup_gid, au->aup_len, au->aup_gids);
- 		}
- 		a.rmt_port = (u_long)port;
--		if (clnt_call(client, a.rmt_proc, xdr_opaque_parms, &a,
--		    xdr_len_opaque_parms, &a, timeout) == RPC_SUCCESS) {
--			svc_sendreply(xprt, xdr_rmtcall_result, (caddr_t)&a);
-+		if (clnt_call(client, a.rmt_proc, (xdrproc_t)xdr_opaque_parms, (caddr_t)&a,
-+		    (xdrproc_t)xdr_len_opaque_parms, (caddr_t)&a, timeout) == RPC_SUCCESS) {
-+			svc_sendreply(xprt, (xdrproc_t)xdr_rmtcall_result, (caddr_t)&a);
- 		}
- 		AUTH_DESTROY(client->cl_auth);
- 		clnt_destroy(client);
-
-+--------------------------------------------------------------------+
-| Ste'phane ERANIAN                       | Email eranian at hpl.hp.com |
-| Hewlett-Packard Laboratories            |                          |
-| 1501, Page Mill Road MS 1U-15           |                          |
-| Palo  Alto, CA 94303-096                |                          |
-| USA                                     |                          |
-| Tel : (650) 857-7174                    |                          |
-| Fax : (650) 857-5548                    |                          |
-+--------------------------------------------------------------------+
-
-
diff --git a/package/portmap/portmap-4.0-cleanup.patch b/package/portmap/portmap-4.0-cleanup.patch
deleted file mode 100644
index 2e005af..0000000
--- a/package/portmap/portmap-4.0-cleanup.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-Some cleanup for my last patch.
-
-
--- 
-H.J. Lu (hjl at gnu.org)
---
---- portmap_4/pmap_check.c.hostname	Wed May 10 10:23:35 2000
-+++ portmap_4/pmap_check.c	Wed May 10 11:03:22 2000
-@@ -35,6 +35,7 @@
- static char sccsid[] = "@(#) pmap_check.c 1.6 93/11/21 20:58:59";
- #endif
- #include <unistd.h>
-+#include <string.h>
- #include <rpc/rpc.h>
- #include <rpc/pmap_prot.h>
- #include <syslog.h>
-@@ -69,8 +70,6 @@ int     deny_severity = LOG_WARNING;
- /* coming from libwrap.a (tcp_wrappers) */
- extern int hosts_ctl(char *daemon, char *name, char *addr, char *user);
- 
--#define	good_client(a) hosts_ctl("portmap", "", inet_ntoa(a->sin_addr), "")
--
- #define reserved_port(p) (IPPORT_RESERVED/2 < (p) && (p) < IPPORT_RESERVED)
- 
- #define unreserved_port(p) (IPPORT_RESERVED <= (p) && (p) != NFS_PORT)
-@@ -88,6 +87,59 @@ extern int hosts_ctl(char *daemon, char 
- 
- #define log_client(addr, proc, prog) \
-   logit(allow_severity, addr, proc, prog, "")
-+
-+#ifdef HOSTS_ACCESS
-+static int
-+good_client(addr)
-+struct sockaddr_in *addr;
-+{
-+    struct hostent *hp;
-+    char **sp;
-+    char *tmpname;
-+
-+    /* Check the IP address first. */
-+    if (hosts_ctl("portmap", "", inet_ntoa(addr->sin_addr), ""))
-+	return 1;
-+
-+    /* Check the hostname. */
-+    hp = gethostbyaddr ((const char *) &(addr->sin_addr),
-+			sizeof (addr->sin_addr), AF_INET);
-+
-+    if (!hp)
-+	return 0;
-+
-+    /* must make sure the hostent is authorative. */
-+    tmpname = alloca (strlen (hp->h_name) + 1);
-+    strcpy (tmpname, hp->h_name);
-+    hp = gethostbyname(tmpname);
-+    if (hp) {
-+	/* now make sure the "addr->sin_addr" is on the list */
-+	for (sp = hp->h_addr_list ; *sp ; sp++) {
-+	    if (memcmp(*sp, &(addr->sin_addr), hp->h_length)==0)
-+		break;
-+	}
-+	if (!*sp)
-+	    /* it was a FAKE. */
-+	    return 0;
-+    }
-+    else
-+	   /* never heard of it. misconfigured DNS? */
-+	   return 0;
-+
-+   /* Check the official name first. */
-+   if (hosts_ctl("portmap", "", hp->h_name, ""))
-+	return 1;
-+
-+   /* Check aliases. */
-+   for (sp = hp->h_aliases; *sp ; sp++) {
-+	if (hosts_ctl("portmap", "", *sp, ""))
-+	    return 1;
-+   }
-+
-+   /* No match */
-+   return 0;
-+}
-+#endif
- 
- /* check_startup - additional startup code */
- 
diff --git a/package/portmap/portmap-4.0-rpc_user.patch b/package/portmap/portmap-4.0-rpc_user.patch
deleted file mode 100644
index 6ef0736..0000000
--- a/package/portmap/portmap-4.0-rpc_user.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-diff -urN portmap_4/daemon.c portmap_4.new/daemon.c
---- portmap_4/daemon.c	Thu Aug  3 18:07:22 2000
-+++ portmap_4.new/daemon.c	Fri Aug  4 08:45:25 2000
-@@ -35,6 +35,7 @@
- static char sccsid[] = "@(#)daemon.c	5.3 (Berkeley) 12/28/90";
- #endif /* LIBC_SCCS and not lint */
- 
-+#include <stdlib.h>
- #include <sys/types.h>
- #include <fcntl.h>
- #include <unistd.h>
-diff -urN portmap_4/pmap_check.c portmap_4.new/pmap_check.c
---- portmap_4/pmap_check.c	Thu Aug  3 18:07:22 2000
-+++ portmap_4.new/pmap_check.c	Thu Aug  3 18:29:51 2000
-@@ -40,6 +40,8 @@
- #include <rpc/pmap_prot.h>
- #include <syslog.h>
- #include <netdb.h>
-+#include <pwd.h>
-+#include <sys/types.h>
- #include <sys/signal.h>
- #ifdef SYSV40
- #include <netinet/in.h>
-@@ -149,11 +151,32 @@
-     /*
-      * Give up root privileges so that we can never allocate a privileged
-      * port when forwarding an rpc request.
-+     *
-+     * Fix 8/3/00 Philipp Knirsch: First lookup our rpc user. If we find it,
-+     * switch to that uid, otherwise simply resue the old bin user and print
-+     * out a warning in syslog.
-      */
--    if (setuid(1) == -1) {
--	syslog(LOG_ERR, "setuid(1) failed: %m");
--	exit(1);
-+
-+    struct passwd *pwent;
-+
-+    pwent = getpwnam("rpc");
-+    if (pwent == NULL) {
-+        syslog(LOG_WARNING, "user rpc not found, reverting to user bin");
-+        if (setuid(1) == -1) {
-+            syslog(LOG_ERR, "setuid(1) failed: %m");
-+            exit(1);
-+        }
-     }
-+    else {
-+        if (setuid(pwent->pw_uid) == -1) {
-+            syslog(LOG_WARNING, "setuid() to rpc user failed: %m");
-+            if (setuid(1) == -1) {
-+                syslog(LOG_ERR, "setuid(1) failed: %m");
-+                exit(1);
-+            }
-+        }
-+    }
-+
-     (void) signal(SIGINT, toggle_verboselog);
- }
- 
diff --git a/package/portmap/portmap-4.0-sigpipe.patch b/package/portmap/portmap-4.0-sigpipe.patch
deleted file mode 100644
index dba7cf4..0000000
--- a/package/portmap/portmap-4.0-sigpipe.patch
+++ /dev/null
@@ -1,12 +0,0 @@
---- portmap_4/portmap.c.sigpipe	Sun Feb 11 17:45:11 2001
-+++ portmap_4/portmap.c	Sun Feb 11 17:45:51 2001
-@@ -228,6 +228,9 @@
- #else
- 	(void)signal(SIGCHLD, reap);
- #endif
-+        /* Dying on SIGPIPE doesn't help anyone */
-+        (void)signal(SIGPIPE, SIG_IGN);
-+          
- 	svc_run();
- 	syslog(LOG_ERR, "run_svc returned unexpectedly");
- 	abort();
diff --git a/package/portmap/portmap-5b-include-errno_h.patch b/package/portmap/portmap-5b-include-errno_h.patch
deleted file mode 100644
index a440e61..0000000
--- a/package/portmap/portmap-5b-include-errno_h.patch
+++ /dev/null
@@ -1,18 +0,0 @@
---- portmap_5beta/portmap.c.orig	2002-12-31 22:13:17.000000000 +0200
-+++ portmap_5beta/portmap.c	2002-12-31 22:13:50.000000000 +0200
-@@ -97,6 +97,7 @@
- 
- extern char *strerror();
- #include <stdlib.h>
-+#include <errno.h>
- 
- #ifndef LOG_PERROR
- #define LOG_PERROR 0
-@@ -124,7 +125,6 @@
- static void callit();
- struct pmaplist *pmaplist;
- int debugging = 0;
--extern int errno;
- 
- #include "pmap_check.h"
- 
diff --git a/package/portmap/portmap-5b-optional-tcpd.patch b/package/portmap/portmap-5b-optional-tcpd.patch
deleted file mode 100644
index d5b79f2..0000000
--- a/package/portmap/portmap-5b-optional-tcpd.patch
+++ /dev/null
@@ -1,38 +0,0 @@
---- portmap/Makefile.orig	2004-10-31 01:54:48.073875024 -0400
-+++ portmap/Makefile	2004-10-31 01:54:58.395305928 -0400
-@@ -15,8 +15,6 @@
- # no access control tables. The local system, since it runs the portmap
- # daemon, is always treated as an authorized host.
- 
--HOSTS_ACCESS= -DHOSTS_ACCESS
--WRAP_LIB = $(WRAP_DIR)/libwrap.a
- 
- # Comment out if your RPC library does not allocate privileged ports for
- # requests from processes with root privilege, or the new portmap will
-@@ -87,7 +85,7 @@
- #
- AUX	= # daemon.o strerror.o
- 
--LIBS	= -lwrap -lutil
-+LIBS	= -lutil
- NSARCHS	= 
- O	= -Wall -O2 -pipe
- 
-@@ -110,7 +108,7 @@
- 
- SHELL	= /bin/sh
- 
--COPT	= $(CONST) -Dperror=xperror $(HOSTS_ACCESS) $(CHECK_PORT) \
-+COPT	= $(CONST) -Dperror=xperror $(CHECK_PORT) \
- 	$(SYS) -DFACILITY=$(FACILITY) $(ULONG) $(ZOMBIES) $(SA_LEN) \
- 	$(LOOPBACK) $(SETPGRP)
- CFLAGS	= $(COPT) $(O) $(NSARCHS)
-@@ -118,7 +116,7 @@
- 
- all:	portmap pmap_dump pmap_set
- 
--portmap: $(OBJECTS) $(WRAP_DIR)/libwrap.a
-+portmap: $(OBJECTS)
- 	$(CC) $(CFLAGS) -o $@ $(OBJECTS) $(WRAP_LIB) $(LIBS)
- 
- pmap_dump: pmap_dump.c
diff --git a/package/portmap/portmap-6.0.0-no-tcp-wrapper.patch b/package/portmap/portmap-6.0.0-no-tcp-wrapper.patch
new file mode 100644
index 0000000..0be5ee2
--- /dev/null
+++ b/package/portmap/portmap-6.0.0-no-tcp-wrapper.patch
@@ -0,0 +1,36 @@
+--- a/Makefile	2007-05-10 20:02:10.000000000 -0700
++++ b/Makefile	2010-10-06 13:35:16.000000000 -0700
+@@ -18,14 +18,14 @@ FACILITY=LOG_DAEMON
+ # target system will never user NIS for hostname lookup, you can define
+ # USE_DNS to add hostname tests in hosts.allow/deny.
+ 
+-ifeq ($(NO_TCP_WRAPPER),)
+-CPPFLAGS += -DHOSTS_ACCESS
+-WRAP_LIB  = -lwrap
+-ifdef USE_DNS
+-CPPFLAGS += -DENABLE_DNS
+-MAN_SED += -e 's/USE_DNS/yes/'
+-endif
+-endif
++#ifeq ($(NO_TCP_WRAPPER),)
++#CPPFLAGS += -DHOSTS_ACCESS
++#WRAP_LIB  = -lwrap
++#ifdef USE_DNS
++#CPPFLAGS += -DENABLE_DNS
++#MAN_SED += -e 's/USE_DNS/yes/'
++#endif
++#endif
+ 
+ # Comment out if your RPC library does not allocate privileged ports for
+ # requests from processes with root privilege, or the new portmap will
+
+--- a/pmap_check.c	2010-10-06 13:41:46.000000000 -0700
++++ b/pmap_check.c	2010-10-06 13:41:13.000000000 -0700
+@@ -44,7 +44,6 @@
+ #include <netinet/in.h>
+ #include <rpc/rpcent.h>
+ #endif
+-#include <tcpd.h>
+ #include <arpa/inet.h>
+ #include <grp.h>
+ 
diff --git a/package/portmap/portmap.mk b/package/portmap/portmap.mk
index 0132c72..506f042 100644
--- a/package/portmap/portmap.mk
+++ b/package/portmap/portmap.mk
@@ -3,45 +3,49 @@
 # portmap
 #
 #############################################################
-PORTMAP_VERSION:=5b
-PORTMAP_SOURCE:=portmap_$(PORTMAP_VERSION)eta.tar.gz
-PORTMAP_SITE:=ftp://ftp.porcupine.org/pub/security/
-PORTMAP_DIR:=$(BUILD_DIR)/portmap_$(PORTMAP_VERSION)eta
-PORTMAP_CAT:=$(ZCAT)
-PORTMAP_BINARY:=portmap
-PORTMAP_TARGET_BINARY:=sbin/portmap
-
-$(DL_DIR)/$(PORTMAP_SOURCE):
-	$(call DOWNLOAD,$(PORTMAP_SITE),$(PORTMAP_SOURCE))
-
-portmap-source: $(DL_DIR)/$(PORTMAP_SOURCE)
-
-$(PORTMAP_DIR)/.unpacked: $(DL_DIR)/$(PORTMAP_SOURCE)
-	$(PORTMAP_CAT) $(DL_DIR)/$(PORTMAP_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(PORTMAP_DIR) package/portmap/ portmap\*.patch
-	touch $(PORTMAP_DIR)/.unpacked
-
-$(PORTMAP_DIR)/$(PORTMAP_BINARY): $(PORTMAP_DIR)/.unpacked
-	$(MAKE) CC="$(TARGET_CC)" O="$(TARGET_CFLAGS)" -C $(PORTMAP_DIR)
-
-$(TARGET_DIR)/$(PORTMAP_TARGET_BINARY): $(PORTMAP_DIR)/$(PORTMAP_BINARY)
-	$(INSTALL) -D $(PORTMAP_DIR)/$(PORTMAP_BINARY) $(TARGET_DIR)/$(PORTMAP_TARGET_BINARY)
-	$(INSTALL) -m 0755 package/portmap/S13portmap $(TARGET_DIR)/etc/init.d
-
-portmap: $(TARGET_DIR)/$(PORTMAP_TARGET_BINARY)
-
-portmap-clean:
-	rm -f $(TARGET_DIR)/$(PORTMAP_TARGET_BINARY)
-	rm -f $(TARGET_DIR)/etc/init.d/S13portmap
-	-$(MAKE) -C $(PORTMAP_DIR) clean
-
-portmap-dirclean:
-	rm -rf $(PORTMAP_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_PORTMAP),y)
-TARGETS+=portmap
+PORTMAP_VERSION = 6.0.0
+PORTMAP_SOURCE = portmap_$(PORTMAP_VERSION).orig.tar.gz
+PORTMAP_PATCH = portmap_$(PORTMAP_VERSION)-2.diff.gz
+PORTMAP_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/p/portmap
+
+PORTMAP_BINARY = portmap
+PORTMAP_TARGET_BINARY = sbin/portmap
+
+ifneq ($(PORTMAP_PATCH),)
+define PORTMAP_DEBIAN_PATCHES
+	if [ -d $(@D)/debian/patches ]; then \
+		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*.diff; \
+	fi
+endef
 endif
+
+PORTMAP_POST_PATCH_HOOKS = PORTMAP_DEBIAN_PATCHES
+
+define PORTMAP_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) CC="$(TARGET_CC)" -C $(@D)
+endef
+
+define PORTMAP_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/portmap $(TARGET_DIR)/sbin/portmap
+	$(INSTALL) -D -m 0755 $(@D)/pmap_dump $(TARGET_DIR)/sbin/pmap_dump
+	$(INSTALL) -D -m 0755 $(@D)/pmap_set $(TARGET_DIR)/sbin/pmap_set
+	$(INSTALL) -D -m 0644 $(@D)/portmap.man $(TARGET_DIR)/usr/share/man/man8/portmap.8
+	$(INSTALL) -D -m 0644 $(@D)/pmap_dump.8 $(TARGET_DIR)/usr/share/man/man8/pmap_dump.8
+	$(INSTALL) -D -m 0644 $(@D)/pmap_set.8 $(TARGET_DIR)/usr/share/man/man8/pmap_set.8
+	$(INSTALL) -D -m 0755 package/portmap/S13portmap $(TARGET_DIR)/etc/init.d/S13portmap
+endef
+
+define PORTMAP_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/sbin/portmap
+	rm -f $(TARGET_DIR)/sbin/pmap_dump
+	rm -f $(TARGET_DIR)/sbin/pmap_set
+	rm -f $(TARGET_DIR)/usr/share/man/man8/portmap.8
+	rm -f $(TARGET_DIR)/usr/share/man/man8/pmap_dump.8
+	rm -f $(TARGET_DIR)/usr/share/man/man8/pmap_set.8
+endef
+
+define PORTMAP_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(call GENTARGETS,package,portmap))
-- 
1.7.3.1
