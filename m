From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Mar 2017 14:07:52 +0100
Subject: [Buildroot] [PATCH v4 2/2] Makefile: add check of binaries
	architecture
In-Reply-To: <1489928872-3965-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1489928872-3965-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1489928872-3965-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As shown recently by the firejail example, it is easy to miss that a
package builds and installs binaries without actually cross-compiling
them: they are built for the host architecture instead of the target
architecture.

This commit adds a small helper script, check-bin-arch, called as a
GLOBAL_INSTRUMENTATION_HOOKS at the end of the target installation of
each package, to verify that the files installed by this package have
been built for the correct architecture.

Being called as a GLOBAL_INSTRUMENTATION_HOOKS allows the build to error
out right after the installation of the faulty package, and therefore
get autobuilder error detection properly assigned to this specific
package.

Example output with the firejail package enabled, when building for an
ARM target:

ERROR: architecture for ./usr/lib/firejail/libconnect.so is Advanced Micro Devices X86-64, should be ARM
ERROR: architecture for ./usr/bin/firejail is Advanced Micro Devices X86-64, should be ARM
ERROR: architecture for ./usr/lib/firejail/libtrace.so is Advanced Micro Devices X86-64, should be ARM
ERROR: architecture for ./usr/lib/firejail/libtracelog.so is Advanced Micro Devices X86-64, should be ARM
ERROR: architecture for ./usr/lib/firejail/ftee is Advanced Micro Devices X86-64, should be ARM
ERROR: architecture for ./usr/lib/firejail/faudit is Advanced Micro Devices X86-64, should be ARM
ERROR: architecture for ./usr/bin/firemon is Advanced Micro Devices X86-64, should be ARM
ERROR: architecture for ./usr/bin/firecfg is Advanced Micro Devices X86-64, should be ARM

Many thanks to Yann E. Morin and Arnout Vandecappelle for their reviews
and suggestions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Changes since v4:
 - Use arguments with flags in the script, as suggested by Arnout.
 - Pipe the readelf output to head -1, so that with static libs we only
   take into account the architecture of the first object file (assuming
   all object files in a static library will have the same
   architecture). Suggested by Arnout.
 - Change error message to not mention the name of the package, since we
   know abort the build during the package installation step. Suggested
   by Arnout.

Changes since v3:
 - Pass TARGET_READELF instead of TARGET_CROSS, suggested by Arnout
 - Pass BR2_READELF_ARCH_NAME to the script, instead of parsing the BR
   config file. Suggested by Yann.
 - Use LC_ALL=C when calling readelf, to avoid surprises. Suggested by
   Yann.
 - Reword the error message, according to Yann suggestion.

Changes since v2:
 - Moved as a per-package check, so that we detect the faulty package
   earlier, and get correct autobuilder notifications.
 - Use TARGET_DIR from the environment and use BR2_CONFIG to retrieve
   the value of BR2_READELF_ARCH_NAME.
 - Skip firmware files in /lib/firmware and /usr/lib/firmware.
 - Simply ignore files for which readelf returned an empty Machine
   field, as a way to quickly detect non-ELF files.

Changes since v1:
 - Following Yann E. Morin's comment, restrict the check to bin, lib,
   sbin, usr/bin, usr/lib and usr/sbin, in order to avoid matching
   firmware files that could use the ELF format but be targeted for
   other architectures.
---
 package/pkg-generic.mk         | 11 +++++++++
 support/scripts/check-bin-arch | 52 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100755 support/scripts/check-bin-arch

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index e8a8021..dd8a1e2 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -87,6 +87,17 @@ define step_pkg_size
 endef
 GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
 
+# Relies on step_pkg_size, so must be after
+define check_bin_arch
+	$(if $(filter end-install-target,$(1)-$(2)),\
+		support/scripts/check-bin-arch -p $(3) \
+			-l $(BUILD_DIR)/packages-file-list.txt \
+			-r $(TARGET_READELF) \
+			-a $(BR2_READELF_ARCH_NAME))
+endef
+
+GLOBAL_INSTRUMENTATION_HOOKS += check_bin_arch
+
 # This hook checks that host packages that need libraries that we build
 # have a proper DT_RPATH or DT_RUNPATH tag
 define check_host_rpath
diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
new file mode 100755
index 0000000..2c619ad
--- /dev/null
+++ b/support/scripts/check-bin-arch
@@ -0,0 +1,52 @@
+#!/bin/bash
+
+while getopts p:l:r:a: OPT ; do
+	case "${OPT}" in
+	p) package="${OPTARG}";;
+	l) pkg_list="${OPTARG}";;
+	r) readelf="${OPTARG}";;
+	a) arch_name="${OPTARG}";;
+	:) error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
+	\?) error "unknown option '%s'\n" "${OPTARG}";;
+	esac
+done
+
+if test -z "${package}" -o -z "${pkg_list}" -o -z "${readelf}" -o -z "${arch_name}" ; then
+	echo "Usage: $0 -p <pkg> -l <pkg-file-list> -r <readelf> -a <arch name>"
+	exit 1
+fi
+
+exitcode=0
+
+pkg_files=$(sed -r -e "/^${package},(.+)$/!d; s//\1/;" ${pkg_list})
+
+for f in ${pkg_files} ; do
+	# Skip firmware files, they could be ELF files for other
+	# architectures
+	if [[ "${f}" =~ ^\./(usr/)?lib/firmware/.* ]]; then
+		continue
+	fi
+
+	# Get architecture using readelf. We pipe through 'head -1' so
+	# that when the file is a static library (.a), we only take
+	# into account the architecture of the first object file.
+	arch=$(LC_ALL=C ${readelf} -h "${TARGET_DIR}/${f}" 2>&1 | \
+		       sed -r -e '/^  Machine: +(.+)/!d; s//\1/;' | head -1)
+
+	# If no architecture found, assume it was not an ELF file
+	if test "${arch}" = "" ; then
+		continue
+	fi
+
+	# Architecture is correct
+	if test "${arch}" = "${arch_name}" ; then
+		continue
+	fi
+
+	printf 'ERROR: architecture for %s is %s, should be %s\n' \
+	       "${f}" "${arch}" "${arch_name}"
+
+	exitcode=1
+done
+
+exit ${exitcode}
-- 
2.7.4
