From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 Jul 2017 03:05:19 +0200
Subject: [Buildroot] [PATCH v7 12/23] support/test-pkg: move minimal.config
	into a separate file
In-Reply-To: <20170721010530.4747-1-arnout@mind.be>
References: <20170721010530.4747-1-arnout@mind.be>
Message-ID: <20170721010530.4747-13-arnout@mind.be>
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
v7: Re-ordered the patch
v6: Use support/config-fragments instead of support/misc
v5: First version
---
 support/config-fragments/minimal.config | 6 ++++++
 utils/test-pkg                          | 8 +-------
 2 files changed, 7 insertions(+), 7 deletions(-)
 create mode 100644 support/config-fragments/minimal.config

diff --git a/support/config-fragments/minimal.config b/support/config-fragments/minimal.config
new file mode 100644
index 0000000000..0f20847f6d
--- /dev/null
+++ b/support/config-fragments/minimal.config
@@ -0,0 +1,6 @@
+# This config fragment disables Buildroot options that are turned on by
+# default, in order to arrive at minimal build time.
+BR2_INIT_NONE=y
+BR2_SYSTEM_BIN_SH_NONE=y
+# BR2_PACKAGE_BUSYBOX is not set
+# BR2_TARGET_ROOTFS_TAR is not set
diff --git a/utils/test-pkg b/utils/test-pkg
index 7633a21e53..25a25e2048 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -100,13 +100,7 @@ build_one() {
         return 2
     fi
 
-    cat >>"${dir}/.config" <<-_EOF_
-	BR2_INIT_NONE=y
-	BR2_SYSTEM_BIN_SH_NONE=y
-	# BR2_PACKAGE_BUSYBOX is not set
-	# BR2_TARGET_ROOTFS_TAR is not set
-	_EOF_
-    cat "${cfg}" >>"${dir}/.config"
+    cat "support/config-fragments/minimal.config" "${cfg}" >>"${dir}/.config"
 
     if ! make O="${dir}" olddefconfig > "${dir}/logfile" 2>&1; then
         return 2
-- 
2.13.2
