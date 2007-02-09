From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  9 Feb 2007 04:32:22 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/dependencies
Message-ID: <20070209123222.4B15B4862C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-09 04:32:21 -0800 (Fri, 09 Feb 2007)
New Revision: 17831

Log:
- add purely informational check of HOSTCXX


Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.sh


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-02-09 06:44:53 UTC (rev 17830)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-02-09 12:32:21 UTC (rev 17831)
@@ -1,5 +1,5 @@
 #!/bin/sh
-
+# vi: set sw=4 ts=4:
 #set -x
 
 echo ""
@@ -175,7 +175,34 @@
 echo "C compiler version '$COMPILER_VERSION':			Ok"
 
 
+# check for host CXX
+CXXCOMPILER=$(which $HOSTCXX)
+if [ -z "$CXXCOMPILER" ] ; then
+	CXXCOMPILER=$(which c++)
+fi
+if [ -z "$CXXCOMPILER" ] ; then
+	echo "C++ Compiler installed:		    FALSE"
+	/bin/echo -e "\nYou may have to install 'g++' on your build machine\n"
+	#exit 1
+fi
+if [ ! -z "$CXXCOMPILER" ] ; then
+	CXXCOMPILER_VERSION=$($CXXCOMPILER --version 2>&1 | head -n1 | $XSED -e 's/^.*(.CC) \([0-9\.]\)/\1/g' -e "s/[-\ ].*//g")
+	if [ -z "$CXXCOMPILER_VERSION" ] ; then
+		echo "c++ installed:		    FALSE"
+		/bin/echo -e "\nYou may have to install 'g++' on your build machine\n"
+		#exit 1
+	fi
 
+	CXXCOMPILER_MAJOR=$(echo $CXXCOMPILER_VERSION | $XSED -e "s/\..*//g")
+	CXXCOMPILER_MINOR=$(echo $CXXCOMPILER_VERSION | $XSED -e "s/^$CXXCOMPILER_MAJOR\.//g" -e "s/\..*//g")
+	if [ $CXXCOMPILER_MAJOR -lt 3 -o $CXXCOMPILER_MAJOR -eq 2 -a $CXXCOMPILER_MINOR -lt 95 ] ; then
+		echo "You have g++ '$CXXCOMPILER_VERSION' installed.  g++ >= 2.95 is required"
+		exit 1
+	fi
+	echo "C++ compiler '$CXXCOMPILER'"
+	echo "C++ compiler version '$CXXCOMPILER_VERSION':			Ok"
+fi
+
 #############################################################
 #
 # check build system 'bison'
