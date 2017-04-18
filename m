From: Etienne Phelip <etienne.phelip@savoirfairelinux.com>
Date: Tue, 18 Apr 2017 11:55:51 -0400
Subject: [Buildroot] [RFC 1/4] genimage.sh: fix argument parsing
In-Reply-To: <20170418155554.28732-1-etienne.phelip@savoirfairelinux.com>
References: <20170418155554.28732-1-etienne.phelip@savoirfairelinux.com>
Message-ID: <20170418155554.28732-2-etienne.phelip@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When executed as a post-image script, BR sets BINARIE_DIR as first
argument.

This first argument causes the option parsing to break.

This patch shifts the first argument before performing the getopts
loop.

	BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
	BR2_ROOTFS_POST_SCRIPT_ARGS="-c path/to/genimage.cfg"

Signed-off-by: Etienne Phelip <etienne.phelip@savoirfairelinux.com>
---
 support/scripts/genimage.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/scripts/genimage.sh b/support/scripts/genimage.sh
index 0ed0e8b..6684e73 100755
--- a/support/scripts/genimage.sh
+++ b/support/scripts/genimage.sh
@@ -7,6 +7,9 @@ die() {
 
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
+# First argument is BINARIES_DIR, skip it
+shift
+
 while getopts c: OPT ; do
 	case "${OPT}" in
 	c) GENIMAGE_CFG="${OPTARG}";;
-- 
2.9.3
