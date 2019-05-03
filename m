From: Norbert Lange <nolange79@gmail.com>
Date: Fri,  3 May 2019 15:18:50 +0200
Subject: [Buildroot] [PATCH 1/2] allow build infrastructure to pick up
 installed meson tool
Message-ID: <20190503131851.12315-1-norbert.lange@andritz.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Norbert Lange <nolange79@gmail.com>

Automatically check for an available meson tool,
and use it aslond the version is fitting.

Some concerns are about being able to figure out the
correct version for all available packages in buildroot.
The min version could be set to version 1.0 to postpone the
problem, but still have the infrastructure in place
to allow users to override the version.

Currently host-ninja will still be always built.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/meson/meson.mk                   |  1 -
 package/pkg-meson.mk                     |  4 +--
 support/dependencies/check-host-meson.mk | 16 +++++++++
 support/dependencies/check-host-meson.sh | 45 ++++++++++++++++++++++++
 4 files changed, 63 insertions(+), 3 deletions(-)
 create mode 100644 support/dependencies/check-host-meson.mk
 create mode 100755 support/dependencies/check-host-meson.sh

diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index cf62b0ddde..2ce7a26ab5 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -10,7 +10,6 @@ MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
 MESON_SETUP_TYPE = setuptools

-HOST_MESON_DEPENDENCIES = host-ninja
 HOST_MESON_NEEDS_HOST_PYTHON = python3

 HOST_MESON_TARGET_ENDIAN = $(call LOWERCASE,$(BR2_ENDIAN))
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 7f1838c09a..25e9bb814e 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -25,7 +25,7 @@
 # $(HOST_DIR)/bin/python3 will not look for Meson modules in
 # $HOME/.local/lib/python3.x/site-packages
 #
-MESON		= PYTHONNOUSERSITE=y $(HOST_DIR)/bin/meson
+MESON		= PYTHONNOUSERSITE=y $(BR2_MESON)
 NINJA		= PYTHONNOUSERSITE=y $(HOST_DIR)/bin/ninja
 NINJA_OPTS	= $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)

@@ -105,7 +105,7 @@ endef
 endif
 endif

-$(2)_DEPENDENCIES += host-meson
+$(2)_DEPENDENCIES += $(BR2_MESON_HOST_DEPENDENCY)

 #
 # Build step. Only define it if not already defined by the package .mk
diff --git a/support/dependencies/check-host-meson.mk b/support/dependencies/check-host-meson.mk
new file mode 100644
index 0000000000..6c779b3e6d
--- /dev/null
+++ b/support/dependencies/check-host-meson.mk
@@ -0,0 +1,16 @@
+# Set this to either 0.49 or higher, depending on the highest minimum
+# version required by any of the packages bundled in Buildroot. If a
+# package is bumped or a new one added, and it requires a higher
+# version, our meson infra will catch it and build its own.
+#
+BR2_MESON_VERSION_MIN = 0.49
+
+BR2_MESON_CANDIDATES ?= meson
+BR2_MESON ?= $(call suitable-host-package,meson,\
+	$(BR2_MESON_VERSION_MIN) $(BR2_MESON_CANDIDATES))
+ifeq ($(BR2_MESON),)
+BR2_MESON = $(HOST_DIR)/bin/meson
+BR2_MESON_HOST_DEPENDENCY = host-meson host-ninja
+else
+BR2_MESON_HOST_DEPENDENCY = host-ninja
+endif
diff --git a/support/dependencies/check-host-meson.sh b/support/dependencies/check-host-meson.sh
new file mode 100755
index 0000000000..805fac9349
--- /dev/null
+++ b/support/dependencies/check-host-meson.sh
@@ -0,0 +1,45 @@
+#!/bin/sh
+
+# prevent shift error
+[ $# -lt 2 ] && exit 1
+
+split_version() {
+    local VARPREFIX
+    local NUMBERS
+    local major
+    local minor
+
+    VARPREFIX=$1
+    NUMBERS=$2
+
+    major=${NUMBERS%%\.*}
+    NUMBERS=${NUMBERS#$major}; NUMBERS=${NUMBERS#\.}
+    minor=${NUMBERS%%\.*}
+    NUMBERS=${NUMBERS#$minor}; NUMBERS=${NUMBERS#\.}
+
+    # ensure that missing values are 0
+    eval "${VARPREFIX}_major=\$major; ${VARPREFIX}_minor=\$((minor + 0)); ${VARPREFIX}_bugfix=\$((NUMBERS + 0));"
+}
+
+split_version req "$1"
+
+shift
+
+for candidate; do
+
+    # Try to locate the candidate. Discard it if not located.
+    meson=$(which "${candidate}" 2>/dev/null)
+    [ -n "${meson}" ] || continue
+
+    split_version cur "$("${meson}" --version)"
+
+    [ -n "${cur_major}" -a "${cur_major}" -ge "${req_major}" ] || continue
+    [ "${cur_major}" -gt "${req_major}" ] || [ "${cur_minor}" -ge "${req_minor}" ] || continue
+    [ "${cur_minor}" -gt "${req_minor}" ] || [ "${cur_bugfix}" -ge "${req_bugfix}" ] || continue
+
+    echo "${meson}"
+    exit
+done
+
+# echo nothing: no suitable meson found
+exit 1
--
2.20.1
