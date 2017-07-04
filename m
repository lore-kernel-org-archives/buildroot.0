From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 17:59:37 +0200
Subject: [Buildroot] [git commit] support/scripts: add relocate-sdk.sh
	script for SDK relocation
Message-ID: <20170704160233.40EE981975@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8ec29ef3e4eba720605487149d169df17d7dce5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It will install the script "relocate-sdk.sh" in the HOST_DIR
allowing to adjust the path to the SDK directory in all text
files after it has been moved to a new location.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
[Thomas:
 - Fix shebang to be /bin/sh instead of /bin/bash, suggested by Arnout
 - Use | instead of \ as a separator for sed expressions, suggested by
   Arnout, discussed with Wolfgang and others
 - Remove ./ at the beginning of LOCFILE, suggested by Arnout
 - Fix comment about the path check being made before doing the
   replacement, suggested by Arnout
 - Fix indentation, suggested by Arnout.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/misc/relocate-sdk.sh | 47 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/support/misc/relocate-sdk.sh b/support/misc/relocate-sdk.sh
new file mode 100755
index 0000000..2a9ebc9
--- /dev/null
+++ b/support/misc/relocate-sdk.sh
@@ -0,0 +1,47 @@
+#!/bin/sh
+#
+if [ "$#" -ne 0 ]; then
+    echo "Run this script to relocate the buildroot SDK at that location"
+    exit 1
+fi
+
+LOCFILE="usr/share/buildroot/sdk-location"
+FILEPATH="$(readlink -f "$0")"
+NEWPATH="$(dirname "${FILEPATH}")"
+
+cd "${NEWPATH}"
+if [ ! -r "${LOCFILE}" ]; then
+    echo "Previous location of the buildroot SDK not found!"
+    exit 1
+fi
+OLDPATH="$(cat "${LOCFILE}")"
+
+if [ "${NEWPATH}" = "${OLDPATH}" ]; then
+    echo "This buildroot SDK has already been relocated!"
+    exit 0
+fi
+
+# Check if the path substitution does work properly, e.g.  a tree
+# "/a/b/c" copied into "/a/b/c/a/b/c/" would not be allowed.
+newpath="$(sed -e "s|${OLDPATH}|${NEWPATH}|g" "${LOCFILE}")"
+if [ "${NEWPATH}" != "${newpath}" ]; then
+    echo "Something went wrong with substituting the path!"
+    echo "Please choose another location for your SDK!"
+    exit 1
+fi
+
+echo "Relocating the buildroot SDK from ${OLDPATH} to ${NEWPATH} ..."
+
+# Make sure file uses the right language
+export LC_ALL=C
+# Replace the old path with the new one in all text files
+while read -r FILE ; do
+    if file -b --mime-type "${FILE}" | grep -q '^text/' && [ "${FILE}" != "${LOCFILE}" ]
+    then
+        sed -i "s|${OLDPATH}|${NEWPATH}|g" "${FILE}"
+    fi
+done < <(grep -lr "${OLDPATH}" .)
+
+# At the very end, we update the location file to not break the
+# SDK if this script gets interruted.
+sed -i "s|${OLDPATH}|${NEWPATH}|g" ${LOCFILE}
