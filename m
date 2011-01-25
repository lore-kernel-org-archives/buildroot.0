From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Jan 2011 22:07:14 +0100
Subject: [Buildroot] [git commit master 1/1] crosstool-ng: don't remove
	installation directory before installing
Message-ID: <20110125211621.EA9998D245@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=82cf0e93f1a72bb4af5b6e3c30f80b2e01bf2358
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

crosstool-ng would normally delete its installation directory before
installing the toolchain to ensure it wouldn't get confused by an earlier
build. Now that we're installing directly into HOST_DIR/usr, this doesn't
work very well - So get rid of the rm's.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../002-dont-nuke-ct-prefix.patch                  |   37 ++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 toolchain/toolchain-crosstool-ng/002-dont-nuke-ct-prefix.patch

diff --git a/toolchain/toolchain-crosstool-ng/002-dont-nuke-ct-prefix.patch b/toolchain/toolchain-crosstool-ng/002-dont-nuke-ct-prefix.patch
new file mode 100644
index 0000000..a5405fa
--- /dev/null
+++ b/toolchain/toolchain-crosstool-ng/002-dont-nuke-ct-prefix.patch
@@ -0,0 +1,37 @@
+ct-ng: don't remove CT_PREFIX_DIR
+
+You might want to install the ct-ng toolchain into an existing directory
+with other files (which is what we're doing in BR for HOST_DIR/usr),
+so don't remove it.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ scripts/crosstool-NG.sh.in |    8 --------
+ 1 file changed, 8 deletions(-)
+
+Index: crosstool-ng-1.8.0/scripts/crosstool-NG.sh.in
+===================================================================
+--- crosstool-ng-1.8.0.orig/scripts/crosstool-NG.sh.in
++++ crosstool-ng-1.8.0/scripts/crosstool-NG.sh.in
+@@ -210,11 +210,6 @@ CT_TOOLCHAIN_ID="crosstool-${CT_VERSION}
+ 
+ CT_DoLog EXTRA "Preparing working directories"
+ 
+-# Ah! The build directory shall be eradicated, even if we restart!
+-if [ -d "${CT_BUILD_DIR}" ]; then
+-    CT_DoForceRmdir "${CT_BUILD_DIR}"
+-fi
+-
+ # Don't eradicate directories if we need to restart
+ if [ -z "${CT_RESTART}" ]; then
+     # Get rid of pre-existing installed toolchain and previous build directories.
+@@ -226,9 +221,6 @@ if [ -z "${CT_RESTART}" ]; then
+     if [ "${CT_FORCE_EXTRACT}" = "y" -a -d "${CT_SRC_DIR}" ]; then
+         CT_DoForceRmdir "${CT_SRC_DIR}"
+     fi
+-    if [ -d "${CT_INSTALL_DIR}" ]; then
+-        CT_DoForceRmdir "${CT_INSTALL_DIR}"
+-    fi
+     # In case we start anew, get rid of the previously saved state directory
+     if [ -d "${CT_STATE_DIR}" ]; then
+         CT_DoForceRmdir "${CT_STATE_DIR}"
-- 
1.7.3.4
