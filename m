From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Apr 2017 19:27:02 +0200
Subject: [Buildroot] [PATCH 1/2] check-bin-arch: add option to exclude files
Message-ID: <20170410172703.26251-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages will validly install files with a different architecture
than the target. We already exclude firmware and /usr/share, but we
have at least one case where a shared library is installed for a
different arch and it is not wrong. libmpeg2 has code that detects at
runtime whether some SPARC instructions are available, which leads to
an ELF machine ID of "Sparc v8+" instead of "Sparc".

Therefore, add a new -x option to check-bin-arch to give a list of
files to exclude from the check. Note that it is necessary to put
spaces around the option argument, otherwise the case statement
doesn't match. So "-x ' <exclusions> '", not "-x '<exclusions>'".
If called with "-x '  '", nothing will match. This weird syntax doesn't
hurt because the script is anyway only meant to be called from within
Buildroot (cfr. the fact that it relies on TARGET_DIR to be set in
the environment).

In addition, add a per-package variable
LIBFOO_CHECK_BIN_ARCH_EXCLUSIONS that is passed to the -x option, and
add documentation for this option.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
I didn't think it was appropriate to split into two patches: in a
patch that just adds the -x option to the script, it wouldn't be clear
what the purpose is or how it's supposed to be used.
---
 docs/manual/adding-packages-generic.txt | 17 +++++++++++++++++
 package/pkg-generic.mk                  |  3 ++-
 support/scripts/check-bin-arch          | 10 ++++++++--
 3 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 71e27b6722..c3dbd48c4b 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -450,6 +450,23 @@ information is (assuming the package name is +libfoo+) :
   FLAT binary format is only 4k bytes. If the application consumes more stack,
   append the required number here.
 
+* +LIBFOO_CHECK_BIN_ARCH_EXCLUSIONS+ defines a list of files that should be
+  excluded from the target architecture check. Since some packages accidentally
+  installs files that are built for the host into the target directory,
+  Buildroot adds a check that all files in the target directory are really
+  built for the target architecture. However, in rare cases, a package will
+  validly install files for a different (sub)architecture. For example, some
+  libraries have code to dynamically detect the available instructions.
+  Buildroot will then complain with an error like:
++
+---------------------
+ERROR: architecture for "/usr/lib/libfoo.so" is "Sparc v8+", should be "Sparc"
+---------------------
++
+If this is really correct, it is possible to override the check by setting
++LIBFOO_CHECK_BIN_ARCH_EXCLUSIONS+ to a space-separated list of files
+(relative to the target directory) that should not be checked.
+
 The recommended way to define these variables is to use the following
 syntax:
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 31dbc54557..a6654c8327 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -93,7 +93,8 @@ define check_bin_arch
 		support/scripts/check-bin-arch -p $(3) \
 			-l $(BUILD_DIR)/packages-file-list.txt \
 			-r $(TARGET_READELF) \
-			-a $(BR2_READELF_ARCH_NAME))
+			-a $(BR2_READELF_ARCH_NAME) \
+			-x ' $($(call UPPERCASE,$(3))_CHECK_BIN_ARCH_EXCLUSIONS) ')
 endef
 
 GLOBAL_INSTRUMENTATION_HOOKS += check_bin_arch
diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
index ff974a71bc..72d7436b5a 100755
--- a/support/scripts/check-bin-arch
+++ b/support/scripts/check-bin-arch
@@ -1,18 +1,19 @@
 #!/bin/bash
 
-while getopts p:l:r:a: OPT ; do
+while getopts p:l:r:a:x: OPT ; do
 	case "${OPT}" in
 	p) package="${OPTARG}";;
 	l) pkg_list="${OPTARG}";;
 	r) readelf="${OPTARG}";;
 	a) arch_name="${OPTARG}";;
+	x) exclusions="${OPTARG}";;
 	:) error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
 	\?) error "unknown option '%s'\n" "${OPTARG}";;
 	esac
 done
 
 if test -z "${package}" -o -z "${pkg_list}" -o -z "${readelf}" -o -z "${arch_name}" ; then
-	echo "Usage: $0 -p <pkg> -l <pkg-file-list> -r <readelf> -a <arch name>"
+	echo "Usage: $0 -p <pkg> -l <pkg-file-list> -r <readelf> -a <arch name> -x ' <exclusions> '"
 	exit 1
 fi
 
@@ -36,6 +37,11 @@ while read f; do
 		continue
 	fi
 
+	# Skip files that have been excluded explicitly
+	case "${exclusions}" in
+	*\ ${f}\ *) continue;;
+	esac
+
 	# Get architecture using readelf. We pipe through 'head -1' so
 	# that when the file is a static library (.a), we only take
 	# into account the architecture of the first object file.
-- 
2.11.0
