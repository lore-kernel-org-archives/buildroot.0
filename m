From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Nov 2015 16:02:42 +0100
Subject: [Buildroot] [PATCHv3] [autobuild] etc: add SysV-init startup script
	and sample config file
Message-ID: <1448809362-6340-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This startup script (and its companion configuration file in
/etc/default/) allows one to easily start/stop an autobuilder.

An autobuilder can be run either on the current system, or in
a chroot (preferred). Running in a chrrot is done by setting
the AUTOBUILD_CHROOT variable in the configuration file. If
that variable is not set, then hte autobuilder does not enter
a chroot.

It is expected that the buildroot-test tree be already present
somewhere (for example, as a git checkout).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v2 -> v3:
  - allow not entering in a chroot  (Thomas)
  - always require an existing buildroot-test tree  (Thomas)
---
 etc/default/buildroot-autobuild |  16 ++++
 etc/init.d/buildroot-autobuild  | 171 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 187 insertions(+)
 create mode 100644 etc/default/buildroot-autobuild
 create mode 100755 etc/init.d/buildroot-autobuild

diff --git a/etc/default/buildroot-autobuild b/etc/default/buildroot-autobuild
new file mode 100644
index 0000000..6cc9408
--- /dev/null
+++ b/etc/default/buildroot-autobuild
@@ -0,0 +1,16 @@
+# The absolute path to chroot into to run the autobuild script.
+# Leave empty to not use a chroot.
+AUTOBUILD_CHROOT="/var/chroot-autobuild"
+
+# The user to run run the autobuild script as.
+# If using a chroot, that user must exist in the chroot.
+AUTOBUILD_USER="buildroot"
+
+# Path to the buildroot-test tree to use.
+# If using a chroot, it will be bind-mounted in the chroot.
+AUTOBUILD_DIR="/home/johndoe/buildroot-test"
+
+# The absolute path to the autobuild work dir.
+# This directory must contain the runtime configuration file for
+# the autobuilder script, in a file name buildroot-autobuild.conf
+AUTOBUILD_BASE_DIR="/home/buildroot/autobuild/"
diff --git a/etc/init.d/buildroot-autobuild b/etc/init.d/buildroot-autobuild
new file mode 100755
index 0000000..6fd8ddc
--- /dev/null
+++ b/etc/init.d/buildroot-autobuild
@@ -0,0 +1,171 @@
+#!/bin/sh
+# vim: ft=sh
+
+### BEGIN INIT INFO
+# Provides:          buildroot-autobuild
+# Required-Start:    $network
+# Required-Stop:     $network
+# Default-Start:     2 3 4 5
+# Default-Stop:      1
+# Short-Description: Buildroot autobuilds
+### END INIT INFO
+
+# Configuration is done in that file:
+CFG_FILE="/etc/default/buildroot-autobuild"
+
+#### Nothing is configurable below
+
+if [ ! -e "${CFG_FILE}" ]; then
+    printf "ERROR: no autobuilder configuration file\n" >&2
+    exit 1
+fi
+. "${CFG_FILE}"
+if [ -z "${AUTOBUILD_USER}" ]; then
+    printf "ERROR: no autobuild user\n" >&2
+    exit 1
+fi
+if [ -z "${AUTOBUILD_DIR}" ]; then
+    printf "ERROR: no autobuild dir\n" >&2
+    exit 1
+fi
+if [ -z "${AUTOBUILD_BASE_DIR}" ]; then
+    printf "ERROR: no autobuild chroot dir\n" >&2
+    exit 1
+fi
+
+# Derived configuration:
+#   AUTOBUILD_CMD               the autobuild script
+#   AUTOBUILD_CFG               the runtime configuration file
+#   AUTOBUILD_RUN_DIR           the directory where to create instances
+#   AUTOBUILD_PID_FILE          the PID file
+#   AUTOBUILD_CHROOT_PID_FILE   the PID file (in the chroot)
+# Note: when not in a chroot, AUTOBUILD_CHROOT_PID_FILE is the same
+# as AUTOBUILD_PID_FILE.
+if [ -n "${AUTOBUILD_CHROOT}" ]; then
+AUTOBUILD_CMD="${AUTOBUILD_BASE_DIR}/buildroot-test/scripts/autobuild-run"
+else
+AUTOBUILD_CMD="${AUTOBUILD_DIR}/scripts/autobuild-run"
+fi
+AUTOBUILD_CHROOT_PID_FILE="${AUTOBUILD_BASE_DIR}/buildroot-autobuild.pid"
+AUTOBUILD_PID_FILE="${AUTOBUILD_CHROOT}/${AUTOBUILD_CHROOT_PID_FILE}"
+AUTOBUILD_RUN_DIR="${AUTOBUILD_BASE_DIR}/run"
+AUTOBUILD_CFG="${AUTOBUILD_BASE_DIR}/buildroot-autobuild.conf"
+
+autobuild_start() {
+    if [ -f "${AUTOBUILD_PID_FILE}" ]; then
+        printf "PID file '%s' already exists\n" "${AUTOBUILD_PID_FILE}" >&2
+        printf "already running or stray file?\n" >&2
+        exit 1
+    fi
+
+    echo "Starting buildroot-autobuild"
+
+    # The autobuild script command on its own
+    CMD="LC_ALL=C LANG=C '${AUTOBUILD_CMD}' -c '${AUTOBUILD_CFG}' "
+    CMD="${CMD} --pid-file '${AUTOBUILD_CHROOT_PID_FILE}' &"
+
+    # The aggregated command run as the specified user
+    CMD="cd '${AUTOBUILD_RUN_DIR}'; ${CMD}"
+    CMD="/bin/su -l '${AUTOBUILD_USER}' -c \"( ${CMD} )\""
+
+    prepare
+    do_run ${CMD}
+}
+
+autobuild_stop() {
+    echo "Stopping buildroot-autobuild"
+    if [ -f "${AUTOBUILD_PID_FILE}" ]; then
+        kill $(cat "${AUTOBUILD_PID_FILE}")
+        rm -f "${AUTOBUILD_PID_FILE}"
+    fi
+    teardown
+}
+
+autobuild_status() {
+    if [ -f "${AUTOBUILD_PID_FILE}" ]; then
+        printf "buildroot-autobuild is running as PID %d\n" "$(cat "${AUTOBUILD_PID_FILE}")"
+    else
+        printf "buildroot-autobuild is not running (or missing PID file)\n"
+    fi
+}
+
+# This creates a bind mount of $1 to $2, if it doesn't already exists
+mount_on() {
+    mkdir -p "${2}"
+    mount | grep -q "^$1 on $2" || mount --bind $1 $2
+}
+
+# This function runs a command *as* the autobuild user (i.e. not root)
+do_run() {
+    # We use 'eval' because the command contains
+    # quotation that we want to enforce.
+    if [ -n "${AUTOBUILD_CHROOT}" ]; then
+        eval chroot "${AUTOBUILD_CHROOT}" "${@}"
+    else
+        eval "${@}"
+    fi
+}
+
+do_mkdir() {
+    MKDIR_CMD="/bin/su -l '${AUTOBUILD_USER}' -c \"( mkdir -p '${1}' )\""
+    do_run ${MKDIR_CMD}
+}
+
+prepare() {
+    # The system mount points, only needed for a chroot
+    if [ -n "${AUTOBUILD_CHROOT}" ]; then
+        mount_on /proc "${AUTOBUILD_CHROOT}/proc"
+        mount_on /run/shm "${AUTOBUILD_CHROOT}/run/shm"
+        mount_on /dev/pts "${AUTOBUILD_CHROOT}/dev/pts"
+        do_mkdir "${AUTOBUILD_BASE_DIR}/buildroot-test"
+        mount_on "${AUTOBUILD_DIR}" "${AUTOBUILD_CHROOT}/${AUTOBUILD_BASE_DIR}/buildroot-test"
+    fi
+    do_mkdir "${AUTOBUILD_BASE_DIR}/run"
+
+    # Check we do have an autobuilder in place
+    if [ ! -x "${AUTOBUILD_CHROOT}/${AUTOBUILD_CMD}" ]; then
+        printf "No autobuilder script found in '%s/%s'\n" \
+               "${AUTOBUILD_CHROOT}" "${AUTOBUILD_CMD}"   >&2
+        teardown
+        exit 1
+    fi
+
+    # Check we do have a configuration file
+    if [ ! -f "${AUTOBUILD_CHROOT}/${AUTOBUILD_CFG}" ]; then
+        printf "No autobuilder configuration found in '%s/%s'\n" \
+               "${AUTOBUILD_CHROOT}" "${AUTOBUILD_CFG}"          >&2
+        teardown
+        exit 1
+    fi
+}
+
+teardown() {
+    if [ -n "${AUTOBUILD_CHROOT}" ]; then
+        # Leave time for the instances to quit
+        sleep 2
+        umount "${AUTOBUILD_CHROOT}/dev/pts"
+        umount "${AUTOBUILD_CHROOT}/run/shm"
+        umount "${AUTOBUILD_CHROOT}/proc"
+        umount "${AUTOBUILD_CHROOT}/${AUTOBUILD_BASE_DIR}/buildroot-test"
+    fi
+}
+
+case "$1" in
+start)
+    autobuild_start
+    ;;
+stop)
+    autobuild_stop
+    ;;
+restart|reload|force-reload)
+    autobuild_stop
+    autobuild_start
+    ;;
+status)
+    autobuild_status
+    ;;
+*)
+    echo "Error, unknown action $1"
+    exit 1
+    ;;
+esac
-- 
1.9.1
