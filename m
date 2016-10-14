From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 14 Oct 2016 16:24:36 +0200
Subject: [Buildroot] [PATCH] contrib: add a directory to store "contrib"
	stuff
Message-ID: <1476455076-20590-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add acontrib directory to store useful little scripts, tools, etc...
but that can't really be part of Buildroot.

Add the first contribution: brmake, a small script that redirects the
build output log to a file, keeping just Buildroot's own messages, with
the date+time added at the start of the line.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 contrib/00-README.txt |  8 ++++++++
 contrib/brmake        | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 contrib/00-README.txt
 create mode 100755 contrib/brmake

diff --git a/contrib/00-README.txt b/contrib/00-README.txt
new file mode 100644
index 0000000..ab1548f
--- /dev/null
+++ b/contrib/00-README.txt
@@ -0,0 +1,8 @@
+This directory contains various useful scripts and tools
+that were contributed, but that do not rellay belong to
+the core Buildroot.
+
+brmake
+    a script that can be run instead of make, that redirects all of the
+    build output to a file, keeping the Buidlroot messages (those lines
+    starting with >>>) and prepend the date in front of each.
diff --git a/contrib/brmake b/contrib/brmake
new file mode 100755
index 0000000..4ae2dc8
--- /dev/null
+++ b/contrib/brmake
@@ -0,0 +1,32 @@
+#!/bin/bash
+# (C) 2016, "Yann E. MORIN" <yann.morin.1998@free.fr>
+# License: WTFPLv2, https://spdx.org/licenses/WTFPL.html
+
+main() {
+    local ret start d h m mf fs
+
+    start=${SECONDS}
+
+    ( exec 2>&1; unbuffer make "${@}"; ) \
+    > >( while read line; do
+             printf "%(%Y-%m-%dT%H:%M:%S)T %s\n" -1 "${line}"
+         done \
+         |tee -a br.log \
+         |grep --colour=never -E '>>>'
+       )
+    ret=${?}
+
+    d=$((SECONDS-start))
+    printf "Done in "
+    h=$((d/3600))
+    d=$((d%3600))
+    [ ${h} -eq 0 ] || { printf "%dh " ${h}; mf="02"; }
+    m=$((d/60))
+    d=$((d%60))
+    [ ${m} -eq 0 ] || { printf "%${mf}dmin " ${m}; sf="02"; }
+    printf "%${sf}ds\n" ${d}
+
+    return ${ret}
+}
+
+main "${@}"
-- 
2.7.4
