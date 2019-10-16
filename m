From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 16 Oct 2019 13:19:27 +0200
Subject: [Buildroot] [PATCH 4/4] support/dependencies: use a helper script
 for common checks
In-Reply-To: <20191016111927.14208-1-nolange79@gmail.com>
References: <20191016111927.14208-1-nolange79@gmail.com>
Message-ID: <20191016111927.14208-5-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 support/dependencies/check-host-cmake.sh | 47 +++---------------------
 support/dependencies/check-host-make.sh  | 39 +++-----------------
 support/dependencies/check-host-meson.sh | 44 ++--------------------
 support/dependencies/check-host-ninja.sh | 44 ++--------------------
 support/dependencies/versioncheck.sh     | 45 +++++++++++++++++++++++
 5 files changed, 61 insertions(+), 158 deletions(-)
 create mode 100755 support/dependencies/versioncheck.sh

diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
index fadeae9f6b..0699ddf571 100755
--- a/support/dependencies/check-host-cmake.sh
+++ b/support/dependencies/check-host-cmake.sh
@@ -1,45 +1,8 @@
 #!/bin/sh
 
-# prevent shift error
-[ $# -lt 2 ] && exit 1
+readversion() {
+	"$1" --version |
+		sed -r -e '/.* ([[:digit:]]+\.[[:digit:]]+).*$/!d;' -e 's//\1/'
+}
 
-major_min="${1%.*}"
-minor_min="${1#*.}"
-
-shift
-
-for candidate; do
-
-    # Try to locate the candidate. Discard it if not located.
-    cmake=`which "${candidate}" 2>/dev/null`
-    [ -n "${cmake}" ] || continue
-
-    # Extract version X.Y from versions in the form X.Y or X.Y.Z
-    # with X, Y and Z numbers with one or more digits each, e.g.
-    #   3.2     -> 3.2
-    #   3.2.3   -> 3.2
-    #   3.2.42  -> 3.2
-    #   3.10    -> 3.10
-    #   3.10.4  -> 3.10
-    #   3.10.42 -> 3.10
-    # Discard the candidate if no version can be obtained
-    version="$(${cmake} --version \
-               |sed -r -e '/.* ([[:digit:]]+\.[[:digit:]]+).*$/!d;' \
-                       -e 's//\1/'
-              )"
-    [ -n "${version}" ] || continue
-
-    major="${version%.*}"
-    minor="${version#*.}"
-
-    if [ ${major} -gt ${major_min} ]; then
-        echo "${cmake}"
-        exit
-    elif [ ${major} -eq ${major_min} -a ${minor} -ge ${minor_min} ]; then
-        echo "${cmake}"
-        exit
-    fi
-done
-
-# echo nothing: no suitable cmake found
-exit 1
+. "$(dirname "$(readlink -e "$0")")"/versioncheck.sh
diff --git a/support/dependencies/check-host-make.sh b/support/dependencies/check-host-make.sh
index 0de7e9f6fa..77bfc5123d 100755
--- a/support/dependencies/check-host-make.sh
+++ b/support/dependencies/check-host-make.sh
@@ -1,37 +1,8 @@
 #!/bin/sh
 
-# prevent shift error
-[ $# -lt 2 ] && exit 1
+readversion() {
+	"$1" --version 2>&1 |
+		sed -e 's/^.* \([0-9\.]\)/\1/g' -e 's/[-].*//g' -e '1q'
+}
 
-major_min="${1%.*}"
-minor_min="${1#*.}"
-
-shift
-
-# The host make program is already checked by dependencies.sh but we
-# want to check the version number even if Buildroot is able to use
-# GNU make >= 3.81 but some packages may require a more recent version.
-make="$1"
-
-# Output of 'make --version' examples:
-# GNU Make 4.2.1
-# GNU Make 4.0
-# GNU Make 3.81
-version=`$make --version 2>&1 | sed -e 's/^.* \([0-9\.]\)/\1/g' -e 's/[-\
-].*//g' -e '1q'`
-
-major=`echo "$version" | cut -d. -f1`
-minor=`echo "$version" | cut -d. -f2`
-
-if [ $major -lt $major_min ]; then
-	# echo nothing: no suitable make found
-	exit 1
-fi
-
-if [ $major -eq $major_min -a $minor -lt $minor_min ]; then
-	# echo nothing: no suitable make found
-	exit 1
-fi
-
-# valid
-echo $make
+. "$(dirname "$(readlink -e "$0")")"/versioncheck.sh
diff --git a/support/dependencies/check-host-meson.sh b/support/dependencies/check-host-meson.sh
index 62746822cc..bec7bf4505 100755
--- a/support/dependencies/check-host-meson.sh
+++ b/support/dependencies/check-host-meson.sh
@@ -1,45 +1,7 @@
 #!/bin/sh
 
-# prevent shift error
-[ $# -ge 2 ] && [ -n "$1" ] || exit 1
-
-split_version() {
-    local VARPREFIX
-    local NUMBERS
-    local major
-    local minor
-
-    VARPREFIX=$1
-    NUMBERS=$2
-
-    major=${NUMBERS%%\.*}
-    NUMBERS=${NUMBERS#$major}; NUMBERS=${NUMBERS#\.}
-    minor=${NUMBERS%%\.*}
-    NUMBERS=${NUMBERS#$minor}; NUMBERS=${NUMBERS#\.}
-
-    # ensure that missing values are 0
-    eval "${VARPREFIX}_major=\$major; ${VARPREFIX}_minor=\$((minor + 0)); ${VARPREFIX}_bugfix=\$((NUMBERS + 0));"
+readversion() {
+	"$1" --version
 }
 
-split_version req "$1"
-
-shift
-
-for candidate; do
-
-    # Try to locate the candidate. Discard it if not located.
-    tool=$(which "${candidate}" 2>/dev/null)
-    [ -n "${tool}" ] || continue
-
-    split_version cur "$("${tool}" --version)"
-
-    [ -n "${cur_major}" -a "${cur_major}" -ge "${req_major}" ] || continue
-    [ "${cur_major}" -gt "${req_major}" ] || [ "${cur_minor}" -ge "${req_minor}" ] || continue
-    [ "${cur_minor}" -gt "${req_minor}" ] || [ "${cur_bugfix}" -ge "${req_bugfix}" ] || continue
-
-    echo "${tool}"
-    exit
-done
-
-# echo nothing: no suitable tool found
-exit 1
+. "$(dirname "$(readlink -e "$0")")"/versioncheck.sh
diff --git a/support/dependencies/check-host-ninja.sh b/support/dependencies/check-host-ninja.sh
index 62746822cc..bec7bf4505 100755
--- a/support/dependencies/check-host-ninja.sh
+++ b/support/dependencies/check-host-ninja.sh
@@ -1,45 +1,7 @@
 #!/bin/sh
 
-# prevent shift error
-[ $# -ge 2 ] && [ -n "$1" ] || exit 1
-
-split_version() {
-    local VARPREFIX
-    local NUMBERS
-    local major
-    local minor
-
-    VARPREFIX=$1
-    NUMBERS=$2
-
-    major=${NUMBERS%%\.*}
-    NUMBERS=${NUMBERS#$major}; NUMBERS=${NUMBERS#\.}
-    minor=${NUMBERS%%\.*}
-    NUMBERS=${NUMBERS#$minor}; NUMBERS=${NUMBERS#\.}
-
-    # ensure that missing values are 0
-    eval "${VARPREFIX}_major=\$major; ${VARPREFIX}_minor=\$((minor + 0)); ${VARPREFIX}_bugfix=\$((NUMBERS + 0));"
+readversion() {
+	"$1" --version
 }
 
-split_version req "$1"
-
-shift
-
-for candidate; do
-
-    # Try to locate the candidate. Discard it if not located.
-    tool=$(which "${candidate}" 2>/dev/null)
-    [ -n "${tool}" ] || continue
-
-    split_version cur "$("${tool}" --version)"
-
-    [ -n "${cur_major}" -a "${cur_major}" -ge "${req_major}" ] || continue
-    [ "${cur_major}" -gt "${req_major}" ] || [ "${cur_minor}" -ge "${req_minor}" ] || continue
-    [ "${cur_minor}" -gt "${req_minor}" ] || [ "${cur_bugfix}" -ge "${req_bugfix}" ] || continue
-
-    echo "${tool}"
-    exit
-done
-
-# echo nothing: no suitable tool found
-exit 1
+. "$(dirname "$(readlink -e "$0")")"/versioncheck.sh
diff --git a/support/dependencies/versioncheck.sh b/support/dependencies/versioncheck.sh
new file mode 100755
index 0000000000..e606da87e4
--- /dev/null
+++ b/support/dependencies/versioncheck.sh
@@ -0,0 +1,45 @@
+#!/bin/sh
+
+# prevent shift error
+[ $# -ge 2 ] && [ -n "$1" ] || exit 1
+
+split_version() {
+	local VARPREFIX
+	local NUMBERS
+	local major
+	local minor
+
+	VARPREFIX=$1
+	NUMBERS=$2
+
+	major=${NUMBERS%%\.*}
+	NUMBERS=${NUMBERS#$major}; NUMBERS=${NUMBERS#\.}
+	minor=${NUMBERS%%\.*}
+	NUMBERS=${NUMBERS#$minor}; NUMBERS=${NUMBERS#\.}
+
+	# ensure that missing values are 0
+	eval "${VARPREFIX}_major=\$major; ${VARPREFIX}_minor=\$((minor + 0)); ${VARPREFIX}_bugfix=\$((NUMBERS + 0));"
+}
+
+split_version req "$1"
+
+shift
+
+for candidate; do
+
+	# Try to locate the candidate. Discard it if not located.
+	tool=$(which "${candidate}" 2>/dev/null)
+	[ -n "${tool}" ] || continue
+
+	split_version cur "$(readversion "${tool}")"
+
+	[ -n "${cur_major}" -a "${cur_major}" -ge "${req_major}" ] || continue
+	[ "${cur_major}" -gt "${req_major}" ] || [ "${cur_minor}" -ge "${req_minor}" ] || continue
+	[ "${cur_minor}" -gt "${req_minor}" ] || [ "${cur_bugfix}" -ge "${req_bugfix}" ] || continue
+
+	echo "${tool}"
+	exit
+done
+
+# echo nothing: no suitable tool found
+exit 1
-- 
2.23.0
