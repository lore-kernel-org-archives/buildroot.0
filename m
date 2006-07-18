From: andersen@uclibc.org <andersen@uclibc.org>
Date: Tue Jul 18 16:39:41 2006
Subject: [Buildroot] svn commit: trunk/buildroot: toolchain/dependencies
	toolchain/uClibc
Message-ID: <20060718233940.601484897F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-07-18 16:39:39 -0700 (Tue, 18 Jul 2006)
New Revision: 15720

Log:
put sed check in the correct place


Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/toolchain/dependencies/dependencies.mk
   trunk/buildroot/toolchain/dependencies/dependencies.sh
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2006-07-18 22:58:58 UTC (rev 15719)
+++ trunk/buildroot/Makefile	2006-07-18 23:39:39 UTC (rev 15720)
@@ -43,7 +43,7 @@
 # along with the packages to build for the target.
 #
 ##############################################################
-TARGETS:=host-sed kernel-headers uclibc-configured binutils gcc uclibc-target-utils
+TARGETS:=kernel-headers uclibc-configured binutils gcc uclibc-target-utils
 include toolchain/Makefile.in
 include package/Makefile.in
 

Modified: trunk/buildroot/toolchain/dependencies/dependencies.mk
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.mk	2006-07-18 22:58:58 UTC (rev 15719)
+++ trunk/buildroot/toolchain/dependencies/dependencies.mk	2006-07-18 23:39:39 UTC (rev 15720)
@@ -5,7 +5,7 @@
 #
 ######################################################################
 
-dependencies:
+dependencies: host-sed
 	$(TOPDIR)/toolchain/dependencies/dependencies.sh
 
 dependencies-source:

Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2006-07-18 22:58:58 UTC (rev 15719)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2006-07-18 23:39:39 UTC (rev 15720)
@@ -6,6 +6,28 @@
 echo "Checking build system dependencies:"
 echo ""
 
+#############################################################
+#
+# check build system 'sed'
+#
+#############################################################
+if test -x /usr/bin/sed ; then
+	SED="/usr/bin/sed"
+else
+	if test -x /bin/sed ; then
+		SED="/bin/sed"
+	else
+		SED="sed"
+	fi
+fi
+echo "HELLO" > .sedtest
+$SED -i -e "s/HELLO/GOODBYE/" .sedtest >/dev/null 2>&1
+if test $? != 0 ; then
+	echo "sed works:			    No, using buildroot version instead"
+else
+	echo "sed works:			    Ok"
+fi
+XSED=$HOST_SED_DIR/bin/sed
 
 #############################################################
 #
@@ -18,14 +40,14 @@
 	echo -e "\n\nYou must install 'make' on your build machine\n";
 	exit 1;
 fi;
-MAKE_VERSION=$($MAKE --version 2>&1 | head -n1 | sed -e 's/^.* \([0-9\.]\)/\1/g' -e 's/[-\ ].*//g')
+MAKE_VERSION=$($MAKE --version 2>&1 | head -n1 | $XSED -e 's/^.* \([0-9\.]\)/\1/g' -e 's/[-\ ].*//g')
 if [ -z "$MAKE_VERSION" ] ; then
 	echo "make installed:		    FALSE"
 	echo -e "\n\nYou must install 'make' on your build machine\n";
 	exit 1;
 fi;
-MAKE_MAJOR=$(echo $MAKE_VERSION | sed -e "s/\..*//g")
-MAKE_MINOR=$(echo $MAKE_VERSION | sed -e "s/^$MAKE_MAJOR\.//g" -e "s/\..*//g")
+MAKE_MAJOR=$(echo $MAKE_VERSION | $XSED -e "s/\..*//g")
+MAKE_MINOR=$(echo $MAKE_VERSION | $XSED -e "s/^$MAKE_MAJOR\.//g" -e "s/\..*//g" -e "s/[a-zA-Z].*//g")
 if [ $MAKE_MAJOR -lt 3 -o $MAKE_MAJOR -eq 3 -a $MAKE_MINOR -lt 8 ] ; then
 	echo "You have make '$MAKE_VERSION' installed.  GNU make >=3.80 is required"
 	exit 1;
@@ -48,14 +70,14 @@
 		exit 1;
 	fi;
 fi;
-COMPILER_VERSION=$($COMPILER --version 2>&1 | head -n1 | sed -e 's/^.* \([0-9\.]\)/\1/g' -e "s/[-\ ].*//g")
+COMPILER_VERSION=$($COMPILER --version 2>&1 | head -n1 | $XSED -e 's/^.* \([0-9\.]\)/\1/g' -e "s/[-\ ].*//g")
 if [ -z "$COMPILER_VERSION" ] ; then
 	echo "gcc installed:		    FALSE"
 	echo -e "\n\nYou must install 'gcc' on your build machine\n";
 	exit 1;
 fi;
-COMPILER_MAJOR=$(echo $COMPILER_VERSION | sed -e "s/\..*//g")
-COMPILER_MINOR=$(echo $COMPILER_VERSION | sed -e "s/^$COMPILER_MAJOR\.//g" -e "s/\..*//g")
+COMPILER_MAJOR=$(echo $COMPILER_VERSION | $XSED -e "s/\..*//g")
+COMPILER_MINOR=$(echo $COMPILER_VERSION | $XSED -e "s/^$COMPILER_MAJOR\.//g" -e "s/\..*//g")
 if [ $COMPILER_MAJOR -lt 3 -o $COMPILER_MAJOR -eq 2 -a $COMPILER_MINOR -lt 95 ] ; then
 	echo "You have gcc '$COMPILER_VERSION' installed.  gcc >= 2.95 is required"
 	exit 1;

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-07-18 22:58:58 UTC (rev 15719)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-07-18 23:39:39 UTC (rev 15720)
@@ -68,7 +68,7 @@
 	touch $(UCLIBC_DIR)/.unpacked
 
 uclibc-configured: $(UCLIBC_DIR)/.configured
-$(UCLIBC_DIR)/.configured: $(UCLIBC_DIR)/.unpacked
+$(UCLIBC_DIR)/.configured: dependencies $(UCLIBC_DIR)/.unpacked
 	cp $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.config
 	$(SED) 's,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX="$(TARGET_CROSS)",g' \
 		-e 's,# TARGET_$(UCLIBC_TARGET_ARCH) is not set,TARGET_$(UCLIBC_TARGET_ARCH)=y,g' \
