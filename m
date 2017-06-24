From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Jun 2017 21:25:45 +0200
Subject: [Buildroot] [git commit] core: allow check-host-cmake.sh to try
	several candidates
Message-ID: <20170624193647.9C482817B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cacc6d0b610f69a6af5f8a5b2af0032964e20973
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is useful on CentOS 7 whose "cmake" package provides cmake 2.8.12,
which is too old, but the "cmake3" package (from EPEL) provides version
3.6.3, which is satisfactory. Examples:

    $ sh support/dependencies/check-host-cmake.sh 2.8 cmake cmake3
    /usr/bin/cmake

    $ sh support/dependencies/check-host-cmake.sh 3.1 cmake cmake3
    /usr/bin/cmake3

    $ sh support/dependencies/check-host-cmake.sh 3.8 cmake cmake3
    (nothing)

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/check-host-cmake.sh | 76 +++++++++++++++++---------------
 1 file changed, 41 insertions(+), 35 deletions(-)

diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
index 73bd4ed..fadeae9 100755
--- a/support/dependencies/check-host-cmake.sh
+++ b/support/dependencies/check-host-cmake.sh
@@ -1,39 +1,45 @@
 #!/bin/sh
 
-version_min="${1}"
-candidate="${2}"
-
-major_min="${version_min%.*}"
-minor_min="${version_min#*.}"
-
-cmake=`which ${candidate}`
-if [ ! -x "${cmake}" ]; then
-    # echo nothing: no suitable cmake found
-    exit 1
-fi
-
-# Extract version X.Y from versions in the form X.Y or X.Y.Z
-# with X, Y and Z numbers with one or more digits each, e.g.
-#   3.2     -> 3.2
-#   3.2.3   -> 3.2
-#   3.2.42  -> 3.2
-#   3.10    -> 3.10
-#   3.10.4  -> 3.10
-#   3.10.42 -> 3.10
-version="$(${cmake} --version \
-           |sed -r -e '/.* ([[:digit:]]+\.[[:digit:]]+).*$/!d;' \
-                   -e 's//\1/'
-          )"
-major="${version%.*}"
-minor="${version#*.}"
-
-if [ ${major} -gt ${major_min} ]; then
-    echo "${cmake}"
-else
-    if [ ${major} -eq ${major_min} -a ${minor} -ge ${minor_min} ]; then
+# prevent shift error
+[ $# -lt 2 ] && exit 1
+
+major_min="${1%.*}"
+minor_min="${1#*.}"
+
+shift
+
+for candidate; do
+
+    # Try to locate the candidate. Discard it if not located.
+    cmake=`which "${candidate}" 2>/dev/null`
+    [ -n "${cmake}" ] || continue
+
+    # Extract version X.Y from versions in the form X.Y or X.Y.Z
+    # with X, Y and Z numbers with one or more digits each, e.g.
+    #   3.2     -> 3.2
+    #   3.2.3   -> 3.2
+    #   3.2.42  -> 3.2
+    #   3.10    -> 3.10
+    #   3.10.4  -> 3.10
+    #   3.10.42 -> 3.10
+    # Discard the candidate if no version can be obtained
+    version="$(${cmake} --version \
+               |sed -r -e '/.* ([[:digit:]]+\.[[:digit:]]+).*$/!d;' \
+                       -e 's//\1/'
+              )"
+    [ -n "${version}" ] || continue
+
+    major="${version%.*}"
+    minor="${version#*.}"
+
+    if [ ${major} -gt ${major_min} ]; then
         echo "${cmake}"
-    else
-        # echo nothing: no suitable cmake found
-        exit 1
+        exit
+    elif [ ${major} -eq ${major_min} -a ${minor} -ge ${minor_min} ]; then
+        echo "${cmake}"
+        exit
     fi
-fi
+done
+
+# echo nothing: no suitable cmake found
+exit 1
