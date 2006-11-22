From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Nov 2006 12:26:06 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ipsec-tools
Message-ID: <20061122202606.D7ACC485F4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-22 12:26:06 -0800 (Wed, 22 Nov 2006)
New Revision: 16635

Log:
- ignore GLOB_TILDE if it's not available.


Added:
   trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.102-GLOB_TILDE.patch


Changeset:
Added: trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.102-GLOB_TILDE.patch
===================================================================
--- trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.102-GLOB_TILDE.patch	2006-11-22 20:21:24 UTC (rev 16634)
+++ trunk/buildroot/package/ipsec-tools/ipsec-tools-0.6.6.102-GLOB_TILDE.patch	2006-11-22 20:26:06 UTC (rev 16635)
@@ -0,0 +1,15 @@
+--- ipsec-tools-0.6.6.oorig/src/racoon/cftoken.c	2006-06-13 10:49:01.000000000 +0200
++++ ipsec-tools-0.6.6/src/racoon/cftoken.c	2006-11-22 21:20:30.000000000 +0100
+@@ -4076,8 +4076,11 @@
+ 			"Includes nested too deeply");
+ 		return -1;
+ 	}
+-
++#ifdef GLOB_TILDE
+ 	if (glob(path, GLOB_TILDE, NULL, &incstack[incstackp].matches) != 0 ||
++#else
++	if (glob(path, 0, NULL, &incstack[incstackp].matches) != 0 ||
++#endif
+ 	    incstack[incstackp].matches.gl_pathc == 0) {
+ 		plog(LLV_ERROR, LOCATION, NULL,
+ 			"glob found no matches for path");
