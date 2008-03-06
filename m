From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:13:24 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  ipkg
Message-ID: <20080306181324.8D5351201F9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:13:24 -0800 (Thu, 06 Mar 2008)
New Revision: 21200

Log:
added ipkg

Added:
   trunk/buildroot/package/ipkg/
   trunk/buildroot/package/ipkg/Config.in
   trunk/buildroot/package/ipkg/ipkg-build
   trunk/buildroot/package/ipkg/ipkg.mk


Changeset:
Added: trunk/buildroot/package/ipkg/Config.in
===================================================================
--- trunk/buildroot/package/ipkg/Config.in	                        (rev 0)
+++ trunk/buildroot/package/ipkg/Config.in	2008-03-06 18:13:24 UTC (rev 21200)
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_IPKG
+	bool "ipkg"
+	default n
+	help
+	  The Itsy Package Installer from handhelds.org
+
+	  http://www.handhelds.org
+

Added: trunk/buildroot/package/ipkg/ipkg-build
===================================================================
--- trunk/buildroot/package/ipkg/ipkg-build	                        (rev 0)
+++ trunk/buildroot/package/ipkg/ipkg-build	2008-03-06 18:13:24 UTC (rev 21200)
@@ -0,0 +1,127 @@
+#!/bin/sh
+
+# ipkg-build -- construct a .ipk from a directory
+# Carl Worth <cworth@east.isi.edu>
+# based on a script by Steve Redler IV, steve at sr-tech.com 5-21-2001
+set -e
+
+ipkg_extract_value() {
+	sed -e "s/^[^:]*:[[:space:]]*//"
+}
+
+required_field() {
+	field=$1
+
+	value=`grep "^$field:" < $CONTROL/control | ipkg_extract_value`
+	if [ -z "$value" ]; then
+		echo "ipkg-build: Error: $CONTROL/control is missing field $field" ;
+		PKG_ERROR=1
+	fi
+	echo $value
+}
+
+pkg_appears_sane() {
+	local pkg_dir=$1
+
+	local owd=`pwd`
+	cd $pkg_dir
+
+	PKG_ERROR=0
+	if [ ! -f "$CONTROL/control" ]; then
+		echo "ipkg-build: Error: Control file $pkg_dir/$CONTROL/control not found."
+		cd $owd
+		return 1
+	fi
+
+	pkg=`required_field Package`
+	version=`required_field Version`
+	arch=`required_field Architecture`
+	required_field Maintainer >/dev/null
+	required_field Description >/dev/null
+
+	if echo $pkg | grep '[^a-z0-9.+-]'; then
+		echo "ipkg-build: Error: Package name $name contains illegal characters, (other than [a-z0-9.+-])"
+		PKG_ERROR=1;
+	fi
+
+	local bad_fields=`sed -ne 's/^\([^[:space:]][^:[:space:]]\+[[:space:]]\+\)[^:].*/\1/p' < $CONTROL/control | sed -e 's/\\n//'`
+	if [ -n "$bad_fields" ]; then
+		bad_fields=`echo $bad_fields`
+		echo "ipkg-build: Error: The following fields in $CONTROL/control are missing a ':'"
+		echo "	$bad_fields"
+		echo "ipkg-build: This may be due to a missing initial space for a multi-line field value"
+		PKG_ERROR=1
+	fi
+
+	for script in $CONTROL/preinst $CONTROL/postinst $CONTROL/prerm $CONTROL/postrm; do
+		if [ -f $script -a ! -x $script ]; then
+			echo "ipkg-build: Error: package script $script is not executable"
+			PKG_ERROR=1
+		fi
+	done
+
+	if [ -f $CONTROL/conffiles ]; then
+		for cf in `cat $CONTROL/conffiles`; do
+			if [ ! -f ./$cf ]; then
+				echo "ipkg-build: Error: $CONTROL/conffiles mentions conffile $cf which does not exist"
+				PKG_ERROR=1
+			fi
+		done
+	fi
+
+	cd $owd
+	return $PKG_ERROR
+}
+
+###
+# ipkg-build "main"
+###
+
+case $# in
+1)
+	dest_dir=.
+	;;
+2)
+	dest_dir=$2
+	;;
+*)
+	echo "Usage: ipkg-build <pkg_directory> [<destination_directory>]" ;
+	exit 1 
+	;;
+esac
+
+pkg_dir=$1
+
+if [ ! -d $pkg_dir ]; then
+	echo "ipkg-build: Error: Directory $pkg_dir does not exist"
+	exit 1
+fi
+
+# CONTROL is second so that it takes precedence
+CONTROL=
+[ -d $pkg_dir/DEBIAN ] && CONTROL=DEBIAN
+[ -d $pkg_dir/CONTROL ] && CONTROL=CONTROL
+if [ -z "$CONTROL" ]; then
+	echo "ipkg-build: Error: Directory $pkg_dir has no CONTROL subdirectory."
+	exit 1
+fi
+
+if ! pkg_appears_sane $pkg_dir; then
+	echo "Please fix the above errors and try again."
+	exit 1
+fi
+
+tmp_dir=$dest_dir/IPKG_BUILD.$$
+mkdir $tmp_dir
+
+tar -C $pkg_dir -czf $tmp_dir/data.tar.gz . --exclude=$CONTROL
+tar -C $pkg_dir/$CONTROL -czf $tmp_dir/control.tar.gz .
+
+echo "2.0" > $tmp_dir/debian-binary
+
+pkg_file=$dest_dir/${pkg}_${version}_${arch}.ipk
+tar -C $tmp_dir -czf $pkg_file debian-binary data.tar.gz control.tar.gz
+rm $tmp_dir/debian-binary $tmp_dir/data.tar.gz $tmp_dir/control.tar.gz
+rmdir $tmp_dir
+
+echo "Packaged contents of $pkg_dir into $pkg_file"


Property changes on: trunk/buildroot/package/ipkg/ipkg-build
___________________________________________________________________
Name: svn:executable
   + *

Added: trunk/buildroot/package/ipkg/ipkg.mk
===================================================================
--- trunk/buildroot/package/ipkg/ipkg.mk	                        (rev 0)
+++ trunk/buildroot/package/ipkg/ipkg.mk	2008-03-06 18:13:24 UTC (rev 21200)
@@ -0,0 +1,19 @@
+#############################################################
+#
+# ipkg
+#
+#############################################################
+
+IPKG_VERSION = 0.99.163
+IPKG_SOURCE = ipkg-$(IPKG_VERSION).tar.gz
+IPKG_SITE = ftp://ftp.handhelds.org/packages/ipkg
+IPKG_AUTORECONF = NO
+IPKG_INSTALL_STAGING = YES
+IPKG_INSTALL_TARGET = YES
+
+IPKG_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) --prefix=/usr --sysconfdir=/etc 
+
+IPKG_DEPENDENCIES = uclibc 
+
+$(eval $(call AUTOTARGETS,package,ipkg))
\ No newline at end of file
