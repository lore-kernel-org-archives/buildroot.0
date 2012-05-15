From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 15 May 2012 20:34:23 +0200
Subject: [Buildroot] [PATCH] Add package 'opkg'
Message-ID: <327c9a85485315c6da4f.1337106863@beantl019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Notes:
- opkg-build is more or less a copy of ipkg-build. Not sure if you'd
prefer to keep some parts common...
- if you prefer a patch not using copies from ipkg, let me know.

diff --git a/package/Config.in b/package/Config.in
--- a/package/Config.in
+++ b/package/Config.in
@@ -591,6 +591,7 @@ endmenu
 
 menu "Package managers"
 source "package/ipkg/Config.in"
+source "package/opkg/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/rpm/Config.in"
 endif
diff --git a/package/ipkg/Config.in b/package/opkg/Config.in
copy from package/ipkg/Config.in
copy to package/opkg/Config.in
--- a/package/ipkg/Config.in
+++ b/package/opkg/Config.in
@@ -1,7 +1,13 @@
-config BR2_PACKAGE_IPKG
-	bool "ipkg"
+config BR2_PACKAGE_OPKG
+	bool "opkg"
 	help
-	  The Itsy Package Installer from handhelds.org
+	  Opkg is a lightweight package management system, based on ipkg. It is
+	  written in C and resembles apt/dpkg in operation. It is intended for
+	  use on embedded Linux devices.
+	  Opkg is maintained, stable, robust and conservative in its memory
+	  usage, despite its buggy ipkg ancestry. As best it can, opkg
+	  maintains backwards compatibility with ipkg and conforms to a subset
+	  of debian's policy manual regarding control files.
 
-	  http://www.handhelds.org
+	  http://code.google.com/p/opkg/
 
diff --git a/package/ipkg/ipkg-build b/package/opkg/opkg-build
copy from package/ipkg/ipkg-build
copy to package/opkg/opkg-build
--- a/package/ipkg/ipkg-build
+++ b/package/opkg/opkg-build
@@ -1,20 +1,20 @@
 #!/bin/sh
 
-# ipkg-build -- construct a .ipk from a directory
+# opkg-build -- construct a .opk from a directory
 # Carl Worth <cworth@east.isi.edu>
 # based on a script by Steve Redler IV, steve at sr-tech.com 5-21-2001
 set -e
 
-ipkg_extract_value() {
+opkg_extract_value() {
 	sed -e "s/^[^:]*:[[:space:]]*//"
 }
 
 required_field() {
 	field=$1
 
-	value=`grep "^$field:" < $CONTROL/control | ipkg_extract_value`
+	value=`grep "^$field:" < $CONTROL/control | opkg_extract_value`
 	if [ -z "$value" ]; then
-		echo "ipkg-build: Error: $CONTROL/control is missing field $field" ;
+		echo "opkg-build: Error: $CONTROL/control is missing field $field" ;
 		PKG_ERROR=1
 	fi
 	echo $value
@@ -28,7 +28,7 @@ pkg_appears_sane() {
 
 	PKG_ERROR=0
 	if [ ! -f "$CONTROL/control" ]; then
-		echo "ipkg-build: Error: Control file $pkg_dir/$CONTROL/control not found."
+		echo "opkg-build: Error: Control file $pkg_dir/$CONTROL/control not found."
 		cd $owd
 		return 1
 	fi
@@ -40,22 +40,22 @@ pkg_appears_sane() {
 	required_field Description >/dev/null
 
 	if echo $pkg | grep '[^a-z0-9.+-]'; then
-		echo "ipkg-build: Error: Package name $name contains illegal characters, (other than [a-z0-9.+-])"
+		echo "opkg-build: Error: Package name $name contains illegal characters, (other than [a-z0-9.+-])"
 		PKG_ERROR=1;
 	fi
 
 	local bad_fields=`sed -ne 's/^\([^[:space:]][^:[:space:]]\+[[:space:]]\+\)[^:].*/\1/p' < $CONTROL/control | sed -e 's/\\n//'`
 	if [ -n "$bad_fields" ]; then
 		bad_fields=`echo $bad_fields`
-		echo "ipkg-build: Error: The following fields in $CONTROL/control are missing a ':'"
+		echo "opkg-build: Error: The following fields in $CONTROL/control are missing a ':'"
 		echo "	$bad_fields"
-		echo "ipkg-build: This may be due to a missing initial space for a multi-line field value"
+		echo "opkg-build: This may be due to a missing initial space for a multi-line field value"
 		PKG_ERROR=1
 	fi
 
 	for script in $CONTROL/preinst $CONTROL/postinst $CONTROL/prerm $CONTROL/postrm; do
 		if [ -f $script -a ! -x $script ]; then
-			echo "ipkg-build: Error: package script $script is not executable"
+			echo "opkg-build: Error: package script $script is not executable"
 			PKG_ERROR=1
 		fi
 	done
@@ -63,7 +63,7 @@ pkg_appears_sane() {
 	if [ -f $CONTROL/conffiles ]; then
 		for cf in `cat $CONTROL/conffiles`; do
 			if [ ! -f ./$cf ]; then
-				echo "ipkg-build: Error: $CONTROL/conffiles mentions conffile $cf which does not exist"
+				echo "opkg-build: Error: $CONTROL/conffiles mentions conffile $cf which does not exist"
 				PKG_ERROR=1
 			fi
 		done
@@ -74,7 +74,7 @@ pkg_appears_sane() {
 }
 
 ###
-# ipkg-build "main"
+# opkg-build "main"
 ###
 
 case $# in
@@ -85,7 +85,7 @@ 2)
 	dest_dir=$2
 	;;
 *)
-	echo "Usage: ipkg-build <pkg_directory> [<destination_directory>]" ;
+	echo "Usage: opkg-build <pkg_directory> [<destination_directory>]" ;
 	exit 1 
 	;;
 esac
@@ -93,7 +93,7 @@ esac
 pkg_dir=$1
 
 if [ ! -d $pkg_dir ]; then
-	echo "ipkg-build: Error: Directory $pkg_dir does not exist"
+	echo "opkg-build: Error: Directory $pkg_dir does not exist"
 	exit 1
 fi
 
@@ -102,7 +102,7 @@ CONTROL=
 [ -d $pkg_dir/DEBIAN ] && CONTROL=DEBIAN
 [ -d $pkg_dir/CONTROL ] && CONTROL=CONTROL
 if [ -z "$CONTROL" ]; then
-	echo "ipkg-build: Error: Directory $pkg_dir has no CONTROL subdirectory."
+	echo "opkg-build: Error: Directory $pkg_dir has no CONTROL subdirectory."
 	exit 1
 fi
 
@@ -111,7 +111,7 @@ if ! pkg_appears_sane $pkg_dir; then
 	exit 1
 fi
 
-tmp_dir=$dest_dir/IPKG_BUILD.$$
+tmp_dir=$dest_dir/OPKG_BUILD.$$
 mkdir $tmp_dir
 
 tar -C $pkg_dir -czf $tmp_dir/data.tar.gz . --exclude=$CONTROL
@@ -119,7 +119,7 @@ tar -C $pkg_dir/$CONTROL -czf $tmp_dir/c
 
 echo "2.0" > $tmp_dir/debian-binary
 
-pkg_file=$dest_dir/${pkg}_${version}_${arch}.ipk
+pkg_file=$dest_dir/${pkg}_${version}_${arch}.opk
 tar -C $tmp_dir -czf $pkg_file debian-binary data.tar.gz control.tar.gz
 rm $tmp_dir/debian-binary $tmp_dir/data.tar.gz $tmp_dir/control.tar.gz
 rmdir $tmp_dir
diff --git a/package/ipkg/ipkg.mk b/package/opkg/opkg.mk
copy from package/ipkg/ipkg.mk
copy to package/opkg/opkg.mk
--- a/package/ipkg/ipkg.mk
+++ b/package/opkg/opkg.mk
@@ -1,12 +1,20 @@
 #############################################################
 #
-# ipkg
+# opkg
 #
 #############################################################
 
-IPKG_VERSION = 0.99.163
-IPKG_SOURCE = ipkg-$(IPKG_VERSION).tar.gz
-IPKG_SITE = http://www.handhelds.org/download/packages/ipkg
-IPKG_INSTALL_STAGING = YES
+OPKG_VERSION = 0.1.8
+OPKG_SOURCE = opkg-$(OPKG_VERSION).tar.gz
+OPKG_SITE = http://opkg.googlecode.com/files
+OPKG_INSTALL_STAGING = YES
+OPKG_CONF_OPT = --disable-curl --disable-gpg
+
+# Ensure directory for lockfile exists
+define OPKG_CREATE_LOCKDIR
+	mkdir -p $(TARGET_DIR)/usr/lib/opkg
+endef
+
+OPKG_POST_INSTALL_TARGET_HOOKS += OPKG_CREATE_LOCKDIR
 
 $(eval $(call AUTOTARGETS))
