From: Biagio Montaruli <biagio.hkr@gmail.com>
Date: Wed, 10 Aug 2016 13:06:04 +0200
Subject: [Buildroot] [PATCH 08/11] Add post-build.sh script for Aria G25
In-Reply-To: <1470827167-9426-1-git-send-email-biagio.hkr@gmail.com>
References: <1470827167-9426-1-git-send-email-biagio.hkr@gmail.com>
Message-ID: <1470827167-9426-10-git-send-email-biagio.hkr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add post build script for Aria G25 in order to organize
AT91bootstrap files after building and to make the final
binary file used to boot Aria board

Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>
---
 board/acmesystems/aria-g25/post-build.sh | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100755 board/acmesystems/aria-g25/post-build.sh

diff --git a/board/acmesystems/aria-g25/post-build.sh b/board/acmesystems/aria-g25/post-build.sh
new file mode 100755
index 0000000..b666039
--- /dev/null
+++ b/board/acmesystems/aria-g25/post-build.sh
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+if [ -e ${BINARIES_DIR}/at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.8.5.bin ]; then 
+	if [ -e ${BINARIES_DIR}/boot.bin ]; then
+		mkdir ${BINARIES_DIR}/aria-at91bootstrap
+		mv ${BINARIES_DIR}/*.bin ${BINARIES_DIR}/aria-at91bootstrap
+		cp -v ${BINARIES_DIR}/aria-at91bootstrap/at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.8.5.bin ${BINARIES_DIR}/boot.bin
+	else
+		mv ${BINARIES_DIR}/at91sam9x5_aria-sdcardboot-linux-zimage-dt-3.8.5.bin ${BINARIES_DIR}/boot.bin
+	fi
+else
+	echo "Cannot find the AT91bootstrap image for Aria-G25"
+fi
+
-- 
2.7.4
