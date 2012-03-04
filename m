From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun,  4 Mar 2012 14:03:16 +0100
Subject: [Buildroot] [PATCH v2 3/3] Add test infrastructure
In-Reply-To: <1330866196-5360-1-git-send-email-arnout@mind.be>
References: <1330866196-5360-1-git-send-email-arnout@mind.be>
Message-ID: <1330866196-5360-3-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

The test infrastructure is a script and a list of tests to be run.
Additional test configurations can be added later to the test directory.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .topdeps         |    3 +-
 .topmsg          |   13 ++++-
 test/runtests.sh |  122 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 test/testspecs   |   24 +++++++++++
 4 files changed, 158 insertions(+), 4 deletions(-)
 create mode 100755 test/runtests.sh
 create mode 100644 test/testspecs

diff --git a/.topdeps b/.topdeps
index 1f7391f..bbe331b 100644
--- a/.topdeps
+++ b/.topdeps
@@ -1 +1,2 @@
-master
+t/print-version
+t/defconfig
diff --git a/.topmsg b/.topmsg
index b431fc4..3a90662 100644
--- a/.topmsg
+++ b/.topmsg
@@ -1,7 +1,14 @@
 From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
-Subject: [PATCH] Add target to print buildroot version
+Subject: [PATCH] Add test infrastructure
 
-It's convenient to have a target to print the buildroot version, for use
-in external scripts calling buildroot.
+The test infrastructure is a script and a list of tests to be run.
+Additional test configurations can be added later to the test directory.
 
 Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+Changes v2:
+ - Fixed support for defconfig and *packageconfig
+ - This now depends on the BR2_DEFCONFIG patch
+ - Use printf instead of echo (feedback from Yann)
+ - Use ${...} for all variable references (feedback from Yann)
+ - Put quotes around everything (feedback from Yann)
diff --git a/test/runtests.sh b/test/runtests.sh
new file mode 100755
index 0000000..6a4af2d
--- /dev/null
+++ b/test/runtests.sh
@@ -0,0 +1,122 @@
+#! /bin/sh
+# Run test builds of buildroot
+# runtest.sh <testspec>...
+#
+# testspec:  <baseconfig>[=<type>,...]
+#   A testspec is a config file name (relative to the buildroot top dir),
+#   optionally followed by a comma-separated list of config types.
+#   Config types are: def, rand, allyes, allno, randpackage, allyespackage,
+#                     allnopackage
+#   If config types are not given, it is taken from a line containing
+#   CONFIGTYPES= in the baseconfig.  If that is also not present, def
+#   and randpackage are tried.
+#
+# If no arguments are given, the testspecs are taken from the testspecs
+# file in the current directory.  If that file doesn't exist, the testspecs
+# file in the test directory is taken.
+#
+# The output goes into the current directory.
+
+testdir="$(dirname ${0})"
+topdir="$(cd ${testdir}/..; pwd)"
+
+configdir="${PWD}/gen-config"
+brversion="$(make -C ${topdir} --no-print-directory print-version)"
+
+printf 'Running tests for %s\n' "${brversion}"
+
+# Run build for config $1 with type $2
+function runbuild() {
+	baseconfig="${1}"
+	configtype="${2}"
+
+	printf 'Building %s %sconfig\n' "${baseconfig}" "${configtype}"
+
+	# Interprete baseconfig relative to topdir
+	if [ "${baseconfig:0:1}" = / ]; then
+		baseconfigfile="${baseconfig}"
+	else
+		baseconfigfile="${topdir}/${baseconfig}"
+	fi
+
+	if [ ! -r "${baseconfigfile}" ]; then
+		printf '  *** %s not found\n' "${baseconfig}"
+		return 1
+	fi
+
+	configname="${brversion}-$(basename ${baseconfig})"
+	hostdir="${PWD}/${configname}.hostdir"
+
+	# Create the configtype from baseconfig.
+	# defconfig is a special case because it needs to be passed in
+	# a different way.  *packageconfig are also special, because
+	# they need a complete config (not just defconfig) as input, otherwise
+	# the package hack doesn't work, so we need to run make defconfig first.
+	mkdir -p "${configdir}"
+	cp "${baseconfigfile}" "${configdir}/.config.in"
+	printf 'BR2_HOST_DIR="%s"\n' "${hostdir}" >> "${configdir}/.config.in"
+	if [ "${configtype}" = "def" -o "${configtype%*package}" != "${configtype}" ]; then
+		make -C "${topdir}" O="${configdir}" defconfig BR2_DEFCONFIG="${configdir}/.config.in" > "${configdir}.log" || {
+			printf '  *** make defconfig failed for %s\n' "${baseconfig}"
+			return 1
+		}
+	else
+		mv "${configdir}/.config.in" "${configdir}/.config"
+	fi
+	if [ "${configtype}" != "def" ]; then
+		make -C "${topdir}" O="${configdir}" "${configtype}config" > "${configdir}.log" || {
+			printf '  *** make %sconfig failed for %s\n' "${configtype}" "${baseconfig}"
+			return 1
+		}
+	fi
+
+	# Add the sha of the config file to its name, so we can uniquely
+	# identify it.  This allows us to remove duplicates, e.g. defconfig
+	# and allnoconfig.
+	fullconfigname="${configname}-$(sha1sum "${configdir}/.config" | cut -c -40)"
+	if [ -e "${fullconfigname}.success" ]; then
+		printf '  %s already built successfully; skipping\n' "${fullconfigname}"
+		return 0
+	fi
+	printf '  Generated %s\n' "${fullconfigname}"
+
+	# Save the defconfig of this config for future reference.
+	make -C "${topdir}" --no-print-directory O="${configdir}" savedefconfig > /dev/null || {
+		printf '  *** Failed savedefconfig for %s\n' "${fullconfigname}"
+		return 1
+	}
+	cp "${configdir}/defconfig" "${fullconfigname}.defconfig"
+
+	outdir="${PWD}/${fullconfigname}.output"
+	logfile="${fullconfigname}.log"
+	mkdir -p "${outdir}"
+	cp "${configdir}/.config" "${outdir}"
+	make -C "${topdir}" O="${outdir}" > "${logfile}" 2>&1 || {
+		printf '  *** Failed %s - see log file for details\n' "${fullconfigname}"
+		touch "${fullconfigname}.failed"
+		#rm -rf ${outdir}
+		return 1
+	}
+
+	printf '  Successfully built %s %sconfig\n' "${baseconfig}" "${configtype}"
+	touch "${fullconfigname}.success"
+	rm -rf "${outdir}"
+	bzip2 "${logfile}"
+}
+
+
+if [ "${1}" ]; then
+	testspecs="$*"
+elif [ -r testspecs ]; then
+	testspecs="$(cat testspecs)"
+else
+	testspecs="$(cat ${testdir}/testspecs)"
+fi
+
+for testspec in ${testspecs}; do
+	baseconfig="${testspec%=*}"
+	configtypes="${testspec#*=}"
+	for configtype in ${configtypes//,/ }; do
+		runbuild "${baseconfig}" "${configtype}"
+	done
+done
diff --git a/test/testspecs b/test/testspecs
new file mode 100644
index 0000000..2e3be3d
--- /dev/null
+++ b/test/testspecs
@@ -0,0 +1,24 @@
+configs/armadeus_apf9328_defconfig=def,randpackage
+configs/at91rm9200df_defconfig=def,randpackage
+configs/at91sam9260dfc_defconfig=def,randpackage
+configs/at91sam9261ek_defconfig=def,randpackage
+configs/at91sam9263ek_defconfig=def,randpackage
+configs/at91sam9g20dfc_defconfig=def,randpackage
+configs/atngw100_defconfig=def,randpackage
+configs/atstk100x_defconfig=def,randpackage
+configs/ea3250_defconfig=def,randpackage
+configs/fdi3250_defconfig=def,randpackage
+configs/integrator926_defconfig=def,randpackage
+configs/kb9202_defconfig=def,randpackage
+configs/mini2440_defconfig=def,randpackage
+configs/mx53loco_defconfig=def,randpackage
+configs/phy3250_defconfig=def,randpackage
+configs/qemu_arm_versatile_defconfig=def,randpackage
+configs/qemu_mips_malta_defconfig=def,randpackage
+configs/qemu_mipsel_malta_defconfig=def,randpackage
+configs/qemu_ppc_g3beige_defconfig=def,randpackage
+configs/qemu_sh4_r2d_defconfig=def,randpackage
+configs/qemu_sparc_ss10_defconfig=def,randpackage
+configs/qemu_x86_64_defconfig=def,randpackage
+configs/qemu_x86_defconfig=def,randpackage
+configs/sheevaplug_defconfig=def,randpackage
-- 
1.7.9.1
