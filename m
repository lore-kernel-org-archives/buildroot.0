From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Mon,  7 May 2018 14:10:32 +0200
Subject: [Buildroot] [RFC PATCH v2] core: Verify that hardening flags are
 used
In-Reply-To: <20180507121032.25794-1-stefan.sorensen@spectralink.com>
References: <20180507121032.25794-1-stefan.sorensen@spectralink.com>
Message-ID: <20180507121032.25794-4-stefan.sorensen@spectralink.com>
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
 Config.in                                     |  9 +++
 package/annobin/0001-Fix-pic-pie-check.patch  | 43 +++++++++++
 ...reat-.so.-files-as-dynamic-libraries.patch | 32 ++++++++
 ...3-Only-issue-warning-for-PIC-PIE-mix.patch | 52 +++++++++++++
 package/pkg-generic.mk                        | 36 +++++++++
 support/scripts/check-hardened                | 75 +++++++++++++++++++
 6 files changed, 247 insertions(+)
 create mode 100644 package/annobin/0001-Fix-pic-pie-check.patch
 create mode 100644 package/annobin/0002-Also-treat-.so.-files-as-dynamic-libraries.patch
 create mode 100644 package/annobin/0003-Only-issue-warning-for-PIC-PIE-mix.patch
 create mode 100755 support/scripts/check-hardened

diff --git a/Config.in b/Config.in
index 6b5b2b043c..79b5cedf8a 100644
--- a/Config.in
+++ b/Config.in
@@ -826,6 +826,15 @@ endchoice
 
 comment "Fortify Source needs a glibc toolchain and optimization"
 	depends on (!BR2_TOOLCHAIN_USES_GLIBC || BR2_OPTIMIZE_0)
+
+config BR2_CHECK_HARDENING
+       bool "Verify hardened build"
+       select BR2_PACKAGE_HOST_ANNOBIN
+       help
+         This option enables a package post install step that verifies
+         that the selected hardening options were actually used during
+         the build.
+
 endmenu
 
 source "toolchain/Config.in"
diff --git a/package/annobin/0001-Fix-pic-pie-check.patch b/package/annobin/0001-Fix-pic-pie-check.patch
new file mode 100644
index 0000000000..056a4a8c13
--- /dev/null
+++ b/package/annobin/0001-Fix-pic-pie-check.patch
@@ -0,0 +1,43 @@
+From 484886ade43da8baceeaa0007053ebaa73865e83 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
+Date: Fri, 4 May 2018 11:39:44 +0200
+Subject: [PATCH] Fix pic/pie check
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The bash -eq operator is for arithmetic comparison and does not work
+as expected with string operands. This causes the check for missing
+-fPIC/-fPIE to fail.
+
+Fix by using the = operator.
+
+Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
+---
+ scripts/hardened.sh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/scripts/hardened.sh b/scripts/hardened.sh
+index b12574e..672ea07 100755
+--- a/scripts/hardened.sh
++++ b/scripts/hardened.sh
+@@ -712,14 +712,14 @@ check_for_pie_or_pic ()
+ 	else
+ 	    if [[ $filetype = lib || ( $filetype = auto && $file == *.so ) ]] ;
+ 	    then
+-		if [[ "x${hard[0]}" -eq "xPIC" || "x${hard[0]}" -eq "xpic" ]] ;
++		if [[ "${hard[0]}" = "PIC" || "${hard[0]}" = "pic" ]] ;
+ 		then
+ 		    pass "compiled with -f${hard[0]}"
+ 		else
+ 		    fail "compiled with -f${hard[0]}"
+ 		fi
+ 	    else
+-		if [[ "x${hard[0]}" -eq "xPIE" || "x${hard[0]}" -eq "xpie" ]] ;
++		if [[ "${hard[0]}" = "PIE" || "${hard[0]}" = "pie" ]] ;
+ 		then
+ 		    pass "compiled with -f${hard[0]}"
+ 		else
+-- 
+2.17.0
+
diff --git a/package/annobin/0002-Also-treat-.so.-files-as-dynamic-libraries.patch b/package/annobin/0002-Also-treat-.so.-files-as-dynamic-libraries.patch
new file mode 100644
index 0000000000..ffb71a3393
--- /dev/null
+++ b/package/annobin/0002-Also-treat-.so.-files-as-dynamic-libraries.patch
@@ -0,0 +1,32 @@
+From fccf40786008b4737cd815f66ce261da06232326 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
+Date: Fri, 4 May 2018 15:22:05 +0200
+Subject: [PATCH] Also treat *.so.* files as dynamic libraries.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The wildcard to match dynamic libraries only matches *.so, so add
+*.so.* as match.
+
+Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
+---
+ scripts/hardened.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/hardened.sh b/scripts/hardened.sh
+index 672ea07..20ffbc9 100755
+--- a/scripts/hardened.sh
++++ b/scripts/hardened.sh
+@@ -710,7 +710,7 @@ check_for_pie_or_pic ()
+ 	then
+ 	    fail "multiple, different, settings of -fpic/-fpie used"
+ 	else
+-	    if [[ $filetype = lib || ( $filetype = auto && $file == *.so ) ]] ;
++	    if [[ $filetype = lib || ( $filetype = auto && ($file == *.so || $file == *.so.* )) ]] ;
+ 	    then
+ 		if [[ "${hard[0]}" = "PIC" || "${hard[0]}" = "pic" ]] ;
+ 		then
+-- 
+2.17.0
+
diff --git a/package/annobin/0003-Only-issue-warning-for-PIC-PIE-mix.patch b/package/annobin/0003-Only-issue-warning-for-PIC-PIE-mix.patch
new file mode 100644
index 0000000000..ce0dc06f99
--- /dev/null
+++ b/package/annobin/0003-Only-issue-warning-for-PIC-PIE-mix.patch
@@ -0,0 +1,52 @@
+From af42159baf0fbd787f57ac446c8796fa38c7811e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
+Date: Fri, 4 May 2018 11:45:18 +0200
+Subject: [PATCH] Only issue warning for PIC/PIE mix
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+A lot of packages build with a mix of -fPIC and -fPIE, so bump this
+down from a failure to just issuing a warning.
+
+Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
+---
+ scripts/hardened.sh | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/scripts/hardened.sh b/scripts/hardened.sh
+index 20ffbc9..b3ee1d8 100755
+--- a/scripts/hardened.sh
++++ b/scripts/hardened.sh
+@@ -173,6 +173,14 @@ fail ()
+     vulnerable=1
+ }
+ 
++warn ()
++{
++    if [ $report -gt 1 ]
++    then
++        report "$file: WARN:" ${1+"$@"}
++    fi
++}
++
+ pass ()
+ {
+     if [ $report -gt 2 ]
+@@ -708,7 +716,12 @@ check_for_pie_or_pic ()
+     else
+ 	if [ ${#hard[*]} -gt 1 ];
+ 	then
+-	    fail "multiple, different, settings of -fpic/-fpie used"
++	    if [[ "${hard[*]}" == *"static"* ]]	;
++	    then
++		fail "multiple, different, settings of -fpic/-fpie/-fstatic used"
++	    else  
++		warn "multiple, different, settings of -fpic/-fpie used"
++	    fi
+ 	else
+ 	    if [[ $filetype = lib || ( $filetype = auto && ($file == *.so || $file == *.so.* )) ]] ;
+ 	    then
+-- 
+2.17.0
+
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8a3b5f90a9..3f46e01a86 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -94,6 +94,42 @@ endef
 
 GLOBAL_INSTRUMENTATION_HOOKS += check_bin_arch
 
+ifeq ($(BR2_CHECK_HARDENING),y)
+# For now, since we do not build with these options, no support for operator[]
+# range check, control flow enforcement, stack clash protection and control
+# flow protection hardening
+HARDENED_OPTS = -k operator -k cet -k clash -k cf
+
+ifneq ($(BR2_SSP_STRONG)$(BR2_SSP_ALL),y)
+HARDENED_OPTS += -k stack
+endif
+ifneq ($(BR2_OPTIMIZE_2)$(BR2_OPTIMIZE_3)$(BR2_OPTIMIZE_S),y)
+HARDENED_OPTS += -k opt
+endif
+ifneq ($(BR2_FORTIFY_SOURCE_2),y)
+HARDENED_OPTS += -k fort
+endif
+ifneq ($(BR2_RELRO_PARTIAL)$(BR2_RELRO_FULL),y)
+HARDENED_OPTS += -k relro
+endif
+ifneq ($(BR2_RELRO_FULL),y)
+HARDENED_OPTS += -k now -k pic
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
+			-h $(HOST_DIR)/bin/hardened.sh)
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
index 0000000000..5c052f7af2
--- /dev/null
+++ b/support/scripts/check-hardened
@@ -0,0 +1,75 @@
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
+while getopts p:l:h:r:i:k: OPT ; do
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
+	k) skip+=("--skip=${OPTARG}");;
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
+# Script may run before annobin plugin and hardened.sh is installed
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
