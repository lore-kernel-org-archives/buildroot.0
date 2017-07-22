From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 14:35:55 +0200
Subject: [Buildroot] [git commit] support/scripts/fix-rpath: check if the
	patchelf utility is executable
Message-ID: <20170722123439.D0A1C8028A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17dd0d49da96e8043ed244a480de0a48b0b116fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
