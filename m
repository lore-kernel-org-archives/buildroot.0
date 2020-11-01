From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  1 Nov 2020 21:43:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/optee-client: disable -Werror
Message-ID: <20201101204349.2553267-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable -Werror thanks to CFG_WERROR which is available since version
3.3.0 and
https://github.com/OP-TEE/optee_client/commit/5355fdb841bce4f7cce3dd37fc31fa91bd625c98
to fix the following build failure with optee-client 3.11.0:

/home/giuliobenetti/autobuild/run/instance-2/output-1/build/optee-client-3.11.0/libckteec/src/pkcs11_processing.c: In function 'ck_create_object':
/home/giuliobenetti/autobuild/run/instance-2/output-1/build/optee-client-3.11.0/libckteec/src/pkcs11_processing.c:22:9: error: missing initializer for field 'buffer' of 'struct serializer' [-Werror=missing-field-initializers]
  struct serializer obj = { };
         ^

Fixes:
 - http://autobuild.buildroot.org/results/a3d663adb943aee814180f01d6e153b3309be962

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/optee-client/optee-client.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 8108fc2130..7f613f724d 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -11,7 +11,8 @@ OPTEE_CLIENT_LICENSE_FILES = LICENSE
 OPTEE_CLIENT_INSTALL_STAGING = YES
 
 OPTEE_CLIENT_CONF_OPTS = \
-	-DCFG_TEE_FS_PARENT_PATH=$(BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH)
+	-DCFG_TEE_FS_PARENT_PATH=$(BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH) \
+	-DCFG_WERROR=OFF
 
 define OPTEE_CLIENT_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D $(OPTEE_CLIENT_PKGDIR)/S30optee \
-- 
2.28.0
