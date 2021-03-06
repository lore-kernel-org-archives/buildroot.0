From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Mar 2021 23:43:54 +0100
Subject: [Buildroot] [git commit] package/optee-client: disable -Werror
Message-ID: <20210308072140.85A348896D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a47e70743abcedba51ae406853a3f414f9ff48a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/optee-client/optee-client.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 0ae8426fc1..22f205e407 100644
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
