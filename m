From: Cam Hutchison <camh@xdna.net>
Date: Wed, 02 Jan 2013 03:40:29 -0000
Subject: [Buildroot] [PATCH 1/2] packages: add ability for packages to
	create users
References: <cover.1357070939.git.yann.morin.1998@free.fr>
 <cover.1357070939.git.yann.morin.1998@free.fr>
 <0b0fa3ae335483e6402e2c15465cacdb2d51b0d7.1357070939.git.yann.morin.1998@free.fr>
Message-ID: <54c3.50e3ac2d.33c5c@xionine.xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> writes:

>+* +LIBFOO_USERS+ lists the users to create for this package, if it installs
>+  a daemon you want to run with a specific user. The syntax is similar in

"if it installs a program you want to run as a specific user"

that is, s/daemon/program/ and s/with/as/

>+- +group+ is the desired name for the user's main group.
>+- +gid+ is the desired GID for the user's main group. It must be unique,
>+  and not +0+. If set to +-1+, then a unique GID will be computed by
>+  buildroot.

I think this is saying it creates groups as well as users. If so, the
documentation should say so.

Also, how do you specifiy that you do not want a group created - such
as when you want a new user in an existing system group. I would assume
something like

foo -1 daemon -1 ...

to create user "foo" in the system "daemon" group, but the documentation
implies a new GID will be allocated.

>+- +password+ is the crypt(3)-encrypted password. If prefixed with +=+,
>+  then it is interpreted as clear-text, and will be cypt-encoded. If
>+  prefixed with +!+, then login is disabled. If set to +*+, then login
>+  is not allowed.

What is the status of the support of other encryption algorithms? e.g.
$6$salt$enc for SHA-512 encrypted passwords? This will depend on settings
in BuildRoot itself, but it would be worth making a reference here
since it is relevant to a user providing encrypted user passwords.

>+set -e
....
>+USERS_TABLE="${1}"
>+TARGET_DIR="${2}"
>+shift 2

This will fail under 'set -e' if there are less than two parameters, but fail
without any useful diagnostics. An error/usage message here would be useful.

>+#----------------------------------------------------------------------------
>+error() {
>+    local fmt="${1}"
>+    shift
>+
>+    printf "%s: " "${myname}" >&2
>+    printf "${fmt}" "${@}" >&2

I think you should put a \n in the format string here. Every call to this
function (via fail) includes a \n, so it seems redundant require each caller
to put a \n on the string. In fact, the last call to fail does not have
a \n in the string which it should, so this will also fix what would
probably become a common error.

>+}
>+fail() {
>+    error "$@"
>+    exit 1
>+}
>+
>+#----------------------------------------------------------------------------
>+get_uid() {
>+    local username="${1}"
>+
>+    grep -r -E "${username}:" "${PASSWD}" |cut -d: -f3

Why grep -r? A recursive grep with a filename (non-directory) as an argument
does not do anything different without -r. Ditto for get_ugid and get_gid.

Why grep -E? You are not using any features of extended regular expressions.
An argument could be made that you should be using grep -F.

You should also anchor ${username} to the start of the line or you may get
false matches:

  grep "^${username}:" "${PASSWD}"

ditto get_ugid and get_gid.

>+}
>+
>+#----------------------------------------------------------------------------
>+get_ugid() {
>+    local username="${1}"
>+
>+    grep -r -E "${username}:" "${PASSWD}" |cut -d: -f4
>+}
>+
>+#----------------------------------------------------------------------------
>+get_gid() {
>+    local group="${1}"
>+
>+    grep -r -E "${group}:" "${GROUP}" |cut -d: -f3
>+}
>+
>+#----------------------------------------------------------------------------
>+get_username() {
>+    local uid="${1}"
>+
>+    sed -r -e '/^([^:]+):[^:]+:'"${uid}"':.*/!d; s//\1/;' "${PASSWD}"

Is awk available in the host toolchain? If so, this would be much clearer
with awk:

  awk -F: '$3 == '"${uid}"' { print $1 }' "${PASSWD}"

ditto get_group

>+}
>+
>+#----------------------------------------------------------------------------
>+get_group() {
>+    local gid="${1}"
>+
>+    sed -r -e '/^([^:]+):[^:]+:'"${gid}"':/!d; s//\1/;' "${GROUP}"
>+}
>+
>+#----------------------------------------------------------------------------
>+get_ugroup() {
>+    local username="${1}"
>+    local ugid
>+
>+    ugid="$( get_ugid "${username}" )"
>+    if [ -n "${ugid}" ]; then
>+        get_group "${ugid}"
>+    fi
>+}
>+
>+#----------------------------------------------------------------------------
>+# Sanity-check the new user/group:
>+#   - check the gid is not already used for another group
>+#   - check the group does not already exist with another gid
>+#   - check the user does not already exist with another gid
>+#   - check the uid is not already used for another user
>+#   - check the user does not already exist with another uid
>+#   - check the user does not already exist in another group
>+check_user_validity() {
>+    local username="${1}"
>+    local uid="${2}"
>+    local group="${3}"
>+    local gid="${4}"
>+    local _uid _ugid _gid _username _group _ugroup
>+
>+    _group="$( get_group "${gid}" )"
>+    _gid="$( get_gid "${group}" )"
>+    _ugid="$( get_ugid "${username}" )"
>+    _username="$( get_username "${uid}" )"
>+    _uid="$( get_uid "${username}" )"
>+    _ugroup="$( get_ugroup "${username}" )"
>+
>+    if [ ${gid} -ge 0 ]; then

Elsewhere in this script you check uid/gid against -1, not >= 0. This
should be changed to "${gid} -eq -1" to be consistent with that and the
documentation.

>+    case "${home}" in
>+        -)  _home="/";;
>+        /)  fail "home can not be explicitly '/'\n";;
>+        /*) _home="${home}";;
>+        *)  fail "home must be an absolute path";;

This is where you missed the \n in the error message.

There is also another spelling mistake somewhere :-) I noticed three when
I first skimmed this patch; two have already been pointed out; and I did
not see the third when I went through to comment.
