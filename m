From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Mon, 18 Jun 2018 22:28:35 -0400
Subject: [Buildroot] [RFC 1/1] support: add qt5bump script
Message-ID: <20180619022835.32530-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This script automatically bumps either the latest version of Qt or Qt
5.6 (if --5.6 option is given).

It updates URL and checksum of every module's hash file and downloads
the sources to validate the changes (unless --no-download is specified
through the command line).

The current patches are moved to the bumped version directory.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 support/scripts/qt5bump | 186 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 186 insertions(+)
 create mode 100755 support/scripts/qt5bump

diff --git a/support/scripts/qt5bump b/support/scripts/qt5bump
new file mode 100755
index 0000000000..911b1e016a
--- /dev/null
+++ b/support/scripts/qt5bump
@@ -0,0 +1,186 @@
+#!/bin/bash
+
+set -e
+
+# Print traditional usage message
+usage() {
+	cat <<EOF
+Usage: ${0##*/} [--5.6] [--no-download] [QT5_VERSION] -- [ADDITIONAL_MAKE_ARGS]
+
+Bumps Qt5 packages to QT5_VERSION when specified, or to the current supported
+version with the minor number increased by 1.
+
+Hashes from hash files are updated using the Qt official release Website.
+
+Patches of the current supported version are moved to the new version directory.
+
+If the --5.6 option is specified, it bumps the Qt 5.6 release instead of the
+latest supported release.
+
+If the --no-download option is specified, it does not download the bumped
+sources for validation.
+
+Examples:
+
+	${0##*/}                   # bumps latest version of Qt (with minor + 1)
+	${0##*/} 5.11.1            # bumps latest version of Qt to 5.11.1
+	${0##*/} --5.6             # bumps Qt 5.6 (with minor + 1)
+	${0##*/} --no-download     # bumps latest version of Qt without
+                                   # downloading sources for validation
+	O=output-qt5.11.1 ${0##*/} # bumps latest version of Qt with the
+                                   # configuration in output-qt5.11.1 directory
+EOF
+}
+
+# Extract version from current package
+get_current_version() {
+	cat package/qt5/qt5.mk - <<EOF | make -f-
+
+.SILENT: all
+all:
+	echo CURRENT_QT5_VERSION="\$(QT5_VERSION)"
+	echo CURRENT_QT5_VERSION_MAJOR="\$(QT5_VERSION_MAJOR)"
+	echo CURRENT_QT5_VERSION_MINOR="\$(subst \$(QT5_VERSION_MAJOR).,,\$(QT5_VERSION))"
+EOF
+}
+
+# Extract URL from the given hash file
+# $1: the hash file
+hashfile_get_url() {
+	sed -e "\\,# Hash from: https\\?://download.qt.io/official_releases/qt/$QT5_VERSION_MAJOR/.*,{s,# Hash from: ,,;s,\\.mirrorlist,.sha256,p}" \
+	    -n "$1"
+}
+
+# Update the given checksum to the given hash file
+# $1: the hash file
+# $2: the hash value
+hashfile_update_checksum() {
+	sed -e "\\,# Hash from: https\\?://download.qt.io/official_releases/qt/$QT5_VERSION_MAJOR/.*,{n;s,^.*$,sha256 $2,}" \
+	    -i "$1"
+}
+
+# Update hashfile
+# $1: the hash file
+update_hashfile() {
+	local url checksum
+	url="$(hashfile_get_url "$1")"
+	if [ -z "$url" ]
+	then
+		echo "Error: $module: Cannot get URL from $1" >&2
+		return 1
+	fi
+
+	if checksum="$(wget -qO- "$url")"
+	then
+		hashfile_update_checksum "$1" "$checksum"
+	else
+		echo "Error: $module: Cannot wget $url!" >&2
+		return 1
+	fi
+
+	echo "$module: sha256 $checksum" >&2
+}
+
+download="make"
+while [ $# -gt 0 ]
+do
+	if [ "$1" == "-h" ] || [ "$1" == "--help" ]
+	then
+		usage
+		exit 0
+	elif [ "$1" == "--no-download" ]
+	then
+		download="echo"
+	elif [ "$1" == "--5.6" ]
+	then
+		BR2_PACKAGE_QT5_VERSION_5_6=y
+		export BR2_PACKAGE_QT5_VERSION_5_6
+	elif [ -z "$QT5_VERSION" ]
+	then
+		QT5_VERSION="$1"
+		QT5_VERSION_MAJOR="${1%.*}"
+		QT5_VERSION_MINOR="${1##*.}"
+		shift
+		break
+	elif [ "$1" == "--" ]
+	then
+		break
+	else
+		usage >&2
+		echo "Too many arguments!" >&2
+		exit 1
+	fi	
+	shift
+done
+
+if [ -z "$BR2_PACKAGE_QT5_VERSION_5_6" ]
+then
+	BR2_PACKAGE_QT5_VERSION_LATEST=y
+	export BR2_PACKAGE_QT5_VERSION_LATEST
+fi
+
+eval "$(get_current_version)"
+if [ -z "$QT5_VERSION" ]
+then
+	QT5_VERSION_MINOR="$((CURRENT_QT5_VERSION_MINOR+1))"
+	QT5_VERSION_MAJOR="$CURRENT_QT5_VERSION_MAJOR"
+	QT5_VERSION="$QT5_VERSION_MAJOR.$QT5_VERSION_MINOR"
+fi
+echo "qt5: from $CURRENT_QT5_VERSION to $QT5_VERSION" >&2
+
+# First, update references to Qt version in .hash files
+find package/qt5/ -name "*.hash" -exec \
+sed -e "s,$CURRENT_QT5_VERSION,$QT5_VERSION,g" \
+    -e "s,$CURRENT_QT5_VERSION_MAJOR,$QT5_VERSION_MAJOR,g" \
+    -i {} \;
+
+# Then, update and source every Qt modules
+for pkg in package/qt5/qt5*
+do
+	[ -d "$pkg" ] || continue
+
+	module=${pkg##*/}
+
+	# Filter out modules that are not available
+	if [ "$BR2_PACKAGE_QT5_VERSION_5_6" = y ]
+	then
+		case "$module" in
+		qt5scxml|qt5virtualkeyboard)
+			echo "Info: $module: skipped" >&2
+			continue
+			;;
+		esac
+	else
+		case "$module" in
+		qt5enginio)
+			echo "Info: $module: skipped" >&2
+			continue
+			;;
+		esac
+	fi
+
+	# Move module's current patches
+	if [ -d "$pkg/$CURRENT_QT5_VERSION" ]
+	then
+		mkdir -p "$pkg/$QT5_VERSION/"
+		mv "$pkg/$CURRENT_QT5_VERSION/"* "$pkg/$QT5_VERSION/"
+		rm -Rf "$pkg/$CURRENT_QT5_VERSION/"
+	fi
+
+	# Update module's .hash file
+	if ! update_hashfile "$pkg/$module.hash"
+	then
+		continue
+	fi
+
+	# Echo module's target to download
+	echo "$module-source"
+done | \
+xargs "$download" "${O:+O=$O}" "QT5_VERSION=$QT5_VERSION" "$@"
+
+# Finally, update the appropriate Qt version
+sed -e "/^QT5_VERSION_MAJOR = $CURRENT_QT5_VERSION_MAJOR/,/^QT5_VERSION = \$(QT5_VERSION_MAJOR).$CURRENT_QT5_VERSION_MINOR/{\
+/^QT5_VERSION_MAJOR =/s,$CURRENT_QT5_VERSION_MAJOR,$QT5_VERSION_MAJOR,g;\
+/^QT5_VERSION =/s,\\.$CURRENT_QT5_VERSION_MINOR,.$QT5_VERSION_MINOR,g\
+}" \
+    -i package/qt5/qt5.mk
-- 
2.17.1
