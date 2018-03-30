From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 22:11:10 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] spport/check-bin-arch:
 accept arbitrary per-package ignore paths
Message-ID: <20180330213158.7A29683EBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=086b43f698108b5d88d69e400aa9784353873429
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Some packages (mostly, out-of-tree) may want to install binary blobs for
another architecture,  outside the locations we currently exclude, like
in /opt or whatever...

Add support in check-bin-arch to accept any arbitrary location, that
individual package can each request to excude from the check, when they
are installed.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 01d90f0d093ff16ab3c1a9466430cee6fb7842d8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-generic.txt |  7 +++++
 package/pkg-generic.mk                  |  1 +
 support/scripts/check-bin-arch          | 56 ++++++++++++++++++++-------------
 3 files changed, 42 insertions(+), 22 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 63ea51bf89..eecf6e2ec0 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -453,6 +453,13 @@ information is (assuming the package name is +libfoo+) :
   FLAT binary format is only 4k bytes. If the application consumes more stack,
   append the required number here.
 
+* +LIBFOO_BIN_ARCH_EXCLUDE+ is a space-separated list of paths (relative
+  to the target directory) to ignore when checking that the package
+  installs correctly cross-compiled binaries. You seldom need to set this
+  variable, unless the package installs binary blobs outside the default
+  locations, `/lib/firmware`, `/usr/lib/firmware`, `/lib/modules`, and
+  `/usr/share`, which are automatically excluded.
+
 The recommended way to define these variables is to use the following
 syntax:
 
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a2a12e7b56..9eddaeee57 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -112,6 +112,7 @@ define check_bin_arch
 	$(if $(filter end-install-target,$(1)-$(2)),\
 		support/scripts/check-bin-arch -p $(3) \
 			-l $(BUILD_DIR)/packages-file-list.txt \
+			$(foreach i,$($(PKG)_BIN_ARCH_EXCLUDE),-i "$(i)") \
 			-r $(TARGET_READELF) \
 			-a $(BR2_READELF_ARCH_NAME))
 endef
diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
index f6a4569c62..d8385b4fcf 100755
--- a/support/scripts/check-bin-arch
+++ b/support/scripts/check-bin-arch
@@ -1,18 +1,45 @@
 #!/usr/bin/env bash
 
-while getopts p:l:r:a: OPT ; do
+# List of hardcoded paths that should be ignored, as they may
+# contain binaries for an architecture different from the
+# architecture of the target.
+declare -a IGNORES=(
+	# Skip firmware files, they could be ELF files for other
+	# architectures
+	"/lib/firmware"
+	"/usr/lib/firmware"
+
+	# Skip kernel modules
+	# When building a 32-bit userland on 64-bit architectures, the kernel
+	# and its modules may still be 64-bit. To keep the basic
+	# check-bin-arch logic simple, just skip this directory.
+	"/lib/modules"
+
+	# Skip files in /usr/share, several packages (qemu,
+	# pru-software-support) legitimately install ELF binaries that
+	# are not for the target architecture
+	"/usr/share"
+)
+
+while getopts p:l:r:a:i: OPT ; do
 	case "${OPT}" in
 	p) package="${OPTARG}";;
 	l) pkg_list="${OPTARG}";;
 	r) readelf="${OPTARG}";;
 	a) arch_name="${OPTARG}";;
+	i)
+		# Ensure we do have single '/' as separators,
+		# and that we have a leading and a trailing one.
+		pattern="$(sed -r -e 's:/+:/:g; s:^/*:/:; s:/*$:/:;' <<<"${OPTARG}")"
+		IGNORES+=("${pattern}")
+		;;
 	:) error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
 	\?) error "unknown option '%s'\n" "${OPTARG}";;
 	esac
 done
 
 if test -z "${package}" -o -z "${pkg_list}" -o -z "${readelf}" -o -z "${arch_name}" ; then
-	echo "Usage: $0 -p <pkg> -l <pkg-file-list> -r <readelf> -a <arch name>"
+	echo "Usage: $0 -p <pkg> -l <pkg-file-list> -r <readelf> -a <arch name> [-i PATH ...]"
 	exit 1
 fi
 
@@ -23,26 +50,11 @@ IFS="
 "
 
 while read f; do
-	# Skip firmware files, they could be ELF files for other
-	# architectures
-	if [[ "${f}" =~ ^/(usr/)?lib/firmware/.* ]]; then
-		continue
-	fi
-
-	# Skip kernel modules
-	# When building a 32-bit userland on 64-bit architectures, the kernel
-	# and its modules may still be 64-bit. To keep the basic
-	# check-bin-arch logic simple, just skip this directory.
-	if [[ "${f}" =~ ^/lib/modules/.* ]]; then
-		continue
-	fi
-
-	# Skip files in /usr/share, several packages (qemu,
-	# pru-software-support) legitimately install ELF binaries that
-	# are not for the target architecture
-	if [[ "${f}" =~ ^/usr/share/.* ]]; then
-		continue
-	fi
+	for ignore in "${IGNORES[@]}"; do
+		if [[ "${f}" =~ ^"${ignore}" ]]; then
+			continue 2
+		fi
+	done
 
 	# Skip symlinks. Some symlinks may have absolute paths as
 	# target, pointing to host binaries while we're building.
