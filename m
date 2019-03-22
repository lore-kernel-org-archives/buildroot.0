From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri, 22 Mar 2019 11:48:28 +0100
Subject: [Buildroot] [PATCH v4] package/optee-client: fix build warnings
 from 3.4.0
Message-ID: <20190322104828.21423-1-etienne.carriere@linaro.org>
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

The optee-client patches have been in the OP-TEE project [1] & [2] and
will be available in the OP-TEE next release planned 3.5.0.

Fixes [3], [4], [5] and other failing builds reported by autobuild tests.

[1] https://github.com/OP-TEE/optee_client/pull/146
[2] https://github.com/OP-TEE/optee_client/pull/153
[3] http://autobuild.buildroot.net/results/80e78cb0bb955e912d6cbe5b30c9b024e7efc802
[4] http://autobuild.buildroot.net/results/a42c19897d03beb02fde2e7e6da25532be27d5ca
[5] http://autobuild.buildroot.net/results/827087f91b7481d1c3effd615172bbee86317962

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Changes v3 -> v4:
  - Update patch from [2] outcome

Changes v2 -> v3:
  - Update patch from [1] outcome

Changes v1 -> v2:
  - Updated commit comment with traces of the build issues that are fixed.
---
 .../0001-libteec-fix-build-warnings.patch     | 76 +++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 package/optee-client/0001-libteec-fix-build-warnings.patch

diff --git a/package/optee-client/0001-libteec-fix-build-warnings.patch b/package/optee-client/0001-libteec-fix-build-warnings.patch
new file mode 100644
index 0000000000..546a245d69
--- /dev/null
+++ b/package/optee-client/0001-libteec-fix-build-warnings.patch
@@ -0,0 +1,76 @@
+From 867ea5c197e440b47c80765adb34af47188ee805 Mon Sep 17 00:00:00 2001
+From: Victor Chong <victor.chong@linaro.org>
+Date: Fri, 22 Mar 2019 06:37:13 +0000
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
+This change is a squash of changes from [2] and [3].
+
+[1] http://lists.busybox.net/pipermail/buildroot/2019-February/243437.html
+[2] https://github.com/OP-TEE/optee_client/pull/146
+[3] https://github.com/OP-TEE/optee_client/pull/153
+
+Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
+Signed-off-by: Victor Chong <victor.chong@linaro.org>
+Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+---
+ libteec/src/tee_client_api.c | 14 ++++++++------
+ 1 file changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/libteec/src/tee_client_api.c b/libteec/src/tee_client_api.c
+index cf0b1f7..4d7b134 100644
+--- a/libteec/src/tee_client_api.c
++++ b/libteec/src/tee_client_api.c
+@@ -481,11 +481,12 @@ TEEC_Result TEEC_OpenSession(TEEC_Context *ctx, TEEC_Session *session,
+ 			uint32_t connection_method, const void *connection_data,
+ 			TEEC_Operation *operation, uint32_t *ret_origin)
+ {
+-	size_t p_sz = TEEC_CONFIG_PAYLOAD_REF_COUNT *
+-		      sizeof(struct tee_ioctl_param);
++	const size_t arg_size = sizeof(struct tee_ioctl_open_session_arg) +
++				TEEC_CONFIG_PAYLOAD_REF_COUNT *
++					sizeof(struct tee_ioctl_param);
+ 	union {
+ 		struct tee_ioctl_open_session_arg arg;
+-		uint8_t data[sizeof(struct tee_ioctl_open_session_arg) + p_sz];
++		uint8_t data[arg_size];
+ 	} buf;
+ 	struct tee_ioctl_buf_data buf_data;
+ 	struct tee_ioctl_open_session_arg *arg;
+@@ -559,11 +560,12 @@ void TEEC_CloseSession(TEEC_Session *session)
+ TEEC_Result TEEC_InvokeCommand(TEEC_Session *session, uint32_t cmd_id,
+ 			TEEC_Operation *operation, uint32_t *error_origin)
+ {
+-	size_t p_sz = TEEC_CONFIG_PAYLOAD_REF_COUNT *
+-			sizeof(struct tee_ioctl_param);
++	const size_t arg_size = sizeof(struct tee_ioctl_invoke_arg) +
++				TEEC_CONFIG_PAYLOAD_REF_COUNT *
++					sizeof(struct tee_ioctl_param);
+ 	union {
+ 		struct tee_ioctl_invoke_arg arg;
+-		uint8_t data[sizeof(struct tee_ioctl_invoke_arg) + p_sz];
++		uint8_t data[arg_size];
+ 	} buf;
+ 	struct tee_ioctl_buf_data buf_data;
+ 	struct tee_ioctl_invoke_arg *arg;
+-- 
+2.17.1
+
-- 
2.17.1
