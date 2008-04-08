From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Tue,  8 Apr 2008 10:47:30 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/dropbear
Message-ID: <20080408174730.2CAEB3C379@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-04-08 10:47:29 -0700 (Tue, 08 Apr 2008)
New Revision: 21673

Log:
* Generate keys for dropbear only when starting
* Generate keys silently


Modified:
   trunk/buildroot/package/dropbear/dropbear-init.patch


Changeset:
Modified: trunk/buildroot/package/dropbear/dropbear-init.patch
===================================================================
--- trunk/buildroot/package/dropbear/dropbear-init.patch	2008-04-08 14:45:32 UTC (rev 21672)
+++ trunk/buildroot/package/dropbear/dropbear-init.patch	2008-04-08 17:47:29 UTC (rev 21673)
@@ -1,5 +1,6 @@
---- dropbear-0.42/S50dropbear
-+++ dropbear-0.42/S50dropbear
+diff -rNu dropbear-0.51_vanilla/S50dropbear dropbear-0.51_init/S50dropbear
+--- dropbear-0.51_vanilla/S50dropbear	1970-01-01 00:00:00.000000000 +0000
++++ dropbear-0.51_init/S50dropbear	2008-04-08 14:46:53.000000000 +0000
 @@ -0,0 +1,56 @@
 +#!/bin/sh
 +#
@@ -9,24 +10,24 @@
 +# Make sure the dropbearkey progam exists
 +[ -f /usr/bin/dropbearkey ] || exit 0
 +
-+# Check for the Dropbear RSA key
-+if [ ! -f /etc/dropbear/dropbear_rsa_host_key ] ; then
-+	echo Generating RSA Key...
-+	mkdir -p /etc/dropbear
-+	/usr/bin/dropbearkey -t rsa -f /etc/dropbear/dropbear_rsa_host_key
-+fi
-+
-+# Check for the Dropbear DSS key
-+if [ ! -f /etc/dropbear/dropbear_dss_host_key ] ; then
-+	echo Generating DSS Key...
-+	mkdir -p /etc/dropbear
-+	/usr/bin/dropbearkey -t dss -f /etc/dropbear/dropbear_dss_host_key
-+fi
-+
-+umask 077
-+
 +start() {
 + 	echo -n "Starting dropbear sshd: "
++	# Make sure dropbear directory exists
++	if [ ! -d /etc/dropbear ] ; then
++		mkdir -p /etc/dropbear
++	fi
++	# Check for the Dropbear RSA key
++	if [ ! -f /etc/dropbear/dropbear_rsa_host_key ] ; then
++		/usr/bin/dropbearkey -t rsa -f /etc/dropbear/dropbear_rsa_host_key > /dev/null 2>&1
++		echo -n .
++	fi
++
++	# Check for the Dropbear DSS key
++	if [ ! -f /etc/dropbear/dropbear_dss_host_key ] ; then
++		/usr/bin/dropbearkey -t dss -f /etc/dropbear/dropbear_dss_host_key > /dev/null 2>&1
++		echo -n .
++	fi
++	umask 077
 +	start-stop-daemon -S -q -p /var/run/dropbear.pid --exec /usr/sbin/dropbear
 +	echo "OK"
 +}
