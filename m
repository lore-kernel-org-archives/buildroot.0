From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 10 Mar 2007 02:29:09 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot: package/sed
	toolchain/dependencies
Message-ID: <20070310102909.5202A48094@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-10 02:29:08 -0800 (Sat, 10 Mar 2007)
New Revision: 18060

Log:
- fixes for bugs introduced with the MacOS10 support (Heikki Lindholm)


Modified:
   trunk/buildroot/package/sed/sed.mk
   trunk/buildroot/toolchain/dependencies/check-host-sed.sh


Changeset:
Modified: trunk/buildroot/package/sed/sed.mk
===================================================================
--- trunk/buildroot/package/sed/sed.mk	2007-03-09 22:48:08 UTC (rev 18059)
+++ trunk/buildroot/package/sed/sed.mk	2007-03-10 10:29:08 UTC (rev 18060)
@@ -42,7 +42,7 @@
 $(SED_DIR1)/.configured: $(SED_DIR1)/.unpacked
 	(cd $(SED_DIR1); rm -rf config.cache; \
 		./configure \
-		--prefix=$(HOST_SED_DIR) \
+		--prefix=/usr \
 	);
 	touch $(SED_DIR1)/.configured
 

Modified: trunk/buildroot/toolchain/dependencies/check-host-sed.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/check-host-sed.sh	2007-03-09 22:48:08 UTC (rev 18059)
+++ trunk/buildroot/toolchain/dependencies/check-host-sed.sh	2007-03-10 10:29:08 UTC (rev 18060)
@@ -1,11 +1,5 @@
 SEDLIST="/usr/bin/sed /bin/sed sed gnused gsed"
 
-DIFF=$(which diff)
-if ! test -x "$DIFF" ; then
-	/bin/echo -e "\n\ntesting for sed needs 'diff' on your build machine\n";
-	exit 1;
-fi;
-
 for SED in $SEDLIST
 do
 	if ! test -x $SED ; then
@@ -17,20 +11,20 @@
 	fi
 
 	echo "HELLO" > .sedtest
-	echo "GOODBYE" > .sedtest-correct
 	$SED -i -e "s/HELLO/GOODBYE/" .sedtest >/dev/null 2>&1
+	RESULT=$(cat .sedtest)
 
 	if test $? != 0 ; then
 		SED=""
 	elif test -e ".sedtest-e" ; then
 		rm -f ".sedtest-e"
 		SED=""
-	elif ! $DIFF ".sedtest" ".sedtest-correct" > /dev/null ; then
-		echo "diff failed"
+	elif [ -z "${RESULT}" ] || [ "${RESULT}" != "GOODBYE"] > /dev/null ;
+	then
 		SED=""
 	fi
 
-	rm -f .sedtest .sedtest-correct
+	rm -f .sedtest
 	if [ ! -z "$SED" ] ; then
 		break
 	fi
