From: Wolfgang Grandegger <wg@grandegger.com>
Date: Thu, 23 Mar 2017 08:54:49 +0100
Subject: [Buildroot] [RFC PATCH v3 06/10] support/scripts: add
	reloacte-sdk.sh script for SDK relocation
In-Reply-To: <1490255693-9134-1-git-send-email-wg@grandegger.com>
References: <1490255693-9134-1-git-send-email-wg@grandegger.com>
Message-ID: <1490255693-9134-7-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It will install the script "relocate-sdk.sh" in the HOST_DIR
allowing to adjust the path to the SDK directory in all text
files after it has been moved to a new location.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 support/misc/relocate-sdk.sh | 47 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100755 support/misc/relocate-sdk.sh

diff --git a/support/misc/relocate-sdk.sh b/support/misc/relocate-sdk.sh
new file mode 100755
index 0000000..1b0be33
--- /dev/null
+++ b/support/misc/relocate-sdk.sh
@@ -0,0 +1,47 @@
+#!/bin/bash
+#
+if [ "$#" -ne 0 ]; then
+    echo "Run this script to relocate the buildroot SDK at that location"
+    exit 1
+fi
+
+LOCFILE="./usr/share/buildroot/sdk-location"
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
+# Check if the path substitution does work properly, e.g.
+# a tree "/a/b/c" copied into "/a/b/c/" would not be allowed.
+newpath="$(sed -e "s\\${OLDPATH}\\${NEWPATH}\\g" "${LOCFILE}")"
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
+	sed -i "s\\${OLDPATH}\\${NEWPATH}\\g" "${FILE}"
+    fi;
+done < <(grep -lr "${OLDPATH}" .)
+
+# At the very end, we update the location file to not break the
+# SDK if this script gets interruted.
+sed -i "s\\${OLDPATH}\\${NEWPATH}\\g" ${LOCFILE}
-- 
1.9.1
