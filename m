From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  7 Feb 2017 14:52:57 +0100
Subject: [Buildroot] [PATCH 1/4] support/scripts: add script to test a
	package
In-Reply-To: <cover.1486475561.git.yann.morin.1998@free.fr>
References: <cover.1486475561.git.yann.morin.1998@free.fr>
Message-ID: <d1a206971ebad3baa346e54205fb4f198d979aa7.1486475561.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This script helps in testing that a pacakge builds fine on a wide range
of architectures and toolchains: BE/LE, 32/64-bit, musl/glibc/uclibc...

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[yann.morin.1998 at free.fr:
 - completely rewrite the script from Thomas, with help from Luca
]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 support/scripts/test-pkg | 164 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)
 create mode 100755 support/scripts/test-pkg

diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
new file mode 100755
index 0000000..daebe62
--- /dev/null
+++ b/support/scripts/test-pkg
@@ -0,0 +1,164 @@
+#!/bin/bash
+set -e
+
+TOOLCHAINS_BASE_URL='http://autobuild.buildroot.org/toolchains/configs'
+
+main() {
+    local o O opts
+    local cfg dir pkg toolchain
+    local -a toolchains
+
+    o='hc:d:p:'
+    O='help,config-snippet:build-dir:package:'
+    opts="$( getopt -n "${my_name}" -o "${o}" -l "${O}" -- "${@}"  )"
+    eval set -- "${opts}"
+
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
+        (--)
+            shift; break
+            ;;
+        esac
+    done
+    if [ -z "${cfg}" ]; then
+        printf "error: no config snippet specified\n" >&2; exit 1
+    fi
+    if [ -z "${dir}" ]; then
+        dir="${HOME}/br-test-pkg"
+    fi
+
+    # Extract the names of the toolchains
+    # http://server/path/to/name.config,arch,libc  -->  name
+    toolchains=( $( curl -s "${TOOLCHAINS_BASE_URL}/toolchain-configs.csv" \
+                    |sed -r -e 's/,.*//; s:.*/(.*)\.config:\1:; /internal/d;'
+                  )
+               )
+
+    if [ ${#toolchains[@]} -eq 0 ]; then
+        printf "error: no toolchain found (networking issue?)\n" >&2; exit 1
+    fi
+
+    for toolchain in "${toolchains[@]}"; do
+        build_one "${dir}" "${toolchain}" "${cfg}" "${pkg}"
+    done
+}
+
+build_one() {
+    local dir="${1}"
+    local toolchain="${2}"
+    local cfg="${3}"
+    local pkg="${4}"
+    local line
+
+    printf "%40s: " "${toolchain}"
+
+    dir="${dir}/${toolchain}"
+    mkdir -p "${dir}"
+
+    printf "download config"
+    if ! curl -s "${TOOLCHAINS_BASE_URL}/${toolchain}.config" >"${dir}/.config"; then
+        printf ": FAILED\n"
+        return
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
+    printf ", olddefconfig"
+    if ! make O="${dir}" olddefconfig >/dev/null 2>&1; then
+        printf ": FAILED\n"
+        return
+    fi
+    # We want all the options from the snippet to be present as-is (set
+    # or not set) in the actual .config; if one of them is not, it means
+    # some dependency from the toolchain or arch is not available, in
+    # which case this config is untestable and we skip it.
+    while read line; do
+        if ! grep "^${line}\$" "${dir}/.config" >/dev/null 2>&1; then
+            printf ", SKIPPED\n"
+            return
+        fi
+    done <"${cfg}"
+
+    if [ -n "${pkg}" ]; then
+        printf ", dirclean"
+        if ! make O="${dir}" "${pkg}-dirclean" >> "${dir}/logfile" 2>&1; then
+            printf ": FAILED\n"
+            return
+        fi
+    fi
+
+    printf ", build"
+    # shellcheck disable=SC2086
+    if ! make O="${dir}" ${pkg} >> "${dir}/logfile" 2>&1; then
+        printf ": FAILED\n"
+        return
+    fi
+
+    printf ": OK\n"
+}
+
+help() {
+    cat <<_EOF_
+test-pkg: test-build a package against various toolchains and architectures
+
+The supplied config snippet is appended to each toolchain config, the
+resulting configuration is checked that it still contains all options
+specified in the snippet; if any is missing, the build is skipped, on the
+assumption that the package under test requires a toolchain or architecture
+feature that is missing.
+
+The list of toolchains is retrieved from Buildroot autobuilders, available
+at ${TOOLCHAINS_BASE_URL}.
+
+In case failures are noticed, you can fix the package and just re-run the
+same command again; it will re-run the test where it failed. If you did
+specify a package (with -p), the package build dir will be removed first.
+
+Options
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
2.7.4
