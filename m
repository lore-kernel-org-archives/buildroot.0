From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Thu,  3 May 2018 16:31:47 +0200
Subject: [Buildroot] [RFC PATCH 2/2] core: Verify that hardening flags are
 used
In-Reply-To: <20180503143147.5301-1-stefan.sorensen@spectralink.com>
References: <20180503143147.5301-1-stefan.sorensen@spectralink.com>
Message-ID: <20180503143147.5301-3-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch add a new package post install check that verifies that
configured hardening options are used.

Using the ELF notes added by the GCC annobin plugin, it verifies that
the following build options are used:
  * Stack protector
  * RELRO
  * FORTIFY_SOURCE
  * Optimization
  * Possition Independent Code/Executeable (-fPIC/-fPIE)

Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
---
 Config.in                      | 15 +++++++
 package/pkg-generic.mk         | 36 +++++++++++++++++
 support/scripts/check-hardened | 74 ++++++++++++++++++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100755 support/scripts/check-hardened

diff --git a/Config.in b/Config.in
index 6b5b2b043c..43fd15f3a2 100644
--- a/Config.in
+++ b/Config.in
@@ -826,6 +826,21 @@ endchoice
 
 comment "Fortify Source needs a glibc toolchain and optimization"
 	depends on (!BR2_TOOLCHAIN_USES_GLIBC || BR2_OPTIMIZE_0)
+
+
+config BR2_CHECK_HARDENING
+       bool "Verify hardened build"
+       depends on BR2_TOOLCHAIN_ANNOBIN_GCC_PLUGIN
+       depends on !BR2_SSP_REGULAR
+       depends on !BR2_FORTIFY_SOURCE_1
+       help
+         This option enables a packet post install step that verifies
+         that the selected hardning options was actually used during
+         the build.
+
+comment "Verifying hardened build needs the annobin GCC plugin and it not compatible with the regular stack protector and the conservative buffer overflow protector"
+	 depends on !BR2_TOOLCHAIN_ANNOBIN_GCC_PLUGIN || BR2_SSP_REGULAR || BR2_FORTIFY_SOURCE_1
+
 endmenu
 
 source "toolchain/Config.in"
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a303dc2e07..9567d260bd 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -94,6 +94,42 @@ endef
 
 GLOBAL_INSTRUMENTATION_HOOKS += check_bin_arch
 
+ifeq ($(BR2_CHECK_HARDENING),y)
+# For now, no support for operator[] range check, control flow
+# enforcement, stack clash protection and control flow protection
+# hardening
+HARDENED_OPTS = -s operator -s cet -s clash -s cf
+
+ifneq ($(BR2_SSP_STRONG)$(BR2_SSP_ALL),y)
+HARDENED_OPTS += -s opt
+endif
+ifneq ($(BR2_OPTIMIZE_2)$(BR2_OPTIMIZE_3)$(BR2_OPTIMIZE_S),y)
+HARDENED_OPTS += -s opt
+endif
+ifneq ($(BR2_FORTIFY_SOURCE_2),y)
+HARDENED_OPTS += -s fort
+endif
+ifneq ($(BR2_RELRO_PARTIAL)$(BR2_RELRO_FULL),y)
+HARDENED_OPTS += -s relro
+endif
+ifneq ($(BR2_RELRO_FULL),y)
+HARDENED_OPTS += -s now -s pic
+endif
+
+define check_hardened
+	$(if $(filter end-install-target,$(1)-$(2)),\
+		support/scripts/check-hardened \
+			-p $(3) \
+			-l $(BUILD_DIR)/packages-file-list.txt \
+			$(foreach i,$($(PKG)_HARDENED_EXCLUDE),-i "$(i)") \
+			$(HARDENED_OPTS) \
+			-r $(TARGET_READELF) \
+			-h $(HARDENED_SH))
+endef
+
+GLOBAL_INSTRUMENTATION_HOOKS += check_hardened
+endif
+
 # This hook checks that host packages that need libraries that we build
 # have a proper DT_RPATH or DT_RUNPATH tag
 define check_host_rpath
diff --git a/support/scripts/check-hardened b/support/scripts/check-hardened
new file mode 100755
index 0000000000..8f4d6628cf
--- /dev/null
+++ b/support/scripts/check-hardened
@@ -0,0 +1,74 @@
+#!/usr/bin/env bash
+
+# Heavily based on check-bin-arch
+
+# List of hardcoded paths that should be ignored, as they are
+# contain binaries for an architecture different from the
+# architecture of the target.
+declare -a IGNORES=(
+	# Skip firmware files, they could be ELF files for other
+	# architectures without hardening
+	"/lib/firmware"
+	"/usr/lib/firmware"
+
+	# Skip kernel modules
+	"/lib/modules"
+	"/usr/lib/modules"
+
+	# Skip files in /usr/share, several packages (qemu,
+	# pru-software-support) legitimately install ELF binaries that
+	# are not for the target architecture and are not hardened
+	"/usr/share"
+)
+
+declare -a skip
+
+while getopts p:l:h:r:i:s: OPT ; do
+	case "${OPT}" in
+	p) package="${OPTARG}";;
+	l) pkg_list="${OPTARG}";;
+	h) hardened="${OPTARG}";;
+	i)
+		# Ensure we do have single '/' as separators,
+		# and that we have a leading one.
+		pattern="$(sed -r -e 's:/+:/:g; s:^/*:/:;' <<<"${OPTARG}")"
+		IGNORES+=("${pattern}")
+		;;
+	r) readelf="${OPTARG}";;
+	s) skip+=("--skip=${OPTARG}");;
+	:) error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
+	\?) error "unknown option '%s'\n" "${OPTARG}";;
+	esac
+done
+
+if test -z "${package}" -o -z "${pkg_list}" -o -z "${hardened}" ; then
+	echo "Usage: $0 -p <pkg> -l <pkg-file-list> -h <hardened> -r <readelf> [-i PATH ...]"
+	exit 1
+fi
+
+if [ ! -e ${hardened} ]; then
+	exit 0
+fi
+
+exitcode=0
+
+# Only split on new lines, for filenames-with-spaces
+IFS="
+"
+
+while read f; do
+	for ignore in "${IGNORES[@]}"; do
+		if [[ "${f}" =~ ^"${ignore}" ]]; then
+			continue 2
+		fi
+	done
+
+	# Only check regular files
+	if [[ ! -f "${TARGET_DIR}/${f}" ]]; then
+		continue
+	fi
+
+	${hardened} --readelf=${readelf} --ignore-unknown ${skip[*]} ${TARGET_DIR}${f} || exitcode=1
+done < <( sed -r -e "/^${package},\.(.+)$/!d; s//\1/;" ${pkg_list} )
+
+exit ${exitcode}
-- 
2.17.0
