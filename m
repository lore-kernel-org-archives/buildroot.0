From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Feb 2017 22:29:59 +0100
Subject: [Buildroot] [git commit] fakedate: new package
Message-ID: <20170207220536.3BDEC80DA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a268768c71ce1189f7a124dbe6869900a3ee3554
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

`date' is widely used by packages to include build information in their
binaries. Unfortunately, this is incompatible with BR2_REPRODUCIBLE.

Instead of having to identify all `date' invocations in the different
packages, this commit adds a small tool that allows to always return
the same date.

This work was sponsored by `BA Robotic Systems'.

[Peter: drop debugging print]
Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fakedate/fakedate    | 57 ++++++++++++++++++++++++++++++++++++++++++++
 package/fakedate/fakedate.mk | 15 ++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/package/fakedate/fakedate b/package/fakedate/fakedate
new file mode 100755
index 0000000..4a9b9b5
--- /dev/null
+++ b/package/fakedate/fakedate
@@ -0,0 +1,57 @@
+#!/bin/sh
+# vim: set sw=4 expandtab:
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+# General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+#
+# Copyright (C) 2016 J??r??me Pouiller <jezz@sysmic.org>
+#
+
+# Sanity check
+if ! readlink -f "$0" | grep -q fakedate; then
+    echo "fakedate: Please name this script \`fakedate'"
+    exit 1
+fi
+
+DATE_BIN=false
+# Do not call `date' directly since it will produce an infinite recursion.
+# Instead, find path of true `date' binary.
+for P in `echo $PATH | tr ':' ' '`; do
+    if [ -x "$P/date" ]; then
+        if readlink -f "$P/date" | grep -qv fakedate; then
+            DATE_BIN="$P/date"
+            break;
+        fi
+    fi
+done
+
+if [ -n "$SOURCE_DATE_EPOCH" ]; then
+    FORCE_EPOCH=1
+    for i in "$@"; do
+        # Use of --date, --file and --reference (and their short option counter
+        # parts) is incompatible with SOURCE_DATE_EPOCH.
+        # -u and -R are the only short options without argument. So they could
+        # appear between '-' and option we want to match.
+        if echo "$i" | grep -qE '^-([uR]*d|-date|[uR]*f|-file|[uR]*r|--reference)'; then
+            FORCE_EPOCH=0
+            break;
+        fi
+    done
+    if [ $FORCE_EPOCH -eq 1 ]; then
+        echo "date: Warning: using \$SOURCE_DATE_EPOCH instead of true time" >&2
+        exec $DATE_BIN -d "@$SOURCE_DATE_EPOCH" "$@"
+    fi
+fi
+
+exec $DATE_BIN "$@"
diff --git a/package/fakedate/fakedate.mk b/package/fakedate/fakedate.mk
new file mode 100644
index 0000000..61d4bd7
--- /dev/null
+++ b/package/fakedate/fakedate.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# fakedate
+#
+################################################################################
+
+# source included in buildroot
+HOST_FAKEDATE_LICENSE = GPLv2+
+
+define HOST_FAKEDATE_INSTALL_CMDS
+	$(INSTALL) -D -m 755 package/fakedate/fakedate $(HOST_DIR)/usr/bin/fakedate
+	ln -sfn fakedate $(HOST_DIR)/usr/bin/date
+endef
+
+$(eval $(host-generic-package))
