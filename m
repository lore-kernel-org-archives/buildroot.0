From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 15 Nov 2020 15:36:07 +0100
Subject: [Buildroot] [=PATCH v3 2/4] board/qemu/post-image.sh: execute from
 BINARIES_DIR
In-Reply-To: <20201115143609.2160080-1-romain.naour@gmail.com>
References: <20201115143609.2160080-1-romain.naour@gmail.com>
Message-ID: <20201115143609.2160080-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Usually the qemu command line start directly with "qemu-system-<arch> ...".
But the command line for qemu_arm_vexpress_tz_defconfig start by doing
"cd output/images && ../host/bin/qemu-system-arm". This is necessary
since boot binaries, except BL1, are primarily loaded via semi-hosting
so all binaries has to reside in the same directory as QEMU is started
from [1].

To order to handle this case correctly, update the post-image.sh used
by all qemu defconfigs to execute qemu from BINARIES_DIR.

Since we have to change the current directory use a subshell to
restore the current directory after Qemu execution.

[1] https://github.com/ARM-software/arm-trusted-firmware/blob/4ebbea9592ab37fc62217d0ac62fa13a3e063527/docs/plat/qemu.rst

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/qemu/post-image.sh | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/board/qemu/post-image.sh b/board/qemu/post-image.sh
index f34bf5043a..b7ee418e07 100755
--- a/board/qemu/post-image.sh
+++ b/board/qemu/post-image.sh
@@ -19,9 +19,9 @@ if [ -z "${QEMU_CMD_LINE}" ]; then
     exit 0
 fi
 
-# Replace output/images path by ${BINARIES_DIR} since the script
-# will be in the same directory as the kernel and the rootfs images.
-QEMU_CMD_LINE="${QEMU_CMD_LINE//output\/images/\${BINARIES_DIR\}}"
+# Remove output/images path since the script will be in
+# the same directory as the kernel and the rootfs images.
+QEMU_CMD_LINE="${QEMU_CMD_LINE//output\/images/}"
 
 # Remove -serial stdio if present, keep it as default args
 DEFAULT_ARGS="$(sed -r -e '/-serial stdio/!d; s/.*(-serial stdio).*/\1/' <<<"${QEMU_CMD_LINE}")"
@@ -40,7 +40,9 @@ esac
 
 cat <<-_EOF_ > "${START_QEMU_SCRIPT}"
 	#!/bin/sh
+	(
 	BINARIES_DIR="\${0%/*}/"
+	cd \${BINARIES_DIR}
 
 	if [ "\${1}" = "serial-only" ]; then
 	    EXTRA_ARGS='${SERIAL_ARGS}'
@@ -50,6 +52,7 @@ cat <<-_EOF_ > "${START_QEMU_SCRIPT}"
 
 	export PATH="${HOST_DIR}/bin:\${PATH}"
 	exec ${QEMU_CMD_LINE} \${EXTRA_ARGS}
+	)
 _EOF_
 
 chmod +x "${START_QEMU_SCRIPT}"
-- 
2.25.4
