From: heiko at zuerker.org <heiko@zuerker.org>
Date: Sun, 26 Dec 2010 11:31:15 -0600
Subject: [Buildroot] =?utf-8?q?=5BPATCH=5D_netperf=3A_add_Gentoo_patch_to_?=
	=?utf-8?q?fix_buffer_overflow_compiler_warnings?=
Message-ID: <855e95b6e3f2b8aba90318035d9951ac9d1a5cb3.1293384653.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/netperf/netperf-2.4.5-netserver.patch |   51 +++++++++++++++++++++++++
 1 files changed, 51 insertions(+), 0 deletions(-)
 create mode 100644 package/netperf/netperf-2.4.5-netserver.patch

diff --git a/package/netperf/netperf-2.4.5-netserver.patch b/package/netperf/netperf-2.4.5-netserver.patch
new file mode 100644
index 0000000..d841c1c
--- /dev/null
+++ b/package/netperf/netperf-2.4.5-netserver.patch
@@ -0,0 +1,51 @@
+http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-analyzer/netperf/files/netperf-2.4.5-netserver.patch?view=log
+# Set DEBUG_LOG_FILE location
+# Fix compiler warnings (bug #337422):
+	netserver.c: In function ?process_requests?:
+	netserver.c:287: warning: array subscript is above array bounds
+	inlined from ?process_requests? at netserver.c:268:
+	/usr/include/bits/stdio2.h:65: warning: call to __builtin___snprintf_chk will always overflow destination buffer
+	inlined from ?process_requests? at netserver.c:284:
+	/usr/include/bits/stdio2.h:65: warning: call to __builtin___snprintf_chk will always overflow destination buffer
+
+--- a/src/netserver.c
++++ b/src/netserver.c
+@@ -142,7 +142,7 @@
+ 
+ #ifndef DEBUG_LOG_FILE
+ #ifndef WIN32
+-#define DEBUG_LOG_FILE "/tmp/netperf.debug"
++#define DEBUG_LOG_FILE "/var/log/netperf.debug"
+ #else
+ #define DEBUG_LOG_FILE "c:\\temp\\netperf.debug"
+ #endif  /* WIN32 */
+@@ -266,7 +266,7 @@
+ 	      (!strstr(local_machine,delims[i])) &&
+ 	      (!strstr(local_version,delims[i]))) {
+ 	    snprintf((char *)netperf_response.content.test_specific_data,
+-		     sizeof(netperf_response) - 7,
++		     MAXSPECDATA,
+ 		     "%c%s%c%s%c%s%c%s",
+ 		     delims[i][0],
+ 		     local_sysname,
+@@ -282,15 +282,15 @@
+ 	if (i == 4) {
+ 	  /* none of the delimiters were unique, use the last one */
+ 	  snprintf((char *)netperf_response.content.test_specific_data,
+-		   sizeof(netperf_response) - 7,
++		   MAXSPECDATA,
+ 		   "%c%s%c%s%c%s%c%s",
+-		   delims[i][0],
++		   delims[3][0],
+ 		   "NoDelimUnique",
+-		   delims[i][0],
++		   delims[3][0],
+ 		   "NoDelimUnique",
+-		   delims[i][0],
++		   delims[3][0],
+ 		   "NoDelimUnique",
+-		   delims[i][0],
++		   delims[3][0],
+ 		   "NoDelimUnique");
+ 	}
+ 	send_response_n(0);
-- 
1.7.3.2
