From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  7 Mar 2018 21:27:18 +0100
Subject: [Buildroot] [PATCH 1/2] spport/check-bin-arch: accept arbitrary
 ignore paths
In-Reply-To: <cover.1520454419.git.yann.morin.1998@free.fr>
References: <cover.1520454419.git.yann.morin.1998@free.fr>
Message-ID: <8a08e5fbfab7e4d021565077544576ad495c8097.1520454419.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages (mostly, out-of-tree) may want to install binary blobs for
another architecture,  outside the locations we currently exclude, like
in /opt or whatever...

Add support in check-bin-arch to accept any arbitrary location, that
individual package can each request to excude from the check, when they
are installed.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-generic.txt |  7 ++++
 package/pkg-generic.mk                  |  1 +
 support/scripts/check-bin-arch          | 58 ++++++++++++++++++++-------------
 3 files changed, 44 insertions(+), 22 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 63ea51bf89..1f5d92d2c9 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -453,6 +453,13 @@ information is (assuming the package name is +libfoo+) :
   FLAT binary format is only 4k bytes. If the application consumes more stack,
   append the required number here.
 
+* +LIBFOO_BIN_ARCH_EXCLUDE+ is a space-separated list of path (relative
+  to the target directory) to ignore when checking that the package
+  installs correctly cross-compiled binaries. You seldom need to set this
+  variable, unless the package installs installs binary blobs in the
+  non-default locations: `/lib/firmware`, `/usr/lib/firmware`,
+  `/lib/modules`, and `/usr/share`.
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
index f6a4569c62..922791ab89 100755
--- a/support/scripts/check-bin-arch
+++ b/support/scripts/check-bin-arch
@@ -1,18 +1,47 @@
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
+		IGNORES+=( "$(sed -r -e 's:/+:/:g; s:^/*:/:; s:/*$:/:;' \
+				  <<<"${OPTARG}"
+			     )"
+			 )
+		;;
 	:) error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
 	\?) error "unknown option '%s'\n" "${OPTARG}";;
 	esac
 done
 
 if test -z "${package}" -o -z "${pkg_list}" -o -z "${readelf}" -o -z "${arch_name}" ; then
-	echo "Usage: $0 -p <pkg> -l <pkg-file-list> -r <readelf> -a <arch name>"
+	echo "Usage: $0 -p <pkg> -l <pkg-file-list> -r <readelf> -a <arch name> [-i PATTERN ...]"
 	exit 1
 fi
 
@@ -23,26 +52,11 @@ IFS="
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
-- 
2.14.1
