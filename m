From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jan 2012 13:51:24 -0300
Subject: [Buildroot] =?utf-8?q?=5BPATCH_05/13=5D_netperf=3A_bump_to_versio?=
	=?utf-8?q?n_2=2E5=2E0?=
In-Reply-To: <1327596692-30728-1-git-send-email-gustavo@zacarias.com.ar>
References: <1327596692-30728-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1327596692-30728-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/netperf/netperf-2.4.5-dccp.patch      |   38 ------------------
 package/netperf/netperf-2.4.5-netserver.patch |   51 -------------------------
 package/netperf/netperf.mk                    |    2 +-
 3 files changed, 1 insertions(+), 90 deletions(-)
 delete mode 100644 package/netperf/netperf-2.4.5-dccp.patch
 delete mode 100644 package/netperf/netperf-2.4.5-netserver.patch

diff --git a/package/netperf/netperf-2.4.5-dccp.patch b/package/netperf/netperf-2.4.5-dccp.patch
deleted file mode 100644
index ae84cee..0000000
--- a/package/netperf/netperf-2.4.5-dccp.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-[PATCH] fix build on systems where IPROTO_DCCP is defined, but SOCK_DCCP isn't
-
-On some systems (E.G. uClibc 0.9.31) IPROTO_DCCP is defined, but SOCK_DCCP
-isn't - Causing the build to break. Fix it by checking for both before
-using.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- src/netsh.c       |    2 +-
- src/nettest_bsd.c |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Index: netperf-2.4.5/src/netsh.c
-===================================================================
---- netperf-2.4.5.orig/src/netsh.c
-+++ netperf-2.4.5/src/netsh.c
-@@ -452,7 +452,7 @@ parse_protocol(char protocol_string[])
-     return IPPROTO_SDP;
-   }
- #endif
--#ifdef IPPROTO_DCCP
-+#if defined(IPPROTO_DCCP) && defined(SOCK_DCCP)
-   if (!strcasecmp(temp,"dccp")) {
-     socket_type = SOCK_DCCP;
-     return IPPROTO_DCCP;
-Index: netperf-2.4.5/src/nettest_bsd.c
-===================================================================
---- netperf-2.4.5.orig/src/nettest_bsd.c
-+++ netperf-2.4.5/src/nettest_bsd.c
-@@ -712,7 +712,7 @@ complete_addrinfo(char *controlhost, cha
- 	 that we did this so the code for the Solaris kludge can do
- 	 the fix-up for us.  also flip error over to EAI_AGAIN and
- 	 make sure we don't "count" this time around the loop. */
--#if defined(IPPROTO_DCCP)
-+#if defined(IPPROTO_DCCP) && defined(SOCK_DCCP)
-       /* only tweak on this one the second time around, after we've
- 	 kludged the ai_protocol field */
-       if ((hints.ai_socktype == SOCK_DCCP) &&
diff --git a/package/netperf/netperf-2.4.5-netserver.patch b/package/netperf/netperf-2.4.5-netserver.patch
deleted file mode 100644
index d841c1c..0000000
--- a/package/netperf/netperf-2.4.5-netserver.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-analyzer/netperf/files/netperf-2.4.5-netserver.patch?view=log
-# Set DEBUG_LOG_FILE location
-# Fix compiler warnings (bug #337422):
-	netserver.c: In function ?process_requests?:
-	netserver.c:287: warning: array subscript is above array bounds
-	inlined from ?process_requests? at netserver.c:268:
-	/usr/include/bits/stdio2.h:65: warning: call to __builtin___snprintf_chk will always overflow destination buffer
-	inlined from ?process_requests? at netserver.c:284:
-	/usr/include/bits/stdio2.h:65: warning: call to __builtin___snprintf_chk will always overflow destination buffer
-
---- a/src/netserver.c
-+++ b/src/netserver.c
-@@ -142,7 +142,7 @@
- 
- #ifndef DEBUG_LOG_FILE
- #ifndef WIN32
--#define DEBUG_LOG_FILE "/tmp/netperf.debug"
-+#define DEBUG_LOG_FILE "/var/log/netperf.debug"
- #else
- #define DEBUG_LOG_FILE "c:\\temp\\netperf.debug"
- #endif  /* WIN32 */
-@@ -266,7 +266,7 @@
- 	      (!strstr(local_machine,delims[i])) &&
- 	      (!strstr(local_version,delims[i]))) {
- 	    snprintf((char *)netperf_response.content.test_specific_data,
--		     sizeof(netperf_response) - 7,
-+		     MAXSPECDATA,
- 		     "%c%s%c%s%c%s%c%s",
- 		     delims[i][0],
- 		     local_sysname,
-@@ -282,15 +282,15 @@
- 	if (i == 4) {
- 	  /* none of the delimiters were unique, use the last one */
- 	  snprintf((char *)netperf_response.content.test_specific_data,
--		   sizeof(netperf_response) - 7,
-+		   MAXSPECDATA,
- 		   "%c%s%c%s%c%s%c%s",
--		   delims[i][0],
-+		   delims[3][0],
- 		   "NoDelimUnique",
--		   delims[i][0],
-+		   delims[3][0],
- 		   "NoDelimUnique",
--		   delims[i][0],
-+		   delims[3][0],
- 		   "NoDelimUnique",
--		   delims[i][0],
-+		   delims[3][0],
- 		   "NoDelimUnique");
- 	}
- 	send_response_n(0);
diff --git a/package/netperf/netperf.mk b/package/netperf/netperf.mk
index a66d4ef..6a8aced 100644
--- a/package/netperf/netperf.mk
+++ b/package/netperf/netperf.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-NETPERF_VERSION = 2.4.5
+NETPERF_VERSION = 2.5.0
 NETPERF_SITE = ftp://ftp.netperf.org/netperf
 NETPERF_CONF_ENV = ac_cv_func_setpgrp_void=set
 
-- 
1.7.3.4
