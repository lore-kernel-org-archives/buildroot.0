From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 25 Oct 2016 15:01:39 -0500
Subject: [Buildroot] [PATCH] support/scripts: tool to create fragments
Message-ID: <1477425699-37971-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Sam Voss <samuel.voss@rockwellcollins.com>

Add script to create kconfig fragment; defaults to busybox fragment if
only one config is specified (compares to package/busybox/busybox.config).

Signed-off-by: Sam Voss <samuel.voss@rockwellcollins.com>
Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
 support/scripts/gen-config-fragment.sh | 59 ++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100755 support/scripts/gen-config-fragment.sh

diff --git a/support/scripts/gen-config-fragment.sh b/support/scripts/gen-config-fragment.sh
new file mode 100755
index 0000000..a8b5345
--- /dev/null
+++ b/support/scripts/gen-config-fragment.sh
@@ -0,0 +1,59 @@
+#!/bin/bash
+
+################################################################################
+# DESCRIPTION:
+#     Creates a fragment by comparing two kconfigs. Default usage creates a
+#       busybox fragment, however providing two config files will override this.
+#
+#     Required arguments:
+#       $1 - config #1. This is generally the new one created
+#
+#     Optional arguments:
+#       $2 - config #2: The configuration file to compare against. If none
+#            supplied, will compare against package/busybox/busybox.config
+################################################################################
+usage ()
+{
+use="gen-config-fragment.sh:
+    Creates a fragment by comparing two kconfigs. Default usage creates a
+      busybox fragment, however providing two config files will override this.
+
+    Required arguments:
+      $1 - config #1. This is generally the new one created
+
+    Optional arguments:
+      $2 - config #2: The configuration file to compare against. If none
+           supplied, will compare against package/busybox/busybox.config"
+        printf "$use"
+        exit 1
+}
+
+if [ -z "$1" ]; then
+        usage
+else
+        FirstConfig="$1"
+fi
+
+if [ -z "$2" ]; then
+        SecondConfig="package/busybox/busybox.config"
+else
+        SecondConfig="$2"
+fi
+
+loadedFirstConfig=()
+loadedSecondConfig=()
+while read line; do
+        if [[ ${line:0:1} != '#' ]] || [[ ${line:2:3} == 'BR2' ]]; then
+                loadedFirstConfig+=("${line// /_space_}")
+        fi
+done < $FirstConfig
+
+while read -r line; do
+        if [[ ${line:0:1} != '#' ]] || [[ ${line:2:3} == 'BR2' ]]; then
+                loadedSecondConfig+=("${line// /_space_}")
+        fi
+done < $SecondConfig
+
+
+D=($(comm -23 <(printf '%s\n' "${loadedFirstConfig[@]}" | sort -d) <(printf '%s\n' "${loadedSecondConfig[@]}" | sort -d)))
+printf '%s\n' "${D[@]//_space_/ }" > "$FirstConfig.fragment"
-- 
1.9.1
