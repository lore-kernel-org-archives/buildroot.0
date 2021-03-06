From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Mar 2021 23:32:39 +0100
Subject: [Buildroot] [git commit branch/next] package/optee-client: bump to
 version 3.12.0
Message-ID: <20210306220945.BCB1F856EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0267ea39ee6106e7d4a72c57a209004692ee7897
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove local patch file since issue addressed in OP-TEE mainline
since 3.12.0 and bump OP-TEE Client package version to OP-TEE
release 3.12.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-libckteec-replace-initializer.patch       | 93 ----------------------
 package/optee-client/optee-client.hash             |  4 +-
 package/optee-client/optee-client.mk               |  2 +-
 3 files changed, 3 insertions(+), 96 deletions(-)

diff --git a/package/optee-client/0001-libckteec-replace-initializer.patch b/package/optee-client/0001-libckteec-replace-initializer.patch
deleted file mode 100644
index 21c75d142e..0000000000
--- a/package/optee-client/0001-libckteec-replace-initializer.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-From 4fff84cebc05a238a8fed3c66d7dcde18f9574fb Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 2 Nov 2020 08:04:14 +0100
-Subject: [PATCH] =?UTF-8?q?libckteec:=20replace=20{=C2=A0}=20initializer?=
- =?UTF-8?q?=20by=20{=C2=A00=20}?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Replace { } initializer by { 0 } to fix the following build failure with
-gcc 4.8:
-
-libckteec/src/pkcs11_processing.c: In function 'ck_create_object':
-libckteec/src/pkcs11_processing.c:22:9: error: missing initializer for field 'buffer' of 'struct serializer' [-Werror=missing-field-initializers]
-  struct serializer obj = { };
-         ^
-
-Fixes: http://autobuild.buildroot.org/results/a3d663adb943aee814180f01d6e153b3309be962
-Reviewed-by: Etienne Carriere <etienne.carriere@linaro.org>
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/OP-TEE/optee_client/pull/230]
----
- libckteec/src/pkcs11_processing.c | 4 ++--
- libckteec/src/serialize_ck.c      | 4 ++--
- libckteec/src/serializer.c        | 4 ++--
- 3 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/libckteec/src/pkcs11_processing.c b/libckteec/src/pkcs11_processing.c
-index 2eb191f5..8eebe769 100644
---- a/libckteec/src/pkcs11_processing.c
-+++ b/libckteec/src/pkcs11_processing.c
-@@ -19,7 +19,7 @@ CK_RV ck_create_object(CK_SESSION_HANDLE session, CK_ATTRIBUTE_PTR attribs,
- 		       CK_ULONG count, CK_OBJECT_HANDLE_PTR handle)
- {
- 	CK_RV rv = CKR_GENERAL_ERROR;
--	struct serializer obj = { };
-+	struct serializer obj = { 0 };
- 	size_t ctrl_size = 0;
- 	TEEC_SharedMemory *ctrl = NULL;
- 	TEEC_SharedMemory *out_shm = NULL;
-@@ -114,7 +114,7 @@ CK_RV ck_encdecrypt_init(CK_SESSION_HANDLE session,
- {
- 	CK_RV rv = CKR_GENERAL_ERROR;
- 	TEEC_SharedMemory *ctrl = NULL;
--	struct serializer obj = { };
-+	struct serializer obj = { 0 };
- 	uint32_t session_handle = session;
- 	uint32_t key_handle = key;
- 	size_t ctrl_size = 0;
-diff --git a/libckteec/src/serialize_ck.c b/libckteec/src/serialize_ck.c
-index 1fc26ddc..0e5df90a 100644
---- a/libckteec/src/serialize_ck.c
-+++ b/libckteec/src/serialize_ck.c
-@@ -39,7 +39,7 @@ static CK_RV serialize_indirect_attribute(struct serializer *obj,
- 	CK_ATTRIBUTE_PTR attr = NULL;
- 	CK_ULONG count = 0;
- 	CK_RV rv = CKR_GENERAL_ERROR;
--	struct serializer obj2 = { };
-+	struct serializer obj2 = { 0 };
- 
- 	switch (attribute->type) {
- 	/* These are serialized each separately */
-@@ -263,7 +263,7 @@ static CK_RV serialize_mecha_aes_iv(struct serializer *obj,
- CK_RV serialize_ck_mecha_params(struct serializer *obj,
- 				CK_MECHANISM_PTR mechanism)
- {
--	CK_MECHANISM mecha = { };
-+	CK_MECHANISM mecha = { 0 };
- 	CK_RV rv = CKR_GENERAL_ERROR;
- 
- 	memset(obj, 0, sizeof(*obj));
-diff --git a/libckteec/src/serializer.c b/libckteec/src/serializer.c
-index 0e3df65c..d94932ba 100644
---- a/libckteec/src/serializer.c
-+++ b/libckteec/src/serializer.c
-@@ -14,7 +14,7 @@
- 
- CK_RV init_serial_object(struct serializer *obj)
- {
--	struct pkcs11_object_head head = { };
-+	struct pkcs11_object_head head = { 0 };
- 
- 	memset(obj, 0, sizeof(*obj));
- 
-@@ -23,7 +23,7 @@ CK_RV init_serial_object(struct serializer *obj)
- 
- void finalize_serial_object(struct serializer *obj)
- {
--	struct pkcs11_object_head head = { };
-+	struct pkcs11_object_head head = { 0 };
- 
- 	head.attrs_size = obj->size - sizeof(head);
- 	head.attrs_count = obj->item_count;
diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
index d8e507dba7..253c29e22a 100644
--- a/package/optee-client/optee-client.hash
+++ b/package/optee-client/optee-client.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_client/archive/3.11.0.tar.gz
-sha256 91f8ec191cd999ee666b6203ec376415d5dc90a8a9955f3d5fce1f48df77169b  optee-client-3.11.0.tar.gz
+# From https://github.com/OP-TEE/optee_client/archive/3.12.0/optee-client-3.12.0.tar.gz
+sha256 f75c45b40147217fa8f4a2ae1e4c06b24eb45d35167854fa9ad3ec3d6a73e858  optee-client-3.12.0.tar.gz
 # Locally computed
 sha256 fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
index 8108fc2130..0ae8426fc1 100644
--- a/package/optee-client/optee-client.mk
+++ b/package/optee-client/optee-client.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_CLIENT_VERSION = 3.11.0
+OPTEE_CLIENT_VERSION = 3.12.0
 OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
 OPTEE_CLIENT_LICENSE = BSD-2-Clause
 OPTEE_CLIENT_LICENSE_FILES = LICENSE
