From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 09:00:40 +0200
Subject: [Buildroot] [git commit] support/test-pkg: move minimal.config into
	a separate file
Message-ID: <20170721065642.600B582158@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c23d0c8633550e95cdbfd97f78d20b2f6b719c3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This minimal configuration is also very useful outside test-pkg. In
addition, it will simplify the config merge in a later patch.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/config-fragments/minimal.config | 6 ++++++
 utils/test-pkg                          | 8 +-------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/support/config-fragments/minimal.config b/support/config-fragments/minimal.config
new file mode 100644
index 0000000..0f20847
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
index 7633a21..25a25e2 100755
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
