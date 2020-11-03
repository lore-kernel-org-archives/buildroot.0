From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  3 Nov 2020 18:30:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/optee-client: fix build with gcc 4.8
Message-ID: <20201103173043.29373-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix the following build failure with optee-client 3.11.0 and gcc 4.8:

/home/giuliobenetti/autobuild/run/instance-2/output-1/build/optee-client-3.11.0/libckteec/src/pkcs11_processing.c: In function 'ck_create_object':
/home/giuliobenetti/autobuild/run/instance-2/output-1/build/optee-client-3.11.0/libckteec/src/pkcs11_processing.c:22:9: error: missing initializer for field 'buffer' of 'struct serializer' [-Werror=missing-field-initializers]
  struct serializer obj = { };
         ^

Build failure is raised since version 3.10.0 and
https://github.com/OP-TEE/optee_client/commit/c3279f424348bdd3378d236fd038fdd7bc76e10a
https://github.com/OP-TEE/optee_client/commit/e88c264ba358941d2166b18eeac448e617ffa887
https://github.com/OP-TEE/optee_client/commit/85a7ea7861339356b39c73926f2b5cb9added45b

Fixes:
 - http://autobuild.buildroot.org/results/a3d663adb943aee814180f01d6e153b3309be962

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-libckteec-replace-initializer.patch  | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 package/optee-client/0001-libckteec-replace-initializer.patch

diff --git a/package/optee-client/0001-libckteec-replace-initializer.patch b/package/optee-client/0001-libckteec-replace-initializer.patch
new file mode 100644
index 0000000000..21c75d142e
--- /dev/null
+++ b/package/optee-client/0001-libckteec-replace-initializer.patch
@@ -0,0 +1,93 @@
+From 4fff84cebc05a238a8fed3c66d7dcde18f9574fb Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 2 Nov 2020 08:04:14 +0100
+Subject: [PATCH] =?UTF-8?q?libckteec:=20replace=20{=C2=A0}=20initializer?=
+ =?UTF-8?q?=20by=20{=C2=A00=20}?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Replace { } initializer by { 0 } to fix the following build failure with
+gcc 4.8:
+
+libckteec/src/pkcs11_processing.c: In function 'ck_create_object':
+libckteec/src/pkcs11_processing.c:22:9: error: missing initializer for field 'buffer' of 'struct serializer' [-Werror=missing-field-initializers]
+  struct serializer obj = { };
+         ^
+
+Fixes: http://autobuild.buildroot.org/results/a3d663adb943aee814180f01d6e153b3309be962
+Reviewed-by: Etienne Carriere <etienne.carriere@linaro.org>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/OP-TEE/optee_client/pull/230]
+---
+ libckteec/src/pkcs11_processing.c | 4 ++--
+ libckteec/src/serialize_ck.c      | 4 ++--
+ libckteec/src/serializer.c        | 4 ++--
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/libckteec/src/pkcs11_processing.c b/libckteec/src/pkcs11_processing.c
+index 2eb191f5..8eebe769 100644
+--- a/libckteec/src/pkcs11_processing.c
++++ b/libckteec/src/pkcs11_processing.c
+@@ -19,7 +19,7 @@ CK_RV ck_create_object(CK_SESSION_HANDLE session, CK_ATTRIBUTE_PTR attribs,
+ 		       CK_ULONG count, CK_OBJECT_HANDLE_PTR handle)
+ {
+ 	CK_RV rv = CKR_GENERAL_ERROR;
+-	struct serializer obj = { };
++	struct serializer obj = { 0 };
+ 	size_t ctrl_size = 0;
+ 	TEEC_SharedMemory *ctrl = NULL;
+ 	TEEC_SharedMemory *out_shm = NULL;
+@@ -114,7 +114,7 @@ CK_RV ck_encdecrypt_init(CK_SESSION_HANDLE session,
+ {
+ 	CK_RV rv = CKR_GENERAL_ERROR;
+ 	TEEC_SharedMemory *ctrl = NULL;
+-	struct serializer obj = { };
++	struct serializer obj = { 0 };
+ 	uint32_t session_handle = session;
+ 	uint32_t key_handle = key;
+ 	size_t ctrl_size = 0;
+diff --git a/libckteec/src/serialize_ck.c b/libckteec/src/serialize_ck.c
+index 1fc26ddc..0e5df90a 100644
+--- a/libckteec/src/serialize_ck.c
++++ b/libckteec/src/serialize_ck.c
+@@ -39,7 +39,7 @@ static CK_RV serialize_indirect_attribute(struct serializer *obj,
+ 	CK_ATTRIBUTE_PTR attr = NULL;
+ 	CK_ULONG count = 0;
+ 	CK_RV rv = CKR_GENERAL_ERROR;
+-	struct serializer obj2 = { };
++	struct serializer obj2 = { 0 };
+ 
+ 	switch (attribute->type) {
+ 	/* These are serialized each separately */
+@@ -263,7 +263,7 @@ static CK_RV serialize_mecha_aes_iv(struct serializer *obj,
+ CK_RV serialize_ck_mecha_params(struct serializer *obj,
+ 				CK_MECHANISM_PTR mechanism)
+ {
+-	CK_MECHANISM mecha = { };
++	CK_MECHANISM mecha = { 0 };
+ 	CK_RV rv = CKR_GENERAL_ERROR;
+ 
+ 	memset(obj, 0, sizeof(*obj));
+diff --git a/libckteec/src/serializer.c b/libckteec/src/serializer.c
+index 0e3df65c..d94932ba 100644
+--- a/libckteec/src/serializer.c
++++ b/libckteec/src/serializer.c
+@@ -14,7 +14,7 @@
+ 
+ CK_RV init_serial_object(struct serializer *obj)
+ {
+-	struct pkcs11_object_head head = { };
++	struct pkcs11_object_head head = { 0 };
+ 
+ 	memset(obj, 0, sizeof(*obj));
+ 
+@@ -23,7 +23,7 @@ CK_RV init_serial_object(struct serializer *obj)
+ 
+ void finalize_serial_object(struct serializer *obj)
+ {
+-	struct pkcs11_object_head head = { };
++	struct pkcs11_object_head head = { 0 };
+ 
+ 	head.attrs_size = obj->size - sizeof(head);
+ 	head.attrs_count = obj->item_count;
-- 
2.28.0
