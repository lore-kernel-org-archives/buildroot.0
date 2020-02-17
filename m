From: Romain Naour <romain.naour@smile.fr>
Date: Mon, 17 Feb 2020 21:50:27 +0100
Subject: [Buildroot] [PATCH v5 2/5] board/qemu: add post-image script for
 gitlab qemu testing
In-Reply-To: <20200217205030.8157-1-romain.naour@smile.fr>
References: <20200217205030.8157-1-romain.naour@smile.fr>
Message-ID: <20200217205030.8157-3-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit add a post-image script to be used by each qemu
board defconfig in order to generate start-qemu.sh in BINARIES_DIR.
The start-qemu.sh script can be used by Buildroot user to start
Qemu or by a gitlab CI.
start-qemu.sh is not started automatically at the end of the build.

To find the correct qemu command line, we use the second post
script argument which must contain "$(BR2_DEFCONFIG)"

  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"

The post-image script expect something like
"/path/to/qemu_aarch64_virt_defconfig" in BR2_DEFCONFIG.

Doing a basename allow to retrieve the name of the defconfig
file that should match on on the "tag" previously introduced in
readme.txt files.

The script start-qemu.sh is able to modify the qemu command
line if CI_JOB_NAME defined in the environment. This allow
to disable the graphical output and redirect serial I/Os to
console.

Only sh4/sh4eb needs a special handling by adding
"-serial stdio -display none" instead of "-display none".

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v5: update the script after Thomas's review [1] [2]

[1] http://lists.busybox.net/pipermail/buildroot/2020-February/273820.html
[2] http://lists.busybox.net/pipermail/buildroot/2020-February/273822.html
---
 board/qemu/post-image.sh | 50 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100755 board/qemu/post-image.sh

diff --git a/board/qemu/post-image.sh b/board/qemu/post-image.sh
new file mode 100755
index 0000000000..804c5f6110
--- /dev/null
+++ b/board/qemu/post-image.sh
@@ -0,0 +1,50 @@
+#!/bin/bash
+
+QEMU_BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILES="${QEMU_BOARD_DIR}/*/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    exit 0
+fi
+
+# Search for "# qemu_*_defconfig" tag in all readme.txt files.
+# Qemu command line on multilines using back slash are accepted.
+QEMU_CMD_LINE=$(sed -r ':a; /\\$/N; s/\\\n//; s/\t/ /; ta; /# '${DEFCONFIG_NAME}'$/!d; s/#.*//' ${README_FILES})
+
+if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    exit 0
+fi
+
+# Replace output/images path by ${IMAGE_DIR} since the script
+# will be in the same directory as the kernel and the rootfs images.
+QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+# Test if we are running in gitlab
+if [ -n "$CI_JOB_NAME" ]; then
+    # Remove -serial stdio if present
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+
+    # Disable graphical output and redirect serial I/Os to console
+    case ${DEFCONFIG_NAME} in
+        # Special case for SH4
+        qemu_sh4eb_r2d_defconfig | qemu_sh4_r2d_defconfig)
+            QEMU_CMD_LINE="$QEMU_CMD_LINE -serial stdio -display none"
+            ;;
+        *)
+            QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+            ;;
+    esac
+fi
+
+cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+
+chmod +x $START_QEMU_SCRIPT
-- 
2.24.1
