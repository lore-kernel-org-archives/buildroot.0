From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Jan 2013 19:31:54 +0100
Subject: [Buildroot] [PATCH 1/2] packages: add ability for packages to
	create users
In-Reply-To: <54c3.50e3ac2d.33c5c@xionine.xdna.net>
References: <cover.1357070939.git.yann.morin.1998@free.fr>
 <0b0fa3ae335483e6402e2c15465cacdb2d51b0d7.1357070939.git.yann.morin.1998@free.fr>
 <54c3.50e3ac2d.33c5c@xionine.xdna.net>
Message-ID: <201301021931.54897.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cam, All,

On Wednesday 02 January 2013 Cam Hutchison wrote:
> "Yann E. MORIN" <yann.morin.1998@free.fr> writes:
> 
> >+* +LIBFOO_USERS+ lists the users to create for this package, if it installs
> >+  a daemon you want to run with a specific user. The syntax is similar in
> 
> "if it installs a program you want to run as a specific user"
> 
> that is, s/daemon/program/ and s/with/as/

Well, I would like to emphasise that this is primarily for running
programs as daemons (ie. started by startup scripts). It does not
really make sense to run program as a specific user when logged in,
especially for embedded systems, where logging in a seldom done.

What about:

... if it installs a daemon program you want to run as ...

> >+- +group+ is the desired name for the user's main group.
> >+- +gid+ is the desired GID for the user's main group. It must be unique,
> >+  and not +0+. If set to +-1+, then a unique GID will be computed by
> >+  buildroot.
> 
> I think this is saying it creates groups as well as users. If so, the
> documentation should say so.

OK.

> Also, how do you specifiy that you do not want a group created - such
> as when you want a new user in an existing system group. I would assume
> something like
> 
> foo -1 daemon -1 ...
> 
> to create user "foo" in the system "daemon" group, but the documentation
> implies a new GID will be allocated.

Ah, yes. If the group already exists (because it is in the skeleton, or
because a previous user added it), then the GID for that group is used,
no new GID is created, of course.

I'll add this to the doc. Good catch!

> >+- +password+ is the crypt(3)-encrypted password. If prefixed with +=+,
> >+  then it is interpreted as clear-text, and will be cypt-encoded. If
> >+  prefixed with +!+, then login is disabled. If set to +*+, then login
> >+  is not allowed.
> 
> What is the status of the support of other encryption algorithms? e.g.
> $6$salt$enc for SHA-512 encrypted passwords? This will depend on settings
> in BuildRoot itself, but it would be worth making a reference here
> since it is relevant to a user providing encrypted user passwords.

First, this is not meant for buildroot users, but for buildroot developpers.
This makes a huge difference, but shall be documented nonetheless, of course.

If the developper enters an already-encoded des/md5/sha256/sha512 pasword
(ie. a password that does not start with '=') then the content is used as-is.

The current password encoding is md5 ($1$salt$...).

Once my other patch to add selection of an alternative encoding, I'll
use that here, too:
    http://lists.busybox.net/pipermail/buildroot/2012-December/064411.html

> >+set -e
> ....
> >+USERS_TABLE="${1}"
> >+TARGET_DIR="${2}"
> >+shift 2
> 
> This will fail under 'set -e' if there are less than two parameters, but fail
> without any useful diagnostics. An error/usage message here would be useful.

OK.

> >+#----------------------------------------------------------------------------
> >+error() {
> >+    local fmt="${1}"
> >+    shift
> >+
> >+    printf "%s: " "${myname}" >&2
> >+    printf "${fmt}" "${@}" >&2
> 
> I think you should put a \n in the format string here. Every call to this
> function (via fail) includes a \n, so it seems redundant require each caller
> to put a \n on the string. In fact, the last call to fail does not have
> a \n in the string which it should, so this will also fix what would
> probably become a common error.

I prefer to keep the \n is every calls. The missing one is an bug.

> >+}
> >+fail() {
> >+    error "$@"
> >+    exit 1
> >+}
> >+
> >+#----------------------------------------------------------------------------
> >+get_uid() {
> >+    local username="${1}"
> >+
> >+    grep -r -E "${username}:" "${PASSWD}" |cut -d: -f3
> 
> Why grep -r?

Indeed.

> Why grep -E? You are not using any features of extended regular expressions.

Because I *always* use 'grep -E', and I /forgot/ what is a standard regexp.
But I can remove, yes.

> An argument could be made that you should be using grep -F.

I don't know (ie. I don't usualy use) this switch, so I am not confident in
using it here. If plain 'grep' does the job, lets just use that.

> You should also anchor ${username}

Yes, indeed.

> >+get_username() {
> >+    local uid="${1}"
> >+
> >+    sed -r -e '/^([^:]+):[^:]+:'"${uid}"':.*/!d; s//\1/;' "${PASSWD}"
> 
> Is awk available in the host toolchain?

Nopt systematically. There's host-gawk that package can depend on.
If we were to use awk instead of sed, then host-gawk would always be
built as soon as a rootfs image (fs/tarball/...) is generated.

So, I prefer to keep using sed for now, unless Peter agrees we can build
always build host-gawk.

> >+check_user_validity() {
> >+    local username="${1}"
> >+    local uid="${2}"
> >+    local group="${3}"
> >+    local gid="${4}"
> >+    local _uid _ugid _gid _username _group _ugroup
> >+
> >+    _group="$( get_group "${gid}" )"
> >+    _gid="$( get_gid "${group}" )"
> >+    _ugid="$( get_ugid "${username}" )"
> >+    _username="$( get_username "${uid}" )"
> >+    _uid="$( get_uid "${username}" )"
> >+    _ugroup="$( get_ugroup "${username}" )"
> >+
> >+    if [ ${gid} -ge 0 ]; then
> 
> Elsewhere in this script you check uid/gid against -1, not >= 0. This
> should be changed to "${gid} -eq -1" to be consistent with that and the
> documentation.

OK. Should also check for invalid (ie. -lt -1).

> >+    case "${home}" in
> >+        -)  _home="/";;
> >+        /)  fail "home can not be explicitly '/'\n";;
> >+        /*) _home="${home}";;
> >+        *)  fail "home must be an absolute path";;
> 
> This is where you missed the \n in the error message.

OK.

> There is also another spelling mistake somewhere :-) I noticed three when
> I first skimmed this patch; two have already been pointed out; and I did
> not see the third when I went through to comment.

Fixed! ;-)

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
