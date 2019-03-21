From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Thu, 21 Mar 2019 11:54:10 +0100
Subject: [Buildroot] [PATCH v2] package/optee-client: fix build warnings
 from 3.4.0
Message-ID: <1553165650-12974-1-git-send-email-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch over current optee-client 3.4.0 to fix build issues
reported by some toolchains with traces like:

  /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function 'TEEC_InitializeContext':
  /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c:149:28: error: 'gen_caps' may be used uninitialized in this function [-Werror=maybe-uninitialized]
    ctx->reg_mem = gen_caps & TEE_GEN_CAP_REG_MEM;
                            ^
  /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function ?TEEC_OpenSession?:
  /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c:507:8: error: cast increases required alignment of target type [-Werror=cast-align]
    arg = (struct tee_ioctl_open_session_arg *)buf;
          ^
  /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function ?TEEC_InvokeCommand?:
  /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c:581:8: error: cast increases required alignment of target type [-Werror=cast-align]
    arg = (struct tee_ioctl_invoke_arg *)buf;

The optee-client patch is under review in the OP-TEE project [1] and
should be merged in the next OP-TEE release 3.5.0.

Fixes [2], [3], [4] and other failing builds reported by autobuild tests.

[1] https://github.com/OP-TEE/optee_client/pull/146
[2] http://autobuild.buildroot.net/results/80e78cb0bb955e912d6cbe5b30c9b024e7efc802
[3] http://autobuild.buildroot.net/results/a42c19897d03beb02fde2e7e6da25532be27d5ca
[4] http://autobuild.buildroot.net/results/827087f91b7481d1c3effd615172bbee86317962

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Changes v2 -> v3:
  - Update patch from [1] outcome

Changes v1 -> v2:
  - Updated commit comment with traces of the build issues that are fixed.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 .../0001-libteec-fix-build-warnings.patch          | 127 +++++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 package/optee-client/0001-libteec-fix-build-warnings.patch

diff --git a/package/optee-client/0001-libteec-fix-build-warnings.patch b/package/optee-client/0001-libteec-fix-build-warnings.patch
new file mode 100644
index 0000000..9b9f0cc
--- /dev/null
+++ b/package/optee-client/0001-libteec-fix-build-warnings.patch
@@ -0,0 +1,127 @@
+From 9dbc61b3767ab1c3dfd0a19af02926b92ae09247 Mon Sep 17 00:00:00 2001
+From: Etienne Carriere <etienne.carriere@linaro.org>
+Date: Wed, 20 Mar 2019 10:01:23 +0100
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
+Tested-by: Jerome Forissier <jerome.forissier@linaro.org> (HiKey960 32, 64)
+Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+---
+ libteec/src/tee_client_api.c | 34 +++++++++++++++++++++-------------
+ 1 file changed, 21 insertions(+), 13 deletions(-)
+
+diff --git a/libteec/src/tee_client_api.c b/libteec/src/tee_client_api.c
+index 698092b..cf0b1f7 100644
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
+@@ -481,10 +481,12 @@ TEEC_Result TEEC_OpenSession(TEEC_Context *ctx, TEEC_Session *session,
+ 			uint32_t connection_method, const void *connection_data,
+ 			TEEC_Operation *operation, uint32_t *ret_origin)
+ {
+-	uint64_t buf[(sizeof(struct tee_ioctl_open_session_arg) +
+-			TEEC_CONFIG_PAYLOAD_REF_COUNT *
+-				sizeof(struct tee_ioctl_param)) /
+-			sizeof(uint64_t)] = { 0 };
++	size_t p_sz = TEEC_CONFIG_PAYLOAD_REF_COUNT *
++		      sizeof(struct tee_ioctl_param);
++	union {
++		struct tee_ioctl_open_session_arg arg;
++		uint8_t data[sizeof(struct tee_ioctl_open_session_arg) + p_sz];
++	} buf;
+ 	struct tee_ioctl_buf_data buf_data;
+ 	struct tee_ioctl_open_session_arg *arg;
+ 	struct tee_ioctl_param *params;
+@@ -493,6 +495,8 @@ TEEC_Result TEEC_OpenSession(TEEC_Context *ctx, TEEC_Session *session,
+ 	TEEC_SharedMemory shm[TEEC_CONFIG_PAYLOAD_REF_COUNT];
+ 	int rc;
+ 
++	memset(&buf, 0, sizeof(buf));
++
+ 	(void)&connection_data;
+ 
+ 	if (!ctx || !session) {
+@@ -501,10 +505,10 @@ TEEC_Result TEEC_OpenSession(TEEC_Context *ctx, TEEC_Session *session,
+ 		goto out;
+ 	}
+ 
+-	buf_data.buf_ptr = (uintptr_t)buf;
++	buf_data.buf_ptr = (uintptr_t)&buf;
+ 	buf_data.buf_len = sizeof(buf);
+ 
+-	arg = (struct tee_ioctl_open_session_arg *)buf;
++	arg = &buf.arg;
+ 	arg->num_params = TEEC_CONFIG_PAYLOAD_REF_COUNT;
+ 	params = (struct tee_ioctl_param *)(arg + 1);
+ 
+@@ -555,10 +559,12 @@ void TEEC_CloseSession(TEEC_Session *session)
+ TEEC_Result TEEC_InvokeCommand(TEEC_Session *session, uint32_t cmd_id,
+ 			TEEC_Operation *operation, uint32_t *error_origin)
+ {
+-	uint64_t buf[(sizeof(struct tee_ioctl_invoke_arg) +
+-			TEEC_CONFIG_PAYLOAD_REF_COUNT *
+-				sizeof(struct tee_ioctl_param)) /
+-			sizeof(uint64_t)] = { 0 };
++	size_t p_sz = TEEC_CONFIG_PAYLOAD_REF_COUNT *
++			sizeof(struct tee_ioctl_param);
++	union {
++		struct tee_ioctl_invoke_arg arg;
++		uint8_t data[sizeof(struct tee_ioctl_invoke_arg) + p_sz];
++	} buf;
+ 	struct tee_ioctl_buf_data buf_data;
+ 	struct tee_ioctl_invoke_arg *arg;
+ 	struct tee_ioctl_param *params;
+@@ -567,6 +573,8 @@ TEEC_Result TEEC_InvokeCommand(TEEC_Session *session, uint32_t cmd_id,
+ 	TEEC_SharedMemory shm[TEEC_CONFIG_PAYLOAD_REF_COUNT];
+ 	int rc;
+ 
++	memset(&buf, 0, sizeof(buf));
++
+ 	if (!session) {
+ 		eorig = TEEC_ORIGIN_API;
+ 		res = TEEC_ERROR_BAD_PARAMETERS;
+@@ -575,10 +583,10 @@ TEEC_Result TEEC_InvokeCommand(TEEC_Session *session, uint32_t cmd_id,
+ 
+ 	bm_timestamp();
+ 
+-	buf_data.buf_ptr = (uintptr_t)buf;
++	buf_data.buf_ptr = (uintptr_t)&buf;
+ 	buf_data.buf_len = sizeof(buf);
+ 
+-	arg = (struct tee_ioctl_invoke_arg *)buf;
++	arg = &buf.arg;
+ 	arg->num_params = TEEC_CONFIG_PAYLOAD_REF_COUNT;
+ 	params = (struct tee_ioctl_param *)(arg + 1);
+ 
+-- 
+1.9.1
+
-- 
1.9.1
