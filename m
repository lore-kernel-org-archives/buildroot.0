From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 16 Oct 2019 13:19:26 +0200
Subject: [Buildroot] [PATCH 3/4] prepare build infrastructure to pick up
 installed ninja tool
In-Reply-To: <20191016111927.14208-1-nolange79@gmail.com>
References: <20191016111927.14208-1-nolange79@gmail.com>
Message-ID: <20191016111927.14208-4-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The only notable use is as dependency from meson,
since using the system installed meson is not officially
supported, netiher is using a system installed ninja.

a user can force the use of the system installed ninja with

   make graph-depends BR2_NINJA_VERSION_MIN=0

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/meson/meson.mk                   |  1 -
 package/pkg-meson.mk                     |  2 +-
 support/dependencies/check-host-meson.mk |  4 +--
 support/dependencies/check-host-ninja.mk | 13 +++++++
 support/dependencies/check-host-ninja.sh | 45 ++++++++++++++++++++++++
 5 files changed, 61 insertions(+), 4 deletions(-)
 create mode 100644 support/dependencies/check-host-ninja.mk
 create mode 100755 support/dependencies/check-host-ninja.sh

diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 435f8d338e..98b816e2a7 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -10,7 +10,6 @@ MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
 MESON_SETUP_TYPE = setuptools

-HOST_MESON_DEPENDENCIES = host-ninja
 HOST_MESON_NEEDS_HOST_PYTHON = python3

 $(eval $(host-python-package))
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 3a66ab8f5a..aa1ef15240 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -26,7 +26,7 @@
 # $HOME/.local/lib/python3.x/site-packages
 #
 MESON		= PYTHONNOUSERSITE=y $(BR2_MESON)
-NINJA		= PYTHONNOUSERSITE=y $(HOST_DIR)/bin/ninja
+NINJA		= PYTHONNOUSERSITE=y $(BR2_NINJA)
 NINJA_OPTS	= $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)

 ################################################################################
diff --git a/support/dependencies/check-host-meson.mk b/support/dependencies/check-host-meson.mk
index fbe0b7d7aa..fb07bea792 100644
--- a/support/dependencies/check-host-meson.mk
+++ b/support/dependencies/check-host-meson.mk
@@ -9,7 +9,7 @@ BR2_MESON ?= $(call suitable-host-package,meson,\
 	$(BR2_MESON_VERSION_MIN) $(BR2_MESON_CANDIDATES))
 ifeq ($(BR2_MESON),)
 BR2_MESON = $(HOST_DIR)/bin/meson
-BR2_MESON_HOST_DEPENDENCY = host-meson host-ninja
+BR2_MESON_HOST_DEPENDENCY = host-meson $(BR2_NINJA_HOST_DEPENDENCY)
 else
-BR2_MESON_HOST_DEPENDENCY = host-ninja
+BR2_MESON_HOST_DEPENDENCY = $(BR2_NINJA_HOST_DEPENDENCY)
 endif
diff --git a/support/dependencies/check-host-ninja.mk b/support/dependencies/check-host-ninja.mk
new file mode 100644
index 0000000000..09ee45ef1e
--- /dev/null
+++ b/support/dependencies/check-host-ninja.mk
@@ -0,0 +1,13 @@
+# Set this to a valid version like 1.8.2, depending on the highest
+# minimum version required by any of the packages bundled in Buildroot.
+# An empty version will never match a system executable
+#
+# BR2_NINJA_VERSION_MIN = 1.8.2
+
+BR2_NINJA_CANDIDATES ?= ninja
+BR2_NINJA ?= $(call suitable-host-package,ninja,\
+	$(BR2_NINJA_VERSION_MIN) $(BR2_NINJA_CANDIDATES))
+ifeq ($(BR2_NINJA),)
+BR2_NINJA = $(HOST_DIR)/bin/ninja
+BR2_NINJA_HOST_DEPENDENCY = host-ninja
+endif
diff --git a/support/dependencies/check-host-ninja.sh b/support/dependencies/check-host-ninja.sh
new file mode 100755
index 0000000000..62746822cc
--- /dev/null
+++ b/support/dependencies/check-host-ninja.sh
@@ -0,0 +1,45 @@
+#!/bin/sh
+
+# prevent shift error
+[ $# -ge 2 ] && [ -n "$1" ] || exit 1
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
+    tool=$(which "${candidate}" 2>/dev/null)
+    [ -n "${tool}" ] || continue
+
+    split_version cur "$("${tool}" --version)"
+
+    [ -n "${cur_major}" -a "${cur_major}" -ge "${req_major}" ] || continue
+    [ "${cur_major}" -gt "${req_major}" ] || [ "${cur_minor}" -ge "${req_minor}" ] || continue
+    [ "${cur_minor}" -gt "${req_minor}" ] || [ "${cur_bugfix}" -ge "${req_bugfix}" ] || continue
+
+    echo "${tool}"
+    exit
+done
+
+# echo nothing: no suitable tool found
+exit 1
--
2.23.0
