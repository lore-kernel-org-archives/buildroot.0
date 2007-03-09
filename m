From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  9 Mar 2007 00:33:34 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: package/sed
	toolchain/dependencies
Message-ID: <20070309083334.1185948598@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-09 00:33:34 -0800 (Fri, 09 Mar 2007)
New Revision: 18046

Log:
Improve the checking of sed by adding some common GNU sed installation
names (gsed/gnused), checking for a basic OS X sed feature in command
line option handling, checking the actual result of the sed run against
the expected result, and placing common code for the check under
toolchain/dependencies/.  (Heikki Lindholm)


Added:
   trunk/buildroot/toolchain/dependencies/check-host-sed.sh

Modified:
   trunk/buildroot/package/sed/sedcheck.sh
   trunk/buildroot/toolchain/dependencies/dependencies.sh


Changeset:
Modified: trunk/buildroot/package/sed/sedcheck.sh
===================================================================
--- trunk/buildroot/package/sed/sedcheck.sh	2007-03-09 08:26:10 UTC (rev 18045)
+++ trunk/buildroot/package/sed/sedcheck.sh	2007-03-09 08:33:34 UTC (rev 18046)
@@ -2,24 +2,10 @@
 
 # Make sure the host sed supports '-i' (in-place).
 # If it doesn't, we'll build and use our own.
+SED=$(toolchain/dependencies/check-host-sed.sh)
 
-if test -x /usr/bin/sed ; then
-	SED="/usr/bin/sed"
-else
-	if test -x /bin/sed ; then
-		SED="/bin/sed"
-	else
-		SED="sed"
-	fi
-fi
-
-echo "HELLO" > .sedtest
-$SED -i -e "s/HELLO/GOODBYE/" .sedtest >/dev/null 2>&1
-
-if test $? != 0 ; then
+if [ -z "$SED" ] ; then
 	echo build-sed-host-binary
 else
 	echo use-sed-host-binary
 fi
-
-rm -f .sedtest

Added: trunk/buildroot/toolchain/dependencies/check-host-sed.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/check-host-sed.sh	                        (rev 0)
+++ trunk/buildroot/toolchain/dependencies/check-host-sed.sh	2007-03-09 08:33:34 UTC (rev 18046)
@@ -0,0 +1,38 @@
+SEDLIST="/usr/bin/sed /bin/sed sed gnused gsed"
+
+DIFF=$(which diff)
+if ! test -x "$DIFF" ; then
+	/bin/echo -e "\n\ntesting for sed needs 'diff' on your build machine\n";
+	exit 1;
+fi;
+
+for SED in $SEDLIST
+do
+	if ! test -x $SED ; then
+		SED=$(which $SED)
+		if ! test -x "$SED" > /dev/null ; then
+			SED=""
+			continue
+		fi
+	fi
+
+	echo "HELLO" > .sedtest
+	echo "GOODBYE" > .sedtest-correct
+	$SED -i -e "s/HELLO/GOODBYE/" .sedtest >/dev/null 2>&1
+
+	if test $? != 0 ; then
+		SED=""
+	elif test -e ".sedtest-e" ; then
+		rm -f ".sedtest-e"
+		SED=""
+	elif ! $DIFF ".sedtest" ".sedtest-correct" > /dev/null ; then
+		echo "diff failed"
+		SED=""
+	fi
+
+	rm -f .sedtest .sedtest-correct
+	if [ ! -z "$SED" ] ; then
+		break
+	fi
+done
+echo $SED


Property changes on: trunk/buildroot/toolchain/dependencies/check-host-sed.sh
___________________________________________________________________
Name: svn:executable
   + *

Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-03-09 08:26:10 UTC (rev 18045)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2007-03-09 08:33:34 UTC (rev 18046)
@@ -88,30 +88,6 @@
 
 #############################################################
 #
-# check build system 'sed'
-#
-#############################################################
-if test -x /usr/bin/sed ; then
-	SED="/usr/bin/sed"
-else
-	if test -x /bin/sed ; then
-		SED="/bin/sed"
-	else
-		SED="sed"
-	fi
-fi
-echo "HELLO" > .sedtest
-$SED -i -e "s/HELLO/GOODBYE/" .sedtest >/dev/null 2>&1
-if test $? != 0 ; then
-	echo "sed works:				No, using buildroot version instead"
-else
-	echo "sed works:					Ok"
-fi
-rm -f .sedtest
-XSED=$HOST_SED_DIR/bin/sed
-
-#############################################################
-#
 # check build system 'which'
 #
 #############################################################
@@ -123,8 +99,27 @@
 echo "which installed:				Ok"
 
 
+
 #############################################################
 #
+# check build system 'sed'
+#
+#############################################################
+SED=$(toolchain/dependencies/check-host-sed.sh)
+
+if [ -z "$SED" ] ; then
+	XSED=$HOST_SED_DIR/bin/sed
+	echo "sed works:					No, using buildroot version instead"
+else
+	XSED=$SED
+	echo "sed works:					Ok ($SED)"
+fi
+
+
+
+
+#############################################################
+#
 # check build system 'make'
 #
 #############################################################
