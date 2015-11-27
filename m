From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 Nov 2015 23:39:11 +0100
Subject: [Buildroot] [PATCH 4/7 v3] etc: add SysV-init startup script and
	sample config file
In-Reply-To: <cover.1448663846.git.yann.morin.1998@free.fr>
References: <cover.1448663846.git.yann.morin.1998@free.fr>
Message-ID: <9243b48a5bc32c35039519eabf4b6946f36f3260.1448663846.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 etc/default/buildroot-autobuild |  23 +++++++
 etc/init.d/buildroot-autobuild  | 148 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 171 insertions(+)
 create mode 100644 etc/default/buildroot-autobuild
 create mode 100755 etc/init.d/buildroot-autobuild

diff --git a/etc/default/buildroot-autobuild b/etc/default/buildroot-autobuild
new file mode 100644
index 0000000..93b7365
--- /dev/null
+++ b/etc/default/buildroot-autobuild
@@ -0,0 +1,23 @@
+# The absolute path, outside the chroot, where the
+# buildroot-test tree is cloned, optional
+AUTOBUILD_DIR="/home/johndoe/buildroot-test"
+
+# The absolute path, outside the chroot, where to
+# share downloads (not yet implemented)
+#AUTOBUILD_DL_DIR="/home/johndoe/dl"
+
+# The absolute path to chroot into to rn the autobuild script
+AUTOBUILD_CHROOT="/var/chroot-autobuild"
+
+# User (in the chroot) that runs the autobuild script)
+AUTOBUILD_USER="buildroot"
+
+# The absolute path, in the chroot, that is the base of the
+# autobuild work dir. In there, you'll have:
+# - AUTOBUILD_CHROOT_DIR/buildroot-test
+#       the buildroot-test tree (bind-mounted from AUTOBUILD_DIR if set)
+# - AUTOBUILD_CHROOT_DIR/buildroot-autobuild.conf
+#       the run-time configuration of the autobuild script
+# - AUTOBUILD_CHROOT_DIR/run/
+#       the parent directory for all build instances
+AUTOBUILD_CHROOT_DIR="/home/buildroot/autobuild/"
diff --git a/etc/init.d/buildroot-autobuild b/etc/init.d/buildroot-autobuild
new file mode 100755
index 0000000..8605533
--- /dev/null
+++ b/etc/init.d/buildroot-autobuild
@@ -0,0 +1,148 @@
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
+# Expected configuration in the configuration file;
+#   AUTOBUILD_DIR           the absolute path to the shared the autobuild
+#                           git tree; optional
+#   AUTOBUILD_DL_DIR        the absolute path to the shared DL dir; optional
+#   AUTOBUILD_CHROOT        the absolute path to the chroot to run in
+#   AUTOBUILD_USER          the username to run as
+#
+# The following variable is to be interpreted inside the chroot:
+#   AUTOBUILD_CHROOT_DIR    the absolute path to the directory builds run in
+
+CFG_FILE="/etc/default/buildroot-autobuild"
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
+if [ -z "${AUTOBUILD_CHROOT}" ]; then
+    printf "ERROR: no autobuild chroot\n" >&2
+    exit 1
+fi
+if [ -z "${AUTOBUILD_CHROOT_DIR}" ]; then
+    printf "ERROR: no autobuild chroot dir\n" >&2
+    exit 1
+fi
+
+# Derived configuration:
+#   AUTOBUILD_RUN_DIR   instances will be created in there
+#   AUTOBUILD_CMD       the autobuild script to run
+#   AUTOBUILD_CFG       the autobuild runtime configuration
+AUTOBUILD_RUN_DIR="${AUTOBUILD_CHROOT_DIR}/run"
+AUTOBUILD_CMD="${AUTOBUILD_CHROOT_DIR}/buildroot-test/scripts/autobuild-run"
+AUTOBUILD_CFG="${AUTOBUILD_CHROOT_DIR}/buildroot-autobuild.conf"
+AUTOBUILD_CHROOT_PID_FILE="${AUTOBUILD_CHROOT_DIR}/buildroot-autobuild.pid"
+AUTOBUILD_PID_FILE="${AUTOBUILD_CHROOT}/${AUTOBUILD_CHROOT_DIR}/buildroot-autobuild.pid"
+
+autobuild_start() {
+    echo "Starting buildroot-autobuild"
+
+    CMD="cd '${AUTOBUILD_RUN_DIR}'"
+    CMD="${CMD}; '${AUTOBUILD_CMD}' -c '${AUTOBUILD_CFG}' --pid-file '${AUTOBUILD_CHROOT_PID_FILE}' &"
+
+    do_chroot "rm -rf '${AUTOBUILD_RUN_DIR}'"
+    do_chroot "mkdir -p '${AUTOBUILD_RUN_DIR}'"
+    do_chroot "${CMD}"
+}
+
+autobuild_stop() {
+    echo "Stopping buildroot-autobuild"
+    if [ -f "${AUTOBUILD_PID_FILE}" ]; then
+        kill $(cat "${AUTOBUILD_PID_FILE}")
+    fi
+    rm -f "${AUTOBUILD_PID_FILE}"
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
+# This function runs a command in the chroot *as* the autobuild user (i.e. not root)
+do_chroot() {
+    LANG=C chroot "${AUTOBUILD_CHROOT}" /bin/su -l "${AUTOBUILD_USER}" -c "( ${1} )"
+}
+
+# Create a number of bind mounts needed for the chroot to operate properly.
+prepare_chroot() {
+    # The autobuild source tree, if shared
+    if [ -d "${AUTOBUILD_DIR}" ]; then
+        do_chroot "mkdir -p '${AUTOBUILD_CHROOT_DIR}/buildroot-test'"
+        mount_on "${AUTOBUILD_DIR}" "${AUTOBUILD_CHROOT}/${AUTOBUILD_CHROOT_DIR}/buildroot-test"
+    fi
+
+    # Download directory, if shared
+    if [ -d "${AUTOBUILD_DL_DIR}" ]; then
+        do_chroot "mkdir -p '${AUTOBUILD_CHROOT_DIR}/dl'"
+        mount_on "${AUTOBUILD_DL_DIR}" "${AUTOBUILD_CHROOT}/${AUTOBUILD_CHROOT_DIR}/dl"
+    fi
+
+    mount_on /proc "${AUTOBUILD_CHROOT}/proc"
+    mount_on /run/shm "${AUTOBUILD_CHROOT}/run/shm"
+}
+
+teardown_chroot() {
+    # Leave time for the instances to quit
+    sleep 2
+    umount "${AUTOBUILD_CHROOT}/run/shm"
+    umount "${AUTOBUILD_CHROOT}/proc"
+    if [ -d "${AUTOBUILD_DL_DIR}" ]; then
+        umount "${AUTOBUILD_CHROOT}/${AUTOBUILD_CHROOT_DIR}/dl"
+    fi
+    if [ -d "${AUTOBUILD_DIR}" ]; then
+        umount "${AUTOBUILD_CHROOT}/${AUTOBUILD_CHROOT_DIR}/buildroot-test"
+    fi
+}
+
+case "$1" in
+start)
+    prepare_chroot
+    autobuild_start
+    ;;
+stop)
+    autobuild_stop
+    teardown_chroot
+    ;;
+restart|reload|force-reload)
+    autobuild_stop
+    teardown_chroot
+    prepare_chroot
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
