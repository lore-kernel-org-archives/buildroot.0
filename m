From: Romain Naour <romain.naour@smile.fr>
Date: Sun,  9 Feb 2020 19:03:24 +0100
Subject: [Buildroot] [PATCH v4 6/9] board/qemu: add post-image script for
 gitlab qemu testing
In-Reply-To: <20200209180327.455426-1-romain.naour@smile.fr>
References: <20200209180327.455426-1-romain.naour@smile.fr>
Message-ID: <20200209180327.455426-7-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit add the same post-image script for each qemu board
in order to generate start-qemu.sh in BINARIES_DIR.
The start-qemu.sh script can be used by Buildroot user to start
Qemu or by a gitlab CI.

To find the correct qemu command line in the readme.txt, we use
the second post script argument which must contain "$(BR2_DEFCONFIG)"

  BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"

Doing a basename allow to retrieve the name of the defconfig
file (ex: qemu_aarch64_virt_defconfig) that should match
on on the "tag" previously introduced in the readme.txt.

The script start-qemu.sh is able to modify the qemu command
line if CI_JOB_NAME defined in the environment. This allow
to disable the graphical output and redirect serial I/Os to
console.

Only sh4/sh4eb needs a special handling by adding
"-serial stdio -display none" instead of "-display none".

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/qemu/aarch64-virt/post-image.sh     | 40 ++++++++++++++++++++++
 board/qemu/arm-versatile/post-image.sh    | 40 ++++++++++++++++++++++
 board/qemu/arm-vexpress-tz/post-image.sh  | 40 ++++++++++++++++++++++
 board/qemu/arm-vexpress/post-image.sh     | 40 ++++++++++++++++++++++
 board/qemu/csky/post-image.sh             | 40 ++++++++++++++++++++++
 board/qemu/m68k-mcf5208/post-image.sh     | 40 ++++++++++++++++++++++
 board/qemu/m68k-q800/post-image.sh        | 40 ++++++++++++++++++++++
 board/qemu/microblazebe-mmu/post-image.sh | 40 ++++++++++++++++++++++
 board/qemu/microblazeel-mmu/post-image.sh | 40 ++++++++++++++++++++++
 board/qemu/mips32r2-malta/post-image.sh   | 40 ++++++++++++++++++++++
 board/qemu/mips32r2el-malta/post-image.sh | 40 ++++++++++++++++++++++
 board/qemu/mips32r6-malta/post-image.sh   | 40 ++++++++++++++++++++++
 board/qemu/mips32r6el-malta/post-image.sh | 40 ++++++++++++++++++++++
 board/qemu/mips64-malta/post-image.sh     | 40 ++++++++++++++++++++++
 board/qemu/mips64el-malta/post-image.sh   | 40 ++++++++++++++++++++++
 board/qemu/mips64r6-malta/post-image.sh   | 40 ++++++++++++++++++++++
 board/qemu/mips64r6el-malta/post-image.sh | 40 ++++++++++++++++++++++
 board/qemu/nios2-10m50/post-image.sh      | 40 ++++++++++++++++++++++
 board/qemu/or1k/post-image.sh             | 40 ++++++++++++++++++++++
 board/qemu/ppc-g3beige/post-image.sh      | 40 ++++++++++++++++++++++
 board/qemu/ppc-mac99/post-image.sh        | 40 ++++++++++++++++++++++
 board/qemu/ppc-mpc8544ds/post-image.sh    | 40 ++++++++++++++++++++++
 board/qemu/ppc-virtex-ml507/post-image.sh | 40 ++++++++++++++++++++++
 board/qemu/ppc64-e5500/post-image.sh      | 40 ++++++++++++++++++++++
 board/qemu/ppc64-pseries/post-image.sh    | 40 ++++++++++++++++++++++
 board/qemu/ppc64le-pseries/post-image.sh  | 40 ++++++++++++++++++++++
 board/qemu/riscv32-virt/post-image.sh     | 40 ++++++++++++++++++++++
 board/qemu/riscv64-virt/post-image.sh     | 40 ++++++++++++++++++++++
 board/qemu/sh4-r2d/post-image.sh          | 41 +++++++++++++++++++++++
 board/qemu/sh4eb-r2d/post-image.sh        | 41 +++++++++++++++++++++++
 board/qemu/sparc-ss10/post-image.sh       | 40 ++++++++++++++++++++++
 board/qemu/sparc64-sun4u/post-image.sh    | 40 ++++++++++++++++++++++
 board/qemu/x86/post-image.sh              | 40 ++++++++++++++++++++++
 board/qemu/x86_64/post-image.sh           | 40 ++++++++++++++++++++++
 board/qemu/xtensa-lx60/post-image.sh      | 40 ++++++++++++++++++++++
 35 files changed, 1402 insertions(+)
 create mode 100755 board/qemu/aarch64-virt/post-image.sh
 create mode 100755 board/qemu/arm-versatile/post-image.sh
 create mode 100755 board/qemu/arm-vexpress-tz/post-image.sh
 create mode 100755 board/qemu/arm-vexpress/post-image.sh
 create mode 100755 board/qemu/csky/post-image.sh
 create mode 100755 board/qemu/m68k-mcf5208/post-image.sh
 create mode 100755 board/qemu/m68k-q800/post-image.sh
 create mode 100755 board/qemu/microblazebe-mmu/post-image.sh
 create mode 100755 board/qemu/microblazeel-mmu/post-image.sh
 create mode 100755 board/qemu/mips32r2-malta/post-image.sh
 create mode 100755 board/qemu/mips32r2el-malta/post-image.sh
 create mode 100755 board/qemu/mips32r6-malta/post-image.sh
 create mode 100755 board/qemu/mips32r6el-malta/post-image.sh
 create mode 100755 board/qemu/mips64-malta/post-image.sh
 create mode 100755 board/qemu/mips64el-malta/post-image.sh
 create mode 100755 board/qemu/mips64r6-malta/post-image.sh
 create mode 100755 board/qemu/mips64r6el-malta/post-image.sh
 create mode 100755 board/qemu/nios2-10m50/post-image.sh
 create mode 100755 board/qemu/or1k/post-image.sh
 create mode 100755 board/qemu/ppc-g3beige/post-image.sh
 create mode 100755 board/qemu/ppc-mac99/post-image.sh
 create mode 100755 board/qemu/ppc-mpc8544ds/post-image.sh
 create mode 100755 board/qemu/ppc-virtex-ml507/post-image.sh
 create mode 100755 board/qemu/ppc64-e5500/post-image.sh
 create mode 100755 board/qemu/ppc64-pseries/post-image.sh
 create mode 100755 board/qemu/ppc64le-pseries/post-image.sh
 create mode 100755 board/qemu/riscv32-virt/post-image.sh
 create mode 100755 board/qemu/riscv64-virt/post-image.sh
 create mode 100755 board/qemu/sh4-r2d/post-image.sh
 create mode 100755 board/qemu/sh4eb-r2d/post-image.sh
 create mode 100755 board/qemu/sparc-ss10/post-image.sh
 create mode 100755 board/qemu/sparc64-sun4u/post-image.sh
 create mode 100755 board/qemu/x86/post-image.sh
 create mode 100755 board/qemu/x86_64/post-image.sh
 create mode 100755 board/qemu/xtensa-lx60/post-image.sh

diff --git a/board/qemu/aarch64-virt/post-image.sh b/board/qemu/aarch64-virt/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/aarch64-virt/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/arm-versatile/post-image.sh b/board/qemu/arm-versatile/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/arm-versatile/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/arm-vexpress-tz/post-image.sh b/board/qemu/arm-vexpress-tz/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/arm-vexpress-tz/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/arm-vexpress/post-image.sh b/board/qemu/arm-vexpress/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/arm-vexpress/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/csky/post-image.sh b/board/qemu/csky/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/csky/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/m68k-mcf5208/post-image.sh b/board/qemu/m68k-mcf5208/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/m68k-mcf5208/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/m68k-q800/post-image.sh b/board/qemu/m68k-q800/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/m68k-q800/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/microblazebe-mmu/post-image.sh b/board/qemu/microblazebe-mmu/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/microblazebe-mmu/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/microblazeel-mmu/post-image.sh b/board/qemu/microblazeel-mmu/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/microblazeel-mmu/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/mips32r2-malta/post-image.sh b/board/qemu/mips32r2-malta/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/mips32r2-malta/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/mips32r2el-malta/post-image.sh b/board/qemu/mips32r2el-malta/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/mips32r2el-malta/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/mips32r6-malta/post-image.sh b/board/qemu/mips32r6-malta/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/mips32r6-malta/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/mips32r6el-malta/post-image.sh b/board/qemu/mips32r6el-malta/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/mips32r6el-malta/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/mips64-malta/post-image.sh b/board/qemu/mips64-malta/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/mips64-malta/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/mips64el-malta/post-image.sh b/board/qemu/mips64el-malta/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/mips64el-malta/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/mips64r6-malta/post-image.sh b/board/qemu/mips64r6-malta/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/mips64r6-malta/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/mips64r6el-malta/post-image.sh b/board/qemu/mips64r6el-malta/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/mips64r6el-malta/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/nios2-10m50/post-image.sh b/board/qemu/nios2-10m50/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/nios2-10m50/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/or1k/post-image.sh b/board/qemu/or1k/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/or1k/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/ppc-g3beige/post-image.sh b/board/qemu/ppc-g3beige/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/ppc-g3beige/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/ppc-mac99/post-image.sh b/board/qemu/ppc-mac99/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/ppc-mac99/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/ppc-mpc8544ds/post-image.sh b/board/qemu/ppc-mpc8544ds/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/ppc-mpc8544ds/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/ppc-virtex-ml507/post-image.sh b/board/qemu/ppc-virtex-ml507/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/ppc-virtex-ml507/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/ppc64-e5500/post-image.sh b/board/qemu/ppc64-e5500/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/ppc64-e5500/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/ppc64-pseries/post-image.sh b/board/qemu/ppc64-pseries/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/ppc64-pseries/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/ppc64le-pseries/post-image.sh b/board/qemu/ppc64le-pseries/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/ppc64le-pseries/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/riscv32-virt/post-image.sh b/board/qemu/riscv32-virt/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/riscv32-virt/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/riscv64-virt/post-image.sh b/board/qemu/riscv64-virt/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/riscv64-virt/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/sh4-r2d/post-image.sh b/board/qemu/sh4-r2d/post-image.sh
new file mode 100755
index 0000000000..a9fd8254db
--- /dev/null
+++ b/board/qemu/sh4-r2d/post-image.sh
@@ -0,0 +1,41 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        # Special case for SH4
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -serial stdio -display none"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/sh4eb-r2d/post-image.sh b/board/qemu/sh4eb-r2d/post-image.sh
new file mode 100755
index 0000000000..a9fd8254db
--- /dev/null
+++ b/board/qemu/sh4eb-r2d/post-image.sh
@@ -0,0 +1,41 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        # Special case for SH4
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -serial stdio -display none"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/sparc-ss10/post-image.sh b/board/qemu/sparc-ss10/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/sparc-ss10/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/sparc64-sun4u/post-image.sh b/board/qemu/sparc64-sun4u/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/sparc64-sun4u/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/x86/post-image.sh b/board/qemu/x86/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/x86/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/x86_64/post-image.sh b/board/qemu/x86_64/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/x86_64/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
diff --git a/board/qemu/xtensa-lx60/post-image.sh b/board/qemu/xtensa-lx60/post-image.sh
new file mode 100755
index 0000000000..6b73b75feb
--- /dev/null
+++ b/board/qemu/xtensa-lx60/post-image.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+BOARD_DIR="$(dirname $0)"
+DEFCONFIG_NAME="$(basename $2)"
+README_FILE="${BOARD_DIR}/readme.txt"
+START_QEMU_SCRIPT="${BINARIES_DIR}/start-qemu.sh"
+
+if [[ "${DEFCONFIG_NAME}" =~ ^"qemu_*" ]]; then
+    # Not a Qemu defconfig, can't test.
+    return
+fi
+
+if [ -f $README_FILE ]; then
+    QEMU_CMD_LINE=$(cat $README_FILE | sed -r "/^${DEFCONFIG_NAME}: /!d; :a; /\\$/N; s/\\\n//; ta; s/^[^:]+://")
+
+    if [ -z "$QEMU_CMD_LINE" ]; then
+    # No Qemu cmd line found, can't test.
+    return
+    fi
+
+    # Replace output/images path by ${IMAGE_DIR} since the script
+    # will be in the same directory as the kernel and the rootfs images.
+    QEMU_CMD_LINE=${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}
+
+    # Test if we are running in gitlab
+    if [ -n "$CI_JOB_NAME" ]; then
+        # Remove -serial stdio if present
+        QEMU_CMD_LINE=${QEMU_CMD_LINE//-serial stdio/}
+        # Disable graphical output and redirect serial I/Os to console
+        QEMU_CMD_LINE="$QEMU_CMD_LINE -nographic"
+    fi
+
+    cat << EOF > $START_QEMU_SCRIPT
+#!/bin/sh
+IMAGE_DIR="\$(dirname \$0)"
+
+$QEMU_CMD_LINE
+EOF
+    chmod +x $START_QEMU_SCRIPT
+fi
-- 
2.24.1
