From: Heiko Stuebner <heiko@sntech.de>
Date: Tue, 24 Mar 2020 16:42:55 +0100
Subject: [Buildroot] [PATCH RESEND 1/1] package/optee-client: add option to
 configure REE-based storage location
Message-ID: <20200324154255.1300634-1-heiko@sntech.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

OP-TEE provides the possibility of secure storage done by the
normal world OS via tee-supplicant.

The location is a compile-time value and by default it is /data/tee .
As this might not be suitable for all use-cases add an option to
set the CFG_TEE_FS_PARENT_PATH compile option.

Default value is still /data/tee as it was before adding this option.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
resend due to buildroot ml rejecting the first try.

 package/optee-client/Config.in       | 8 ++++++++
 package/optee-client/optee-client.mk | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
index e519a13456..f187c0f2f1 100644
--- a/package/optee-client/Config.in
+++ b/package/optee-client/Config.in
@@ -13,5 +13,13 @@ config BR2_PACKAGE_OPTEE_CLIENT
 
 	  https://github.com/OP-TEE/optee_client
 
+config BR2_PACKAGE_OPTEE_CLIENT_REE_FS_PATH
+	string "Path for normal world OS secure storage"
+	default "/data/tee"
+	help
+	  Path to storage area for secure storage based on the
+	  normal world OS providing the actual storage via
+	  tee-supplicant.
+
 comment "optee-client needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 15bebdc615..0121fab7dd 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -10,6 +10,8 @@ OPTEE_CLIENT_LICENSE = BSD-2-Clause
 OPTEE_CLIENT_LICENSE_FILES = LICENSE
 OPTEE_CLIENT_INSTALL_STAGING = YES
 
+OPTEE_CLIENT_CONF_OPTS = -DCFG_TEE_FS_PARENT_PATH=$(BR2_PACKAGE_OPTEE_CLIENT_REE_FS_PATH)
+
 define OPTEE_CLIENT_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D $(OPTEE_CLIENT_PKGDIR)/S30optee \
 		$(TARGET_DIR)/etc/init.d/S30optee
-- 
2.24.1
