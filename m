From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 27 Sep 2017 22:45:35 +0200
Subject: [Buildroot] [git commit] utils/config: new script to manipulate
	.config files on the command line
Message-ID: <20170927204224.7B8278108D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2c5c7a263d9d61faba80544e0f6ac6da03716ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Default prefix is set to `BR2_` but may be overidden by setting
BR2_PREFIX.

Example usage:

Enable `BR2_PACKAGE_GNUPG`:
./utils/config --package --enable GNUPG

Check state of config option `BR2_PACKAGE_GNUPG`:
./utils/config --package --state GNUPG
y

Enable `BR2_PACKAGE_GNUPG`:
./utils/config --package --disable GNUPG

Set `BR2_TARGET_GENERIC_ISSUE` to "Welcome":
./utils/config --set-str  TARGET_GENERIC_ISSUE "Welcome"

Copied from the Linux kernel (4.13-rc6) source code and adapted to
Buildroot.
Thanks to Andi Kleen who is the original author of this script.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
[Arnout: merge the two tr invications]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/config | 206 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 206 insertions(+)

diff --git a/utils/config b/utils/config
new file mode 100755
index 0000000..c5e2d72
--- /dev/null
+++ b/utils/config
@@ -0,0 +1,206 @@
+#!/bin/bash
+# Manipulate options in a .config file from the command line
+
+myname=${0##*/}
+
+# If no prefix forced, use the default BR2_
+BR2_PREFIX="${BR2_PREFIX-BR2_}"
+
+usage() {
+	cat >&2 <<EOL
+Manipulate options in a .config file from the command line.
+Usage:
+$myname options command ...
+commands:
+	--enable|-e option   Enable option
+	--disable|-d option  Disable option
+	--set-str option string
+	                     Set option to "string"
+	--set-val option value
+	                     Set option to value
+	--undefine|-u option Undefine option
+	--state|-s option    Print state of option (n,y,m,undef)
+
+	--enable-after|-E beforeopt option
+                             Enable option directly after other option
+	--disable-after|-D beforeopt option
+                             Disable option directly after other option
+
+	commands can be repeated multiple times
+
+options:
+	--file config-file   .config file to change (default .config)
+	--keep-case|-k       Keep next symbols' case (dont' upper-case it)
+	--package|-p         Operate on package (set prefix to BR2_PACKAGE_)
+
+$myname doesn't check the validity of the .config file. This is done@next
+make time.
+
+By default, $myname will upper-case the given symbol. Use --keep-case to keep
+the case of all following symbols unchanged.
+
+$myname uses 'BR2_' as the default symbol prefix. Set the environment
+variable BR2_PREFIX to the prefix to use. Eg.: BR2_PREFIX="FOO_" $myname ...
+EOL
+	exit 1
+}
+
+checkarg() {
+	ARG="$1"
+	if [ "$ARG" = "" ] ; then
+		usage
+	fi
+	if [ "$MUNGE_CASE" = "yes" ] ; then
+		ARG="`echo $ARG | tr a-z- A-Z_`"
+	fi
+	case "$ARG" in
+	${BR2_PREFIX}*)
+		ARG="${ARG/${BR2_PREFIX}/}"
+		;;
+	esac
+}
+
+txt_append() {
+	local anchor="$1"
+	local insert="$2"
+	local infile="$3"
+	local tmpfile="$infile.swp"
+
+	# sed append cmd: 'a\' + newline + text + newline
+	cmd="$(printf "a\\%b$insert" "\n")"
+
+	sed -i -e "/$anchor/$cmd" "$infile"
+}
+
+txt_subst() {
+	local before="$1"
+	local after="$2"
+	local infile="$3"
+	local tmpfile="$infile.swp"
+
+	sed -i -e "s:$before:$after:" "$infile"
+}
+
+txt_delete() {
+	local text="$1"
+	local infile="$2"
+	local tmpfile="$infile.swp"
+
+	sed -i -e "/$text/d" "$infile"
+}
+
+set_var() {
+	local name=$1 new=$2 before=$3
+
+	name_re="^($name=|# $name is not set)"
+	before_re="^($before=|# $before is not set)"
+	if test -n "$before" && grep -Eq "$before_re" "$FN"; then
+		txt_append "^$before=" "$new" "$FN"
+		txt_append "^# $before is not set" "$new" "$FN"
+	elif grep -Eq "$name_re" "$FN"; then
+		txt_subst "^$name=.*" "$new" "$FN"
+		txt_subst "^# $name is not set" "$new" "$FN"
+	else
+		echo "$new" >>"$FN"
+	fi
+}
+
+undef_var() {
+	local name=$1
+
+	txt_delete "^$name=" "$FN"
+	txt_delete "^# $name is not set" "$FN"
+}
+
+if [ "$1" = "--file" ]; then
+	FN="$2"
+	if [ "$FN" = "" ] ; then
+		usage
+	fi
+	shift 2
+else
+	FN=.config
+fi
+
+if [ "$1" = "" ] ; then
+	usage
+fi
+
+MUNGE_CASE=yes
+while [ "$1" != "" ] ; do
+	CMD="$1"
+	shift
+	case "$CMD" in
+	--keep-case|-k)
+		MUNGE_CASE=no
+		continue
+		;;
+	--package|-p)
+		BR2_PREFIX="BR2_PACKAGE_"
+		continue
+		;;
+	--*-after|-E|-D|-M)
+		checkarg "$1"
+		A=$ARG
+		checkarg "$2"
+		B=$ARG
+		shift 2
+		;;
+	-*)
+		checkarg "$1"
+		shift
+		;;
+	esac
+	case "$CMD" in
+	--enable|-e)
+		set_var "${BR2_PREFIX}$ARG" "${BR2_PREFIX}$ARG=y"
+		;;
+
+	--disable|-d)
+		set_var "${BR2_PREFIX}$ARG" "# ${BR2_PREFIX}$ARG is not set"
+		;;
+
+	--set-str)
+		# sed swallows one level of escaping, so we need double-escaping
+		set_var "${BR2_PREFIX}$ARG" "${BR2_PREFIX}$ARG=\"${1//\"/\\\\\"}\""
+		shift
+		;;
+
+	--set-val)
+		set_var "${BR2_PREFIX}$ARG" "${BR2_PREFIX}$ARG=$1"
+		shift
+		;;
+	--undefine|-u)
+		undef_var "${BR2_PREFIX}$ARG"
+		;;
+
+	--state|-s)
+		if grep -q "# ${BR2_PREFIX}$ARG is not set" $FN ; then
+			echo n
+		else
+			V="$(grep "^${BR2_PREFIX}$ARG=" $FN)"
+			if [ $? != 0 ] ; then
+				echo undef
+			else
+				V="${V/#${BR2_PREFIX}$ARG=/}"
+				V="${V/#\"/}"
+				V="${V/%\"/}"
+				V="${V//\\\"/\"}"
+				echo "${V}"
+			fi
+		fi
+		;;
+
+	--enable-after|-E)
+		set_var "${BR2_PREFIX}$B" "${BR2_PREFIX}$B=y" "${BR2_PREFIX}$A"
+		;;
+
+	--disable-after|-D)
+		set_var "${BR2_PREFIX}$B" "# ${BR2_PREFIX}$B is not set" "${BR2_PREFIX}$A"
+		;;
+
+	*)
+		usage
+		;;
+	esac
+done
