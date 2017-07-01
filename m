From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 17:56:11 +0200
Subject: [Buildroot] [git commit] tools: new tool to filter the output of
	make
Message-ID: <20170701160503.B79CE7FAEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=afdb545b2847d2a922ee202775998d4658900fec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add brmake, a small script that redirects the build output log to a
file, keeping just Buildroot's own messages, with the date+time added
at the start of the line.

We need to unbuffer the output of make so that, when the script is
interrupted (SIGINT, ^C), there is no lingering output not yet digested
by the logger loop.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/writing-rules.txt |  5 +++--
 tools/brmake                  | 37 +++++++++++++++++++++++++++++++++++++
 tools/readme.txt              |  9 +++++++++
 3 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index 3a2c8dc..c144874 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -146,5 +146,6 @@ syntax, refer to http://www.methods.co.nz/asciidoc/userguide.html[].
 
 === Support scripts
 
-Some scripts in the +support/+ directory are written in Python and should follow
-the https://www.python.org/dev/peps/pep-0008/[PEP8 Style Guide for Python Code].
+Some scripts in the +support/+ and +tools/+ directories are written in
+Python and should follow the
+https://www.python.org/dev/peps/pep-0008/[PEP8 Style Guide for Python Code].
diff --git a/tools/brmake b/tools/brmake
new file mode 100755
index 0000000..3c6f848
--- /dev/null
+++ b/tools/brmake
@@ -0,0 +1,37 @@
+#!/bin/bash
+# (C) 2016, "Yann E. MORIN" <yann.morin.1998@free.fr>
+# License: WTFPL, https://spdx.org/licenses/WTFPL.html
+
+main() {
+    local found ret start d h m mf
+
+    if ! which unbuffer >/dev/null 2>&1; then
+        printf "you need to install 'unbuffer' (from package expect or expect-dev)\n" >&2
+        exit 1
+    fi
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
diff --git a/tools/readme.txt b/tools/readme.txt
index 9484333..a90805f 100644
--- a/tools/readme.txt
+++ b/tools/readme.txt
@@ -2,6 +2,15 @@ This directory contains various useful scripts and tools for working
 with Buildroot. You need not add this directory in your PATH to use
 any of those tools, but you may do so if you want.
 
+brmake
+    a script that can be run instead of make, that prepends the date in
+    front of each line, redirects all of the build output to a file
+    ("'br.log' in the current directory), and just outputs the Buildroot
+    messages (those lines starting with >>>) on stdout.
+    Do not run this script for interactive configuration (e.g. menuconfig)
+    or on an unconfigured directory. The output is redirected so you will see
+    nothing.
+
 check-package
     a script that checks the coding style of a package's Config.in and
     .mk files, and also tests them for various types of typoes.
