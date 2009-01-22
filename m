From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 22 Jan 2009 23:05:49 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/scripts
Message-ID: <20090122230550.07A2776724@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-22 23:05:49 +0000 (Thu, 22 Jan 2009)
New Revision: 24973

Log:
Add help script for testing

Added:
   trunk/buildroot/scripts/testheader.inc


Changeset:
Added: trunk/buildroot/scripts/testheader.inc
===================================================================
--- trunk/buildroot/scripts/testheader.inc	                        (rev 0)
+++ trunk/buildroot/scripts/testheader.inc	2009-01-22 23:05:49 UTC (rev 24973)
@@ -0,0 +1,111 @@
+alias mk="scripts/mkpkg"
+
+function	header()
+{
+	echo "#!/bin/sh"
+	echo "source \"scripts/testheader.inc\""
+	
+}
+
+active=1
+busybox=0
+
+function	SKIP()
+{
+	echo SKIP
+	active=0
+}
+
+function	RESTART()
+{
+	echo RESTART
+	active=1
+}
+
+function	EXE()
+{
+	printf 	"EXE	"
+	if [ ${active} == 1 ] ; then
+		printf "$1	"
+		$1 $2 $3 $4 $5 $6
+		return 0;
+	else
+		echo "$1 $2 $3 $4 $5 $6"
+		return 1;
+	fi
+}
+
+function	AVR()
+{
+	printf 	"AVR	"
+	if [ "${ARCH}X" == "avr32X" ] ; then
+		echo "mk $2 UNSUPPORTED \"$4\" $5 $6"
+		return 1;
+	elif [ ${active} == 1 ] ; then
+		printf "$1	"
+		$1 $2 $3 $4 $5 $6
+		return 0;
+	else
+		echo "$1 $2 $3 $4 $5 $6"
+		return 1;
+	fi
+}
+
+
+function skip()
+{
+	printf "skip	%-31s" "$1"
+	if [ "$2X" == "OKX" ] ; then
+		echo "DISABLED	$3 $4"
+	elif [ "$2X" == "FAILX" ] ; then
+		echo "DISABLED	$3 $4"
+	elif [ "$2X" == "BROKENX" ] ; then
+		echo "DISABLED	$3 $4"
+	elif [ "$2X" == "DISABLEDX" ] ; then
+		echo "DISABLED	\"$3 $4\""
+	else
+		echo "DISABLED	\"$2 $3 $4\""
+	fi
+}
+
+function bb()
+{
+	printf 	"bb	"
+	if [ ${busybox} == 1 ] ; then
+		printf "$1	"
+		$1 $2 $3 $4 $5 $6
+		return 0;
+	else
+		echo "$1 $2 $3 $4 $5 $6"
+		return 1;
+	fi
+}
+
+function	comment()
+{
+	echo	"comment	$1"
+}
+
+# Enable HASERL
+sed -i s/.*BR2_PACKAGE_HASERL.*// .config
+echo "# BR2_PACKAGE_HASERL_VERSION_0_8_X is not set" >> .config
+echo "BR2_PACKAGE_HASERL_VERSION_0_9_X=y" >> .config
+echo "BR2_PACKAGE_HASERL_VERSION=\"0.9.25\"" >> .config
+echo "BR2_PACKAGE_HASERL=y" >> .config
+# Enable SSL
+sed -i s/.*BR2_PACKAGE_OPENSSL.*// .config
+echo "BR2_PACKAGE_OPENSSL=y" >> .config
+# Enable socat
+sed -i s/.*BR2_PACKAGE_SOCAT.*// .config
+echo "BR2_PACKAGE_SOCAT=y" >> .config
+echo "BR2_PACKAGE_SOCAT_PREDEF_CRDLY_SHIFT=\"9\"" >> .config
+echo "BR2_PACKAGE_SOCAT_PREDEF_TABDLY_SHIFT=\"11\"" >> .config
+echo "BR2_PACKAGE_SOCAT_PREDEF_CSIZE_SHIFT=\"4\"" >> .config
+# Enable Freetype
+sed -i s/.*BR2_PACKAGE_FREETYPE.*// .config
+echo "BR2_PACKAGE_FREETYPE=y" >> .config
+sed -i s/.*BR2_FREETYPE_VERSION.*// .config
+echo "# BR2_FREETYPE_VERSION_2_2_1 is not set" >> .config
+echo "BR2_FREETYPE_VERSION_2_3_7=y" >> .config
+echo "BR2_FREETYPE_VERSION=\"2.3.7\"" >> .config
+
