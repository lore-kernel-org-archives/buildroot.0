From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  1 Oct 2015 14:45:35 +0300
Subject: [Buildroot] [PATCH] tcpdump: drop unneeded security patches
Message-ID: <8eab1f5310d5dac8ab6e17bc5a0e4fdf5d3017ad.1443699935.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 4.7.4 of tcpdump is not vulnerable to these issues according to:

   https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8767
   https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8768
   https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8769

The tcpdump commit log seems to indicate that these issues were fixes in a
different way in the following commits:

CVE-2014-8767: 4038f83ebf654804829b258dde5e0a508c1c2003
CVE-2014-8768: 9255c9b05b0a04b8d89739b3efcb9f393a617fe9
CVE-2014-8769: 9ed7ddb48fd557dc993e73f22a50dda6cedf4df7

Just drop these patches.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/tcpdump/0002-fix-CVE-2014-8767.patch | 20 --------------------
 package/tcpdump/0003-fix-CVE-2014-8768.patch | 19 -------------------
 package/tcpdump/0004-fix-CVE-2014-8769.patch | 19 -------------------
 3 files changed, 58 deletions(-)
 delete mode 100644 package/tcpdump/0002-fix-CVE-2014-8767.patch
 delete mode 100644 package/tcpdump/0003-fix-CVE-2014-8768.patch
 delete mode 100644 package/tcpdump/0004-fix-CVE-2014-8769.patch

diff --git a/package/tcpdump/0002-fix-CVE-2014-8767.patch b/package/tcpdump/0002-fix-CVE-2014-8767.patch
deleted file mode 100644
index a88efdf58de3..000000000000
--- a/package/tcpdump/0002-fix-CVE-2014-8767.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-From https://bugzilla.redhat.com/show_bug.cgi?id=1165160
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- tcpdump-tcpdump-4.6/print-olsr.c	2014-10-23 14:07:12.000000000 +0700
-+++ tcpdump-4.6.2/print-olsr.c	2014-11-21 14:56:18.205542679 +0700
-@@ -234,6 +234,13 @@
-     ND_PRINT((ndo, "\n\t      neighbor\n\t\t"));
-     neighbor = 1;
- 
-+    u_int caplength;
-+
-+    /* Checking length of available data before print */
-+    caplength = (ndo->ndo_snapend >= msg_data) ? ndo->ndo_snapend - msg_data : 0;
-+    if (hello_len > caplength)
-+        hello_len = caplength;
-+
-     while (hello_len >= sizeof(struct in_addr)) {
- 
-         /* print 4 neighbors per line */
diff --git a/package/tcpdump/0003-fix-CVE-2014-8768.patch b/package/tcpdump/0003-fix-CVE-2014-8768.patch
deleted file mode 100644
index a8b82cf7017f..000000000000
--- a/package/tcpdump/0003-fix-CVE-2014-8768.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-From https://bugzilla.redhat.com/show_bug.cgi?id=1165161
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- tcpdump-tcpdump_4.5/print-geonet.c	2014-02-17 05:58:41.000000000 +0700
-+++ print-geonet.c	2014-11-21 10:06:58.590217933 +0700
-@@ -237,6 +237,12 @@
- 		printf("Malformed (small) ");
- 	}
- 
-+	/* Checking length before print */
-+	u_int caplength;
-+	caplength = (ndo->ndo_snapend >= bp) ? ndo->ndo_snapend - bp : 0;
-+	if (length > caplength)
-+		length = caplength;
-+
- 	/* Print user data part */
- 	if (ndo->ndo_vflag)
- 		default_print(bp, length);
diff --git a/package/tcpdump/0004-fix-CVE-2014-8769.patch b/package/tcpdump/0004-fix-CVE-2014-8769.patch
deleted file mode 100644
index 38eaf1247c1f..000000000000
--- a/package/tcpdump/0004-fix-CVE-2014-8769.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-From https://bugzilla.redhat.com/show_bug.cgi?id=1165162
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- tcpdump-tcpdump-4.6/print-udp.c	2014-11-21 13:53:05.757690197 +0700
-+++ tcpdump-4.6.2/print-udp.c	2014-11-21 13:50:58.077695164 +0700
-@@ -357,6 +357,12 @@
- #ifdef INET6
- 	register const struct ip6_hdr *ip6;
- #endif
-+	u_int caplength;
-+
-+	/* Checking length of available data before print */
-+	caplength = (ndo->ndo_snapend >= bp) ? ndo->ndo_snapend - bp : 0;
-+	if (length > caplength)
-+		length = caplength;
- 
- 	if (ep > ndo->ndo_snapend)
- 		ep = ndo->ndo_snapend;
-- 
2.5.3
