From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 22 Nov 2015 00:18:38 +0100
Subject: [Buildroot] [PATCH 2/3] Config.in: add symbols for
	BR2_HOST_GCC_AT_LEAST_X_Y
In-Reply-To: <1448147919-5463-1-git-send-email-arnout@mind.be>
References: <1448147919-5463-1-git-send-email-arnout@mind.be>
Message-ID: <1448147919-5463-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some host packages need a recent gcc version. Add symbols to Config.in
to specify the HOSTCC version. The values are passed through the
environment, and this environment is generated in a new support script.

Also update the documentation to mention the new symbols.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in                                 | 17 ++++++++++
 Makefile                                  |  1 +
 docs/manual/adding-packages-directory.txt |  7 ++++
 support/scripts/gcc-version-variables     | 56 +++++++++++++++++++++++++++++++
 4 files changed, 81 insertions(+)
 create mode 100755 support/scripts/gcc-version-variables

diff --git a/Config.in b/Config.in
index d795361..7bec90c 100644
--- a/Config.in
+++ b/Config.in
@@ -18,6 +18,23 @@ config BR2_EXTERNAL
 	string
 	option env="BR2_EXTERNAL"
 
+# Hidden config symbols for packages to check system gcc version
+config BR2_HOST_GCC_AT_LEAST_4_7
+	bool
+	option env="HOST_GCC_AT_LEAST_4_7"
+
+config BR2_HOST_GCC_AT_LEAST_4_8
+	bool
+	option env="HOST_GCC_AT_LEAST_4_8"
+
+config BR2_HOST_GCC_AT_LEAST_4_9
+	bool
+	option env="HOST_GCC_AT_LEAST_4_9"
+
+config BR2_HOST_GCC_AT_LEAST_5
+	bool
+	option env="HOST_GCC_AT_LEAST_5"
+
 # Hidden boolean selected by packages in need of Java in order to build
 # (example: xbmc)
 config BR2_NEEDS_HOST_JAVA
diff --git a/Makefile b/Makefile
index 76c9bff..60d9a0f 100644
--- a/Makefile
+++ b/Makefile
@@ -712,6 +712,7 @@ COMMON_CONFIG_ENV = \
 	KCONFIG_TRISTATE=$(BUILD_DIR)/buildroot-config/tristate.config \
 	BR2_CONFIG=$(BR2_CONFIG) \
 	BR2_EXTERNAL=$(BR2_EXTERNAL) \
+	$(shell support/scripts/gcc-version-variables $(HOSTCC_NOCCACHE)) \
 	SKIP_LEGACY=
 
 xconfig: $(BUILD_DIR)/buildroot-config/qconf outputmakefile
diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 139123e..c2d9f75 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -283,6 +283,13 @@ use in the comment.
 ** Comment string: +gcc >= X.Y+ and/or `gcc <= X.Y` (replace
    +X.Y+ with the proper version)
 
+* Host GCC version
+** Dependency symbol: +BR2_HOST_GCC_AT_LEAST_X_Y+, (replace
+   +X_Y+ with the proper version, see +Config.in+)
+** Comment string: no comment to be added
+** Note that it is usually not the package itself that has a minimum
+   host GCC version, but rather a host-package on which it depends.
+
 * C library
 ** Dependency symbol: +BR2_TOOLCHAIN_USES_GLIBC+,
    +BR2_TOOLCHAIN_USES_MUSL+, +BR2_TOOLCHAIN_USES_UCLIBC+
diff --git a/support/scripts/gcc-version-variables b/support/scripts/gcc-version-variables
new file mode 100755
index 0000000..282cfc3
--- /dev/null
+++ b/support/scripts/gcc-version-variables
@@ -0,0 +1,56 @@
+#! /bin/sh
+#
+# Print the environment variables for top-level Config.in's
+# HOST_GCC_AT_LEAST_X_Y. First argument is the compiler.
+#
+# Copyright (C) 2014 by the Buildroot developers <buildroot@buildroot.org>
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+# General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program; if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+#
+
+HOSTCC_NOCCACHE="$1"
+
+# hostcc version as an integer - E.G. 4.9.2 => 49
+HOSTCC_VERSION=$(${HOSTCC_NOCCACHE} --version | \
+    sed -n 's/^.* \([0-9]*\)\.\([0-9]*\)\.\([0-9]*\)[ ]*.*$/\1\2/p')
+
+if [ -z "$HOSTCC_VERSION" ]; then
+    printf 'Usage: %s <path-to-compiler>\n' "$0" 1>&2
+    exit 1
+fi
+
+print_host_gcc_at_least() {
+    local version
+    printf 'HOST_GCC_AT_LEAST_%s' "$1"
+    if [ "$2" ]; then
+        printf '_%s' "$2"
+        version="$1$2"
+    else
+        version="${1}0"
+    fi
+    printf '='
+
+    if [ "$HOSTCC_VERSION" -ge $version ]; then
+        printf 'y'
+    else
+        printf 'n'
+    fi
+    printf ' '
+}
+
+print_host_gcc_at_least 4 7
+print_host_gcc_at_least 4 8
+print_host_gcc_at_least 4 9
+print_host_gcc_at_least 5
-- 
2.6.2
