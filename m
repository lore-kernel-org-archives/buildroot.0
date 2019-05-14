From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 14 May 2019 10:20:38 +0200
Subject: [Buildroot] [PATCH v3 4/7] package/optee-client: bump version to
 3.5.0
In-Reply-To: <20190514082041.3487-1-etienne.carriere@linaro.org>
References: <20190514082041.3487-1-etienne.carriere@linaro.org>
Message-ID: <20190514082041.3487-4-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump OP-TEE Client package version to release 3.5.0.
This change discard now useless patches on OP-TEE Client
package.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Changes v2 -> v3:
- Fix on commit message: s/OP-TEE OS/OP-TEE Client/.
Changes v1 -> v2:
- No change
---
 ...-BUILD_STATIC_LIBS-BUILD_SHARED_LIBS.patch |  52 -------
 .../0002-libteec-fix-build-warnings.patch     | 128 ------------------
 .../0003-libteec-fix-clang-build-errors.patch |  64 ---------
 package/optee-client/optee-client.hash        |   4 +-
 package/optee-client/optee-client.mk          |   2 +-
 5 files changed, 3 insertions(+), 247 deletions(-)
 delete mode 100644 package/optee-client/0001-cmake-support-BUILD_STATIC_LIBS-BUILD_SHARED_LIBS.patch
 delete mode 100644 package/optee-client/0002-libteec-fix-build-warnings.patch
 delete mode 100644 package/optee-client/0003-libteec-fix-clang-build-errors.patch

diff --git a/package/optee-client/0001-cmake-support-BUILD_STATIC_LIBS-BUILD_SHARED_LIBS.patch b/package/optee-client/0001-cmake-support-BUILD_STATIC_LIBS-BUILD_SHARED_LIBS.patch
deleted file mode 100644
index b62357f52b..0000000000
--- a/package/optee-client/0001-cmake-support-BUILD_STATIC_LIBS-BUILD_SHARED_LIBS.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From e2d82d46b33b693305978dfe64d84148314aef46 Mon Sep 17 00:00:00 2001
-From: Etienne Carriere <etienne.carriere@linaro.org>
-Date: Wed, 6 Mar 2019 11:46:07 +0100
-Subject: [PATCH] cmake: support BUILD_STATIC_LIBS/BUILD_SHARED_LIBS
-
-CMake variables BUILD_STATIC_LIBS and BUILD_SHARED_LIBS
-set constraints on libraries and executable linkage.
-
-With this change OP-TEE client CMake script builds and installs the
-embedded files with the expected linkage configuration.
-
-Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
-Acked-by: Jerome Forissier <jerome.forissier@linaro.org>
----
- libteec/CMakeLists.txt        | 5 +++--
- tee-supplicant/CMakeLists.txt | 2 +-
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/libteec/CMakeLists.txt b/libteec/CMakeLists.txt
-index 3ec8f66..e3495fb 100644
---- a/libteec/CMakeLists.txt
-+++ b/libteec/CMakeLists.txt
-@@ -33,7 +33,7 @@ endif()
- ################################################################################
- # Built library
- ################################################################################
--add_library (teec SHARED ${SRC})
-+add_library (teec ${SRC})
- 
- set_target_properties (teec PROPERTIES
- 	VERSION ${PROJECT_VERSION}
-@@ -71,4 +71,5 @@ target_link_libraries (teec
- ################################################################################
- # FIXME: This should in someway harmonize with CFG_TEE_CLIENT_LOAD_PATH
- # FIXME: Should we change this to /usr/local/lib?
--install (TARGETS teec DESTINATION ${CMAKE_INSTALL_LIBDIR})
-+install (TARGETS teec LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
-+                      ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}")
-diff --git a/tee-supplicant/CMakeLists.txt b/tee-supplicant/CMakeLists.txt
-index d2d3afd..e663be9 100644
---- a/tee-supplicant/CMakeLists.txt
-+++ b/tee-supplicant/CMakeLists.txt
-@@ -85,4 +85,4 @@ target_link_libraries (${PROJECT_NAME}
- ################################################################################
- # Install targets
- ################################################################################
--install (TARGETS ${PROJECT_NAME} DESTINATION ${CMAKE_INSTALL_SBINDIR})
-+install (TARGETS ${PROJECT_NAME} RUNTIME DESTINATION ${CMAKE_INSTALL_SBINDIR})
--- 
-2.17.1
-
diff --git a/package/optee-client/0002-libteec-fix-build-warnings.patch b/package/optee-client/0002-libteec-fix-build-warnings.patch
deleted file mode 100644
index e76b718e57..0000000000
--- a/package/optee-client/0002-libteec-fix-build-warnings.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From 076522d57a1de87008762ad5cf8bfb0f5e40bb6a Mon Sep 17 00:00:00 2001
-From: Etienne Carriere <etienne.carriere@linaro.org>
-Date: Wed, 20 Mar 2019 10:01:23 +0100
-Subject: [PATCH] libteec: fix build warnings
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fix build warnings reported by the Buildroot team [1]:
-
-/home/thomas/projets/outputs/armv5-ctng-linux-gnueabi/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function 'TEEC_InitializeContext':
-/home/thomas/projets/outputs/armv5-ctng-linux-gnueabi/build/optee-client-3.4.0/libteec/src/tee_client_api.c:149:28: error: 'gen_caps' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-    ctx->reg_mem = gen_caps & TEE_GEN_CAP_REG_MEM;
-                            ^
-/home/thomas/projets/buildroot/output/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function ?TEEC_OpenSession?:
-/home/thomas/projets/buildroot/output/build/optee-client-3.4.0/libteec/src/tee_client_api.c:507:8: error: cast increases required alignment of target type [-Werror=cast-align]
-  arg = (struct tee_ioctl_open_session_arg *)buf;
-        ^
-/home/thomas/projets/buildroot/output/build/optee-client-3.4.0/libteec/src/tee_client_api.c: In function ?TEEC_InvokeCommand?:
-/home/thomas/projets/buildroot/output/build/optee-client-3.4.0/libteec/src/tee_client_api.c:581:8: error: cast increases required alignment of target type [-Werror=cast-align]
-  arg = (struct tee_ioctl_invoke_arg *)buf;
-        ^
-
-[1] http://lists.busybox.net/pipermail/buildroot/2019-February/243437.html
-
-Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
-Tested-by: Jerome Forissier <jerome.forissier@linaro.org> (HiKey960 32, 64)
-Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
-Upstream: https://github.com/OP-TEE/optee_client/commit/9dbc61b3767ab1c3dfd0a19af02926b92ae09247
----
- libteec/src/tee_client_api.c | 34 +++++++++++++++++++++-------------
- 1 file changed, 21 insertions(+), 13 deletions(-)
-
-diff --git a/libteec/src/tee_client_api.c b/libteec/src/tee_client_api.c
-index 698092b..cf0b1f7 100644
---- a/libteec/src/tee_client_api.c
-+++ b/libteec/src/tee_client_api.c
-@@ -140,7 +140,7 @@ TEEC_Result TEEC_InitializeContext(const char *name, TEEC_Context *ctx)
- 		return TEEC_ERROR_BAD_PARAMETERS;
- 
- 	for (n = 0; n < TEEC_MAX_DEV_SEQ; n++) {
--		uint32_t gen_caps;
-+		uint32_t gen_caps = 0;
- 
- 		snprintf(devname, sizeof(devname), "/dev/tee%zu", n);
- 		fd = teec_open_dev(devname, name, &gen_caps);
-@@ -481,10 +481,12 @@ TEEC_Result TEEC_OpenSession(TEEC_Context *ctx, TEEC_Session *session,
- 			uint32_t connection_method, const void *connection_data,
- 			TEEC_Operation *operation, uint32_t *ret_origin)
- {
--	uint64_t buf[(sizeof(struct tee_ioctl_open_session_arg) +
--			TEEC_CONFIG_PAYLOAD_REF_COUNT *
--				sizeof(struct tee_ioctl_param)) /
--			sizeof(uint64_t)] = { 0 };
-+	size_t p_sz = TEEC_CONFIG_PAYLOAD_REF_COUNT *
-+		      sizeof(struct tee_ioctl_param);
-+	union {
-+		struct tee_ioctl_open_session_arg arg;
-+		uint8_t data[sizeof(struct tee_ioctl_open_session_arg) + p_sz];
-+	} buf;
- 	struct tee_ioctl_buf_data buf_data;
- 	struct tee_ioctl_open_session_arg *arg;
- 	struct tee_ioctl_param *params;
-@@ -493,6 +495,8 @@ TEEC_Result TEEC_OpenSession(TEEC_Context *ctx, TEEC_Session *session,
- 	TEEC_SharedMemory shm[TEEC_CONFIG_PAYLOAD_REF_COUNT];
- 	int rc;
- 
-+	memset(&buf, 0, sizeof(buf));
-+
- 	(void)&connection_data;
- 
- 	if (!ctx || !session) {
-@@ -501,10 +505,10 @@ TEEC_Result TEEC_OpenSession(TEEC_Context *ctx, TEEC_Session *session,
- 		goto out;
- 	}
- 
--	buf_data.buf_ptr = (uintptr_t)buf;
-+	buf_data.buf_ptr = (uintptr_t)&buf;
- 	buf_data.buf_len = sizeof(buf);
- 
--	arg = (struct tee_ioctl_open_session_arg *)buf;
-+	arg = &buf.arg;
- 	arg->num_params = TEEC_CONFIG_PAYLOAD_REF_COUNT;
- 	params = (struct tee_ioctl_param *)(arg + 1);
- 
-@@ -555,10 +559,12 @@ void TEEC_CloseSession(TEEC_Session *session)
- TEEC_Result TEEC_InvokeCommand(TEEC_Session *session, uint32_t cmd_id,
- 			TEEC_Operation *operation, uint32_t *error_origin)
- {
--	uint64_t buf[(sizeof(struct tee_ioctl_invoke_arg) +
--			TEEC_CONFIG_PAYLOAD_REF_COUNT *
--				sizeof(struct tee_ioctl_param)) /
--			sizeof(uint64_t)] = { 0 };
-+	size_t p_sz = TEEC_CONFIG_PAYLOAD_REF_COUNT *
-+			sizeof(struct tee_ioctl_param);
-+	union {
-+		struct tee_ioctl_invoke_arg arg;
-+		uint8_t data[sizeof(struct tee_ioctl_invoke_arg) + p_sz];
-+	} buf;
- 	struct tee_ioctl_buf_data buf_data;
- 	struct tee_ioctl_invoke_arg *arg;
- 	struct tee_ioctl_param *params;
-@@ -567,6 +573,8 @@ TEEC_Result TEEC_InvokeCommand(TEEC_Session *session, uint32_t cmd_id,
- 	TEEC_SharedMemory shm[TEEC_CONFIG_PAYLOAD_REF_COUNT];
- 	int rc;
- 
-+	memset(&buf, 0, sizeof(buf));
-+
- 	if (!session) {
- 		eorig = TEEC_ORIGIN_API;
- 		res = TEEC_ERROR_BAD_PARAMETERS;
-@@ -575,10 +583,10 @@ TEEC_Result TEEC_InvokeCommand(TEEC_Session *session, uint32_t cmd_id,
- 
- 	bm_timestamp();
- 
--	buf_data.buf_ptr = (uintptr_t)buf;
-+	buf_data.buf_ptr = (uintptr_t)&buf;
- 	buf_data.buf_len = sizeof(buf);
- 
--	arg = (struct tee_ioctl_invoke_arg *)buf;
-+	arg = &buf.arg;
- 	arg->num_params = TEEC_CONFIG_PAYLOAD_REF_COUNT;
- 	params = (struct tee_ioctl_param *)(arg + 1);
- 
--- 
-2.17.1
-
diff --git a/package/optee-client/0003-libteec-fix-clang-build-errors.patch b/package/optee-client/0003-libteec-fix-clang-build-errors.patch
deleted file mode 100644
index 1c845a1e2c..0000000000
--- a/package/optee-client/0003-libteec-fix-clang-build-errors.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From d6f79741803dd31b34960dbc59999eb2482df9c1 Mon Sep 17 00:00:00 2001
-From: Victor Chong <victor.chong@linaro.org>
-Date: Fri, 22 Mar 2019 06:37:13 +0000
-Subject: [PATCH] libteec: fix clang build errors
-
-external/optee_client/libteec/src/tee_client_api.c:488:11: error: fields must have a constant size: 'variable length array in structure' extension will never be supported
-                uint8_t data[sizeof(struct tee_ioctl_open_session_arg) + p_sz];
-                        ^
-external/optee_client/libteec/src/tee_client_api.c:566:11: error: fields must have a constant size: 'variable length array in structure' extension will never be supported
-                uint8_t data[sizeof(struct tee_ioctl_invoke_arg) + p_sz];
-                        ^
-
-Fixes: 9dbc61b3 ("libteec: fix build warnings")
-Fixes: https://github.com/OP-TEE/optee_client/issues/152
-
-Signed-off-by: Victor Chong <victor.chong@linaro.org>
-Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
-
-Upstream: https://github.com/OP-TEE/optee_client/commit/16c8f548786c70df04d3a1e61bf89abce9b92389
-[fix conflict]
-Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
----
- libteec/src/tee_client_api.c | 14 ++++++++------
- 1 file changed, 8 insertions(+), 6 deletions(-)
-
-diff --git a/libteec/src/tee_client_api.c b/libteec/src/tee_client_api.c
-index cf0b1f7..4d7b134 100644
---- a/libteec/src/tee_client_api.c
-+++ b/libteec/src/tee_client_api.c
-@@ -481,11 +481,12 @@ TEEC_Result TEEC_OpenSession(TEEC_Context *ctx, TEEC_Session *session,
- 			uint32_t connection_method, const void *connection_data,
- 			TEEC_Operation *operation, uint32_t *ret_origin)
- {
--	size_t p_sz = TEEC_CONFIG_PAYLOAD_REF_COUNT *
--		      sizeof(struct tee_ioctl_param);
-+	const size_t arg_size = sizeof(struct tee_ioctl_open_session_arg) +
-+				TEEC_CONFIG_PAYLOAD_REF_COUNT *
-+					sizeof(struct tee_ioctl_param);
- 	union {
- 		struct tee_ioctl_open_session_arg arg;
--		uint8_t data[sizeof(struct tee_ioctl_open_session_arg) + p_sz];
-+		uint8_t data[arg_size];
- 	} buf;
- 	struct tee_ioctl_buf_data buf_data;
- 	struct tee_ioctl_open_session_arg *arg;
-@@ -559,11 +560,12 @@ void TEEC_CloseSession(TEEC_Session *session)
- TEEC_Result TEEC_InvokeCommand(TEEC_Session *session, uint32_t cmd_id,
- 			TEEC_Operation *operation, uint32_t *error_origin)
- {
--	size_t p_sz = TEEC_CONFIG_PAYLOAD_REF_COUNT *
--			sizeof(struct tee_ioctl_param);
-+	const size_t arg_size = sizeof(struct tee_ioctl_invoke_arg) +
-+				TEEC_CONFIG_PAYLOAD_REF_COUNT *
-+					sizeof(struct tee_ioctl_param);
- 	union {
- 		struct tee_ioctl_invoke_arg arg;
--		uint8_t data[sizeof(struct tee_ioctl_invoke_arg) + p_sz];
-+		uint8_t data[arg_size];
- 	} buf;
- 	struct tee_ioctl_buf_data buf_data;
- 	struct tee_ioctl_invoke_arg *arg;
--- 
-2.17.1
-
diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
index 0da25ced2d..010eb69275 100644
--- a/package/optee-client/optee-client.hash
+++ b/package/optee-client/optee-client.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_client/archive/3.4.0.tar.gz
-sha256 7c131a44f4d73acb8816fba88bcd7e6a18537f0a522ae426a20e2ca7dc46a6ec  optee-client-3.4.0.tar.gz
+# From https://github.com/OP-TEE/optee_client/archive/3.5.0.tar.gz
+sha256 b7f6f8ac57c0c9b0cc59c34a2622b9ff3ae85676d2da10176fb2eaaa10716083  optee-client-3.5.0.tar.gz
 # Locally computed
 sha256 fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 0a9fafd0d3..cf52b8e87e 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_CLIENT_VERSION = 3.4.0
+OPTEE_CLIENT_VERSION = 3.5.0
 OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
 OPTEE_CLIENT_LICENSE = BSD-2-Clause
 OPTEE_CLIENT_LICENSE_FILES = LICENSE
-- 
2.17.1
