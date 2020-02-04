From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  4 Feb 2020 15:24:54 +0100
Subject: [Buildroot] [PATCH 3/5] package/python: install wrapper in
 HOST_BIN_CROSS
In-Reply-To: <20200204142456.1537358-1-arnout@mind.be>
References: <20200204142456.1537358-1-arnout@mind.be>
Message-ID: <20200204142456.1537358-4-arnout@mind.be>
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
know that STAGING_DIR is at ../sysroot. PYTHONPATH is still passed in
explicitly, since that refers to TARGET_DIR - because most python
packages are only installed in target and not in staging. So until we
install everything in staging as well, we keep an explicit TARGET_DIR.

sysconfigdata is not needed for python2 because it is not "multilib":
there is only a target sysonfigdata module in STAGING_DIR.

Since the installation hook uses PYTHON_PATH, move the definition of
that variable higher in the file so it comes before its first use.

It is not really necessary to have a similar script for native python,
because the only environment variable we need in that case is
PYTHONNOUSERSITE=1.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python/python-wrapper.in | 10 ++++++++++
 package/python/python.mk         | 17 ++++++++++++++---
 2 files changed, 24 insertions(+), 3 deletions(-)
 create mode 100644 package/python/python-wrapper.in

diff --git a/package/python/python-wrapper.in b/package/python/python-wrapper.in
new file mode 100644
index 0000000000..c5e6e5481b
--- /dev/null
+++ b/package/python/python-wrapper.in
@@ -0,0 +1,10 @@
+#! /bin/sh
+
+STAGING_DIR=$(cd "${0%/*}/../sysroot"; pwd)
+
+PYTHONPATH="@PYTHON_PATH@" \
+PYTHONNOUSERSITE=1 \
+_python_sysroot="$STAGING_DIR" \
+_python_prefix=/usr \
+_python_exec_prefix=/usr \
+exec "${0%/*}/../../bin/python" "$@"
diff --git a/package/python/python.mk b/package/python/python.mk
index 41a981e3d3..6f2e01386e 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -227,6 +227,20 @@ PYTHON_POST_INSTALL_STAGING_HOOKS += PYTHON_INSTALL_STAGING_PYTHON_CONFIG_SYMLIN
 
 PYTHON_AUTORECONF = YES
 
+# Provided to other packages
+PYTHON_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/
+
+define PYTHON_INSTALL_CROSS_WRAPPER
+	mkdir -p $(HOST_BIN_CROSS)
+	sed 's%@PYTHON_PATH@%$(PYTHON_PATH)%' \
+		package/python/python-wrapper.in \
+		> $(HOST_BIN_CROSS)/python
+	chmod 0755 $(HOST_BIN_CROSS)/python
+	ln -sf python $(HOST_BIN_CROSS)/python2
+endef
+
+PYTHON_POST_INSTALL_STAGING_HOOKS += PYTHON_INSTALL_CROSS_WRAPPER
+
 # Some packages may have build scripts requiring python2.
 # Only install the python symlink in the host tree if python3 is not enabled
 # for the target, otherwise the default python program may be missing.
@@ -239,9 +253,6 @@ endef
 HOST_PYTHON_POST_INSTALL_HOOKS += HOST_PYTHON_INSTALL_PYTHON_SYMLINK
 endif
 
-# Provided to other packages
-PYTHON_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
-- 
2.24.1
