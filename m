From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 6 Apr 2017 20:18:47 +0200
Subject: [Buildroot] [PATCH v5 07/13] support/test-pkg: move minimal.config
	into a separate file
In-Reply-To: <cover.1491502445.git.arnout@mind.be>
References: <cover.1491502445.git.arnout@mind.be>
Message-ID: <20170406181854.5242-7-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This minimal configuration is also very useful outside test-pkg. In
addition, it will simplify the config merge in a later patch.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/misc/minimal.config | 6 ++++++
 support/scripts/test-pkg    | 8 +-------
 2 files changed, 7 insertions(+), 7 deletions(-)
 create mode 100644 support/misc/minimal.config

diff --git a/support/misc/minimal.config b/support/misc/minimal.config
new file mode 100644
index 0000000000..0f20847f6d
--- /dev/null
+++ b/support/misc/minimal.config
@@ -0,0 +1,6 @@
+# This config fragment disables Buildroot options that are turned on by
+# default, in order to arrive at minimal build time.
+BR2_INIT_NONE=y
+BR2_SYSTEM_BIN_SH_NONE=y
+# BR2_PACKAGE_BUSYBOX is not set
+# BR2_TARGET_ROOTFS_TAR is not set
diff --git a/support/scripts/test-pkg b/support/scripts/test-pkg
index 0d093e8c2f..67f88ec380 100755
--- a/support/scripts/test-pkg
+++ b/support/scripts/test-pkg
@@ -99,13 +99,7 @@ build_one() {
         return 2
     fi
 
-    cat >>"${dir}/.config" <<-_EOF_
-	BR2_INIT_NONE=y
-	BR2_SYSTEM_BIN_SH_NONE=y
-	# BR2_PACKAGE_BUSYBOX is not set
-	# BR2_TARGET_ROOTFS_TAR is not set
-	_EOF_
-    cat "${cfg}" >>"${dir}/.config"
+    cat "support/misc/minimal.config" "${cfg}" >>"${dir}/.config"
 
     if ! make O="${dir}" olddefconfig > "${dir}/logfile" 2>&1; then
         return 2
-- 
2.11.0
