From: Marcel Patzlaff <m.patzlaff@pilz.de>
Date: Mon, 30 Jul 2018 17:51:51 +0200
Subject: [Buildroot] [PATCH 1/3] Support script for defconfig comparison
In-Reply-To: <20180730155153.24091-1-m.patzlaff@pilz.de>
References: <20180730155153.24091-1-m.patzlaff@pilz.de>
Message-ID: <20180730155153.24091-2-m.patzlaff@pilz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a new support script that allows to compare two defconfigs and
to output the differences in a form such that it can be used as configuration
fragment.

The comparison is done in two steps:

1) Apply a plain "diff" on the two files (A and B) and collect all item names
   where diff sees a difference. This results in a list of newline separated
   item names.
2) For each item name in the list, the complete line out of the .config file
   derived from B is taken and written to stdout.

Signed-off-by: Marcel Patzlaff <m.patzlaff@pilz.de>
---
 utils/diff_defconfig.sh | 95 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100755 utils/diff_defconfig.sh

diff --git a/utils/diff_defconfig.sh b/utils/diff_defconfig.sh
new file mode 100755
index 0000000000..385e741813
--- /dev/null
+++ b/utils/diff_defconfig.sh
@@ -0,0 +1,95 @@
+#!/bin/sh
+
+#  diff_defconfig.sh - Takes two defconfig files A and B as well as the config
+#  file derived from B and outputs the differences that lead from A to B.
+#  The output can be used as configuration fragment.
+#  It is garanteed, that the output only contains configuration items that are
+#  present in either defconfig. So it's assumed, that all configuration items
+#  this script outputs are also user-settable.
+#
+#
+#  Copyright 2018 Pilz GmbH & Co. KG
+#
+#  This program is free software; you can redistribute it and/or modify
+#  it under the terms of the GNU General Public License version 2 as
+#  published by the Free Software Foundation.
+#
+#  This program is distributed in the hope that it will be useful,
+#  but WITHOUT ANY WARRANTY; without even the implied warranty of
+#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
+#  See the GNU General Public License for more details.
+
+set -e
+
+THIS_FILE=$(basename "${0}")
+
+USAGE="${THIS_FILE} [OPTIONS] <a.defconfig> <b.defconfig> <b.config>"
+
+fail_msg() {
+    printf "%s\n" "${1}" 1>&2
+    exit 1
+}
+
+help() {
+    cat <<-_EOF_
+	Usage:
+	    ${USAGE}
+
+	${THIS_FILE} takes two defconfig files A and B as well as the .config
+	file derived from B and outputs the differences that lead from A to B on
+	stdout. The output can be used as configuration fragment.
+
+	Options:
+	    -h   display this help text
+	    -p   do not restrict config prefix to CONFIG_
+
+	Returns:
+	    0    If no error
+	    !0   If any error
+	_EOF_
+}
+
+
+ALLPREFIXES=false
+# parse options
+while true; do
+    case "${1}" in
+        "-h")
+            help
+            exit 0
+        ;;
+        "-p")
+            ALLPREFIXES=true
+            shift
+        ;;
+        *)
+            break
+        ;;
+    esac
+done
+
+# check if all files are given
+[ "${#}" -eq "3" ] || fail_msg "Usage: ${USAGE}"
+
+# test if files exist
+[ -f "${1}" ] || fail_msg "First defconfig file '${1}' does not exist!"
+[ -f "${2}" ] || fail_msg "Second defconfig file '${2}' does not exist!"
+[ -f "${3}" ] || fail_msg "Config file '${3}' does not exist!"
+
+ITEM_EXP="s/^[<>]\s\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
+if [ "${ALLPREFIXES}" = "true" ]; then
+    ITEM_EXP="s/^[<>]\s\(# \)\{0,1\}\([a-zA-Z][a-zA-Z0-9_]*\)[= ].*/\2/p"
+fi
+
+# use normal diff and collect all differing item names
+ITEMS=$(diff "${1}" "${2}" | sed -n "${ITEM_EXP}" | sort | uniq)
+
+# output their values
+# Note: ITEMS does only contain newline separators and no other whitespaces.
+#       See regular expression above.
+for item in ${ITEMS}; do
+    # some items disable/hide others so grep may fail here
+    grep -w "${item}" "${3}" || true
+done
+
+exit 0
-- 
2.17.1

Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
We do care about the environment! - Please consider the environment before printing this e-mail.
