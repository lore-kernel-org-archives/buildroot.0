From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 29 Mar 2020 22:19:25 +0200
Subject: [Buildroot] [git commit] package/optee-client: add option to
 configure TEE-based storage location
Message-ID: <20200329200708.F02B88909A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96929f344ff6ad2eb8311933d3a8a69a2be02882
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OP-TEE provides the possibility of secure storage done by the
normal world OS via tee-supplicant.

The location is a compile-time value and by default it is /data/tee .
As this might not be suitable for all use-cases add an option to
set the CFG_TEE_FS_PARENT_PATH compile option.

Default value is still /data/tee as it was before adding this option.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/optee-client/Config.in       | 12 ++++++++++++
 package/optee-client/optee-client.mk |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
index e519a13456..1ef0a1401e 100644
--- a/package/optee-client/Config.in
+++ b/package/optee-client/Config.in
@@ -13,5 +13,17 @@ config BR2_PACKAGE_OPTEE_CLIENT
 
 	  https://github.com/OP-TEE/optee_client
 
+if BR2_PACKAGE_OPTEE_CLIENT
+
+config BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH
+	string "Path for normal world OS secure storage"
+	default "/data/tee"
+	help
+	  Path to storage area for secure storage based on the
+	  normal world OS providing the actual storage via
+	  tee-supplicant.
+
+endif
+
 comment "optee-client needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 15bebdc615..64235b41e4 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -10,6 +10,9 @@ OPTEE_CLIENT_LICENSE = BSD-2-Clause
 OPTEE_CLIENT_LICENSE_FILES = LICENSE
 OPTEE_CLIENT_INSTALL_STAGING = YES
 
+OPTEE_CLIENT_CONF_OPTS = \
+	-DCFG_TEE_FS_PARENT_PATH=$(BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH)
+
 define OPTEE_CLIENT_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D $(OPTEE_CLIENT_PKGDIR)/S30optee \
 		$(TARGET_DIR)/etc/init.d/S30optee
