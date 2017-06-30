From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Jun 2017 23:50:05 +0200
Subject: [Buildroot] [PATCH 1/8 v3] tools: add a directory to store some
	useful user-facing tools
In-Reply-To: <cover.1498859395.git.yann.morin.1998@free.fr>
References: <cover.1498859395.git.yann.morin.1998@free.fr>
Message-ID: <318abf359fe6708061165ffe829ac1d5c5e2d2c4.1498859395.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a tools directory to store useful little scripts, tools, etc...
Users may add that directory in their PATH if they want to, but this
is not mandatory.

Add the first tool: brmake, a small script that redirects the build
output log to a file, keeping just Buildroot's own messages, with the
date+time added at the start of the line.

We need to unbuffer the output of make so that, when the script is
interrupted (SIGINT, ^C), there is no lingering output not yet digested
by the logger loop.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>

---
Changes v2 -> v3:
  - detect unconfigured build tree  (Ricardo)
  - rename 00-README -> readme.txt  (Thomas, Arnout)

Changes v1 -> v2:
  - rename contrib -> tools  (Arnout)
  - detect missing unbuffer  (Arnout)

Notes:
  - Arnout suggested using 'stdbuf' instead of 'unbuffer', but that has
    some shortcomings in weird corner-cases because it uses LD_PRELOAD
    to call a constructor that forces settings on stdout/stderr/stdin
    (it cost me three days to investigate a build failure because of
    that). So, I stuck with 'unbuffer'...
  - I also tried to use bash' coproc, but it seems there was a
    regression in later bash versions that causes an incorrect
    redirect. So, I stuck with 'unbuffer'...
---
 docs/manual/writing-rules.txt |  5 ++--
 tools/brmake                  | 62 +++++++++++++++++++++++++++++++++++++++++++
 tools/readme.txt              |  9 +++++++
 3 files changed, 74 insertions(+), 2 deletions(-)
 create mode 100755 tools/brmake
 create mode 100644 tools/readme.txt

diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index 3a2c8dcb37..c144874a0d 100644
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
index 0000000000..36e2374207
--- /dev/null
+++ b/tools/brmake
@@ -0,0 +1,62 @@
+#!/bin/bash
+# (C) 2016, "Yann E. MORIN" <yann.morin.1998@free.fr>
+# License: WTFPL, https://spdx.org/licenses/WTFPL.html
+
+main() {
+    local found ret start d h m mf cdir odir
+
+    if ! which unbuffer >/dev/null 2>&1; then
+        printf "you need to install 'unbuffer' (from package expect or expect-dev)\n" >&2
+        exit 1
+    fi
+
+    # Crude parsing to find the directory with the .config
+    # and catch any configurator
+    found=false
+    for i in "${@}"; do
+        ${found} && { cdir="${i}"; found=false; continue; }
+        case "${i}" in
+        (-C|--directory)    found=true;;
+        (-C*)               cdir="${i#-C}";;
+        (--directory=*)     cdir="${i#--directory}";;
+        (O=*)               odir="${i#O=}";;
+        # Other configurators are either non-interactive, or graphical
+        # apps, so their stdout can safely be redirected.
+        (config|menuconfig|nconfig|oldconfig)
+            printf "you can't use brmake for '%s'\n" "${i}" >&2
+            exit 1
+            ;;
+        esac
+    done
+    # We favour O= if specified, then -C, and fallback to cwd.
+    dir="${odir:-${cdir:-$(pwd)}}"
+    if [ ! -e "${dir}/.config" ]; then
+        # No .config, don't log as we need a terminal for menuconfig
+        exec make "${@}"
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
new file mode 100644
index 0000000000..49e08d4f31
--- /dev/null
+++ b/tools/readme.txt
@@ -0,0 +1,9 @@
+This directory contains various useful scripts and tools for working
+with Buildroot. You need not add this directory in your PATH to use
+any of those tools, but you may do so if you want.
+
+brmake
+    a script that can be run instead of make, that prepends the date in
+    front of each line, redirects all of the build output to a file
+    ("'br.log' in the current directory), and just outputs the Buildroot
+    messages (those lines starting with >>>) on stdout.
-- 
2.11.0
