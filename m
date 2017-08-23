From: Sam Voss <sam.voss@rockwellcollins.com>
Date: Wed, 23 Aug 2017 09:21:26 -0500
Subject: [Buildroot] [PATCH 1/1] Support: Config generation script
Message-ID: <1503498086-1593-1-git-send-email-sam.voss@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add script to create kconfig fragments that are directly usable.

- Sort commented out packages
- Output to stdout, must be redirected
- Add linux example

Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>

---

Relates to: https://patchwork.ozlabs.org/patch/686694/

Missing feature to combine all fragments used to create newest
configuration file, which can make it difficult to diff large fragment
sets. I was hoping to leverage buildroot's fragment combiner, but haven't
had a chance to look into it.
---
 support/scripts/diffconfig.sh | 75 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100755 support/scripts/diffconfig.sh

diff --git a/support/scripts/diffconfig.sh b/support/scripts/diffconfig.sh
new file mode 100755
index 0000000..59227ad
--- /dev/null
+++ b/support/scripts/diffconfig.sh
@@ -0,0 +1,75 @@
+#!/bin/bash
+
+################################################################################
+# DESCRIPTION:
+#     Creates a fragment by comparing two kconfigs.
+#
+#     Required arguments:
+#       $1 - config #1. This is generally the new one created
+#       $2 - config #2: The configuration file to compare against.
+#
+# Linux Example
+# ./support/scripts/diffconfig.sh <outputdir>/build/linux-x.y.z/defconfig
+#     board/custom-board/linux-x.y.z.config
+################################################################################
+
+usage ()
+{
+cat <<-_EOF_
+	diffconfig.sh:
+	Creates a fragment by comparing two kconfigs.
+
+	Required arguments:
+	$1 - config #1. This is generally the new one created
+	$2 - config #2: The configuration file to compare against.
+_EOF_
+
+    exit 1
+}
+
+if [ -z "$1" ] || [ -z "$2" ]; then
+        usage
+fi
+
+declare -a loaded_first_config loaded_second_config
+
+# spaces must be removed, and then re-replaced.
+SPACE_DELIM="_s_p_a_c_e_"
+
+while read line; do
+        if [ "${line:0:1}" != "#" ]; then
+                loaded_first_config+=("${line// /${SPACE_DELIM}}")
+        elif [ "${line:2:3}" = "BR2" ] || [ "${line:2:6}" = "CONFIG" ]; then
+                # was a commented line, but still needs alpha sorting
+                NOC="${line:2}"
+                loaded_first_config+=("${NOC// /${SPACE_DELIM}}")
+        fi
+done < "$1" # load file 1
+
+while read line; do
+        if [ "${line:0:1}" != "#" ]; then
+                loaded_second_config+=("${line// /${SPACE_DELIM}}")
+        elif [ "${line:2:3}" = "BR2" ] || [ "${line:2:6}" = "CONFIG" ]; then
+                # was a commented line, but still needs alpha sorting
+                NOC="${line:2}"
+                loaded_second_config+=("${NOC// /${SPACE_DELIM}}")
+        fi
+done < "$2" # load file 2
+
+D=($(comm -23 <(printf '%s\n' "${loaded_first_config[@]}" | sort -d) <(printf '%s\n' "${loaded_second_config[@]}" | sort -d)))
+
+# Earlier, the '# ' were removed from the beginning of not-set packages for
+#  sorting. Add them back.
+declare -a NFRAG
+
+for line in "${D[@]}"; do
+    # if the line does not have an '=', it was a comment
+    if [ "${line#*=*}" = "${line}" ]; then
+        NFRAG+=("# ${line}")
+    else
+        NFRAG+=($line)
+    fi
+done
+
+# Earlier, spaces were replaced with '_space_'. Revert this and dump to stdout.
+printf "%s\n" "${NFRAG[@]//${SPACE_DELIM}/ }"
-- 
1.9.1
