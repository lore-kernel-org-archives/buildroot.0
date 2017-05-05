From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri,  5 May 2017 17:30:29 -0300
Subject: [Buildroot] [PATCH 1/3] core: allow check-host-cmake.sh to check
	several candidates
In-Reply-To: <1494016231-50639-1-git-send-email-casantos@datacom.ind.br>
References: <1494016231-50639-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <1494016231-50639-2-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On CentOS 7 the "cmake" package installs cmake 2.8.12, which is too old
for us but the "cmake3" package (from EPEL) provides cmake 3.6.3, which
is good enough.

This change allows passing a list of candidates and the minimal version
to check-host-cmake.sh. Examples (on CentOS 7):

    $ sh support/dependencies/check-host-cmake.sh cmake cmake3 2.8
    /usr/bin/cmake

    $ sh support/dependencies/check-host-cmake.sh cmake cmake3 3.1
    /usr/bin/cmake3

    $ sh support/dependencies/check-host-cmake.sh cmake cmake3 3.8

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 support/dependencies/check-host-cmake.sh | 66 ++++++++++++++++----------------
 1 file changed, 34 insertions(+), 32 deletions(-)

diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
index 9b63b06..09ae8cc 100755
--- a/support/dependencies/check-host-cmake.sh
+++ b/support/dependencies/check-host-cmake.sh
@@ -1,39 +1,41 @@
 #!/bin/sh
 
-candidate="${1}"
-version_min="${2}"
+eval 'version_min="${'${#}'}"'
 
 major_min="${version_min%.*}"
 minor_min="${version_min#*.}"
 
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
-        echo "${cmake}"
-    else
-        # echo nothing: no suitable cmake found
-        exit 1
+while [ $# -gt 1 ]; do
+
+    cmake=`which "${1}" 2>/dev/null`
+
+    if [ -x "${cmake}" ]; then
+        # Extract version X.Y from versions in the form X.Y or X.Y.Z
+        # with X, Y and Z numbers with one or more digits each, e.g.
+        #   3.2     -> 3.2
+        #   3.2.3   -> 3.2
+        #   3.2.42  -> 3.2
+        #   3.10    -> 3.10
+        #   3.10.4  -> 3.10
+        #   3.10.42 -> 3.10
+        version="$(${cmake} --version \
+                   |sed -r -e '/.* ([[:digit:]]+\.[[:digit:]]+).*$/!d;' \
+                           -e 's//\1/'
+                  )"
+        major="${version%.*}"
+        minor="${version#*.}"
+
+        if [ ${major} -gt ${major_min} ]; then
+            echo "${cmake}"
+            exit
+        elif [ ${major} -eq ${major_min} -a ${minor} -ge ${minor_min} ]; then
+            echo "${cmake}"
+            exit
+        fi
     fi
-fi
+
+    shift
+done
+
+# echo nothing: no suitable cmake found
+exit 1
-- 
1.8.3.1
