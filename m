From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:50:22 +0200
Subject: [Buildroot] [git commit] support/scripts: add generic genimage
	script
Message-ID: <20170401135040.03E38803EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9062dcdf6079b89cfb2a737eddabd6878141fb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This script is a wrapper for the genimage tool used by most boards.
The board postimage script can now call this script instead of invoking
genimage command themselves.

Signed-off-by: Etienne Phelip <etienne.phelip@savoirfairelinux.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/genimage.sh | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

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
