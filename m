From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  4 Feb 2020 15:24:53 +0100
Subject: [Buildroot] [PATCH 2/5] package/python3: install wrapper in
 HOST_BIN_CROSS
In-Reply-To: <20200204142456.1537358-1-arnout@mind.be>
References: <20200204142456.1537358-1-arnout@mind.be>
Message-ID: <20200204142456.1537358-3-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When building python packages, we set some environment variables to make
sure python picks up the correct configuration even though we're running
host-python intead of target-python.

Create a wrapper script that does the same, without requiring an
explicit export from Buildroot. This script is installed in
HOST_BIN_CROSS so that it can be found when cross-compiling.

The script is made auto-discovering as much as possible. Since we know
the script will be installed in $(HOST_DIR)/$(GNU_TARGET_NAME)/bin, we
know that STAGING_DIR is at ../sysroot. sysconfigdata can be calculated
based on that. Since this is specific for python3, we don't need the
python3 condition. Only PYTHONPATH is still passed in explicitly, since
that refers to TARGET_DIR - because most python packages are only
installed in target and not in staging. So until we install everything
in staging as well, we keep an explicit TARGET_DIR.

Since the installation hook uses PYTHON3_PATH, move the definition of
that variable higher in the file so it comes before its first use.

It is not really necessary to have a similar script for native python,
because the only environment variable we need in that case is
PYTHONNOUSERSITE=1.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python3/python-wrapper.in | 24 ++++++++++++++++++++++++
 package/python3/python3.mk        | 17 ++++++++++++++---
 2 files changed, 38 insertions(+), 3 deletions(-)
 create mode 100644 package/python3/python-wrapper.in

diff --git a/package/python3/python-wrapper.in b/package/python3/python-wrapper.in
new file mode 100644
index 0000000000..c2f34f32df
--- /dev/null
+++ b/package/python3/python-wrapper.in
@@ -0,0 +1,24 @@
+#! /bin/sh
+
+STAGING_DIR=$(cd "${0%/*}/../sysroot"; pwd)
+
+SYSCONFIGDATA=""
+for sysconfig in ${STAGING_DIR}/usr/lib/python*/_sysconfigdata__linux_*.py; do
+    if [ -n "$SYSCONFIGDATA" ]; then
+        echo "*** More than one sysconfigdata exists. Buildroot doesn't support mixing targets." 1>&2
+        exit 1
+    fi
+    if [ ! -r "$sysconfig" ]; then
+        echo "*** No sysconfigdata found in $sysconfig." 1>&2
+        exit 1
+    fi
+    SYSCONFIGDATA="$(echo $sysconfig | sed 's%.*/\([^/]*\).py%\1%')"
+done
+
+PYTHONPATH="@PYTHON_PATH@" \
+PYTHONNOUSERSITE=1 \
+_PYTHON_SYSCONFIGDATA_NAME="$SYSCONFIGDATA" \
+_python_sysroot="$STAGING_DIR" \
+_python_prefix=/usr \
+_python_exec_prefix=/usr \
+exec "${0%/*}/../../bin/python3" "$@"
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 9432f1c59e..6280b4a550 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -239,6 +239,20 @@ ifneq ($(BR2_PACKAGE_PYTHON),y)
 PYTHON3_POST_INSTALL_TARGET_HOOKS += PYTHON3_INSTALL_SYMLINK
 endif
 
+# Provided to other packages
+PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/
+
+define PYTHON3_INSTALL_CROSS_WRAPPER
+	mkdir -p $(HOST_BIN_CROSS)
+	sed 's%@PYTHON_PATH@%$(PYTHON3_PATH)%' \
+		package/python3/python-wrapper.in \
+		> $(HOST_BIN_CROSS)/python
+	chmod 0755 $(HOST_BIN_CROSS)/python
+	ln -sf python $(HOST_BIN_CROSS)/python3
+endef
+
+PYTHON3_POST_INSTALL_STAGING_HOOKS += PYTHON3_INSTALL_CROSS_WRAPPER
+
 # Some packages may have build scripts requiring python3, whatever is the
 # python version chosen for the target.
 # Only install the python symlink in the host tree if python3 is enabled
@@ -252,9 +266,6 @@ endef
 HOST_PYTHON3_POST_INSTALL_HOOKS += HOST_PYTHON3_INSTALL_SYMLINK
 endif
 
-# Provided to other packages
-PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/
-
 # Support for socket.AF_BLUETOOTH
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_HEADERS),y)
 PYTHON3_DEPENDENCIES += bluez5_utils-headers
-- 
2.24.1
