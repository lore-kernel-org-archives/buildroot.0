From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Sat, 23 Sep 2017 19:30:06 -0400
Subject: [Buildroot] [PATCH 2/3] raspberrypi: post-image.sh add new gpu_mem
	option
In-Reply-To: <20170923233007.13772-1-gael.portay@savoirfairelinux.com>
References: <20170923233007.13772-1-gael.portay@savoirfairelinux.com>
Message-ID: <20170923233007.13772-3-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The amount of GPU memory can be set using the new option --gpu_mem_XXX
(where XXX is the total amount of memory available on the board).

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 board/raspberrypi/post-image.sh | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index 1b49f0ea30..9091476ced 100755
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
 	shift
 done
-- 
2.13.2
