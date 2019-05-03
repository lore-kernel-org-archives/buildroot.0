From: Norbert Lange <nolange79@gmail.com>
Date: Fri,  3 May 2019 15:18:51 +0200
Subject: [Buildroot] [PATCH 2/2] allow build infrastructure to pick up
 installed ninja tool
In-Reply-To: <20190503131851.12315-1-norbert.lange@andritz.com>
References: <20190503131851.12315-1-norbert.lange@andritz.com>
Message-ID: <20190503131851.12315-2-norbert.lange@andritz.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Norbert Lange <nolange79@gmail.com>

If a fitting ninja tool is detected it will be used,
otherwise the tool will be built from source.

Replace the fixed dependencies to host-ninja,
notably from the meson infrastructure.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/pkg-meson.mk                     |  2 +-
 support/dependencies/check-host-meson.mk |  4 +--
 support/dependencies/check-host-ninja.mk | 14 ++++++++
 support/dependencies/check-host-ninja.sh | 45 ++++++++++++++++++++++++
 4 files changed, 62 insertions(+), 3 deletions(-)
 create mode 100644 support/dependencies/check-host-ninja.mk
 create mode 100755 support/dependencies/check-host-ninja.sh

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 25e9bb814e..c4cf682ee8 100644
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
index 6c779b3e6d..36fc9129d1 100644
--- a/support/dependencies/check-host-meson.mk
+++ b/support/dependencies/check-host-meson.mk
@@ -10,7 +10,7 @@ BR2_MESON ?= $(call suitable-host-package,meson,\
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
index 0000000000..6d89255ee5
--- /dev/null
+++ b/support/dependencies/check-host-ninja.mk
@@ -0,0 +1,14 @@
+# Set this to either 1.8.2 or higher, depending on the highest minimum
+# version required by any of the packages bundled in Buildroot. If a
+# package is bumped or a new one added, and it requires a higher
+# version, our ninja infra will catch it and build its own.
+#
+BR2_NINJA_VERSION_MIN = 1.8.0
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
index 0000000000..7f531da98e
--- /dev/null
+++ b/support/dependencies/check-host-ninja.sh
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
+    ninja=$(which "${candidate}" 2>/dev/null)
+    [ -n "${ninja}" ] || continue
+
+    split_version cur "$("${ninja}" --version)"
+
+    [ -n "${cur_major}" -a "${cur_major}" -ge "${req_major}" ] || continue
+    [ "${cur_major}" -gt "${req_major}" ] || [ "${cur_minor}" -ge "${req_minor}" ] || continue
+    [ "${cur_minor}" -gt "${req_minor}" ] || [ "${cur_bugfix}" -ge "${req_bugfix}" ] || continue
+
+    echo "${ninja}"
+    exit
+done
+
+# echo nothing: no suitable ninja found
+exit 1
--
2.20.1
