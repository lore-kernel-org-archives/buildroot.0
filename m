From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Sep 2012 01:40:47 +0200
Subject: [Buildroot] [PATCH 2/7] support/scripts: add a script to add a new
	package
In-Reply-To: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1347234052-10527-3-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This script asks a few questions to the user, and creates the skeleton
files (Config.in and package.mk).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/adding-packages-script.txt |   41 +++++++++
 docs/manual/adding-packages.txt        |    2 +
 support/scripts/pkg-new                |  151 ++++++++++++++++++++++++++++++++
 3 files changed, 194 insertions(+), 0 deletions(-)
 create mode 100644 docs/manual/adding-packages-script.txt
 create mode 100755 support/scripts/pkg-new

diff --git a/docs/manual/adding-packages-script.txt b/docs/manual/adding-packages-script.txt
new file mode 100644
index 0000000..b19e6ee
--- /dev/null
+++ b/docs/manual/adding-packages-script.txt
@@ -0,0 +1,41 @@
+Scripted new package
+--------------------
+
+To help you add your new package, Buildroot offers a script that partially
+automates the creation of a new package: +support/scripts/pkg-new+.
+
+When run, this script asks you a few questions about your package, and
+creates skeleton files for you, so you only have to fill-in the the values
+for the different variables.
+
+----
+$ ./support/script/pkg-new
+Name of the package: libfoo
+
+1) none
+2) multimedia
+3) java
+4) x11r7
+5) games
+Category of your package: 1
+
+1) autotools
+2) cmake
+3) generic
+Build-system your package is using: 1
+
+Your package skeleton files have been created; you can now edit these files
+to complete the creation of the package:
+  package/libfoo/Config.in
+  package/libfoo/libfoo.mk
+
+Do not forget to also edit 'package/Config.in' to include
+package/libfoo/Config.in in the correct location.
+----
+
+Then, you just have to edit the two generated files with appropriate values.
+Refer to the following sections for each type of build-system:
+
+* xref:generic-package-tutorial[]
+* xref:autotools-package-tutorial[]
+* xref:cmake-package-tutorial[]
diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
index cb75f2d..1aacaa8 100644
--- a/docs/manual/adding-packages.txt
+++ b/docs/manual/adding-packages.txt
@@ -19,4 +19,6 @@ include::adding-packages-handwritten.txt[]
 
 include::adding-packages-gettext.txt[]
 
+include::adding-packages-script.txt[]
+
 include::adding-packages-conclusion.txt[]
diff --git a/support/scripts/pkg-new b/support/scripts/pkg-new
new file mode 100755
index 0000000..4e1ddac
--- /dev/null
+++ b/support/scripts/pkg-new
@@ -0,0 +1,151 @@
+#!/bin/bash
+
+my_name="${0##*/}"
+
+# -----------------------------------------------------------------------------
+# Ask some questions...
+# 
+
+# List of known categories:
+CAT_LIST=( none multimedia java x11r7 games )
+# List of known build-systems:
+BS_LIST=( autotools cmake generic )
+
+# --------------------------------------
+# First, some trivial stuff: what's the package name?
+if [ -n "${1}" ]; then
+    pkg_name="${1}"
+    printf "Starting addition of new package '%s'\n" "${pkg_name}"
+else
+    read -p "Name of the package: " pkg_name
+fi
+
+# Check we do not already have this package
+pkgs="$( find package -type d -name "${pkg_name}" 2>/dev/null )"
+if [ -n "${pkgs}" ]; then
+    printf "%s: error: package '%s' already exists in:\n"   \
+           "${my_name}" "${pkg_name}"
+    for p in ${pkgs}; do
+        printf "    %s\n" "${p}"
+    done
+    exit 1
+fi
+PKG_NAME="$( tr '[:lower:]-' '[:upper:]_' <<<"${pkg_name}" )"
+
+# --------------------------------------
+# Will it be categorised?
+printf "\n"
+PS3="Category of your package: "
+select pkg_cat in "${CAT_LIST[@]}"; do
+    case "${pkg_cat}" in
+        none)   pkg_cat=""; break;;
+        ?*)     break;;
+    esac
+    printf "Please enter a number in [1..%d]\n" "${#CAT_LIST[@]}"
+done
+
+pkg_dir="package/${pkg_cat}/${pkg_name}"
+pkg_dir="${pkg_dir//\/\///}"
+
+# --------------------------------------
+# What kind of build system is it using?
+printf "\n"
+PS3="Build-system your package is using: "
+select pkg_bs in "${BS_LIST[@]}"; do
+    case "${pkg_bs}" in
+        *?)     break;;
+    esac
+    printf "Please enter a number in [1..%d]\n" "${#BS_LIST[@]}"
+done
+
+# -----------------------------------------------------------------------------
+# Now we can create the package
+#
+
+mkdir -p "${pkg_dir}"
+
+# --------------------------------------
+# Can't use 'cat <<-_EOF_', as Config.in uses leading tabs.
+sed -r -e 's/^    //;' >"${pkg_dir}/Config.in" <<_EOF_
+    config BR2_PACKAGE_${PKG_NAME}_AVAILABLE
+    	def_bool y
+    	# Here, add one 'depends on' line for each of your
+    	# package's dependencies, eg.:
+    	#depends on BR2_PACKAGE_LIBBAR_AVAILABLE
+    	#depends on BR2_LARGEFILE
+    
+    # Update this comment to tell why the package is not available:
+    comment "${pkg_name} requires XXX and YYY"
+    	depends on !BR2_PACKAGE_${PKG_NAME}_AVAILABLE
+    
+    config BR2_PACKAGE_${PKG_NAME}
+    	bool "${pkg_name}"
+    	depends on BR2_PACKAGE_${PKG_NAME}_AVAILABLE
+    	# Here, add one 'select' line for each package your
+    	# package depends on, eg.:
+    	#select BR2_PACKAGE_LIBBAR
+    	help
+    	  # Here, add a short description of your package
+    	  # For example, copy the first few description sentences
+    	  # from the package's website
+    	  
+    	  # Also, add a pointer to the package's website
+    
+    # Here, you may add optional features/options of your package:
+    if BR2_PACKAGE_${PKG_NAME}
+    endif # BR2_PACKAGE_${PKG_NAME}
+_EOF_
+
+# --------------------------------------
+# Create the package.mk file
+cat >"${pkg_dir}/${pkg_name}.mk" <<-_EOF_
+	#############################################################
+	#
+	# ${pkg_name}
+	#
+	#############################################################
+	
+	${PKG_NAME}_VERSION       = 
+	${PKG_NAME}_SOURCE        = 
+	${PKG_NAME}_SITE          = 
+	${PKG_NAME}_DEPENDENCIES  = 
+	${PKG_NAME}_LICENSE       = 
+	${PKG_NAME}_LICENSE_FILES = 
+	
+_EOF_
+
+if [ "${pkg_bs}" = "generic" ]; then
+    cat  >>"${pkg_dir}/${pkg_name}.mk" <<-_EOF_
+		# See docs/manual/ for the complete list of actions that can
+		# be defined; only the most common ones are listed below:
+		
+		define ${PKG_NAME}_CONFIGURE_CMDS
+		endef
+		
+		define ${PKG_NAME}_BUILD_CMDS
+		endef
+		
+		define ${PKG_NAME}_INSTALL_TARGET_CMDS
+		endef
+		
+		define ${PKG_NAME}_UNINSTALL_TARGET_CMDS
+		endef
+		
+	_EOF_
+fi
+
+printf '$(eval $(%s-package))\n' "${pkg_bs}" >>"${pkg_dir}/${pkg_name}.mk"
+
+# -----------------------------------------------------------------------------
+# The End
+# 
+cat <<-_EOF_
+	
+	Your package skeleton files have been created; you can now edit these files
+	to complete the creation of the package:
+	  ${pkg_dir}/Config.in
+	  ${pkg_dir}/${pkg_name}.mk
+	
+	Do not forget to also edit '${pkg_dir%/${pkg_name}}/Config.in' to include
+	${pkg_dir}/Config.in in the correct location.
+_EOF_
-- 
1.7.2.5
