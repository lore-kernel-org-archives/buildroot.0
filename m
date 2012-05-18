From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 18 May 2012 23:38:50 +0200
Subject: [Buildroot] [git commit branch/next] Add package 'opkg'
Message-ID: <20120518214433.2929A96D3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=20d4b4148f3bd2697093ab8adef4f642c358581d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in       |    1 +
 package/opkg/Config.in  |   13 +++++
 package/opkg/opkg-build |  127 +++++++++++++++++++++++++++++++++++++++++++++++
 package/opkg/opkg.mk    |   20 +++++++
 4 files changed, 161 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 5d6250c..75d5c46 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -599,6 +599,7 @@ endmenu
 
 menu "Package managers"
 source "package/ipkg/Config.in"
+source "package/opkg/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/rpm/Config.in"
 endif
diff --git a/package/opkg/Config.in b/package/opkg/Config.in
new file mode 100644
index 0000000..eb997a7
--- /dev/null
+++ b/package/opkg/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_OPKG
+	bool "opkg"
+	help
+	  Opkg is a lightweight package management system, based on ipkg. It is
+	  written in C and resembles apt/dpkg in operation. It is intended for
+	  use on embedded Linux devices.
+	  Opkg is maintained, stable, robust and conservative in its memory
+	  usage, despite its buggy ipkg ancestry. As best it can, opkg
+	  maintains backwards compatibility with ipkg and conforms to a subset
+	  of debian's policy manual regarding control files.
+
+	  http://code.google.com/p/opkg/
+
diff --git a/package/opkg/opkg-build b/package/opkg/opkg-build
new file mode 100755
index 0000000..7fd0d3f
--- /dev/null
+++ b/package/opkg/opkg-build
@@ -0,0 +1,127 @@
+#!/bin/sh
+
+# opkg-build -- construct a .opk from a directory
+# Carl Worth <cworth@east.isi.edu>
+# based on a script by Steve Redler IV, steve at sr-tech.com 5-21-2001
+set -e
+
+opkg_extract_value() {
+	sed -e "s/^[^:]*:[[:space:]]*//"
+}
+
+required_field() {
+	field=$1
+
+	value=`grep "^$field:" < $CONTROL/control | opkg_extract_value`
+	if [ -z "$value" ]; then
+		echo "opkg-build: Error: $CONTROL/control is missing field $field" ;
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
+		echo "opkg-build: Error: Control file $pkg_dir/$CONTROL/control not found."
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
+		echo "opkg-build: Error: Package name $name contains illegal characters, (other than [a-z0-9.+-])"
+		PKG_ERROR=1;
+	fi
+
+	local bad_fields=`sed -ne 's/^\([^[:space:]][^:[:space:]]\+[[:space:]]\+\)[^:].*/\1/p' < $CONTROL/control | sed -e 's/\\n//'`
+	if [ -n "$bad_fields" ]; then
+		bad_fields=`echo $bad_fields`
+		echo "opkg-build: Error: The following fields in $CONTROL/control are missing a ':'"
+		echo "	$bad_fields"
+		echo "opkg-build: This may be due to a missing initial space for a multi-line field value"
+		PKG_ERROR=1
+	fi
+
+	for script in $CONTROL/preinst $CONTROL/postinst $CONTROL/prerm $CONTROL/postrm; do
+		if [ -f $script -a ! -x $script ]; then
+			echo "opkg-build: Error: package script $script is not executable"
+			PKG_ERROR=1
+		fi
+	done
+
+	if [ -f $CONTROL/conffiles ]; then
+		for cf in `cat $CONTROL/conffiles`; do
+			if [ ! -f ./$cf ]; then
+				echo "opkg-build: Error: $CONTROL/conffiles mentions conffile $cf which does not exist"
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
+# opkg-build "main"
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
+	echo "Usage: opkg-build <pkg_directory> [<destination_directory>]" ;
+	exit 1 
+	;;
+esac
+
+pkg_dir=$1
+
+if [ ! -d $pkg_dir ]; then
+	echo "opkg-build: Error: Directory $pkg_dir does not exist"
+	exit 1
+fi
+
+# CONTROL is second so that it takes precedence
+CONTROL=
+[ -d $pkg_dir/DEBIAN ] && CONTROL=DEBIAN
+[ -d $pkg_dir/CONTROL ] && CONTROL=CONTROL
+if [ -z "$CONTROL" ]; then
+	echo "opkg-build: Error: Directory $pkg_dir has no CONTROL subdirectory."
+	exit 1
+fi
+
+if ! pkg_appears_sane $pkg_dir; then
+	echo "Please fix the above errors and try again."
+	exit 1
+fi
+
+tmp_dir=$dest_dir/OPKG_BUILD.$$
+mkdir $tmp_dir
+
+tar -C $pkg_dir -czf $tmp_dir/data.tar.gz . --exclude=$CONTROL
+tar -C $pkg_dir/$CONTROL -czf $tmp_dir/control.tar.gz .
+
+echo "2.0" > $tmp_dir/debian-binary
+
+pkg_file=$dest_dir/${pkg}_${version}_${arch}.opk
+tar -C $tmp_dir -czf $pkg_file debian-binary data.tar.gz control.tar.gz
+rm $tmp_dir/debian-binary $tmp_dir/data.tar.gz $tmp_dir/control.tar.gz
+rmdir $tmp_dir
+
+echo "Packaged contents of $pkg_dir into $pkg_file"
diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
new file mode 100644
index 0000000..9cfaa26
--- /dev/null
+++ b/package/opkg/opkg.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# opkg
+#
+#############################################################
+
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
+
+$(eval $(call AUTOTARGETS))
