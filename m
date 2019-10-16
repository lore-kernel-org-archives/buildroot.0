From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 16 Oct 2019 13:19:25 +0200
Subject: [Buildroot] [PATCH 2/4] prepare build infrastructure to pick up
 installed meson tool
In-Reply-To: <20191016111927.14208-1-nolange79@gmail.com>
References: <20191016111927.14208-1-nolange79@gmail.com>
Message-ID: <20191016111927.14208-3-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Automatically check for an available meson tool,
and use it as long as the version is fitting.

Using a system provided meson is not an official supported
option, hence this is currently disabled.
use of the system provided meson can be enforced with:

   make ... BR2_MESON_VERSION_MIN=0

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/pkg-meson.mk                     |  4 +--
 support/dependencies/check-host-meson.mk | 15 ++++++++
 support/dependencies/check-host-meson.sh | 45 ++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 2 deletions(-)
 create mode 100644 support/dependencies/check-host-meson.mk
 create mode 100755 support/dependencies/check-host-meson.sh

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 2756fb7856..3a66ab8f5a 100644
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

@@ -99,7 +99,7 @@ endef
 endif
 endif

-$(2)_DEPENDENCIES += host-meson
+$(2)_DEPENDENCIES += $(BR2_MESON_HOST_DEPENDENCY)

 #
 # Build step. Only define it if not already defined by the package .mk
diff --git a/support/dependencies/check-host-meson.mk b/support/dependencies/check-host-meson.mk
new file mode 100644
index 0000000000..fbe0b7d7aa
--- /dev/null
+++ b/support/dependencies/check-host-meson.mk
@@ -0,0 +1,15 @@
+# Set this to a valid version like  0.49, depending on the highest minimum
+# version required by any of the packages bundled in Buildroot.
+# An empty version will never match a system executable
+#
+# BR2_MESON_VERSION_MIN = 0.49
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
index 0000000000..62746822cc
--- /dev/null
+++ b/support/dependencies/check-host-meson.sh
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
