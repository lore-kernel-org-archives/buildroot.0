From: Etienne Phelip <etienne.phelip@savoirfairelinux.com>
Date: Wed, 29 Mar 2017 10:51:17 -0400
Subject: [Buildroot] [RFC 1/4] support/scripts: add generic genimage script
In-Reply-To: <20170329145120.11863-1-etienne.phelip@savoirfairelinux.com>
References: <20170329145120.11863-1-etienne.phelip@savoirfairelinux.com>
Message-ID: <20170329145120.11863-2-etienne.phelip@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This script is a wrapper for the genimage tool used by most boards.
The board postimage script can now call this script instead of invoking
genimage command themselves.

Signed-off-by: Etienne Phelip <etienne.phelip@savoirfairelinux.com>
---
 support/scripts/genimage.sh | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100755 support/scripts/genimage.sh

diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
new file mode 100755
index 0000000..0ed0e8b
--- /dev/null
+++ b/support/scripts/genimage.sh
@@ -0,0 +1,27 @@
+#!/bin/bash
+
+die() {
+  echo "Error: $@" >&2
+  exit 1
+}
+
+GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
+
+while getopts c: OPT ; do
+	case "${OPT}" in
+	c) GENIMAGE_CFG="${OPTARG}";;
+	:) die "option '${OPTARG}' expects a mandatory argument\n";;
+	\?) die "unknown option '${OPTARG}'\n";;
+	esac
+done
+
+[ -n "${GENIMAGE_CFG}" ] || die "Missing argument"
+
+rm -rf "${GENIMAGE_TMP}"
+
+genimage \
+	--rootpath "${TARGET_DIR}"     \
+	--tmppath "${GENIMAGE_TMP}"    \
+	--inputpath "${BINARIES_DIR}"  \
+	--outputpath "${BINARIES_DIR}" \
+	--config "${GENIMAGE_CFG}"
-- 
2.9.3
