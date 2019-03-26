From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 18:50:18 +0100
Subject: [Buildroot] [git commit] package/optee-client: fix build warnings
 from 3.4.0
Message-ID: <20190326174714.D8F4381DC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34d743be7add02147d67f23d528f0be095b725b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add two patches over current optee-client 3.4.0 to fix build issues
reported by some toolchains with traces like:

  /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function 'TEEC_InitializeContext':
  /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c:149:28: error: 'gen_caps' may be used uninitialized in this function [-Werror=maybe-uninitialized]
    ctx->reg_mem = gen_caps & TEE_GEN_CAP_REG_MEM;
                            ^
  /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function ???TEEC_OpenSession???:
  /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c:507:8: error: cast increases required alignment of target type [-Werror=cast-align]
    arg = (struct tee_ioctl_open_session_arg *)buf;
          ^
  /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function ???TEEC_InvokeCommand???:
  /path/to/build/optee-client-3.4.0/libteec/src/tee_client_api.c:581:8: error: cast increases required alignment of target type [-Werror=cast-align]
    arg = (struct tee_ioctl_invoke_arg *)buf;

The optee-client patches have been in the OP-TEE project [1] & [2] and
will be available in the OP-TEE next release planned 3.5.0.

Fixes [3], [4], [5] and other failing builds reported by autobuild tests.

[1] https://github.com/OP-TEE/optee_client/commit/9dbc61b3767ab1c3dfd0a19af02926b92ae09247
[2] https://github.com/OP-TEE/optee_client/commit/16c8f548786c70df04d3a1e61bf89abce9b92389
[3] http://autobuild.buildroot.net/results/80e78cb0bb955e912d6cbe5b30c9b024e7efc802
[4] http://autobuild.buildroot.net/results/a42c19897d03beb02fde2e7e6da25532be27d5ca
[5] http://autobuild.buildroot.net/results/827087f91b7481d1c3effd615172bbee86317962

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...port-BUILD_STATIC_LIBS-BUILD_SHARED_LIBS.patch} |   7 +-
 .../0002-libteec-fix-build-warnings.patch          | 128 +++++++++++++++++++++
 .../0003-libteec-fix-clang-build-errors.patch      |  64 +++++++++++
 3 files changed, 196 insertions(+), 3 deletions(-)

diff --git a/package/optee-client/0002-cmake-support-BUILD_STATIC_LIBS-BUILD_SHARED_LIBS.patch b/package/optee-client/0001-cmake-support-BUILD_STATIC_LIBS-BUILD_SHARED_LIBS.patch
similarity index 92%
rename from package/optee-client/0002-cmake-support-BUILD_STATIC_LIBS-BUILD_SHARED_LIBS.patch
rename to package/optee-client/0001-cmake-support-BUILD_STATIC_LIBS-BUILD_SHARED_LIBS.patch
index 9aea801fc7..b62357f52b 100644
--- a/package/optee-client/0002-cmake-support-BUILD_STATIC_LIBS-BUILD_SHARED_LIBS.patch
+++ b/package/optee-client/0001-cmake-support-BUILD_STATIC_LIBS-BUILD_SHARED_LIBS.patch
@@ -1,6 +1,6 @@
-From 857ed6a900e2f16035a88e73e47d79e9251f6544 Mon Sep 17 00:00:00 2001
+From e2d82d46b33b693305978dfe64d84148314aef46 Mon Sep 17 00:00:00 2001
 From: Etienne Carriere <etienne.carriere@linaro.org>
-Date: Fri, 1 Mar 2019 12:31:48 +0100
+Date: Wed, 6 Mar 2019 11:46:07 +0100
 Subject: [PATCH] cmake: support BUILD_STATIC_LIBS/BUILD_SHARED_LIBS
 
 CMake variables BUILD_STATIC_LIBS and BUILD_SHARED_LIBS
@@ -11,6 +11,7 @@ embedded files with the expected linkage configuration.
 
 Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
+Acked-by: Jerome Forissier <jerome.forissier@linaro.org>
 ---
  libteec/CMakeLists.txt        | 5 +++--
  tee-supplicant/CMakeLists.txt | 2 +-
@@ -47,5 +48,5 @@ index d2d3afd..e663be9 100644
 -install (TARGETS ${PROJECT_NAME} DESTINATION ${CMAKE_INSTALL_SBINDIR})
 +install (TARGETS ${PROJECT_NAME} RUNTIME DESTINATION ${CMAKE_INSTALL_SBINDIR})
 -- 
-1.9.1
+2.17.1
 
diff --git a/package/optee-client/0002-libteec-fix-build-warnings.patch b/package/optee-client/0002-libteec-fix-build-warnings.patch
new file mode 100644
index 0000000000..e76b718e57
--- /dev/null
+++ b/package/optee-client/0002-libteec-fix-build-warnings.patch
@@ -0,0 +1,128 @@
+From 076522d57a1de87008762ad5cf8bfb0f5e40bb6a Mon Sep 17 00:00:00 2001
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
+/home/thomas/projets/buildroot/output/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function ???TEEC_OpenSession???:
+/home/thomas/projets/buildroot/output/build/optee-client-3.4.0/libteec/src/tee_client_api.c:507:8: error: cast increases required alignment of target type [-Werror=cast-align]
+  arg = (struct tee_ioctl_open_session_arg *)buf;
+        ^
+/home/thomas/projets/buildroot/output/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function ???TEEC_InvokeCommand???:
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
+Upstream: https://github.com/OP-TEE/optee_client/commit/9dbc61b3767ab1c3dfd0a19af02926b92ae09247
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
+2.17.1
+
diff --git a/package/optee-client/0003-libteec-fix-clang-build-errors.patch b/package/optee-client/0003-libteec-fix-clang-build-errors.patch
new file mode 100644
index 0000000000..1c845a1e2c
--- /dev/null
+++ b/package/optee-client/0003-libteec-fix-clang-build-errors.patch
@@ -0,0 +1,64 @@
+From d6f79741803dd31b34960dbc59999eb2482df9c1 Mon Sep 17 00:00:00 2001
+From: Victor Chong <victor.chong@linaro.org>
+Date: Fri, 22 Mar 2019 06:37:13 +0000
+Subject: [PATCH] libteec: fix clang build errors
+
+external/optee_client/libteec/src/tee_client_api.c:488:11: error: fields must have a constant size: 'variable length array in structure' extension will never be supported
+                uint8_t data[sizeof(struct tee_ioctl_open_session_arg) + p_sz];
+                        ^
+external/optee_client/libteec/src/tee_client_api.c:566:11: error: fields must have a constant size: 'variable length array in structure' extension will never be supported
+                uint8_t data[sizeof(struct tee_ioctl_invoke_arg) + p_sz];
+                        ^
+
+Fixes: 9dbc61b3 ("libteec: fix build warnings")
+Fixes: https://github.com/OP-TEE/optee_client/issues/152
+
+Signed-off-by: Victor Chong <victor.chong@linaro.org>
+Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
+
+Upstream: https://github.com/OP-TEE/optee_client/commit/16c8f548786c70df04d3a1e61bf89abce9b92389
+[fix conflict]
+Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
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
