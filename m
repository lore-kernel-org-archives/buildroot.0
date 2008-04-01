From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  1 Apr 2008 08:29:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pkgconfig
Message-ID: <20080401152904.38D863C555@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-01 08:29:03 -0700 (Tue, 01 Apr 2008)
New Revision: 21612

Log:
pkgconfig: Return appropriate error code from pkgconfig script

Patch by Will Newton.

Currently the wrapper script for pkgconfig clobbers the return status
of pkgconfig. This is a problem for example when someone tries to run
"pkgconfig --exists". This patch should allow the correct return code
to be passed through. Note it uses the "pipefail" option that was
introduced with bash 3.


Modified:
   trunk/buildroot/package/pkgconfig/pkgconfig-filter.sh


Changeset:
Modified: trunk/buildroot/package/pkgconfig/pkgconfig-filter.sh
===================================================================
--- trunk/buildroot/package/pkgconfig/pkgconfig-filter.sh	2008-04-01 14:50:40 UTC (rev 21611)
+++ trunk/buildroot/package/pkgconfig/pkgconfig-filter.sh	2008-04-01 15:29:03 UTC (rev 21612)
@@ -2,6 +2,8 @@
 # filter the output from pkg-config (renamed as pkg-config.real)
 # and ensures PKG_CONFIG_SYSROOT is prepended to all paths
 
+set -o pipefail
+
 CMD=$0
 
 if [ ! "$PKG_CONFIG_SYSROOT" ]; then
@@ -22,6 +24,5 @@
 	#echo "OKAY" >&2;
 	exit 0;
 else
-	echo "pkg-config failed!" >&2
 	exit $?
 fi
