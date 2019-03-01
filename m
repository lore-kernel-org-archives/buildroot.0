From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri,  1 Mar 2019 17:47:08 +0100
Subject: [Buildroot] [PATCH/next 4/9] package/optee-client: fix build
 warnings 3.4.0
In-Reply-To: <e709b9364807ed93b5e1dc0edfe8a1dd50006b1b.1551458062.git.etienne.carriere@linaro.org>
References: <e709b9364807ed93b5e1dc0edfe8a1dd50006b1b.1551458062.git.etienne.carriere@linaro.org>
Message-ID: <bb232c034ea826652d904417479d7d946ba7593b.1551458062.git.etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And a patch for optee-client package currently synced with tag 3.4.0
which contains source issues to be fixed.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 .../0001-libteec-fix-build-warnings.patch          | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 package/optee-client/0001-libteec-fix-build-warnings.patch

diff --git a/package/optee-client/0001-libteec-fix-build-warnings.patch b/package/optee-client/0001-libteec-fix-build-warnings.patch
new file mode 100644
index 0000000..21f47ec
--- /dev/null
+++ b/package/optee-client/0001-libteec-fix-build-warnings.patch
@@ -0,0 +1,65 @@
+From 657414ccd20b4fb2985efd83b0679964fec923c2 Mon Sep 17 00:00:00 2001
+From: Etienne Carriere <etienne.carriere@linaro.org>
+Date: Fri, 1 Mar 2019 09:36:46 +0100
+Subject: [PATCH] libteec: fix build warnings
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix build warnings reported by the Buildroot team [1]:
+
+/home/thomas/projets/outputs/armv5-ctng-linux-gnueabi/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function 'TEEC_InitializeContext':
+/home/thomas/projets/outputs/armv5-ctng-linux-gnueabi/build/optee-client-3.4.0/libteec/src/tee_client_api.c:149:28: error: 'gen_caps' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+    ctx->reg_mem = gen_caps & TEE_GEN_CAP_REG_MEM;
+                            ^
+/home/thomas/projets/buildroot/output/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function ?TEEC_OpenSession?:
+/home/thomas/projets/buildroot/output/build/optee-client-3.4.0/libteec/src/tee_client_api.c:507:8: error: cast increases required alignment of target type [-Werror=cast-align]
+  arg = (struct tee_ioctl_open_session_arg *)buf;
+        ^
+/home/thomas/projets/buildroot/output/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function ?TEEC_InvokeCommand?:
+/home/thomas/projets/buildroot/output/build/optee-client-3.4.0/libteec/src/tee_client_api.c:581:8: error: cast increases required alignment of target type [-Werror=cast-align]
+  arg = (struct tee_ioctl_invoke_arg *)buf;
+        ^
+
+[1] http://lists.busybox.net/pipermail/buildroot/2019-February/243437.html
+
+Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
+---
+ libteec/src/tee_client_api.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/libteec/src/tee_client_api.c b/libteec/src/tee_client_api.c
+index 698092b..a8683fd 100644
+--- a/libteec/src/tee_client_api.c
++++ b/libteec/src/tee_client_api.c
+@@ -140,7 +140,7 @@ TEEC_Result TEEC_InitializeContext(const char *name, TEEC_Context *ctx)
+ 		return TEEC_ERROR_BAD_PARAMETERS;
+ 
+ 	for (n = 0; n < TEEC_MAX_DEV_SEQ; n++) {
+-		uint32_t gen_caps;
++		uint32_t gen_caps = 0;
+ 
+ 		snprintf(devname, sizeof(devname), "/dev/tee%zu", n);
+ 		fd = teec_open_dev(devname, name, &gen_caps);
+@@ -504,7 +504,7 @@ TEEC_Result TEEC_OpenSession(TEEC_Context *ctx, TEEC_Session *session,
+ 	buf_data.buf_ptr = (uintptr_t)buf;
+ 	buf_data.buf_len = sizeof(buf);
+ 
+-	arg = (struct tee_ioctl_open_session_arg *)buf;
++	arg = (struct tee_ioctl_open_session_arg *)(void *)buf;
+ 	arg->num_params = TEEC_CONFIG_PAYLOAD_REF_COUNT;
+ 	params = (struct tee_ioctl_param *)(arg + 1);
+ 
+@@ -578,7 +578,7 @@ TEEC_Result TEEC_InvokeCommand(TEEC_Session *session, uint32_t cmd_id,
+ 	buf_data.buf_ptr = (uintptr_t)buf;
+ 	buf_data.buf_len = sizeof(buf);
+ 
+-	arg = (struct tee_ioctl_invoke_arg *)buf;
++	arg = (struct tee_ioctl_invoke_arg *)(void *)buf;
+ 	arg->num_params = TEEC_CONFIG_PAYLOAD_REF_COUNT;
+ 	params = (struct tee_ioctl_param *)(arg + 1);
+ 
+-- 
+1.9.1
+
-- 
1.9.1
