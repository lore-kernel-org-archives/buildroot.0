From: andersen at uclibc.org <andersen@uclibc.org>
Date: Thu,  7 Dec 2006 21:24:59 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain: dependencies
	kernel-headers
Message-ID: <20061208052459.6F335485D9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-07 21:24:59 -0800 (Thu, 07 Dec 2006)
New Revision: 16811

Log:
use '/bin/echo -e' to make certain we don't use an unusable /bin/sh builtin


Modified:
   trunk/buildroot/toolchain/dependencies/dependencies.sh
   trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk


Changeset:
Modified: trunk/buildroot/toolchain/dependencies/dependencies.sh
===================================================================
--- trunk/buildroot/toolchain/dependencies/dependencies.sh	2006-12-08 05:23:08 UTC (rev 16810)
+++ trunk/buildroot/toolchain/dependencies/dependencies.sh	2006-12-08 05:24:59 UTC (rev 16811)
@@ -35,7 +35,7 @@
 #############################################################
 if ! which which > /dev/null ; then
 	echo "which installed:		    FALSE"
-	echo -e "\n\nYou must install 'which' on your build machine\n";
+	/bin/echo -e "\n\nYou must install 'which' on your build machine\n";
 	exit 1;
 fi;
 echo "which installed:		    Ok"
@@ -49,13 +49,13 @@
 MAKE=$(which make)
 if [ -z "$MAKE" ] ; then
 	echo "make installed:		    FALSE"
-	echo -e "\n\nYou must install 'make' on your build machine\n";
+	/bin/echo -e "\n\nYou must install 'make' on your build machine\n";
 	exit 1;
 fi;
 MAKE_VERSION=$($MAKE --version 2>&1 | head -n1 | $XSED -e 's/^.* \([0-9\.]\)/\1/g' -e 's/[-\ ].*//g')
 if [ -z "$MAKE_VERSION" ] ; then
 	echo "make installed:		    FALSE"
-	echo -e "\n\nYou must install 'make' on your build machine\n";
+	/bin/echo -e "\n\nYou must install 'make' on your build machine\n";
 	exit 1;
 fi;
 MAKE_MAJOR=$(echo $MAKE_VERSION | $XSED -e "s/\..*//g")
@@ -79,14 +79,14 @@
 fi;
 if [ -z "$COMPILER" ] ; then
 	echo "C Compiler installed:		    FALSE"
-	echo -e "\n\nYou must install 'gcc' on your build machine\n";
+	/bin/echo -e "\n\nYou must install 'gcc' on your build machine\n";
 	exit 1;
 fi;
 
 COMPILER_VERSION=$($COMPILER --version 2>&1 | head -n1 | $XSED -e 's/^.*(.CC) \([0-9\.]\)/\1/g' -e "s/[-\ ].*//g")
 if [ -z "$COMPILER_VERSION" ] ; then
 	echo "gcc installed:		    FALSE"
-	echo -e "\n\nYou must install 'gcc' on your build machine\n";
+	/bin/echo -e "\n\nYou must install 'gcc' on your build machine\n";
 	exit 1;
 fi;
 COMPILER_MAJOR=$(echo $COMPILER_VERSION | $XSED -e "s/\..*//g")
@@ -107,7 +107,7 @@
 #############################################################
 if ! which bison > /dev/null ; then
 	echo "bison installed:		    FALSE"
-	echo -e "\n\nYou must install 'bison' on your build machine\n";
+	/bin/echo -e "\n\nYou must install 'bison' on your build machine\n";
 	exit 1;
 fi;
 echo "bison installed:		    Ok"
@@ -120,7 +120,7 @@
 #############################################################
 if ! which flex > /dev/null ; then
 	echo "flex installed:		    FALSE"
-	echo -e "\n\nYou must install 'flex' on your build machine\n";
+	/bin/echo -e "\n\nYou must install 'flex' on your build machine\n";
 	exit 1;
 fi;
 echo "flex installed:			    Ok"
@@ -133,7 +133,7 @@
 #############################################################
 if ! which msgfmt > /dev/null ; then \
 	echo "gettext installed:		    FALSE"
-	echo -e "\n\nYou must install 'gettext' on your build machine\n"; \
+	/bin/echo -e "\n\nYou must install 'gettext' on your build machine\n"; \
 	exit 1; \
 fi;
 echo "gettext installed:		    Ok"

Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-12-08 05:23:08 UTC (rev 16810)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2006-12-08 05:24:59 UTC (rev 16811)
@@ -163,11 +163,11 @@
 $(LINUX_HEADERS_DIR)/.configured: $(LINUX_HEADERS_DIR)/.patched
 	rm -f $(LINUX_HEADERS_DIR)/include/asm
 	@if [ ! -f $(LINUX_HEADERS_DIR)/Makefile ] ; then \
-	    echo -e "VERSION = $(VERSION)\nPATCHLEVEL = $(PATCHLEVEL)\n" > \
+	    /bin/echo -e "VERSION = $(VERSION)\nPATCHLEVEL = $(PATCHLEVEL)\n" > \
 		    $(LINUX_HEADERS_DIR)/Makefile; \
-	    echo -e "SUBLEVEL = $(SUBLEVEL)\nEXTRAVERSION =\n" >> \
+	    /bin/echo -e "SUBLEVEL = $(SUBLEVEL)\nEXTRAVERSION =\n" >> \
 		    $(LINUX_HEADERS_DIR)/Makefile; \
-	    echo -e "KERNELRELEASE=\$$(VERSION).\$$(PATCHLEVEL).\$$(SUBLEVEL)\$$(EXTRAVERSION)" >> \
+	    /bin/echo -e "KERNELRELEASE=\$$(VERSION).\$$(PATCHLEVEL).\$$(SUBLEVEL)\$$(EXTRAVERSION)" >> \
 		    $(LINUX_HEADERS_DIR)/Makefile; \
 	fi;
 	@if [ "$(ARCH)" = "powerpc" ];then \
