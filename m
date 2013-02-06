From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 06 Feb 2013 01:12:57 +0100
Subject: [Buildroot] [PATCH 1/2] packages: add ability for packages to
 create users
In-Reply-To: <5f1de03287fa8817aa692419c52e0997ec3e2489.1360075956.git.yann.morin.1998@free.fr>
References: <cover.1360075956.git.yann.morin.1998@free.fr>
 <5f1de03287fa8817aa692419c52e0997ec3e2489.1360075956.git.yann.morin.1998@free.fr>
Message-ID: <5111A009.10304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Although I have a shitload of comments below, there's nothing critical so:
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

On 05/02/13 15:54, Yann E. MORIN wrote:
[snip]
> diff --git a/support/scripts/mkusers b/support/scripts/mkusers
> new file mode 100755
> index 0000000..d98714c
> --- /dev/null
> +++ b/support/scripts/mkusers
> @@ -0,0 +1,371 @@
> +#!/bin/bash

  Although we already do depend on bash, I would prefer not to add more 
dependencies. The only bashism I could find is the 'local' declaration, 
which unfortunately is really required where it is used in this script. 
So never mind that.

> +set -e
> +myname="${0##*/}"
> +
> +#----------------------------------------------------------------------------
> +# Configurable items
> +MIN_UID=1000
> +MAX_UID=1999
> +MIN_GID=1000
> +MAX_GID=1999
> +# No more is configurable below this point
> +#----------------------------------------------------------------------------
> +
> +#----------------------------------------------------------------------------
> +error() {
> +    local fmt="${1}"
> +    shift
> +
> +    printf "%s: " "${myname}" >&2
> +    printf "${fmt}" "${@}" >&2
> +}
> +fail() {
> +    error "$@"
> +    exit 1
> +}
> +
> +#----------------------------------------------------------------------------
> +if [ ${#} -ne 2 ]; then
> +    fail "usage: %s USERS_TBLE TARGET_DIR\n"

  USERS_TABLE

> +fi
> +USERS_TABLE="${1}"
> +TARGET_DIR="${2}"
> +shift 2
> +PASSWD="${TARGET_DIR}/etc/passwd"
> +SHADOW="${TARGET_DIR}/etc/shadow"
> +GROUP="${TARGET_DIR}/etc/group"
> +# /etc/gsahdow is not part of the standard skeleton, so not everybody

  gshadow

> +# will have it, but some may hav it, and its content must be in sync
> +# with /etc/group, so any use of gshadow must be conditional.
> +GSHADOW="${TARGET_DIR}/etc/gshadow"
> +PASSWD_METHOD="$( sed -r -e '/^BR2_TARGET_GENERIC_PASSWD_METHOD="(.)*"$/!d' \
> +                         -e 's//\1/;'                                       \
> +                         "${BUILDROOT_CONFIG}"                              \
> +                )"

  I'm personally more in favour of sourcing ${BUILDROOT_CONFIG} and using 
"${BR2_TARGET_GENERIC_PASSWD_METHOD}" directly.

> +
> +#----------------------------------------------------------------------------
> +get_uid() {
> +    local username="${1}"
> +
> +    awk -F: '$1=="'"${username}"'" { printf( "%d\n", $3 ); }' "${PASSWD}"

  I personally find it easier to read an awk script that is written like 
this:

	awk -F: -v username="${1}" \
		'$1 == username { printf( "%d\n", $3 ); }'

(i.e. pass variables as awk variables rather than expanding them in the 
awk script).

  But obviously that's just personal opinion.

> +}
> +
> +#----------------------------------------------------------------------------
> +get_ugid() {
> +    local username="${1}"
> +
> +    awk -F: '$1=="'"${username}"'" { printf( "%d\n", $4 ); }' "${PASSWD}"
> +}
> +
> +#----------------------------------------------------------------------------
> +get_gid() {
> +    local group="${1}"
> +
> +    awk -F: '$1=="'"${group}"'" { printf( "%d\n", $3 ); }' "${GROUP}"
> +}

  I would define a single get_id for passwd and group, where the file is 
passed as a parameter. That allows to factor the generate_uid/gid, below, 
as well.

> +
> +#----------------------------------------------------------------------------
> +get_username() {
> +    local uid="${1}"
> +
> +    awk -F: '$3=="'"${uid}"'" { printf( "%s\n", $1 ); }' "${PASSWD}"
> +}
> +
> +#----------------------------------------------------------------------------
> +get_group() {
> +    local gid="${1}"
> +
> +    awk -F: '$3=="'"${gid}"'" { printf( "%s\n", $1 ); }' "${GROUP}"
> +}
> +
> +#----------------------------------------------------------------------------
> +get_ugroup() {
> +    local username="${1}"
> +    local ugid
> +
> +    ugid="$( get_ugid "${username}" )"
> +    if [ -n "${ugid}" ]; then
> +        get_group "${ugid}"
> +    fi
> +}
> +
> +#----------------------------------------------------------------------------
> +# Sanity-check the new user/group:
> +#   - check the gid is not already used for another group
> +#   - check the group does not already exist with another gid
> +#   - check the user does not already exist with another gid
> +#   - check the uid is not already used for another user
> +#   - check the user does not already exist with another uid
> +#   - check the user does not already exist in another group
> +check_user_validity() {
> +    local username="${1}"
> +    local uid="${2}"
> +    local group="${3}"
> +    local gid="${4}"
> +    local _uid _ugid _gid _username _group _ugroup
> +
> +    _group="$( get_group "${gid}" )"
> +    _gid="$( get_gid "${group}" )"
> +    _ugid="$( get_ugid "${username}" )"
> +    _username="$( get_username "${uid}" )"
> +    _uid="$( get_uid "${username}" )"
> +    _ugroup="$( get_ugroup "${username}" )"
> +
> +    if [ "${username}" = "root" ]; then
> +        fail "invalid username '%s\n'" "${username}"
> +    fi
> +
> +    if [ ${gid} -lt -1 -o ${gid} -eq 0 ]; then

  If ${gid} is not an integer, this will report:
[: foo: integer expression expected
in addition to the error below. Unfortunately there is no way to check 
for integer, but you could redirect stderr to /dev/null.

> +        fail "invalid gid '%d'\n" ${gid}
> +    elif [ ${gid} -ne -1 ]; then
> +        # check the gid is not already used for another group
> +        if [ -n "${_group}" -a "${_group}" != "${group}" ]; then
> +            fail "gid is already used by group '${_group}'\n"
> +        fi
> +
> +        # check the group does not already exists with another gid
> +        if [ -n "${_gid}" -a ${_gid} -ne ${gid} ]; then
> +            fail "group already exists with gid '${_gid}'\n"
> +        fi
> +
> +        # check the user does not already exists with another gid
> +        if [ -n "${_ugid}" -a ${_ugid} -ne ${gid} ]; then
> +            fail "user already exists with gid '${_ugid}'\n"
> +        fi
> +    fi
> +
> +    if [ ${uid} -lt -1 -o ${uid} -eq 0 ]; then
> +        fail "invalid uid '%d'\n" ${uid}
> +    elif [ ${uid} -ne -1 ]; then
> +        # check the uid is not already used for another user
> +        if [ -n "${_username}" -a "${_username}" != "${username}" ]; then
> +            fail "uid is already used by user '${_username}'\n"
> +        fi
> +
> +        # check the user does not already exists with another uid
> +        if [ -n "${_uid}" -a ${_uid} -ne ${uid} ]; then
> +            fail "user already exists with uid '${_uid}'\n"
> +        fi
> +    fi

  If the user already exists, I would check that _all_ fields are exactly 
the same. Otherwise, it depends on the order of evaluation of the .mk 
files what will end up in the passwd/group file.

> +
> +    # check the user does not already exist in another group
> +    if [ -n "${_ugroup}" -a "${_ugroup}" != "${group}" ]; then
> +        fail "user already exists with group '${_ugroup}'\n"
> +    fi
> +
> +    return 0
> +}
> +
> +#----------------------------------------------------------------------------
> +# Generate a unique GID for given group. If the group already exists,
> +# then simply report its current GID. Otherwise, generate the lowest GID
> +# that is:
> +#   - not 0
> +#   - comprised in [MIN_GID..MAX_GID]
> +#   - not already used by a group
> +generate_gid() {

  So you could factor generate_gid/uid into a single generate_id which 
you call like:

generate_id ${group} ${GROUP} ${MIN_GID} ${MAX_GID}

> +    local group="${1}"
> +    local gid
> +
> +    gid="$( get_gid "${group}" )"
> +    if [ -z "${gid}" ]; then
> +        for(( gid=MIN_GID; gid<=MAX_GID; gid++ )); do
> +            if [ -z "$( get_group "${gid}" )" ]; then
> +                break
> +            fi
> +        done
> +        if [ ${gid} -gt ${MAX_GID} ]; then
> +            fail "can not allocate a GID for group '%s'\n" "${group}"
> +        fi
> +    fi
> +    printf "%d\n" "${gid}"
> +}
> +
> +#----------------------------------------------------------------------------
> +# Add a group; if it does already exist, remove it first
> +add_one_group() {
> +    local group="${1}"
> +    local gid="${2}"
> +    local _f
> +
> +    # Generate a new GID if needed
> +    if [ ${gid} -eq -1 ]; then
> +        gid="$( generate_gid "${group}" )"
> +    fi
> +
> +    # Remove any previous instance of this group
> +    for _f in "${GROUP}" "${GSHADOW}"; do

  Since ${GROUP} always exists, I think having a loop here is harder to 
read that just repeating the sed call.

> +        [ -f "${_f}" ] || continue
> +        sed -r -i -e '/^'"${group}"':.*/d;' "${_f}"

  -r is redundant (it's a plain regex).

  Quoting could be simpler:

	sed -i -e "/^${group}:.*/d;" "${GROUP}"

> +    done
> +
> +    printf "%s:x:%d:\n" "${group}" "${gid}" >>"${GROUP}"
> +    if [ -f "${GSHADOW}" ]; then

  Instead of having the condition twice, just put the sed statement for 
GSHADOW here.

> +        printf "%s:*::\n" "${group}" >>"${GSHADOW}"
> +    fi
> +}
> +
> +#----------------------------------------------------------------------------
> +# Generate a unique UID for given username. If the username already exists,
> +# then simply report its current UID. Otherwise, generate the lowest UID
> +# that is:
> +#   - not 0
> +#   - comprised in [MIN_UID..MAX_UID]
> +#   - not already used by a user
> +generate_uid() {
> +    local username="${1}"
> +    local uid
> +
> +    uid="$( get_uid "${username}" )"
> +    if [ -z "${uid}" ]; then
> +        for(( uid=MIN_UID; uid<=MAX_UID; uid++ )); do
> +            if [ -z "$( get_username "${uid}" )" ]; then
> +                break
> +            fi
> +        done
> +        if [ ${uid} -gt ${MAX_UID} ]; then
> +            fail "can not allocate a UID for user '%s'\n" "${username}"
> +        fi
> +    fi
> +    printf "%d\n" "${uid}"
> +}
> +
> +#----------------------------------------------------------------------------
> +# Add given user to given group, if not already the case
> +add_user_to_group() {
> +    local username="${1}"
> +    local group="${2}"
> +    local _f
> +
> +    for _f in "${GROUP}" "${GSHADOW}"; do
> +        [ -f "${_f}" ] || continue
> +        sed -r -i -e 's/^('"${group}"':.*:)(([^:]+,)?)'"${username}"'(,[^:]+*)?$/\1\2\4/;'  \
> +                  -e 's/^('"${group}"':.*)$/\1,'"${username}"'/;'                           \
> +                  -e 's/,+/,/'                                                              \
> +                  -e 's/:,/:/'                                                              \
> +                  "${_f}"
> +    done
> +}
> +
> +#----------------------------------------------------------------------------
> +# Encode a password
> +encode_password() {
> +    local passwd="${1}"
> +
> +    mkpasswd -m "${BR2_TARGET_GENERIC_PASSWD_METHOD}" "${passwd}"

  Err, you defined it as PASSWD_METHOD above...  But if you source 
.config as I suggested, this is OK :-)

> +}
> +
> +#----------------------------------------------------------------------------
> +# Add a user; if it does already exist, remove it first
> +add_one_user() {
> +    local username="${1}"
> +    local uid="${2}"
> +    local group="${3}"
> +    local gid="${4}"
> +    local passwd="${5}"
> +    local home="${6}"
> +    local shell="${7}"
> +    local groups="${8}"
> +    local comment="${9}"
> +    local nb_days="$((($(date +%s)+(24*60*60-1))/(24*60*60)))"

  Hm, I don't like this. If I re-run the same configuration after a year, 
it gives me a different shadow.

  I think the nb_days field in shadow should be left empty. The one in 
the skeleton is arbitrarily set to Dec. 8 1999, it has been like that 
since the first commit in 2001, and it has completely no meaning.

> +    local _f _group _home _shell _gid _passwd
> +
> +    # First, sanity-check the user
> +    check_user_validity "${username}" "${uid}" "${group}" "${gid}"
> +
> +    # Generate a new UID if needed
> +    if [ ${uid} -eq -1 ]; then
> +        uid="$( generate_uid "${username}" )"
> +    fi
> +
> +    # Remove any previous instance of this user
> +    for _f in "${PASSWD}" "${SHADOW}"; do
> +        sed -r -i -e '/^'"${username}"':.*/d;' "${_f}"
> +    done
> +
> +    _gid="$( get_gid "${group}" )"
> +    _shell="${shell}"
> +    if [ "${shell}" = "-" ]; then
> +        _shell="/bin/false"
> +    fi
> +    case "${home}" in
> +        -)  _home="/";;
> +        /)  fail "home can not explicitly be '/'\n";;
> +        /*) _home="${home}";;
> +        *)  fail "home must be an absolute path\n";;
> +    esac
> +    case "${passwd}" in
> +        !=*)
> +            _passwd='!'"$( encode_passwd "${passwd#!=}" )"
> +            ;;
> +        =*)
> +            _passwd="$( encode_passwd "${passwd#=}" )"
> +            ;;
> +        *)
> +            _passwd="${passwd}"
> +            ;;
> +    esac
> +
> +    printf "%s:x:%d:%d:%s:%s:%s\n"              \
> +           "${username}" "${uid}" "${_gid}"     \
> +           "${comment}" "${_home}" "${_shell}"  \
> +           >>"${PASSWD}"
> +    printf "%s:%s:%d:0:99999:7:::\n"                \
> +           "${username}" "${_passwd}" "${nb_days}"  \
> +           >>"${SHADOW}"
> +
> +    # Add the user to its additional groups
> +    if [ "${groups}" != "-" ]; then
> +        for _group in ${groups//,/ }; do

  Oh, here's another bashism. But also one which is much more difficult 
to write in Posix sh.

> +            add_user_to_group "${username}" "${_group}"
> +        done
> +    fi
> +
> +    # If the user has a home, chown it
> +    # (Note: stdout goes to the fakeroot-script)
> +    if [ "${home}" != "-" ]; then
> +        mkdir -p "${TARGET_DIR}/${home}"
> +        printf "chown -R %d:%d '%s'\n" "${uid}" "${_gid}" "${TARGET_DIR}/${home}"
> +    fi
> +}
> +
> +#----------------------------------------------------------------------------
> +main() {
> +    local username uid group gid passwd home shell groups comment
> +
> +    # Some sanity checks
> +    if [ ${MIN_UID} -le 0 ]; then
> +        fail "MIN_UID must be >0 (currently %d)\n" ${MIN_UID}
> +    fi
> +    if [ ${MIN_GID} -le 0 ]; then
> +        fail "MIN_GID must be >0 (currently %d)\n" ${MIN_GID}
> +    fi
> +
> +    # First, create all the main groups
> +    while read username uid group gid passwd home shell groups comment; do
> +        [ -n "${username}" ] || continue    # Package with no user
> +        add_one_group "${group}" "${gid}"

  In the first pass, I would only add groups where gid != -1. Then, if 
there is a line which sets gid and another one which doesn't, it still 
works.  Of course that means you have to repeat the add_one_group for gid 
== -1 in the second pass.

> +    done <"${USERS_TABLE}"
> +
> +    # Then, create all the additional groups
> +    # If any additional group is already a main group, we should use
> +    # the gid of that main group; otherwise, we can use any gid
> +    while read username uid group gid passwd home shell groups comment; do
> +        [ -n "${username}" ] || continue    # Package with no user
> +        if [ "${groups}" != "-" ]; then
> +            for g in ${groups//,/ }; do
> +                add_one_group "${g}" -1
> +            done
> +        fi
> +    done <"${USERS_TABLE}"
> +
> +    # Finally, add users
> +    while read username uid group gid passwd home shell groups comment; do
> +        [ -n "${username}" ] || continue    # Package with no user
> +        add_one_user "${username}" "${uid}" "${group}" "${gid}" "${passwd}" \
> +                     "${home}" "${shell}" "${groups}" "${comment}"

  If you reverse-sort the USERS_TABLE in the makefile before the script 
is called, then you also make it possible for one package setting uid to 
-1 and another giving a specific uid.

  Regards,
  Arnout

> +    done <"${USERS_TABLE}"
> +}
> +
> +#----------------------------------------------------------------------------
> +main "${@}"
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
