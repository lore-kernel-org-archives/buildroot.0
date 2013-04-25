From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 25 Apr 2013 22:56:42 +0200
Subject: [Buildroot] [git commit] packages: add ability for packages to
	create users
Message-ID: <20130425214004.8B24F9B83B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f3af04db77f9e9e707bd37ee85f6508aef797f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Packages that install daemons may need those daemons to run as a non-root,
or an otherwise non-system (eg. 'daemon'), user.

Add infrastructure for packages to create users, by declaring the FOO_USERS
variable that contain a makedev-syntax-like description of the user(s) to
add.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Cam Hutchison <camh@xdna.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-generic.txt |   16 +-
 docs/manual/appendix.txt                |    1 +
 docs/manual/makeusers-syntax.txt        |   87 +++++++
 fs/common.mk                            |    3 +
 package/pkg-generic.mk                  |    1 +
 support/scripts/mkusers                 |  409 +++++++++++++++++++++++++++++++
 6 files changed, 515 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index a615ae2..aa94b88 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -53,7 +53,11 @@ system is based on hand-written Makefiles or shell scripts.
 36:	/bin/foo  f  4755  0  0	 -  -  -  -  -
 37: endef
 38:
-39: $(eval $(generic-package))
+39: define LIBFOO_USERS
+40:	foo -1 libfoo -1 * - - - LibFoo daemon
+41: endef
+42:
+43: $(eval $(generic-package))
 --------------------------------
 
 The Makefile begins on line 7 to 11 with metadata information: the
@@ -140,7 +144,10 @@ On line 31..33, we define a device-node file used by this package
 On line 35..37, we define the permissions to set to specific files
 installed by this package (+LIBFOO_PERMISSIONS+).
 
-Finally, on line 39, we call the +generic-package+ function, which
+On lines 39..41, we define a user that is used by this package (eg.
+to run a daemon as non-root) (+LIBFOO_USERS+).
+
+Finally, on line 43, we call the +generic-package+ function, which
 generates, according to the variables defined previously, all the
 Makefile code necessary to make your package working.
 
@@ -307,6 +314,11 @@ information is (assuming the package name is +libfoo+) :
   You can find some documentation for this syntax in the xref:makedev-syntax[].
   This variable is optional.
 
+* +LIBFOO_USERS+ lists the users to create for this package, if it installs
+  a program you want to run as a specific user (eg. as a daemon, or as a
+  cron-job). The syntax is similar in spirit to the makedevs one, and is
+  described in the xref:makeuser-syntax[]. This variable is optional.
+
 * +LIBFOO_LICENSE+ defines the license (or licenses) under which the package
   is released.
   This name will appear in the manifest file produced by +make legal-info+.
diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
index ef34169..c48c3b1 100644
--- a/docs/manual/appendix.txt
+++ b/docs/manual/appendix.txt
@@ -5,6 +5,7 @@ Appendix
 ========
 
 include::makedev-syntax.txt[]
+include::makeusers-syntax.txt[]
 
 [[package-list]]
 Available packages
diff --git a/docs/manual/makeusers-syntax.txt b/docs/manual/makeusers-syntax.txt
new file mode 100644
index 0000000..2199654
--- /dev/null
+++ b/docs/manual/makeusers-syntax.txt
@@ -0,0 +1,87 @@
+// -*- mode:doc -*- ;
+
+[[makeuser-syntax]]
+Makeuser syntax documentation
+-----------------------------
+
+The syntax to create users is inspired by the makedev syntax, above, but
+is specific to Buildroot.
+
+The syntax for adding a user is a space-separated list of fields, one
+user per line; the fields are:
+
+|=================================================================
+|username |uid |group |gid |password |home |shell |groups |comment
+|=================================================================
+
+Where:
+
+- +username+ is the desired user name (aka login name) for the user.
+  It can not be +root+, and must be unique.
+- +uid+ is the desired UID for the user. It must be unique, and not
+  +0+. If set to +-1+, then a unique UID will be computed by Buildroot
+  in the range [1000...1999]
+- +group+ is the desired name for the user's main group. It can not
+  be +root+. If the group does not exist, it will be created.
+- +gid+ is the desired GID for the user's main group. It must be unique,
+  and not +0+. If set to +-1+, and the group does not already exist, then
+  a unique GID will be computed by Buildroot in the range [1000..1999]
+- +password+ is the crypt(3)-encoded password. If prefixed with +!+,
+  then login is disabled. If prefixed with +=+, then it is interpreted
+  as clear-text, and will be crypt-encoded (using MD5). If prefixed with
+  +!=+, then the password will be crypt-encoded (using MD5) and login
+  will be disabled. If set to +*+, then login is not allowed.
+- +home+ is the desired home directory for the user. If set to '-', no
+  home directory will be created, and the user's home will be +/+.
+  Explicitly setting +home+ to +/+ is not allowed.
+- +shell+ is the desired shell for the user. If set to +-+, then
+  +/bin/false+ is set as the user's shell.
+- +groups+ is the comma-separated list of additional groups the user
+  should be part of. If set to +-+, then the user will be a member of
+  no additional group. Missing groups will be created with an arbitrary
+  +gid+.
+- +comment+ (aka https://en.wikipedia.org/wiki/Gecos_field[GECOS]
+  field) is an almost-free-form text.
+
+There are a few restrictions on the content of each field:
+
+* except for +comment+, all fields are mandatory.
+* except for +comment+, fields may not contain spaces.
+* no field may contain a colon (+:+).
+
+If +home+ is not +-+, then the home directory, and all files below,
+will belong to the user and its main group.
+
+Examples:
+
+----
+foo -1 bar -1 !=blabla /home/foo /bin/sh alpha,bravo Foo user
+----
+
+This will create this user:
+
+- +username+ (aka login name) is: +foo+
+- +uid+ is computed by Buildroot
+- main +group+ is: +bar+
+- main group +gid+ is computed by Buildroot
+- clear-text +password+ is: +blabla+, will be crypt(3)-encoded, and login is disabled.
+- +home+ is: +/home/foo+
+- +shell+ is: +/bin/sh+
+- +foo+ is also a member of +groups+: +alpha+ and +bravo+
+- +comment+ is: +Foo user+
+
+----
+test 8000 wheel -1 = - /bin/sh - Test user
+----
+
+This will create this user:
+
+- +username+ (aka login name) is: +test+
+- +uid+ is : +8000+
+- main +group+ is: +wheel+
+- main group +gid+ is computed by Buildroot, and will use the value defined in the rootfs skeleton
+- +password+ is empty (aka no password).
+- +home+ is +/+ but will not belong to +test+
+- +shell+ is: +/bin/sh+
+- +test+ is not a member of any additional +groups+
+- +comment+ is: +Test user+
diff --git a/fs/common.mk b/fs/common.mk
index c6f67d8..36da2dd 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -35,6 +35,7 @@ FAKEROOT_SCRIPT = $(BUILD_DIR)/_fakeroot.fs
 FULL_DEVICE_TABLE = $(BUILD_DIR)/_device_table.txt
 ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
        $(BR2_ROOTFS_STATIC_DEVICE_TABLE))
+USERS_TABLE = $(BUILD_DIR)/_users_table.txt
 
 define ROOTFS_TARGET_INTERNAL
 
@@ -55,6 +56,8 @@ endif
 	printf '$$(subst $$(sep),\n,$$(PACKAGES_PERMISSIONS_TABLE))' >> $$(FULL_DEVICE_TABLE)
 	echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
 endif
+	printf '$(subst $(sep),\n,$(PACKAGES_USERS))' > $(USERS_TABLE)
+	$(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) $(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
 	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
 	chmod a+x $$(FAKEROOT_SCRIPT)
 	$$(HOST_DIR)/usr/bin/fakeroot -- $$(FAKEROOT_SCRIPT)
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index e6bc955..b55b5f0 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -529,6 +529,7 @@ ifeq ($$($$($(2)_KCONFIG_VAR)),y)
 TARGETS += $(1)
 PACKAGES_PERMISSIONS_TABLE += $$($(2)_PERMISSIONS)$$(sep)
 PACKAGES_DEVICES_TABLE += $$($(2)_DEVICES)$$(sep)
+PACKAGES_USERS += $$($(2)_USERS)$$(sep)
 
 ifeq ($$($(2)_SITE_METHOD),svn)
 DL_TOOLS_DEPENDENCIES += svn
diff --git a/support/scripts/mkusers b/support/scripts/mkusers
new file mode 100755
index 0000000..19aa085
--- /dev/null
+++ b/support/scripts/mkusers
@@ -0,0 +1,409 @@
+#!/bin/bash
+set -e
+myname="${0##*/}"
+
+#----------------------------------------------------------------------------
+# Configurable items
+MIN_UID=1000
+MAX_UID=1999
+MIN_GID=1000
+MAX_GID=1999
+# No more is configurable below this point
+#----------------------------------------------------------------------------
+
+#----------------------------------------------------------------------------
+error() {
+    local fmt="${1}"
+    shift
+
+    printf "%s: " "${myname}" >&2
+    printf "${fmt}" "${@}" >&2
+}
+fail() {
+    error "$@"
+    exit 1
+}
+
+#----------------------------------------------------------------------------
+if [ ${#} -ne 2 ]; then
+    fail "usage: %s USERS_TABLE TARGET_DIR\n"
+fi
+USERS_TABLE="${1}"
+TARGET_DIR="${2}"
+shift 2
+PASSWD="${TARGET_DIR}/etc/passwd"
+SHADOW="${TARGET_DIR}/etc/shadow"
+GROUP="${TARGET_DIR}/etc/group"
+# /etc/gshadow is not part of the standard skeleton, so not everybody
+# will have it, but some may hav it, and its content must be in sync
+# with /etc/group, so any use of gshadow must be conditional.
+GSHADOW="${TARGET_DIR}/etc/gshadow"
+
+# We can't simply source ${BUILDROOT_CONFIG} as it may contains constructs
+# such as:
+#    BR2_DEFCONFIG="$(CONFIG_DIR)/defconfig"
+# which when sourced from a shell script will eventually try to execute
+# a command name 'CONFIG_DIR', which is plain wrong for virtually every
+# systems out there.
+# So, we have to scan that file instead. Sigh... :-(
+PASSWD_METHOD="$( sed -r -e '/^BR2_TARGET_GENERIC_PASSWD_METHOD="(.*)"$/!d;'    \
+                         -e 's//\1/;'                                           \
+                         "${BUILDROOT_CONFIG}"                                  \
+                )"
+
+#----------------------------------------------------------------------------
+get_uid() {
+    local username="${1}"
+
+    awk -F: -v username="${username}"                           \
+        '$1 == username { printf( "%d\n", $3 ); }' "${PASSWD}"
+}
+
+#----------------------------------------------------------------------------
+get_ugid() {
+    local username="${1}"
+
+    awk -F:i -v username="${username}"                          \
+        '$1 == username { printf( "%d\n", $4 ); }' "${PASSWD}"
+}
+
+#----------------------------------------------------------------------------
+get_gid() {
+    local group="${1}"
+
+    awk -F: -v group="${group}"                             \
+        '$1 == group { printf( "%d\n", $3 ); }' "${GROUP}"
+}
+
+#----------------------------------------------------------------------------
+get_username() {
+    local uid="${1}"
+
+    awk -F: -v uid="${uid}"                                 \
+        '$3 == uid { printf( "%s\n", $1 ); }' "${PASSWD}"
+}
+
+#----------------------------------------------------------------------------
+get_group() {
+    local gid="${1}"
+
+    awk -F: -v gid="${gid}"                             \
+        '$3 == gid { printf( "%s\n", $1 ); }' "${GROUP}"
+}
+
+#----------------------------------------------------------------------------
+get_ugroup() {
+    local username="${1}"
+    local ugid
+
+    ugid="$( get_ugid "${username}" )"
+    if [ -n "${ugid}" ]; then
+        get_group "${ugid}"
+    fi
+}
+
+#----------------------------------------------------------------------------
+# Sanity-check the new user/group:
+#   - check the gid is not already used for another group
+#   - check the group does not already exist with another gid
+#   - check the user does not already exist with another gid
+#   - check the uid is not already used for another user
+#   - check the user does not already exist with another uid
+#   - check the user does not already exist in another group
+check_user_validity() {
+    local username="${1}"
+    local uid="${2}"
+    local group="${3}"
+    local gid="${4}"
+    local _uid _ugid _gid _username _group _ugroup
+
+    _group="$( get_group "${gid}" )"
+    _gid="$( get_gid "${group}" )"
+    _ugid="$( get_ugid "${username}" )"
+    _username="$( get_username "${uid}" )"
+    _uid="$( get_uid "${username}" )"
+    _ugroup="$( get_ugroup "${username}" )"
+
+    if [ "${username}" = "root" ]; then
+        fail "invalid username '%s\n'" "${username}"
+    fi
+
+    if [ ${gid} -lt -1 -o ${gid} -eq 0 ]; then
+        fail "invalid gid '%d'\n" ${gid}
+    elif [ ${gid} -ne -1 ]; then
+        # check the gid is not already used for another group
+        if [ -n "${_group}" -a "${_group}" != "${group}" ]; then
+            fail "gid is already used by group '${_group}'\n"
+        fi
+
+        # check the group does not already exists with another gid
+        if [ -n "${_gid}" -a ${_gid} -ne ${gid} ]; then
+            fail "group already exists with gid '${_gid}'\n"
+        fi
+
+        # check the user does not already exists with another gid
+        if [ -n "${_ugid}" -a ${_ugid} -ne ${gid} ]; then
+            fail "user already exists with gid '${_ugid}'\n"
+        fi
+    fi
+
+    if [ ${uid} -lt -1 -o ${uid} -eq 0 ]; then
+        fail "invalid uid '%d'\n" ${uid}
+    elif [ ${uid} -ne -1 ]; then
+        # check the uid is not already used for another user
+        if [ -n "${_username}" -a "${_username}" != "${username}" ]; then
+            fail "uid is already used by user '${_username}'\n"
+        fi
+
+        # check the user does not already exists with another uid
+        if [ -n "${_uid}" -a ${_uid} -ne ${uid} ]; then
+            fail "user already exists with uid '${_uid}'\n"
+        fi
+    fi
+
+    # check the user does not already exist in another group
+    if [ -n "${_ugroup}" -a "${_ugroup}" != "${group}" ]; then
+        fail "user already exists with group '${_ugroup}'\n"
+    fi
+
+    return 0
+}
+
+#----------------------------------------------------------------------------
+# Generate a unique GID for given group. If the group already exists,
+# then simply report its current GID. Otherwise, generate the lowest GID
+# that is:
+#   - not 0
+#   - comprised in [MIN_GID..MAX_GID]
+#   - not already used by a group
+generate_gid() {
+    local group="${1}"
+    local gid
+
+    gid="$( get_gid "${group}" )"
+    if [ -z "${gid}" ]; then
+        for(( gid=MIN_GID; gid<=MAX_GID; gid++ )); do
+            if [ -z "$( get_group "${gid}" )" ]; then
+                break
+            fi
+        done
+        if [ ${gid} -gt ${MAX_GID} ]; then
+            fail "can not allocate a GID for group '%s'\n" "${group}"
+        fi
+    fi
+    printf "%d\n" "${gid}"
+}
+
+#----------------------------------------------------------------------------
+# Add a group; if it does already exist, remove it first
+add_one_group() {
+    local group="${1}"
+    local gid="${2}"
+    local _f
+
+    # Generate a new GID if needed
+    if [ ${gid} -eq -1 ]; then
+        gid="$( generate_gid "${group}" )"
+    fi
+
+    # Remove any previous instance of this group, and re-add the new one
+    sed -i -e '/^'"${group}"':.*/d;' "${GROUP}"
+    printf "%s:x:%d:\n" "${group}" "${gid}" >>"${GROUP}"
+
+    # Ditto for /etc/gshadow if it exists
+    if [ -f "${GSHADOW}" ]; then
+        sed -i -e '/^'"${group}"':.*/d;' "${GSHADOW}"
+        printf "%s:*::\n" "${group}" >>"${GSHADOW}"
+    fi
+}
+
+#----------------------------------------------------------------------------
+# Generate a unique UID for given username. If the username already exists,
+# then simply report its current UID. Otherwise, generate the lowest UID
+# that is:
+#   - not 0
+#   - comprised in [MIN_UID..MAX_UID]
+#   - not already used by a user
+generate_uid() {
+    local username="${1}"
+    local uid
+
+    uid="$( get_uid "${username}" )"
+    if [ -z "${uid}" ]; then
+        for(( uid=MIN_UID; uid<=MAX_UID; uid++ )); do
+            if [ -z "$( get_username "${uid}" )" ]; then
+                break
+            fi
+        done
+        if [ ${uid} -gt ${MAX_UID} ]; then
+            fail "can not allocate a UID for user '%s'\n" "${username}"
+        fi
+    fi
+    printf "%d\n" "${uid}"
+}
+
+#----------------------------------------------------------------------------
+# Add given user to given group, if not already the case
+add_user_to_group() {
+    local username="${1}"
+    local group="${2}"
+    local _f
+
+    for _f in "${GROUP}" "${GSHADOW}"; do
+        [ -f "${_f}" ] || continue
+        sed -r -i -e 's/^('"${group}"':.*:)(([^:]+,)?)'"${username}"'(,[^:]+*)?$/\1\2\4/;'  \
+                  -e 's/^('"${group}"':.*)$/\1,'"${username}"'/;'                           \
+                  -e 's/,+/,/'                                                              \
+                  -e 's/:,/:/'                                                              \
+                  "${_f}"
+    done
+}
+
+#----------------------------------------------------------------------------
+# Encode a password
+encode_password() {
+    local passwd="${1}"
+
+    mkpasswd -m "${PASSWD_METHOD}" "${passwd}"
+}
+
+#----------------------------------------------------------------------------
+# Add a user; if it does already exist, remove it first
+add_one_user() {
+    local username="${1}"
+    local uid="${2}"
+    local group="${3}"
+    local gid="${4}"
+    local passwd="${5}"
+    local home="${6}"
+    local shell="${7}"
+    local groups="${8}"
+    local comment="${9}"
+    local _f _group _home _shell _gid _passwd
+
+    # First, sanity-check the user
+    check_user_validity "${username}" "${uid}" "${group}" "${gid}"
+
+    # Generate a new UID if needed
+    if [ ${uid} -eq -1 ]; then
+        uid="$( generate_uid "${username}" )"
+    fi
+
+    # Remove any previous instance of this user
+    for _f in "${PASSWD}" "${SHADOW}"; do
+        sed -r -i -e '/^'"${username}"':.*/d;' "${_f}"
+    done
+
+    _gid="$( get_gid "${group}" )"
+    _shell="${shell}"
+    if [ "${shell}" = "-" ]; then
+        _shell="/bin/false"
+    fi
+    case "${home}" in
+        -)  _home="/";;
+        /)  fail "home can not explicitly be '/'\n";;
+        /*) _home="${home}";;
+        *)  fail "home must be an absolute path\n";;
+    esac
+    case "${passwd}" in
+        !=*)
+            _passwd='!'"$( encode_passwd "${passwd#!=}" )"
+            ;;
+        =*)
+            _passwd="$( encode_passwd "${passwd#=}" )"
+            ;;
+        *)
+            _passwd="${passwd}"
+            ;;
+    esac
+
+    printf "%s:x:%d:%d:%s:%s:%s\n"              \
+           "${username}" "${uid}" "${_gid}"     \
+           "${comment}" "${_home}" "${_shell}"  \
+           >>"${PASSWD}"
+    printf "%s:%s:::::::\n"      \
+           "${username}" "${_passwd}"   \
+           >>"${SHADOW}"
+
+    # Add the user to its additional groups
+    if [ "${groups}" != "-" ]; then
+        for _group in ${groups//,/ }; do
+            add_user_to_group "${username}" "${_group}"
+        done
+    fi
+
+    # If the user has a home, chown it
+    # (Note: stdout goes to the fakeroot-script)
+    if [ "${home}" != "-" ]; then
+        mkdir -p "${TARGET_DIR}/${home}"
+        printf "chown -R %d:%d '%s'\n" "${uid}" "${_gid}" "${TARGET_DIR}/${home}"
+    fi
+}
+
+#----------------------------------------------------------------------------
+main() {
+    local username uid group gid passwd home shell groups comment
+
+    # Some sanity checks
+    if [ ${MIN_UID} -le 0 ]; then
+        fail "MIN_UID must be >0 (currently %d)\n" ${MIN_UID}
+    fi
+    if [ ${MIN_GID} -le 0 ]; then
+        fail "MIN_GID must be >0 (currently %d)\n" ${MIN_GID}
+    fi
+
+    # We first create groups whose gid is not -1, and then we create groups
+    # whose gid is -1 (automatic), so that, if a group is defined both with
+    # a specified gid and an automatic gid, we ensure the specified gid is
+    # used, rather than a different automatic gid is computed.
+
+    # First, create all the main groups which gid is *not* automatic
+    while read username uid group gid passwd home shell groups comment; do
+        [ -n "${username}" ] || continue    # Package with no user
+        [ ${gid} -ge 0     ] || continue    # Automatic gid
+        add_one_group "${group}" "${gid}"
+    done <"${USERS_TABLE}"
+
+    # Then, create all the main groups which gid *is* automatic
+    while read username uid group gid passwd home shell groups comment; do
+        [ -n "${username}" ] || continue    # Package with no user
+        [ ${gid} -eq -1    ] || continue    # Non-automatic gid
+        add_one_group "${group}" "${gid}"
+    done <"${USERS_TABLE}"
+
+    # Then, create all the additional groups
+    # If any additional group is already a main group, we should use
+    # the gid of that main group; otherwise, we can use any gid
+    while read username uid group gid passwd home shell groups comment; do
+        [ -n "${username}" ] || continue    # Package with no user
+        if [ "${groups}" != "-" ]; then
+            for g in ${groups//,/ }; do
+                add_one_group "${g}" -1
+            done
+        fi
+    done <"${USERS_TABLE}"
+
+    # When adding users, we do as for groups, in case two packages create
+    # the same user, one with an automatic uid, the other with a specified
+    # uid, to ensure the specified uid is used, rather than an incompatible
+    # uid be generated.
+
+    # Now, add users whose uid is *not* automatic
+    while read username uid group gid passwd home shell groups comment; do
+        [ -n "${username}" ] || continue    # Package with no user
+        [ ${uid} -ge 0     ] || continue    # Automatic uid
+        add_one_user "${username}" "${uid}" "${group}" "${gid}" "${passwd}" \
+                     "${home}" "${shell}" "${groups}" "${comment}"
+    done <"${USERS_TABLE}"
+
+    # Finally, add users whose uid *is* automatic
+    while read username uid group gid passwd home shell groups comment; do
+        [ -n "${username}" ] || continue    # Package with no user
+        [ ${uid} -eq -1    ] || continue    # Non-automatic uid
+        add_one_user "${username}" "${uid}" "${group}" "${gid}" "${passwd}" \
+                     "${home}" "${shell}" "${groups}" "${comment}"
+    done <"${USERS_TABLE}"
+}
+
+#----------------------------------------------------------------------------
+main "${@}"
