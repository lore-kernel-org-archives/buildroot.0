From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Jun 2010 21:02:45 +0200
Subject: [Buildroot] [git commit master] netperf: fix build with uClibc
	0.9.31
Message-ID: <20100602190350.682888A2C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3c5deb98def6a7d9400c5c36dea5dead128b1b40
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1909

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                  |    8 ++++++
 package/netperf/netperf-2.4.5-dccp.patch |   38 ++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+), 0 deletions(-)
 create mode 100644 package/netperf/netperf-2.4.5-dccp.patch

diff --git a/CHANGES b/CHANGES
index f635864..dffc848 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,5 +1,13 @@
 2010.08, Not released yet:
 
+	Fixes all over the tree.
+
+	Updated/fixed packages: netperf
+
+	Issues resolved (http://bugs.uclibc.org):
+
+	#1909: netperf-2.4.5 fails to build because of undeclared SOCK_DCCP
+
 2010.05, Released May 30th, 2010:
 
 	Fixes all over the tree.
diff --git a/package/netperf/netperf-2.4.5-dccp.patch b/package/netperf/netperf-2.4.5-dccp.patch
new file mode 100644
index 0000000..ae84cee
--- /dev/null
+++ b/package/netperf/netperf-2.4.5-dccp.patch
@@ -0,0 +1,38 @@
+[PATCH] fix build on systems where IPROTO_DCCP is defined, but SOCK_DCCP isn't
+
+On some systems (E.G. uClibc 0.9.31) IPROTO_DCCP is defined, but SOCK_DCCP
+isn't - Causing the build to break. Fix it by checking for both before
+using.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ src/netsh.c       |    2 +-
+ src/nettest_bsd.c |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+Index: netperf-2.4.5/src/netsh.c
+===================================================================
+--- netperf-2.4.5.orig/src/netsh.c
++++ netperf-2.4.5/src/netsh.c
+@@ -452,7 +452,7 @@ parse_protocol(char protocol_string[])
+     return IPPROTO_SDP;
+   }
+ #endif
+-#ifdef IPPROTO_DCCP
++#if defined(IPPROTO_DCCP) && defined(SOCK_DCCP)
+   if (!strcasecmp(temp,"dccp")) {
+     socket_type = SOCK_DCCP;
+     return IPPROTO_DCCP;
+Index: netperf-2.4.5/src/nettest_bsd.c
+===================================================================
+--- netperf-2.4.5.orig/src/nettest_bsd.c
++++ netperf-2.4.5/src/nettest_bsd.c
+@@ -712,7 +712,7 @@ complete_addrinfo(char *controlhost, cha
+ 	 that we did this so the code for the Solaris kludge can do
+ 	 the fix-up for us.  also flip error over to EAI_AGAIN and
+ 	 make sure we don't "count" this time around the loop. */
+-#if defined(IPPROTO_DCCP)
++#if defined(IPPROTO_DCCP) && defined(SOCK_DCCP)
+       /* only tweak on this one the second time around, after we've
+ 	 kludged the ai_protocol field */
+       if ((hints.ai_socktype == SOCK_DCCP) &&
-- 
1.6.3.3
