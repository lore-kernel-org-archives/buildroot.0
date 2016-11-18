From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 18 Nov 2016 10:10:18 +0100
Subject: [Buildroot] [PATCH v2 09/15] fakedate: new package
In-Reply-To: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
Message-ID: <1479460224-6119-10-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

`date' is widely used by packages to include build information in their
binaries. Unfortunately, this is incompatible with  BR2_REPRODUCIBLE.

Instead to find all `date' invocation in build process, we add small tool
allowing to alway return same date.

This work was sponsored by `BA Robotic Systems'.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/fakedate/fakedate    | 28 ++++++++++++++++++++++++++++
 package/fakedate/fakedate.mk | 14 ++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100755 package/fakedate/fakedate
 create mode 100644 package/fakedate/fakedate.mk

diff --git a/package/fakedate/fakedate b/package/fakedate/fakedate
new file mode 100755
index 0000000..2eded22
--- /dev/null
+++ b/package/fakedate/fakedate
@@ -0,0 +1,28 @@
+#!/bin/sh
+# vim: set sw=4 expandtab:
+#
+# Licence: GPL
+# Created: 2016-11-04 16:31:18+01:00
+# Main authors:
+#     - J?r?me Pouiller <jezz@sysmic.org>
+#
+
+PATH=/bin:/usr/bin
+LOG=/dev/null
+if [ -n "$SOURCE_DATE_EPOCH" ]; then
+    INHIBIT=0
+    for i in "$@"; do
+        case $i in
+        -d|-[!-]*d|--date=*|-f|-[!-]*f|--file=*)
+            INHIBIT=1
+            ;;
+        esac
+    done
+    if [ $INHIBIT -eq 0 ]; then
+        echo "date: Warning: using \$SOURCE_DATE_EPOCH instead of true time" >&2
+        echo "Catch call to date from `pwd` with parameters: '$@'" >> $LOG
+        exec date -d "@$SOURCE_DATE_EPOCH" "$@"
+    fi
+fi
+
+exec date "$@"
diff --git a/package/fakedate/fakedate.mk b/package/fakedate/fakedate.mk
new file mode 100644
index 0000000..e81ce5d
--- /dev/null
+++ b/package/fakedate/fakedate.mk
@@ -0,0 +1,14 @@
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
+	$(INSTALL) -D -m 755 package/fakedate/fakedate $(HOST_DIR)/usr/bin/date
+endef
+
+$(eval $(host-generic-package))
-- 
1.9.1
