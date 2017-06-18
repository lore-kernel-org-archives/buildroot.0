From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jun 2017 16:01:43 +0200
Subject: [Buildroot] [PATCH 2/4 v2] tools: move test-pkg out of
	support/scripts
In-Reply-To: <cover.1497794488.git.yann.morin.1998@free.fr>
References: <cover.1497794488.git.yann.morin.1998@free.fr>
Message-ID: <937e234aa28d4d11f676ce0c1437d2883cdd0f10.1497794488.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move it to the top-level tools/ directory, so that it is easier to
find for users.

Add a legacy symlink for those users who already used them, so as
not to break their habits.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 docs/manual/adding-packages-tips.txt |  12 +--
 support/scripts/test-pkg             | 198 +----------------------------------
 tools/00-README.txt                  |   5 +
 tools/test-pkg                       | 197 ++++++++++++++++++++++++++++++++++
 4 files changed, 209 insertions(+), 203 deletions(-)
 mode change 100755 => 120000 support/scripts/test-pkg
 create mode 100755 tools/test-pkg

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index d1eab2b440..0047dfd14f 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -45,9 +45,9 @@ continuously test random configurations. However, these only build the
 `master` branch of the git tree, and your new fancy package is not yet
 there.
 
-Buildroot provides a script in +support/scripts/test-pkg+ that uses the
-same base configurations as used by the autobuilders so you can test
-your package in the same conditions.
+Buildroot provides a script in +tools/test-pkg+ that uses the same base
+configurations as used by the autobuilders so you can test your package
+in the same conditions.
 
 First, create a config snippet that contains all the necessary options
 needed to enable your package, but without any architecture or toolchain
@@ -74,7 +74,7 @@ Then run the +test-pkg+ script, by telling it what config snippet to use
 and what package to test:
 
 ----
-$ ./support/scripts/test-pkg -c libcurl.config -p libcurl
+$ ./tools/test-pkg -c libcurl.config -p libcurl
 ----
 
 This will try to build your package against all the toolchains used
@@ -83,7 +83,7 @@ too long to do so). The output lists all toolchains and the corresponding
 result (excerpt, results are fake):
 
 ----
-$ ./support/scripts/test-pkg -c libcurl.config -p libcurl
+$ ./tools/test-pkg -c libcurl.config -p libcurl
                 armv5-ctng-linux-gnueabi [ 1/11]: OK
               armv7-ctng-linux-gnueabihf [ 2/11]: OK
                         br-aarch64-glibc [ 3/11]: SKIPPED
@@ -124,7 +124,7 @@ The +test-pkg+ script accepts a few options, for which you can get some
 help by running:
 
 ----
-$ ./support/scripts/test-pkg -h
+$ ./tools/test-pkg -h
 ----
 
 [[github-download-url]]
diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
deleted file mode 100755
index 7633a21e53..0000000000
--- a/support/scripts/test-pkg
+++ /dev/null
@@ -1,197 +0,0 @@
-#!/usr/bin/env bash
-set -e
-
-TOOLCHAINS_URL='http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv'
-
-main() {
-    local o O opts
-    local cfg dir pkg random toolchain
-    local ret nb nb_skip nb_fail nb_legal nb_tc build_dir
-    local -a toolchains
-
-    o='hc:d:p:r:'
-    O='help,config-snippet:build-dir:package:,random:'
-    opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
-    eval set -- "${opts}"
-
-    random=0
-    while [ ${#} -gt 0 ]; do
-        case "${1}" in
-        (-h|--help)
-            help; exit 0
-            ;;
-        (-c|--config-snippet)
-            cfg="${2}"; shift 2
-            ;;
-        (-d|--build-dir)
-            dir="${2}"; shift 2
-            ;;
-        (-p|--package)
-            pkg="${2}"; shift 2
-            ;;
-        (-r|--random)
-            random="${2}"; shift 2
-            ;;
-        (--)
-            shift; break
-            ;;
-        esac
-    done
-    if [ -z "${cfg}" ]; then
-        printf "error: no config snippet specified\n" >&2; exit 1
-    fi
-    if [ ! -e "${cfg}" ]; then
-        printf "error: %s: no such file\n" "${cfg}" >&2; exit 1
-    fi
-    if [ -z "${dir}" ]; then
-        dir="${HOME}/br-test-pkg"
-    fi
-
-    # Extract the URLs of the toolchains; drop internal toolchains
-    # E.g.: http://server/path/to/name.config,arch,libc
-    #  -->  http://server/path/to/name.config
-    toolchains=($(curl -s "${TOOLCHAINS_URL}" \
-                  |sed -r -e 's/,.*//; /internal/d;' \
-                  |if [ ${random} -gt 0 ]; then \
-                      sort -R |head -n ${random}
-                   else
-                      cat
-                   fi |sort
-                 )
-               )
-
-    nb_tc="${#toolchains[@]}"
-    if [ ${nb_tc} -eq 0 ]; then
-        printf "error: no toolchain found (networking issue?)\n" >&2; exit 1
-    fi
-
-    nb=0
-    nb_skip=0
-    nb_fail=0
-    nb_legal=0
-    for toolchainconfig in "${toolchains[@]}"; do
-        : $((nb++))
-        # Using basename(1) on a URL works nicely
-        toolchain="$(basename "${toolchainconfig}" .config)"
-        build_dir="${dir}/${toolchain}"
-        printf "%40s [%*d/%d]: " "${toolchain}" ${#nb_tc} ${nb} ${nb_tc}
-        build_one "${build_dir}" "${toolchainconfig}" "${cfg}" "${pkg}" && ret=0 || ret=${?}
-        case ${ret} in
-        (0) printf "OK\n";;
-        (1) : $((nb_skip++)); printf "SKIPPED\n";;
-        (2) : $((nb_fail++)); printf "FAILED\n";;
-        (3) : $((nb_legal++)); printf "FAILED\n";;
-        esac
-    done
-
-    printf "%d builds, %d skipped, %d build failed, %d legal-info failed\n" \
-        ${nb} ${nb_skip} ${nb_fail} ${nb_legal}
-}
-
-build_one() {
-    local dir="${1}"
-    local url="${2}"
-    local cfg="${3}"
-    local pkg="${4}"
-
-    mkdir -p "${dir}"
-
-    if ! curl -s "${url}" >"${dir}/.config"; then
-        return 2
-    fi
-
-    cat >>"${dir}/.config" <<-_EOF_
-	BR2_INIT_NONE=y
-	BR2_SYSTEM_BIN_SH_NONE=y
-	# BR2_PACKAGE_BUSYBOX is not set
-	# BR2_TARGET_ROOTFS_TAR is not set
-	_EOF_
-    cat "${cfg}" >>"${dir}/.config"
-
-    if ! make O="${dir}" olddefconfig > "${dir}/logfile" 2>&1; then
-        return 2
-    fi
-    # We want all the options from the snippet to be present as-is (set
-    # or not set) in the actual .config; if one of them is not, it means
-    # some dependency from the toolchain or arch is not available, in
-    # which case this config is untestable and we skip it.
-    # We don't care about the locale to sort in, as long as both sort are
-    # done in the same locale.
-    comm -23 <(sort "${cfg}") <(sort "${dir}/.config") >"${dir}/missing.config"
-    if [ -s "${dir}/missing.config" ]; then
-        return 1
-    fi
-    # Remove file, it's empty anyway.
-    rm -f "${dir}/missing.config"
-
-    if [ -n "${pkg}" ]; then
-        if ! make O="${dir}" "${pkg}-dirclean" >> "${dir}/logfile" 2>&1; then
-            return 2
-        fi
-    fi
-
-    # shellcheck disable=SC2086
-    if ! make O="${dir}" ${pkg} >> "${dir}/logfile" 2>&1; then
-        return 2
-    fi
-
-    # legal-info done systematically, because some packages have different
-    # sources depending on the configuration (e.g. lua-5.2 vs. lua-5.3)
-    if [ -n "${pkg}" ]; then
-        if ! make O="${dir}" "${pkg}-legal-info" >> "${dir}/logfile" 2>&1; then
-            return 3
-        fi
-    fi
-}
-
-help() {
-    cat <<_EOF_
-test-pkg: test-build a package against various toolchains and architectures
-
-The supplied config snippet is appended to each toolchain config, the
-resulting configuration is checked to ensure it still contains all options
-specified in the snippet; if any is missing, the build is skipped, on the
-assumption that the package under test requires a toolchain or architecture
-feature that is missing.
-
-In case failures are noticed, you can fix the package and just re-run the
-same command again; it will re-run the test where it failed. If you did
-specify a package (with -p), the package build dir will be removed first.
-
-The list of toolchains is retrieved from the Buildroot autobuilders, available
-at ${TOOLCHAINS_URL}.
-
-Options:
-
-    -h, --help
-        Print this help.
-
-    -c CFG, --config-snippet CFG
-        Use the CFG file as the source for the config snippet. This file
-        should contain all the config options required to build a package.
-
-    -d DIR, --build-dir DIR
-        Do the builds in directory DIR, one sub-dir per toolchain.
-
-    -p PKG, --package PKG
-        Test-build the package PKG, by running 'make PKG'; if not specified,
-        just runs 'make'.
-
-    -r N, --random N
-        Limit the tests to the N randomly selected toolchains, instead of
-        building with all toolchains.
-
-Example:
-
-    Testing libcec would require a config snippet that contains:
-        BR2_PACKAGE_LIBCEC=y
-
-    Testing libcurl with openSSL support would require a snippet such as:
-        BR2_PACKAGE_OPENSSL=y
-        BR2_PACKAGE_LIBCURL=y
-
-_EOF_
-}
-
-my_name="${0##*/}"
-main "${@}"
diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
new file mode 120000
index 0000000000..2acaa87478
--- /dev/null
+++ b/support/scripts/test-pkg
@@ -0,0 +1 @@
+../../tools/test-pkg
\ No newline@end of file
diff --git a/tools/00-README.txt b/tools/00-README.txt
index ffc0fbf5ef..092e0eac8e 100644
--- a/tools/00-README.txt
+++ b/tools/00-README.txt
@@ -7,3 +7,8 @@ brmake
     front of each line, redirects all of the build output to a file
     ("'br.log' in the current directory), and just ouputs the Buildroot
     messages (those lines starting with >>>) on stdout.
+
+test-pkg
+    a script that tests a specific package against a set of various
+    toolchains, with the goal to detect toolchain-related dependencies
+    (wchar, threads...)
diff --git a/tools/test-pkg b/tools/test-pkg
new file mode 100755
index 0000000000..7633a21e53
--- /dev/null
+++ b/tools/test-pkg
@@ -0,0 +1,197 @@
+#!/usr/bin/env bash
+set -e
+
+TOOLCHAINS_URL='http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv'
+
+main() {
+    local o O opts
+    local cfg dir pkg random toolchain
+    local ret nb nb_skip nb_fail nb_legal nb_tc build_dir
+    local -a toolchains
+
+    o='hc:d:p:r:'
+    O='help,config-snippet:build-dir:package:,random:'
+    opts="$(getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}")"
+    eval set -- "${opts}"
+
+    random=0
+    while [ ${#} -gt 0 ]; do
+        case "${1}" in
+        (-h|--help)
+            help; exit 0
+            ;;
+        (-c|--config-snippet)
+            cfg="${2}"; shift 2
+            ;;
+        (-d|--build-dir)
+            dir="${2}"; shift 2
+            ;;
+        (-p|--package)
+            pkg="${2}"; shift 2
+            ;;
+        (-r|--random)
+            random="${2}"; shift 2
+            ;;
+        (--)
+            shift; break
+            ;;
+        esac
+    done
+    if [ -z "${cfg}" ]; then
+        printf "error: no config snippet specified\n" >&2; exit 1
+    fi
+    if [ ! -e "${cfg}" ]; then
+        printf "error: %s: no such file\n" "${cfg}" >&2; exit 1
+    fi
+    if [ -z "${dir}" ]; then
+        dir="${HOME}/br-test-pkg"
+    fi
+
+    # Extract the URLs of the toolchains; drop internal toolchains
+    # E.g.: http://server/path/to/name.config,arch,libc
+    #  -->  http://server/path/to/name.config
+    toolchains=($(curl -s "${TOOLCHAINS_URL}" \
+                  |sed -r -e 's/,.*//; /internal/d;' \
+                  |if [ ${random} -gt 0 ]; then \
+                      sort -R |head -n ${random}
+                   else
+                      cat
+                   fi |sort
+                 )
+               )
+
+    nb_tc="${#toolchains[@]}"
+    if [ ${nb_tc} -eq 0 ]; then
+        printf "error: no toolchain found (networking issue?)\n" >&2; exit 1
+    fi
+
+    nb=0
+    nb_skip=0
+    nb_fail=0
+    nb_legal=0
+    for toolchainconfig in "${toolchains[@]}"; do
+        : $((nb++))
+        # Using basename(1) on a URL works nicely
+        toolchain="$(basename "${toolchainconfig}" .config)"
+        build_dir="${dir}/${toolchain}"
+        printf "%40s [%*d/%d]: " "${toolchain}" ${#nb_tc} ${nb} ${nb_tc}
+        build_one "${build_dir}" "${toolchainconfig}" "${cfg}" "${pkg}" && ret=0 || ret=${?}
+        case ${ret} in
+        (0) printf "OK\n";;
+        (1) : $((nb_skip++)); printf "SKIPPED\n";;
+        (2) : $((nb_fail++)); printf "FAILED\n";;
+        (3) : $((nb_legal++)); printf "FAILED\n";;
+        esac
+    done
+
+    printf "%d builds, %d skipped, %d build failed, %d legal-info failed\n" \
+        ${nb} ${nb_skip} ${nb_fail} ${nb_legal}
+}
+
+build_one() {
+    local dir="${1}"
+    local url="${2}"
+    local cfg="${3}"
+    local pkg="${4}"
+
+    mkdir -p "${dir}"
+
+    if ! curl -s "${url}" >"${dir}/.config"; then
+        return 2
+    fi
+
+    cat >>"${dir}/.config" <<-_EOF_
+	BR2_INIT_NONE=y
+	BR2_SYSTEM_BIN_SH_NONE=y
+	# BR2_PACKAGE_BUSYBOX is not set
+	# BR2_TARGET_ROOTFS_TAR is not set
+	_EOF_
+    cat "${cfg}" >>"${dir}/.config"
+
+    if ! make O="${dir}" olddefconfig > "${dir}/logfile" 2>&1; then
+        return 2
+    fi
+    # We want all the options from the snippet to be present as-is (set
+    # or not set) in the actual .config; if one of them is not, it means
+    # some dependency from the toolchain or arch is not available, in
+    # which case this config is untestable and we skip it.
+    # We don't care about the locale to sort in, as long as both sort are
+    # done in the same locale.
+    comm -23 <(sort "${cfg}") <(sort "${dir}/.config") >"${dir}/missing.config"
+    if [ -s "${dir}/missing.config" ]; then
+        return 1
+    fi
+    # Remove file, it's empty anyway.
+    rm -f "${dir}/missing.config"
+
+    if [ -n "${pkg}" ]; then
+        if ! make O="${dir}" "${pkg}-dirclean" >> "${dir}/logfile" 2>&1; then
+            return 2
+        fi
+    fi
+
+    # shellcheck disable=SC2086
+    if ! make O="${dir}" ${pkg} >> "${dir}/logfile" 2>&1; then
+        return 2
+    fi
+
+    # legal-info done systematically, because some packages have different
+    # sources depending on the configuration (e.g. lua-5.2 vs. lua-5.3)
+    if [ -n "${pkg}" ]; then
+        if ! make O="${dir}" "${pkg}-legal-info" >> "${dir}/logfile" 2>&1; then
+            return 3
+        fi
+    fi
+}
+
+help() {
+    cat <<_EOF_
+test-pkg: test-build a package against various toolchains and architectures
+
+The supplied config snippet is appended to each toolchain config, the
+resulting configuration is checked to ensure it still contains all options
+specified in the snippet; if any is missing, the build is skipped, on the
+assumption that the package under test requires a toolchain or architecture
+feature that is missing.
+
+In case failures are noticed, you can fix the package and just re-run the
+same command again; it will re-run the test where it failed. If you did
+specify a package (with -p), the package build dir will be removed first.
+
+The list of toolchains is retrieved from the Buildroot autobuilders, available
+at ${TOOLCHAINS_URL}.
+
+Options:
+
+    -h, --help
+        Print this help.
+
+    -c CFG, --config-snippet CFG
+        Use the CFG file as the source for the config snippet. This file
+        should contain all the config options required to build a package.
+
+    -d DIR, --build-dir DIR
+        Do the builds in directory DIR, one sub-dir per toolchain.
+
+    -p PKG, --package PKG
+        Test-build the package PKG, by running 'make PKG'; if not specified,
+        just runs 'make'.
+
+    -r N, --random N
+        Limit the tests to the N randomly selected toolchains, instead of
+        building with all toolchains.
+
+Example:
+
+    Testing libcec would require a config snippet that contains:
+        BR2_PACKAGE_LIBCEC=y
+
+    Testing libcurl with openSSL support would require a snippet such as:
+        BR2_PACKAGE_OPENSSL=y
+        BR2_PACKAGE_LIBCURL=y
+
+_EOF_
+}
+
+my_name="${0##*/}"
+main "${@}"
-- 
2.11.0
