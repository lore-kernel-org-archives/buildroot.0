From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Apr 2020 21:51:12 +0200
Subject: [Buildroot] [git commit] board/qemu: add post-image script for
 gitlab qemu testing
Message-ID: <20200413193722.EF6F48EA6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=575493c1869fb5f769fe23661d44d50ca6ea3809
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit add a post-image script to be used by each qemu board
defconfig in order to generate start-qemu.sh in BINARIES_DIR. The
start-qemu.sh script can be used by Buildroot user to start Qemu
or by a gitlab CI.

To find the correct qemu command line, we use the second post script
argument which must contain "$(BR2_DEFCONFIG)"

    BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"

The post-image script expect something like
"/path/to/qemu_aarch64_virt_defconfig" in BR2_DEFCONFIG.

Doing a basename allow to retrieve the name of the defconfig file that
should match on on the "tag" previously introduced in readme.txt files.

For running in the CI, as well as running from a remote machine (e.g. on
a remote build machine), it is better not to start in graphical mode,
but only with the serial line attached to the terminal. The post-build
script prepares two sets of arguments for each case, graphical or
serial, and stores them in the start-qemu.sh script, which then decodes
which to use, based on an argument on the command line (default is still
graphical)

sh4/sh4eb needs a special handling by adding "-serial stdio -display
none"; others only require "-nographics". Some qemu command lines
already contain "-serial stdio", but that does not play nicely with
"-nographics", we remove that when going serial-only (although this
might seem counter-intuitive).

Finally, we ensure the script uses our qemu-system (if it was built).

Signed-off-by: Romain Naour <romain.naour@smile.fr>
[yann.morin.1998 at free.fr:
  - drop the knowledge about gitlab-ci, replace with an argument to
    pass to start-qemu.sh
  - adapt the commit log accordingly
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/qemu/post-image.sh | 55 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/board/qemu/post-image.sh b/board/qemu/post-image.sh
new file mode 100755
index 0000000000..9a4d216274
--- /dev/null
+++ b/board/qemu/post-image.sh
@@ -0,0 +1,55 @@
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
+if [ -z "${QEMU_CMD_LINE}" ]; then
+    # No Qemu cmd line found, can't test.
+    exit 0
+fi
+
+# Replace output/images path by ${IMAGE_DIR} since the script
+# will be in the same directory as the kernel and the rootfs images.
+QEMU_CMD_LINE="${QEMU_CMD_LINE//output\/images/\${IMAGE_DIR\}}"
+
+# Remove -serial stdio if present, keep it as default args
+DEFAULT_ARGS="$(sed -r -e '/-serial stdio/!d; s/.*(-serial stdio).*/\1/' <<<"${QEMU_CMD_LINE}")"
+QEMU_CMD_LINE="${QEMU_CMD_LINE//-serial stdio/}"
+
+# Disable graphical output and redirect serial I/Os to console
+case ${DEFCONFIG_NAME} in
+  (qemu_sh4eb_r2d_defconfig|qemu_sh4_r2d_defconfig)
+    # Special case for SH4
+    SERIAL_ARGS="-serial stdio -display none"
+    ;;
+  (*)
+    SERIAL_ARGS="-nographic"
+    ;;
+esac
+
+cat <<-_EOF_ > "${START_QEMU_SCRIPT}"
+	#!/bin/sh
+	IMAGE_DIR="\${0%/*}/"
+
+	if [ "\${1}" = "serial-only" ]; then
+	    EXTRA_ARGS='${SERIAL_ARGS}'
+	else
+	    EXTRA_ARGS='${DEFAULT_ARGS}'
+	fi
+
+	export PATH="${HOST_DIR}/bin:\${PATH}"
+	exec ${QEMU_CMD_LINE} \${EXTRA_ARGS}
+_EOF_
+
+chmod +x "${START_QEMU_SCRIPT}"
