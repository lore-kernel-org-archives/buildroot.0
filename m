From: Robert J. Heywood <robert.heywood@codethink.co.uk>
Date: Tue, 29 Jan 2019 13:23:06 +0000
Subject: [Buildroot] [PATCH 5/8] board/raspberrypi: post-image --file option
In-Reply-To: <20190129132309.3455-1-robert.heywood@codethink.co.uk>
References: <20190129132309.3455-1-robert.heywood@codethink.co.uk>
Message-ID: <20190129132309.3455-6-robert.heywood@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a mechanism for adding files to the boot partition.

Usage: --file=example.txt
Signed-off-by: Robert J. Heywood <robert.heywood@codethink.co.uk>
---
 board/raspberrypi/post-image.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index c082dada3c..7e39399187 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -55,6 +55,9 @@ __EOF__
 		gpu_mem="${arg:2}"
 		sed -e "/^${gpu_mem%=*}=/s,=.*,=${gpu_mem##*=}," -i "${BINARIES_DIR}/rpi-firmware/config.txt"
 		;;
+		--file=*)
+		FILES+=("${arg:7}")
+		;;
 	esac
 
 done
@@ -81,7 +84,7 @@ fi
 
 for i in ${!FILES[*]}
 do
-	FILES[$i]="\"${FILES[$i]}\","
+	FILES[$i]=$(echo "\"${FILES[$i]}\"," | sed -e 's/[\/&]/\\&/g')
 done
 SEDCMD_BOOTFILES=" -e 's/{BOOT_FILES}/${FILES[*]}/' "
 
-- 
2.11.0
