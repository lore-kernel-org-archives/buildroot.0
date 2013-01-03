From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  3 Jan 2013 22:47:22 +0100
Subject: [Buildroot] [PATCH 1/2] packages: add ability for packages to
	create users
In-Reply-To: <cover.1357248864.git.yann.morin.1998@free.fr>
References: <cover.1357248864.git.yann.morin.1998@free.fr>
Message-ID: <3f7ba86845ac8661df700c310ae646fcd68b11b7.1357248864.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Packages that install daemons may need those daemons to run as a non-root,
or an otherwise non-system (eg. 'daemon'), user.

Add infrastructure for packages to create users, by declaring the
FOO_USERS variable that contain a makedev-syntax-like description
of the user(s) to add.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Cam Hutchison <camh@xdna.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-generic.txt |   16 ++-
 docs/manual/appendix.txt                |    1 +
 docs/manual/makeusers-syntax.txt        |   87 ++++++++
 fs/common.mk                            |    5 +-
 package/pkg-generic.mk                  |    1 +
 support/scripts/mkusers                 |  359 +++++++++++++++++++++++++++++++
 6 files changed, 466 insertions(+), 3 deletions(-)
 create mode 100644 docs/manual/makeusers-syntax.txt
 create mode 100755 support/scripts/mkusers

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 0759d4f..42897e9 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -50,7 +50,11 @@ system is based on hand-written Makefiles or shell scripts.
 34:	/bin/foo  f  4755  0  0	 -  -  -  -  -
 35: endef
 36:
-37: $(eval $(generic-package))
+37: define LIBFOO_USERS
+38: foo -1 libfoo -1 * - - - LibFoo daemon
+39: endef
+40
+41: $(eval $(generic-package))
 --------------------------------
 
 The Makefile begins on line 6 to 10 with metadata information: the
@@ -95,7 +99,10 @@ On line 29..31, we define a device-node file used by this package
 On line 33..35, we define the permissions to set to specific files
 installed by this package (+LIBFOO_PERMISSIONS+).
 
-Finally, on line 37, we call the +generic-package+ function, which
+On lines 37..39, we define a user that is used by this package (eg.
+to run a daemon as non-root).
+
+Finally, on line 41, we call the +generic-package+ function, which
 generates, according to the variables defined previously, all the
 Makefile code necessary to make your package working.
 
@@ -252,6 +259,11 @@ information is (assuming the package name is +libfoo+) :
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
index 6f1e9f3..63b172b 100644
--- a/docs/manual/appendix.txt
+++ b/docs/manual/appendix.txt
@@ -4,6 +4,7 @@ Appendix
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
index b1512dd..b5a7950 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -35,6 +35,7 @@ FAKEROOT_SCRIPT = $(BUILD_DIR)/_fakeroot.fs
 FULL_DEVICE_TABLE = $(BUILD_DIR)/_device_table.txt
 ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE)) \
 	$(call qstrip,$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
+USERS_TABLE = $(BUILD_DIR)/_users_table.txt
 
 define ROOTFS_TARGET_INTERNAL
 
@@ -55,11 +56,13 @@ endif
 	printf '$(subst $(sep),\n,$(PACKAGES_PERMISSIONS_TABLE))' >> $(FULL_DEVICE_TABLE)
 	echo "$(HOST_DIR)/usr/bin/makedevs -d $(FULL_DEVICE_TABLE) $(TARGET_DIR)" >> $(FAKEROOT_SCRIPT)
 endif
+	printf '$(subst $(sep),\n,$(PACKAGES_USERS))' > $(USERS_TABLE)
+	$(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) $(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
 	echo "$(ROOTFS_$(2)_CMD)" >> $(FAKEROOT_SCRIPT)
 	chmod a+x $(FAKEROOT_SCRIPT)
 	$(HOST_DIR)/usr/bin/fakeroot -- $(FAKEROOT_SCRIPT)
 	cp support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
-	- at rm -f $(FAKEROOT_SCRIPT) $(FULL_DEVICE_TABLE)
+	- at rm -f $(FAKEROOT_SCRIPT) $(FULL_DEVICE_TABLE) $(USERS_TABLE)
 	$(foreach hook,$(ROOTFS_$(2)_POST_GEN_HOOKS),$(call $(hook))$(sep))
 ifeq ($$(BR2_TARGET_ROOTFS_$(2)_GZIP),y)
 	gzip -9 -c $$@ > $$@.gz
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a570ad7..871544c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -510,6 +510,7 @@ ifeq ($$($$($(2)_KCONFIG_VAR)),y)
 TARGETS += $(1)
 PACKAGES_PERMISSIONS_TABLE += $$($(2)_PERMISSIONS)$$(sep)
 PACKAGES_DEVICES_TABLE += $$($(2)_DEVICES)$$(sep)
+PACKAGES_USERS += $$($(2)_USERS)$$(sep)
 
 ifeq ($$($(2)_SITE_METHOD),svn)
 DL_TOOLS_DEPENDENCIES += svn
diff --git a/support/scripts/mkusers b/support/scripts/mkusers
new file mode 100755
index 0000000..5df3493
--- /dev/null
+++ b/support/scripts/mkusers
@@ -0,0 +1,359 @@
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
+    fail "usage: %s USERS_TBLE TARGET_DIR\n"
+fi
+USERS_TABLE="${1}"
+TARGET_DIR="${2}"
+shift 2
+PASSWD="${TARGET_DIR}/etc/passwd"
+SHADOW="${TARGET_DIR}/etc/shadow"
+GROUP="${TARGET_DIR}/etc/group"
+# /etc/gsahdow is not part of the standard skeleton, so not everybody
+# will have it, but some may hav it, and its content must be in sync
+# with /etc/group, so any use of gshadow must be conditional.
+GSHADOW="${TARGET_DIR}/etc/gshadow"
+
+#----------------------------------------------------------------------------
+get_uid() {
+    local username="${1}"
+
+    awk -F: '$1=="'"${username}"'" { printf( "%d\n", $3 ); }' "${PASSWD}"
+}
+
+#----------------------------------------------------------------------------
+get_ugid() {
+    local username="${1}"
+
+    awk -F: '$1=="'"${username}"'" { printf( "%d\n", $4 ); }' "${PASSWD}"
+}
+
+#----------------------------------------------------------------------------
+get_gid() {
+    local group="${1}"
+
+    awk -F: '$1=="'"${group}"'" { printf( "%d\n", $3 ); }' "${GROUP}"
+}
+
+#----------------------------------------------------------------------------
+get_username() {
+    local uid="${1}"
+
+    awk -F: '$3=="'"${uid}"'" { printf( "%s\n", $1 ); }' "${PASSWD}"
+}
+
+#----------------------------------------------------------------------------
+get_group() {
+    local gid="${1}"
+
+    awk -F: '$3=="'"${gid}"'" { printf( "%s\n", $1 ); }' "${GROUP}"
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
+    # Remove any previous instance of this group
+    for _f in "${GROUP}" "${GSHADOW}"; do
+        [ -f "${_f}" ] || continue
+        sed -r -i -e '/^'"${group}"':.*/d;' "${_f}"
+    done
+
+    printf "%s:x:%d:\n" "${group}" "${gid}" >>"${GROUP}"
+    if [ -f "${GSHADOW}" ]; then
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
+    local nb_days="$((($(date +%s)+(24*60*60-1))/(24*60*60)))"
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
+            _passwd='!'"$( mkpasswd -m md5 "${passwd#!=}" )"
+            ;;
+        =*)
+            _passwd="$( mkpasswd -m md5 "${passwd#=}" )"
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
+    printf "%s:%s:%d:0:99999:7:::\n"                \
+           "${username}" "${_passwd}" "${nb_days}"  \
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
+    # First, create all the main groups
+    while read username uid group gid passwd home shell groups comment; do
+        [ -n "${username}" ] || continue    # Package with no user
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
+    # Finally, add users
+    while read username uid group gid passwd home shell groups comment; do
+        [ -n "${username}" ] || continue    # Package with no user
+        add_one_user "${username}" "${uid}" "${group}" "${gid}" "${passwd}" \
+                     "${home}" "${shell}" "${groups}" "${comment}"
+    done <"${USERS_TABLE}"
+}
+
+#----------------------------------------------------------------------------
+main "${@}"
-- 
1.7.2.5
