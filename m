From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 14 May 2019 09:39:01 +0200
Subject: [Buildroot] [PATCH v2 6/7] package/optee-examples: bump version to
 3.5.0
In-Reply-To: <20190514073902.3775-1-etienne.carriere@linaro.org>
References: <20190514073902.3775-1-etienne.carriere@linaro.org>
Message-ID: <20190514073902.3775-6-etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to OP-TEE OS package version to release 3.5.0.
This change discard now useless patches on OP-TEE Examples
package.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
Changes v1 -> v2:
- No change
---
 ...-fix-deprecated-size_t-type-for-size.patch | 42 -------------------
 package/optee-examples/optee-examples.hash    |  4 +-
 package/optee-examples/optee-examples.mk      |  2 +-
 3 files changed, 3 insertions(+), 45 deletions(-)
 delete mode 100644 package/optee-examples/0001-fix-deprecated-size_t-type-for-size.patch

diff --git a/package/optee-examples/0001-fix-deprecated-size_t-type-for-size.patch b/package/optee-examples/0001-fix-deprecated-size_t-type-for-size.patch
deleted file mode 100644
index 4f1fb38305..0000000000
--- a/package/optee-examples/0001-fix-deprecated-size_t-type-for-size.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 1a2713ac698410fb1a889941d52df12a7bd75f3b Mon Sep 17 00:00:00 2001
-From: Etienne Carriere <etienne.carriere@linaro.org>
-Date: Sun, 17 Feb 2019 22:17:21 +0100
-Subject: [PATCH] secure_storage: fix deprecated size_t type for size
-
-size_t types is an deprecated type used in GPD API v1.0.
-Update
-
-Error reported by GCC 7.3-2018.05:
-  secure_storage_ta.c:203:6: warning: passing argument 4 of 'TEE_ReadObjectData' from incompatible pointer type [-Wincompatible-pointer-types]
-      &read_bytes);
-
-Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
----
- secure_storage/ta/secure_storage_ta.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/secure_storage/ta/secure_storage_ta.c b/secure_storage/ta/secure_storage_ta.c
-index d120e47..3ccc12d 100644
---- a/secure_storage/ta/secure_storage_ta.c
-+++ b/secure_storage/ta/secure_storage_ta.c
-@@ -146,7 +146,7 @@ static TEE_Result read_raw_object(uint32_t param_types, TEE_Param params[4])
- 	TEE_ObjectHandle object;
- 	TEE_ObjectInfo object_info;
- 	TEE_Result res;
--	size_t read_bytes;
-+	uint32_t read_bytes;
- 	char *obj_id;
- 	size_t obj_id_sz;
- 	char *data;
-@@ -202,7 +202,7 @@ static TEE_Result read_raw_object(uint32_t param_types, TEE_Param params[4])
- 	res = TEE_ReadObjectData(object, data, object_info.dataSize,
- 				 &read_bytes);
- 	if (res != TEE_SUCCESS || read_bytes != object_info.dataSize) {
--		EMSG("TEE_ReadObjectData failed 0x%08x, read %u over %u",
-+		EMSG("TEE_ReadObjectData failed 0x%08x, read %" PRIu32 " over %u",
- 				res, read_bytes, object_info.dataSize);
- 		goto exit;
- 	}
--- 
-2.20.1
-
diff --git a/package/optee-examples/optee-examples.hash b/package/optee-examples/optee-examples.hash
index 077fd9757c..980595eb69 100644
--- a/package/optee-examples/optee-examples.hash
+++ b/package/optee-examples/optee-examples.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_examples/archive/3.4.0.tar.gz
-sha256 d833753980ac438c1675787857bb8352997352212334274de9419770097ce039  optee-examples-3.4.0.tar.gz
+# From https://github.com/linaro-swg/optee_examples/archive/3.5.0.tar.gz
+sha256 5b7cf07f6d4b19a8557cfa9ab7a0d98b9e199832694c65c8a74e928926821862  optee-examples-3.5.0.tar.gz
 # Locally computed
 sha256 6f1ef8449cb82ae79d2155605f7985bdf0f08e7ab5007de9b4362e8bf28733b9  LICENSE
diff --git a/package/optee-examples/optee-examples.mk b/package/optee-examples/optee-examples.mk
index f2163b8643..7d08209ce8 100644
--- a/package/optee-examples/optee-examples.mk
+++ b/package/optee-examples/optee-examples.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_EXAMPLES_VERSION = 3.4.0
+OPTEE_EXAMPLES_VERSION = 3.5.0
 OPTEE_EXAMPLES_SITE = $(call github,linaro-swg,optee_examples,$(OPTEE_EXAMPLES_VERSION))
 OPTEE_EXAMPLES_LICENSE = BSD-2-Clause
 OPTEE_EXAMPLES_LICENSE_FILES = LICENSE
-- 
2.17.1
