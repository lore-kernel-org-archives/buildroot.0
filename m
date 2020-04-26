From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 27 Apr 2020 00:33:24 +0200
Subject: [Buildroot] [PATCH 5/6] board/qemu/post-image.sh: start from a shell
In-Reply-To: <20200426223325.1468127-1-romain.naour@gmail.com>
References: <20200426223325.1468127-1-romain.naour@gmail.com>
Message-ID: <20200426223325.1468127-5-romain.naour@gmail.com>
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

The start-qemu.sh script fail to start qemu since it use exec on the
"cd" command. To work around this issue, use "exec sh -c":
exec sh -c "${QEMU_CMD_LINE} \${EXTRA_ARGS}"

[1] https://github.com/ARM-software/arm-trusted-firmware/blob/4ebbea9592ab37fc62217d0ac62fa13a3e063527/docs/plat/qemu.rst

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/qemu/post-image.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/post-image.sh b/board/qemu/post-image.sh
index 9a4d216274..bf3e4df0b9 100755
--- a/board/qemu/post-image.sh
+++ b/board/qemu/post-image.sh
@@ -49,7 +49,7 @@ cat <<-_EOF_ > "${START_QEMU_SCRIPT}"
 	fi
 
 	export PATH="${HOST_DIR}/bin:\${PATH}"
-	exec ${QEMU_CMD_LINE} \${EXTRA_ARGS}
+	exec sh -c "${QEMU_CMD_LINE} \${EXTRA_ARGS}"
 _EOF_
 
 chmod +x "${START_QEMU_SCRIPT}"
-- 
2.25.3
