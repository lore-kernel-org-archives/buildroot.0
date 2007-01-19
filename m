From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 19 Jan 2007 09:11:06 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20070119171106.928BC48580@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-19 09:11:05 -0800 (Fri, 19 Jan 2007)
New Revision: 17383

Log:
- add sanity check to make sure that LD_LIBRARY_PATH doesn't contain CWD


Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.sh


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-01-19 16:23:35 UTC (rev 17382)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-01-19 17:11:05 UTC (rev 17383)
@@ -55,6 +55,31 @@
 fi;
 echo "CXXFLAGS clean:					Ok"
 
+echo "WORKS" | grep "WORKS" >/dev/null 2>&1
+if test $? != 0 ; then
+	echo "grep works:				FALSE"
+	exit 1
+fi
+
+# sanity check for CWD in LD_LIBRARY_PATH
+# try not to rely on egrep..
+if test -n "$LD_LIBRARY_PATH" ; then
+	/bin/echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | /bin/grep ':.:' >/dev/null 2>&1 ||
+	/bin/echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | /bin/grep 'TRiGGER_start:' >/dev/null 2>&1 ||
+	/bin/echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | /bin/grep ':TRiGGER_end' >/dev/null 2>&1 ||
+	/bin/echo TRiGGER_start"$LD_LIBRARY_PATH"TRiGGER_end | /bin/grep '::' >/dev/null 2>&1
+	if test $? = 0; then
+		echo "LD_LIBRARY_PATH sane:				FALSE"
+		echo "You seem to have the current working directory in your"
+		echo "LD_LIBRARY_PATH environment variable. This doesn't work."
+		exit 1;
+	else
+		echo "LD_LIBRARY_PATH sane:				Ok"
+	fi
+fi;
+
+
+
 #############################################################
 #
 # check build system 'sed'
