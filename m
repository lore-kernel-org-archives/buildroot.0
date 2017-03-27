From: Phelip Etienne <etienne.phelip@savoirfairelinux.com>
Date: Mon, 27 Mar 2017 12:47:29 -0400
Subject: [Buildroot] [PATCH 1/2] support/scripts: add generic genimage script
In-Reply-To: <20170327164730.16271-1-etienne.phelip@savoirfairelinux.com>
References: <20170327164730.16271-1-etienne.phelip@savoirfairelinux.com>
Message-ID: <20170327164730.16271-2-etienne.phelip@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This script is a wrapper for the genimage tool used by most boards.
The board postimage script can now call this script instead of invoking
genimage command themselves.

Signed-off-by: Phelip Etienne <etienne.phelip@savoirfairelinux.com>
---
 support/scripts/genimage.sh | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 support/scripts/genimage.sh

diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
new file mode 100644
index 0000000..134fc98
--- /dev/null
+++ b/support/scripts/genimage.sh
@@ -0,0 +1,26 @@
+#!/bin/sh
+
+usage() {
+  echo "Usage: genimage.sh GENIMAGE_CFG"
+}
+
+# Exit if argument is missing
+if [ ! -n "$1" ]; then
+  usage >&2
+  echo "Error: Invalid argument!" >&2
+  exit 1
+fi
+
+GENIMAGE_CFG=$1
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage  \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
+
+exit $?
-- 
2.9.3
