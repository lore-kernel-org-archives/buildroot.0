From: Wolfgang Grandegger <wg@grandegger.com>
Date: Sat, 22 Jul 2017 13:15:41 +0200
Subject: [Buildroot] [PATCH v10 2/3] support/scripts/fix-rpath: check if the
	patchelf utility is executable
In-Reply-To: <1500722142-20420-1-git-send-email-wg@grandegger.com>
References: <1500722142-20420-1-git-send-email-wg@grandegger.com>
Message-ID: <1500722142-20420-3-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/scripts/fix-rpath | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/support/scripts/fix-rpath b/support/scripts/fix-rpath
index f7c70b7..f92e601 100755
--- a/support/scripts/fix-rpath
+++ b/support/scripts/fix-rpath
@@ -45,6 +45,9 @@ Environment:
 
     TOOLCHAIN_EXTERNAL_DOWNLOAD_INSTALL_DIR
                  (default HOST_DIR/opt/ext-toolchain)
+
+Returns:         0 if success or 1 in case of error
+
 EOF
 }
 
@@ -60,6 +63,11 @@ main() {
     local find_args=( )
     local sanitize_extra_args=( )
 
+    if ! "${PATCHELF}" --version > /dev/null 2>&1; then
+	echo "Error: can't execute patchelf utility '${PATCHELF}'"
+	exit 1
+    fi
+
     case "${tree}" in
         host)
             rootdir="${HOST_DIR}"
-- 
1.9.1
