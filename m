From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 7 Feb 2013 00:20:54 +0100
Subject: [Buildroot] [PATCH 1/2] packages: add ability for packages to
	create users
In-Reply-To: <5111A009.10304@mind.be>
References: <cover.1360075956.git.yann.morin.1998@free.fr>
 <5f1de03287fa8817aa692419c52e0997ec3e2489.1360075956.git.yann.morin.1998@free.fr>
 <5111A009.10304@mind.be>
Message-ID: <201302070020.54509.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

[sorry about previous post, I inadvertently press Ctrl-Enter which sends
the mail in kmail]

On Wednesday 06 February 2013 Arnout Vandecappelle wrote:
>   Although I have a shitload of comments below, there's nothing critical so:
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Thanks!

Typos fixed. See my other comments below, too.

> On 05/02/13 15:54, Yann E. MORIN wrote:
> > diff --git a/support/scripts/mkusers b/support/scripts/mkusers
> > new file mode 100755
> > index 0000000..d98714c
> > --- /dev/null
> > +++ b/support/scripts/mkusers
[--SNIP--]
> > +# will have it, but some may hav it, and its content must be in sync
> > +# with /etc/group, so any use of gshadow must be conditional.
> > +GSHADOW="${TARGET_DIR}/etc/gshadow"
> > +PASSWD_METHOD="$( sed -r -e '/^BR2_TARGET_GENERIC_PASSWD_METHOD="(.)*"$/!d' \
> > +                         -e 's//\1/;'                                       \
> > +                         "${BUILDROOT_CONFIG}"                              \
> > +                )"
> 
>   I'm personally more in favour of sourcing ${BUILDROOT_CONFIG} and using 
> "${BR2_TARGET_GENERIC_PASSWD_METHOD}" directly.

I'll how much it simplifies the code.

> > +
> > +#----------------------------------------------------------------------------
> > +get_uid() {
> > +    local username="${1}"
> > +
> > +    awk -F: '$1=="'"${username}"'" { printf( "%d\n", $3 ); }' "${PASSWD}"
> 
>   I personally find it easier to read an awk script that is written like 
> this:
> 
> 	awk -F: -v username="${1}" \
> 		'$1 == username { printf( "%d\n", $3 ); }'
> 
> (i.e. pass variables as awk variables rather than expanding them in the 
> awk script).

OK, seems reasonable.

> > +}
> > +
> > +#----------------------------------------------------------------------------
> > +get_ugid() {
> > +    local username="${1}"
> > +
> > +    awk -F: '$1=="'"${username}"'" { printf( "%d\n", $4 ); }' "${PASSWD}"
> > +}
> > +
> > +#----------------------------------------------------------------------------
> > +get_gid() {
> > +    local group="${1}"
> > +
> > +    awk -F: '$1=="'"${group}"'" { printf( "%d\n", $3 ); }' "${GROUP}"
> > +}
> 
>   I would define a single get_id for passwd and group, where the file is 
> passed as a parameter. That allows to factor the generate_uid/gid, below, 
> as well.

It's not the same field. While factorising is overall good, it simple enough
like that.

> > +    if [ "${username}" = "root" ]; then
> > +        fail "invalid username '%s\n'" "${username}"
> > +    fi
> > +
> > +    if [ ${gid} -lt -1 -o ${gid} -eq 0 ]; then
> 
>   If ${gid} is not an integer, this will report:
> [: foo: integer expression expected
> in addition to the error below. Unfortunately there is no way to check 
> for integer, but you could redirect stderr to /dev/null.

Well, this is not user-selectable, and is in the code. If the code is
not using an integer, this is a bug in our code.

> > +        # check the user does not already exists with another uid
> > +        if [ -n "${_uid}" -a ${_uid} -ne ${uid} ]; then
> > +            fail "user already exists with uid '${_uid}'\n"
> > +        fi
> > +    fi
> 
>   If the user already exists, I would check that _all_ fields are exactly 
> the same. Otherwise, it depends on the order of evaluation of the .mk 
> files what will end up in the passwd/group file.

OK, I'll queue that change for tomorow, when I'm not as sleepy as I'm now.

> > +#----------------------------------------------------------------------------
> > +# Generate a unique GID for given group. If the group already exists,
> > +# then simply report its current GID. Otherwise, generate the lowest GID
> > +# that is:
> > +#   - not 0
> > +#   - comprised in [MIN_GID..MAX_GID]
> > +#   - not already used by a group
> > +generate_gid() {
> 
>   So you could factor generate_gid/uid into a single generate_id which 
> you call like:
> 
> generate_id ${group} ${GROUP} ${MIN_GID} ${MAX_GID}

Hmm. No sure it would be that simple... :-/

> > +#----------------------------------------------------------------------------
> > +# Add a group; if it does already exist, remove it first
> > +add_one_group() {
> > +    local group="${1}"
> > +    local gid="${2}"
> > +    local _f
> > +
> > +    # Generate a new GID if needed
> > +    if [ ${gid} -eq -1 ]; then
> > +        gid="$( generate_gid "${group}" )"
> > +    fi
> > +
> > +    # Remove any previous instance of this group
> > +    for _f in "${GROUP}" "${GSHADOW}"; do
> 
>   Since ${GROUP} always exists, I think having a loop here is harder to 
> read that just repeating the sed call.

OK.

> > +        [ -f "${_f}" ] || continue
> > +        sed -r -i -e '/^'"${group}"':.*/d;' "${_f}"
> 
>   -r is redundant (it's a plain regex).

I never know what is a plain regexp or an extended regexp. So I always
use -i. Will remove.

>   Quoting could be simpler:
> 
> 	sed -i -e "/^${group}:.*/d;" "${GROUP}"

OK.

> > +    done
> > +
> > +    printf "%s:x:%d:\n" "${group}" "${gid}" >>"${GROUP}"
> > +    if [ -f "${GSHADOW}" ]; then
> 
>   Instead of having the condition twice, just put the sed statement for 
> GSHADOW here.

OK. Makes much more sense that way. :-)

> > +#----------------------------------------------------------------------------
> > +# Encode a password
> > +encode_password() {
> > +    local passwd="${1}"
> > +
> > +    mkpasswd -m "${BR2_TARGET_GENERIC_PASSWD_METHOD}" "${passwd}"
> 
>   Err, you defined it as PASSWD_METHOD above...  But if you source 
> .config as I suggested, this is OK :-)

He! How is it even supposed to work at all? :-/
/me is puzzled...
Will fix.

> > +}
> > +
> > +#----------------------------------------------------------------------------
> > +# Add a user; if it does already exist, remove it first
> > +add_one_user() {
> > +    local username="${1}"
> > +    local uid="${2}"
> > +    local group="${3}"
> > +    local gid="${4}"
> > +    local passwd="${5}"
> > +    local home="${6}"
> > +    local shell="${7}"
> > +    local groups="${8}"
> > +    local comment="${9}"
> > +    local nb_days="$((($(date +%s)+(24*60*60-1))/(24*60*60)))"
> 
>   Hm, I don't like this. If I re-run the same configuration after a year, 
> it gives me a different shadow.
> 
>   I think the nb_days field in shadow should be left empty. The one in 
> the skeleton is arbitrarily set to Dec. 8 1999, it has been like that 
> since the first commit in 2001, and it has completely no meaning.

OK, will go for an empty nb_day field ("empty field means that password
aging features are disabled.").

> > +    # Add the user to its additional groups
> > +    if [ "${groups}" != "-" ]; then
> > +        for _group in ${groups//,/ }; do
> 
>   Oh, here's another bashism. But also one which is much more difficult 
> to write in Posix sh.

It'd need womething along the lines of:

  for _group in $( printf "%s" "${groups}" |sed -r -e 's/,/ /g;' ); do

which is much more verbose... I'd like it to be kept a bash script.

> > +    # First, create all the main groups
> > +    while read username uid group gid passwd home shell groups comment; do
> > +        [ -n "${username}" ] || continue    # Package with no user
> > +        add_one_group "${group}" "${gid}"
> 
>   In the first pass, I would only add groups where gid != -1. Then, if 
> there is a line which sets gid and another one which doesn't, it still 
> works.  Of course that means you have to repeat the add_one_group for gid 
> == -1 in the second pass.

OK.

> > +    done <"${USERS_TABLE}"
> > +
> > +    # Then, create all the additional groups
> > +    # If any additional group is already a main group, we should use
> > +    # the gid of that main group; otherwise, we can use any gid
> > +    while read username uid group gid passwd home shell groups comment; do
> > +        [ -n "${username}" ] || continue    # Package with no user
> > +        if [ "${groups}" != "-" ]; then
> > +            for g in ${groups//,/ }; do
> > +                add_one_group "${g}" -1
> > +            done
> > +        fi
> > +    done <"${USERS_TABLE}"
> > +
> > +    # Finally, add users
> > +    while read username uid group gid passwd home shell groups comment; do
> > +        [ -n "${username}" ] || continue    # Package with no user
> > +        add_one_user "${username}" "${uid}" "${group}" "${gid}" "${passwd}" \
> > +                     "${home}" "${shell}" "${groups}" "${comment}"
> 
>   If you reverse-sort the USERS_TABLE in the makefile before the script 
> is called, then you also make it possible for one package setting uid to 
> -1 and another giving a specific uid.

OK, I'll check this.

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
