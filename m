From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 27 Sep 2017 22:08:03 +0200
Subject: [Buildroot] [git commit] raspberrypi: post-image.sh add new gpu_mem
	option
Message-ID: <20170927200048.86CD27FCC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9ccd2a186e6307fb40b90f96491c6f0b0ab8847
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The amount of GPU memory can be set using the new option --gpu_mem_XXX
(where XXX is the total amount of memory available on the board).

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/raspberrypi/post-image.sh | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index 3900a15..a2d6a98 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 
 BOARD_DIR="$(dirname $0)"
 BOARD_NAME="$(basename ${BOARD_DIR})"
@@ -38,6 +38,11 @@ enable_uart=1
 __EOF__
 		fi
 		;;
+		--gpu_mem_256=*|--gpu_mem_512=*|--gpu_mem_1024=*)
+		# Set GPU memory
+		gpu_mem="${1:2}"
+		sed -e "/^${gpu_mem%=*}=/s,=.*,=${gpu_mem##*=}," -i "${BINARIES_DIR}/rpi-firmware/config.txt"
+		;;
 	esac
 
 done
