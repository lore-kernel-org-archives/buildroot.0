From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  7 Jan 2019 23:05:32 +0100
Subject: [Buildroot] [PATCH 10/19] support: rewrite check-bin-arch in python
In-Reply-To: <cover.1546898693.git.yann.morin.1998@free.fr>
References: <cover.1546898693.git.yann.morin.1998@free.fr>
Message-ID: <638ba4cafb8ab013365ae54a393b49f459bc6e74.1546898693.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The existing check-bin-arch script is written in shell, so it can't make
use of all the helpers we have in python, especially the parser for the
package-files lists.

Although this script is relatively clean as it is, it is not totally
fool-proof either, especially against weird filenames (e.g.
specially-crafted filenames with \n, or \b, etc...).

Also, shell scripts are often frowned upon but for the most mundane
processing, and this script is definitely not mundane.

Finally, shell scripts are slow, as all the processing the have to do is
more often than not done by spawning programs, and that is relatively
expensive.

Rewrite that script in python.

This allows to do cleaner processing and reuse the package-files list
parser.

There's however a drawback: the script grows substantially, in part
because of spawning the actual readelf call (there is no ELF parser in
the standard python library), and because we want to keep backward
compatible with old pythons that lack proper abstractions like
subprocess.DEVNULL et al.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 support/scripts/check-bin-arch | 205 +++++++++++++++++++++++------------------
 1 file changed, 113 insertions(+), 92 deletions(-)

diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
index 66b8d89932..d4902163e7 100755
--- a/support/scripts/check-bin-arch
+++ b/support/scripts/check-bin-arch
@@ -1,92 +1,113 @@
-#!/usr/bin/env bash
-
-# List of hardcoded paths that should be ignored, as they may
-# contain binaries for an architecture different from the
-# architecture of the target.
-declare -a IGNORES=(
-	# Skip firmware files, they could be ELF files for other
-	# architectures
-	"/lib/firmware"
-	"/usr/lib/firmware"
-
-	# Skip kernel modules
-	# When building a 32-bit userland on 64-bit architectures, the kernel
-	# and its modules may still be 64-bit. To keep the basic
-	# check-bin-arch logic simple, just skip this directory.
-	"/lib/modules"
-	"/usr/lib/modules"
-
-	# Skip files in /usr/share, several packages (qemu,
-	# pru-software-support) legitimately install ELF binaries that
-	# are not for the target architecture
-	"/usr/share"
-
-	# Skip files in /lib/grub, since it is possible to have it
-	# for a different architecture (e.g. i386 grub on x86_64).
-	"/lib/grub"
-)
-
-while getopts p:l:r:a:i: OPT ; do
-	case "${OPT}" in
-	p) package="${OPTARG}";;
-	l) pkg_list="${OPTARG}";;
-	r) readelf="${OPTARG}";;
-	a) arch_name="${OPTARG}";;
-	i)
-		# Ensure we do have single '/' as separators,
-		# and that we have a leading and a trailing one.
-		pattern="$(sed -r -e 's:/+:/:g; s:^/*:/:; s:/*$:/:;' <<<"${OPTARG}")"
-		IGNORES+=("${pattern}")
-		;;
-	:) error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
-	\?) error "unknown option '%s'\n" "${OPTARG}";;
-	esac
-done
-
-if test -z "${package}" -o -z "${pkg_list}" -o -z "${readelf}" -o -z "${arch_name}" ; then
-	echo "Usage: $0 -p <pkg> -l <pkg-file-list> -r <readelf> -a <arch name> [-i PATH ...]"
-	exit 1
-fi
-
-exitcode=0
-
-# Only split on new lines, for filenames-with-spaces
-IFS="
-"
-
-while read f; do
-	for ignore in "${IGNORES[@]}"; do
-		if [[ "${f}" =~ ^"${ignore}" ]]; then
-			continue 2
-		fi
-	done
-
-	# Skip symlinks. Some symlinks may have absolute paths as
-	# target, pointing to host binaries while we're building.
-	if [[ -L "${TARGET_DIR}/${f}" ]]; then
-		continue
-	fi
-
-	# Get architecture using readelf. We pipe through 'head -1' so
-	# that when the file is a static library (.a), we only take
-	# into account the architecture of the first object file.
-	arch=$(LC_ALL=C ${readelf} -h "${TARGET_DIR}/${f}" 2>&1 | \
-		       sed -r -e '/^  Machine: +(.+)/!d; s//\1/;' | head -1)
-
-	# If no architecture found, assume it was not an ELF file
-	if test "${arch}" = "" ; then
-		continue
-	fi
-
-	# Architecture is correct
-	if test "${arch}" = "${arch_name}" ; then
-		continue
-	fi
-
-	printf 'ERROR: architecture for "%s" is "%s", should be "%s"\n' \
-	       "${f}" "${arch}" "${arch_name}"
-
-	exitcode=1
-done < <( sed -r -e "/^${package},\.(.+)$/!d; s//\1/;" ${pkg_list} )
-
-exit ${exitcode}
+#!/usr/bin/env python
+
+import argparse
+import os
+import re
+import subprocess
+import sys
+from brpkgutil import parse_pkg_file_list as parse_pkg_file_list
+
+
+# List of hardcoded paths that should be ignored, as they may contain
+# binaries for an architecture different from the architecture of the
+# target
+IGNORES = {
+    # Skip firmware files
+    # They could be ELF files for other architectures.
+    '/lib/firmware',
+    '/usr/lib/firmware',
+
+    # Skip kernel modules
+    # When building a 32-bit userland on 64-bit architectures, the
+    # kernel and its modules may still be 64-bit. To keep the basic
+    # check-bin-arch logic simple, just skip these directories
+    '/lib/modules',
+    '/usr/lib/modules',
+
+    # Skip files in /usr/share
+    # Several packages (qemu, pru-software-support) legitimately install
+    # ELF binaries that are not for the target architecture
+    '/usr/share',
+
+    # Skip files in /lib/grub
+    # It is possible to have it for a different architecture (e.g. i386
+    # grub on x86_64)
+    '/lib/grub',
+}
+
+
+ERROR = 'ERROR: architecture for "%s" is "%s", should be "%s"\n'
+
+
+def main():
+    parser = argparse.ArgumentParser()
+    parser.add_argument('--package', '-p', metavar='PACKAGE', required=True)
+    parser.add_argument('--pkg-list', '-l', metavar='PKG_LIST', required=True)
+    parser.add_argument('--readelf', '-r', metavar='READELF', required=True)
+    parser.add_argument('--arch', '-a', metavar='ARCH', required=True)
+    parser.add_argument('--ignore', '-i', metavar='PATH', action='append')
+    args = parser.parse_args()
+
+    if args.ignore is not None:
+        # Ensure we do have single '/' as separators, and that we have a
+        # leading and a trailing one, then append to the global list.
+        for pattern in args.ignore:
+            IGNORES.add(re.sub('/+', '/', '/{0}/'.format(pattern)))
+
+    ignores_re = set()
+    for i in IGNORES:
+        ignores_re.add(re.compile(i))
+
+    arch_re = re.compile('^  Machine: +(.+)')
+
+    target_dir = os.environ['TARGET_DIR']
+
+    exit_code = 0
+    for record in parse_pkg_file_list(args.pkg_list):
+        if record['pkg'] != args.package:
+            continue
+
+        fpath = record['file']
+
+        ignored = False
+        for i in ignores_re:
+            if i.match(fpath):
+                ignored = True
+                break
+        if ignored:
+            continue
+
+        # Skip symlinks. Some symlinks may have absolute paths as
+        # target, pointing to host binaries while we're building.
+        if os.path.islink(os.path.join(target_dir, fpath)):
+            continue
+
+        cmd = [args.readelf, '-h', os.path.join(target_dir, fpath)]
+        try:
+            with open(os.devnull, 'wb') as devnull:
+                p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=devnull,
+                                     universal_newlines=True)
+                stdout = p.communicate()[0].split('\n')[:-1]
+                ret = p.returncode
+        except OSError:
+            ret = 1
+            stdout = list()
+        # If readelf returned in error, or returned nothing on stdout,
+        # then that was not an ELF file, or we may not yet have readelf
+        # (e.g. in skeleton, before toolchain)
+        if ret != 0 or len(stdout) == 0:
+            continue
+
+        for line in stdout:
+            if arch_re.match(line):
+                arch = arch_re.sub(r'\1', line)
+                if arch != args.arch:
+                    print(ERROR.format(fpath, arch, args.arch))
+                    exit_code = 1
+                break
+
+    return exit_code
+
+
+if __name__ == "__main__":
+    sys.exit(main())
-- 
2.14.1
