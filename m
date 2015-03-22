From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2015 18:18:21 +0100
Subject: [Buildroot] [PATCH 2/3] support/maintainers: add support for
	autobuild results
In-Reply-To: <cover.1427044305.git.yann.morin.1998@free.fr>
References: <cover.1427044305.git.yann.morin.1998@free.fr>
Message-ID: <e256c9430c3a6d0005946031bcefcdcdebe48852.1427044305.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 support/scripts/check-maintainer | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/support/scripts/check-maintainer b/support/scripts/check-maintainer
index 0ca7136..1dae00b 100755
--- a/support/scripts/check-maintainer
+++ b/support/scripts/check-maintainer
@@ -1,20 +1,54 @@
 #!/usr/bin/env bash
 
+# Base URL for autobuild results
+ABO_BASE="http://autobuild.buildroot.org/results/"
+
 main() {
     local OPT OPTARGS
     local -a pkgs archs files rcpt
-    local pattern pkg arch file maintainer
+    local autobuild pattern pkg arch file maintainer
+    local pkg_url arch_url short_sha
 
-    while getopts :hp:a: OPT; do
+    while getopts :hp:a:b: OPT; do
         case "${OPT}" in
         h)  help; exit 0;;
         p)  pkgs+=( "${OPTARG}" );;
         a)  archs+=( "${OPTARG}" );;
+        b)  autobuild="${OPTARG}";;
         :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
         \?) error "unknown option '%s'\n" "${OPTARG}";;
         esac
     done
 
+    # Sanity check: can't have an autobuild url and either a package or an arch
+    if [ -n "${autobuild}" -a \( ${#pkgs[@]} -ne 0 -o ${#archs[@]} -ne 0 \) ]; then
+        error "Can not use an autobuild failure at the same time as a package or architcture\n"
+    fi
+
+    # For an autobuild failure, get the failing package and arch,
+    # and fake as if they were passed on the command line.
+    if [ -n "${autobuild}" ]; then
+        # If it starts with http:// then we consider this is an URL to
+        # an autobuild result directory, otherwise we consider it is the
+        # sha1 of a failed build.
+        if [[ "${autobuild}" =~ ^http:// ]]; then
+            pkg_url="${autobuild}/build-time.log"
+            arch_url="${autobuild}/config"
+        else
+            short_sha="${autobuild%${autobuild#???}}"
+            pkg_url="${ABO_BASE}/${short_sha}/${autobuild}/build-time.log"
+            arch_url="${ABO_BASE}/${short_sha}/${autobuild}/config"
+        fi
+        pkgs=( "$( curl -s "${pkg_url}" \
+                   |tail -n 1 |awk '{ print $(NF); }'
+                 )"
+             )
+        archs=( "$( curl -s "${arch_url}" \
+                    |sed -r -e '/^BR2_ARCH="(.+)"$/!d; s//\1/'
+                  )"
+              )
+    fi
+
     if [ "${#pkgs[@]}" -eq 0 -a "${#archs[@]}" -eq 0 ]; then
         # When no package and no arch specified, expect a patch from stdin
         # and extract files from that patch
-- 
1.9.1
