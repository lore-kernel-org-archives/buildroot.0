From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Sep 2017 22:26:36 +0200
Subject: [Buildroot] [PATCH] kconfig: add script to manipulate .config
 files on the command line
In-Reply-To: <20170926195502.2441-1-marcus.folkesson@gmail.com>
References: <20170926195502.2441-1-marcus.folkesson@gmail.com>
Message-ID: <6aaabba7-c6fe-d870-22a4-880718911d8d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 This looks very interesting! Just a few remarks...

On 26-09-17 21:55, Marcus Folkesson wrote:
> Default prefix is set to `BR2_` but may be overidden by setting
> BR2_PREFIX.
> 
> Example usage:
> 
> ./support/scripts/config --package --enable GNUPG
> Enable `BR2_PACKAGE_GNUPG`

 It's clearer if you swap the lines:

Enable `BR2_PACKAGE_GNUPG`:
./support/scripts/config --package --enable GNUPG


> 
> ./support/scripts/config --package --state GNUPG
> y
> Check state of config option `BR2_PACKAGE_GNUPG`
> 
> ./support/scripts/config --package --disable GNUPG
> Enable `BR2_PACKAGE_GNUPG`
> 
> ./support/scripts/config --set-str  TARGET_GENERIC_ISSUE "Welcome"
> Set `BR2_TARGET_GENERIC_ISSUE` to "Welcome"
> 
> Copied from the Linux kernel (4.13-rc6) source code and adapted to
> Buildroot.
> Thanks to Andi Kleen who is the original author of this script.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  utils/config | 230 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 230 insertions(+)
>  create mode 100755 utils/config
> 
> diff --git a/utils/config b/utils/config
> new file mode 100755
> index 0000000000..4b5f2e4109
> --- /dev/null
> +++ b/utils/config
> @@ -0,0 +1,230 @@
> +#!/bin/bash
> +# Manipulate options in a .config file from the command line
> +
> +myname=${0##*/}
> +
> +# If no prefix forced, use the default BR2_PACKAGE_

 BR2_, not BR2_PACKAGE (a few more times below).

> +BR2_PREFIX="${BR2_PREFIX-BR2_}"
> +
> +usage() {
> +	cat >&2 <<EOL
> +Manipulate options in a .config file from the command line.
> +Usage:
> +$myname options command ...
> +commands:
> +	--enable|-e option   Enable option
> +	--disable|-d option  Disable option
> +	--module|-m option   Turn option into a module
> +	--set-str option string
> +	                     Set option to "string"
> +	--set-val option value
> +	                     Set option to value
> +	--undefine|-u option Undefine option
> +	--state|-s option    Print state of option (n,y,m,undef)
> +	--package|-p         Operate on package (set prefix to BR2_PACKAGE_)

 It would make more sense to move this to the options section of the help.

> +
> +	--enable-after|-E beforeopt option
> +                             Enable option directly after other option
> +	--disable-after|-D beforeopt option
> +                             Disable option directly after other option
> +	--module-after|-M beforeopt option
> +                             Turn option into module directly after other option
> +
> +	commands can be repeated multiple times
> +
> +options:
> +	--file config-file   .config file to change (default .config)
> +	--keep-case|-k       Keep next symbols' case (dont' upper-case it)
> +
> +$myname doesn't check the validity of the .config file. This is done at next
> +make time.
> +
> +By default, $myname will upper-case the given symbol. Use --keep-case to keep
> +the case of all following symbols unchanged.
> +
> +$myname uses 'BR2_PACKAGE_' as the default symbol prefix. Set the environment
> +variable BR2_PREFIX to the prefix to use. Eg.: BR2_PREFIX="FOO_" $myname ...
> +EOL
> +	exit 1
> +}
> +
> +checkarg() {
> +	ARG="$1"
> +	if [ "$ARG" = "" ] ; then
> +		usage
> +	fi
> +	case "$ARG" in
> +	${BR2_PREFIX}*)
> +		ARG="${ARG/${BR2_PREFIX}/}"
> +		;;
> +	esac

 It would make more sense to me to first munge case and then strip the prefix,
so that a prefix of br2_foo is also stripped.

> +	if [ "$MUNGE_CASE" = "yes" ] ; then
> +		ARG="`echo $ARG | tr a-z A-Z`"

 Better also convert - to _ like our UPPERCASE macro.

> +	fi


> +}
> +
> +txt_append() {
> +	local anchor="$1"
> +	local insert="$2"
> +	local infile="$3"
> +	local tmpfile="$infile.swp"
> +
> +	# sed append cmd: 'a\' + newline + text + newline
> +	cmd="$(printf "a\\%b$insert" "\n")"
> +
> +	sed -e "/$anchor/$cmd" "$infile" >"$tmpfile"

 Why not sed -i? sed does a better job of creating an appropriate tmpfile. Same
below, obviously.

> +	# replace original file with the edited one
> +	mv "$tmpfile" "$infile"
> +}
> +
> +txt_subst() {
> +	local before="$1"
> +	local after="$2"
> +	local infile="$3"
> +	local tmpfile="$infile.swp"
> +
> +	sed -e "s:$before:$after:" "$infile" >"$tmpfile"
> +	# replace original file with the edited one
> +	mv "$tmpfile" "$infile"
> +}
> +
> +txt_delete() {
> +	local text="$1"
> +	local infile="$2"
> +	local tmpfile="$infile.swp"
> +
> +	sed -e "/$text/d" "$infile" >"$tmpfile"
> +	# replace original file with the edited one
> +	mv "$tmpfile" "$infile"
> +}
> +
> +set_var() {
> +	local name=$1 new=$2 before=$3
> +
> +	name_re="^($name=|# $name is not set)"
> +	before_re="^($before=|# $before is not set)"
> +	if test -n "$before" && grep -Eq "$before_re" "$FN"; then
> +		txt_append "^$before=" "$new" "$FN"
> +		txt_append "^# $before is not set" "$new" "$FN"
> +	elif grep -Eq "$name_re" "$FN"; then
> +		txt_subst "^$name=.*" "$new" "$FN"
> +		txt_subst "^# $name is not set" "$new" "$FN"
> +	else
> +		echo "$new" >>"$FN"
> +	fi
> +}
> +
> +undef_var() {
> +	local name=$1
> +
> +	txt_delete "^$name=" "$FN"
> +	txt_delete "^# $name is not set" "$FN"
> +}
> +
> +if [ "$1" = "--file" ]; then
> +	FN="$2"
> +	if [ "$FN" = "" ] ; then
> +		usage
> +	fi
> +	shift 2
> +else
> +	FN=.config
> +fi
> +
> +if [ "$1" = "" ] ; then
> +	usage
> +fi
> +
> +MUNGE_CASE=yes
> +while [ "$1" != "" ] ; do
> +	CMD="$1"
> +	shift
> +	case "$CMD" in
> +	--keep-case|-k)
> +		MUNGE_CASE=no
> +		continue
> +		;;
> +	--package|-p)
> +		BR2_PREFIX="BR2_PACKAGE_"
> +		continue
> +		;;
> +	--refresh)

 I'd remove this (see below).

> +		;;
> +	--*-after|-E|-D|-M)
> +		checkarg "$1"
> +		A=$ARG
> +		checkarg "$2"
> +		B=$ARG
> +		shift 2
> +		;;
> +	-*)
> +		checkarg "$1"
> +		shift
> +		;;
> +	esac
> +	case "$CMD" in
> +	--enable|-e)
> +		set_var "${BR2_PREFIX}$ARG" "${BR2_PREFIX}$ARG=y"
> +		;;
> +
> +	--disable|-d)
> +		set_var "${BR2_PREFIX}$ARG" "# ${BR2_PREFIX}$ARG is not set"
> +		;;
> +
> +	--module|-m)
> +		set_var "${BR2_PREFIX}$ARG" "${BR2_PREFIX}$ARG=m"
> +		;;
> +
> +	--set-str)
> +		# sed swallows one level of escaping, so we need double-escaping
> +		set_var "${BR2_PREFIX}$ARG" "${BR2_PREFIX}$ARG=\"${1//\"/\\\\\"}\""
> +		shift
> +		;;
> +
> +	--set-val)
> +		set_var "${BR2_PREFIX}$ARG" "${BR2_PREFIX}$ARG=$1"
> +		shift
> +		;;
> +	--undefine|-u)
> +		undef_var "${BR2_PREFIX}$ARG"
> +		;;
> +
> +	--state|-s)
> +		if grep -q "# ${BR2_PREFIX}$ARG is not set" $FN ; then
> +			echo n
> +		else
> +			V="$(grep "^${BR2_PREFIX}$ARG=" $FN)"
> +			if [ $? != 0 ] ; then
> +				echo undef
> +			else
> +				V="${V/#${BR2_PREFIX}$ARG=/}"
> +				V="${V/#\"/}"
> +				V="${V/%\"/}"
> +				V="${V//\\\"/\"}"
> +				echo "${V}"
> +			fi
> +		fi
> +		;;
> +
> +	--enable-after|-E)
> +		set_var "${BR2_PREFIX}$B" "${BR2_PREFIX}$B=y" "${BR2_PREFIX}$A"
> +		;;
> +
> +	--disable-after|-D)
> +		set_var "${BR2_PREFIX}$B" "# ${BR2_PREFIX}$B is not set" "${BR2_PREFIX}$A"
> +		;;
> +
> +	--module-after|-M)
> +		set_var "${BR2_PREFIX}$B" "${BR2_PREFIX}$B=m" "${BR2_PREFIX}$A"
> +		;;
> +
> +	# undocumented because it ignores --file (fixme)
> +	--refresh)
> +		yes "" | make oldconfig

 I would remove this. It's not needed, it's wrong (make olddefconfig is better),
and it doesn't work with --file.

 Regards,
 Arnout

> +		;;
> +
> +	*)
> +		usage
> +		;;
> +	esac
> +done
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
