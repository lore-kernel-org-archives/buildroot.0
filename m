From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Apr 2021 13:09:25 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] boot/shim: fix build
 issues with gcc 9.x
Message-ID: <20210406104423.94B4682A8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9aa21ecfc8f4c587fe92d938d71fb464bdbc004
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Backport a set of upstream patches to fix:

MokManager.c: In function ???write_back_mok_list???:
MokManager.c:1081:19: error: taking address of packed member of ???struct <anonymous>??? may result in an unaligned pointer value [-Werror=address-of-packed-member]
 1081 |   if (CompareGuid(&(list[i].Type), &X509_GUID) == 0)
      |                   ^~~~~~~~~~~~~~~
MokManager.c:1103:19: error: taking address of packed member of ???struct <anonymous>??? may result in an unaligned pointer value [-Werror=address-of-packed-member]
 1103 |   if (CompareGuid(&(list[i].Type), &X509_GUID) == 0) {
      |                   ^~~~~~~~~~~~~~~
MokManager.c: In function ???delete_cert???:
MokManager.c:1144:19: error: taking address of packed member of ???struct <anonymous>??? may result in an unaligned pointer value [-Werror=address-of-packed-member]
 1144 |   if (CompareGuid(&(mok[i].Type), &X509_GUID) != 0)
      |                   ^~~~~~~~~~~~~~
MokManager.c: In function ???delete_hash_in_list???:
MokManager.c:1195:20: error: taking address of packed member of ???struct <anonymous>??? may result in an unaligned pointer value [-Werror=address-of-packed-member]
 1195 |   if ((CompareGuid(&(mok[i].Type), &Type) != 0) ||
      |                    ^~~~~~~~~~~~~~
MokManager.c: In function ???delete_keys???:
MokManager.c:1359:19: error: taking address of packed member of ???struct <anonymous>??? may result in an unaligned pointer value [-Werror=address-of-packed-member]
 1359 |   if (CompareGuid(&(del_key[i].Type), &X509_GUID) == 0) {
      |                   ^~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[1]: *** [<builtin>: MokManager.o] Error 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4239eff73b6c5c9b76469ee97429ea5258cdc586)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...und-stuff-Waddress-of-packed-member-finds.patch |  90 +++++++++++++++++
 ...Use-CompareMem-on-MokListNode.Type-instea.patch |  73 ++++++++++++++
 ...ger-avoid-Werror-address-of-packed-member.patch | 112 +++++++++++++++++++++
 3 files changed, 275 insertions(+)

diff --git a/boot/shim/0002-Work-around-stuff-Waddress-of-packed-member-finds.patch b/boot/shim/0002-Work-around-stuff-Waddress-of-packed-member-finds.patch
new file mode 100644
index 0000000000..9a6187b1a1
--- /dev/null
+++ b/boot/shim/0002-Work-around-stuff-Waddress-of-packed-member-finds.patch
@@ -0,0 +1,90 @@
+From 7c1d3d8116b78bf096b7b8c6da5486f37efeb75f Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Mon, 13 May 2019 16:34:35 -0400
+Subject: [PATCH] Work around stuff -Waddress-of-packed-member finds.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+In MokManager we get a lot of these:
+
+../src/MokManager.c:1063:19: error: taking address of packed member of ???struct <anonymous>??? may result in an unaligned pointer value [-Werror=address-of-packed-member]
+ 1063 |   if (CompareGuid(&(list[i].Type), &X509_GUID) == 0)
+      |                   ^~~~~~~~~~~~~~~
+
+The reason for this is that gnu-efi takes EFI_GUID * as its argument
+instead of VOID *, and there's nothing telling the compiler that it
+doesn't have alignment constraints on the input, so the compiler wants
+it to have 16-byte alignment.
+
+Just use CompareMem() for these, as that's all CompareGuid is calling
+anyway.
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+Upstream: 2cbf56b82a5102777b37c4f7f47c8cf058cea027
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ MokManager.c | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/MokManager.c b/MokManager.c
+index 7e40a38..5d0a979 100644
+--- a/MokManager.c
++++ b/MokManager.c
+@@ -22,6 +22,8 @@
+ #define CERT_STRING L"Select an X509 certificate to enroll:\n\n"
+ #define HASH_STRING L"Select a file to trust:\n\n"
+ 
++#define CompareMemberGuid(x, y) CompareMem(x, y, sizeof(EFI_GUID))
++
+ typedef struct {
+ 	UINT32 MokSize;
+ 	UINT8 *Mok;
+@@ -1078,7 +1080,7 @@ static EFI_STATUS write_back_mok_list(MokListNode * list, INTN key_num,
+ 			continue;
+ 
+ 		DataSize += sizeof(EFI_SIGNATURE_LIST);
+-		if (CompareGuid(&(list[i].Type), &X509_GUID) == 0)
++		if (CompareMemberGuid(&(list[i].Type), &X509_GUID) == 0)
+ 			DataSize += sizeof(EFI_GUID);
+ 		DataSize += list[i].MokSize;
+ 	}
+@@ -1100,7 +1102,7 @@ static EFI_STATUS write_back_mok_list(MokListNode * list, INTN key_num,
+ 		CertList->SignatureType = list[i].Type;
+ 		CertList->SignatureHeaderSize = 0;
+ 
+-		if (CompareGuid(&(list[i].Type), &X509_GUID) == 0) {
++		if (CompareMemberGuid(&(list[i].Type), &X509_GUID) == 0) {
+ 			CertList->SignatureListSize = list[i].MokSize +
+ 			    sizeof(EFI_SIGNATURE_LIST) + sizeof(EFI_GUID);
+ 			CertList->SignatureSize =
+@@ -1141,7 +1143,7 @@ static void delete_cert(void *key, UINT32 key_size,
+ 	int i;
+ 
+ 	for (i = 0; i < mok_num; i++) {
+-		if (CompareGuid(&(mok[i].Type), &X509_GUID) != 0)
++		if (CompareMemberGuid(&(mok[i].Type), &X509_GUID) != 0)
+ 			continue;
+ 
+ 		if (mok[i].MokSize == key_size &&
+@@ -1192,7 +1194,7 @@ static void delete_hash_in_list(EFI_GUID Type, UINT8 * hash, UINT32 hash_size,
+ 	sig_size = hash_size + sizeof(EFI_GUID);
+ 
+ 	for (i = 0; i < mok_num; i++) {
+-		if ((CompareGuid(&(mok[i].Type), &Type) != 0) ||
++		if ((CompareMemberGuid(&(mok[i].Type), &Type) != 0) ||
+ 		    (mok[i].MokSize < sig_size))
+ 			continue;
+ 
+@@ -1356,7 +1358,7 @@ static EFI_STATUS delete_keys(void *MokDel, UINTN MokDelSize, BOOLEAN MokX)
+ 
+ 	/* Search and destroy */
+ 	for (i = 0; i < del_num; i++) {
+-		if (CompareGuid(&(del_key[i].Type), &X509_GUID) == 0) {
++		if (CompareMemberGuid(&(del_key[i].Type), &X509_GUID) == 0) {
+ 			delete_cert(del_key[i].Mok, del_key[i].MokSize,
+ 				    mok, mok_num);
+ 		} else if (is_sha2_hash(del_key[i].Type)) {
+-- 
+2.30.2
+
diff --git a/boot/shim/0003-MokManager-Use-CompareMem-on-MokListNode.Type-instea.patch b/boot/shim/0003-MokManager-Use-CompareMem-on-MokListNode.Type-instea.patch
new file mode 100644
index 0000000000..5f8f44519d
--- /dev/null
+++ b/boot/shim/0003-MokManager-Use-CompareMem-on-MokListNode.Type-instea.patch
@@ -0,0 +1,73 @@
+From 694a91664a7f5018bdc1e1092e07a8ac7fc35fc0 Mon Sep 17 00:00:00 2001
+From: Gary Lin <glin@suse.com>
+Date: Tue, 26 Feb 2019 11:33:53 +0800
+Subject: [PATCH] MokManager: Use CompareMem on MokListNode.Type instead of
+ CompareGuid
+
+Fix the errors from gcc9 '-Werror=address-of-packed-member'
+
+https://github.com/rhboot/shim/issues/161
+
+Signed-off-by: Gary Lin <glin@suse.com>
+Upstream: 5d30a31fef4eb7e773da24c5e6c20576282a9c3a
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ MokManager.c | 14 +++++++++-----
+ 1 file changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/MokManager.c b/MokManager.c
+index 5d0a979..e13400b 100644
+--- a/MokManager.c
++++ b/MokManager.c
+@@ -1080,7 +1080,8 @@ static EFI_STATUS write_back_mok_list(MokListNode * list, INTN key_num,
+ 			continue;
+ 
+ 		DataSize += sizeof(EFI_SIGNATURE_LIST);
+-		if (CompareMemberGuid(&(list[i].Type), &X509_GUID) == 0)
++		if (CompareMem(&(list[i].Type), &X509_GUID,
++			       sizeof(EFI_GUID)) == 0)
+ 			DataSize += sizeof(EFI_GUID);
+ 		DataSize += list[i].MokSize;
+ 	}
+@@ -1102,7 +1103,8 @@ static EFI_STATUS write_back_mok_list(MokListNode * list, INTN key_num,
+ 		CertList->SignatureType = list[i].Type;
+ 		CertList->SignatureHeaderSize = 0;
+ 
+-		if (CompareMemberGuid(&(list[i].Type), &X509_GUID) == 0) {
++		if (CompareMem(&(list[i].Type), &X509_GUID,
++			       sizeof(EFI_GUID)) == 0) {
+ 			CertList->SignatureListSize = list[i].MokSize +
+ 			    sizeof(EFI_SIGNATURE_LIST) + sizeof(EFI_GUID);
+ 			CertList->SignatureSize =
+@@ -1143,7 +1145,8 @@ static void delete_cert(void *key, UINT32 key_size,
+ 	int i;
+ 
+ 	for (i = 0; i < mok_num; i++) {
+-		if (CompareMemberGuid(&(mok[i].Type), &X509_GUID) != 0)
++		if (CompareMem(&(mok[i].Type), &X509_GUID,
++			       sizeof(EFI_GUID)) != 0)
+ 			continue;
+ 
+ 		if (mok[i].MokSize == key_size &&
+@@ -1194,7 +1197,7 @@ static void delete_hash_in_list(EFI_GUID Type, UINT8 * hash, UINT32 hash_size,
+ 	sig_size = hash_size + sizeof(EFI_GUID);
+ 
+ 	for (i = 0; i < mok_num; i++) {
+-		if ((CompareMemberGuid(&(mok[i].Type), &Type) != 0) ||
++		if ((CompareMem(&(mok[i].Type), &Type, sizeof(EFI_GUID)) != 0) ||
+ 		    (mok[i].MokSize < sig_size))
+ 			continue;
+ 
+@@ -1358,7 +1361,8 @@ static EFI_STATUS delete_keys(void *MokDel, UINTN MokDelSize, BOOLEAN MokX)
+ 
+ 	/* Search and destroy */
+ 	for (i = 0; i < del_num; i++) {
+-		if (CompareMemberGuid(&(del_key[i].Type), &X509_GUID) == 0) {
++		if (CompareMem(&(del_key[i].Type), &X509_GUID,
++			       sizeof(EFI_GUID)) == 0) {
+ 			delete_cert(del_key[i].Mok, del_key[i].MokSize,
+ 				    mok, mok_num);
+ 		} else if (is_sha2_hash(del_key[i].Type)) {
+-- 
+2.30.2
+
diff --git a/boot/shim/0004-MokManager-avoid-Werror-address-of-packed-member.patch b/boot/shim/0004-MokManager-avoid-Werror-address-of-packed-member.patch
new file mode 100644
index 0000000000..d86c5bb005
--- /dev/null
+++ b/boot/shim/0004-MokManager-avoid-Werror-address-of-packed-member.patch
@@ -0,0 +1,112 @@
+From f17f67fef7ae05cbad8609aacef41a448a2d8d54 Mon Sep 17 00:00:00 2001
+From: Jonas Witschel <diabonas@gmx.de>
+Date: Thu, 5 Sep 2019 10:39:37 +0200
+Subject: [PATCH] MokManager: avoid -Werror=address-of-packed-member
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When compiling with GCC 9, there are a couple of errors of the form
+
+MokManager.c: In function ???write_back_mok_list???:
+MokManager.c:1056:19: error: taking address of packed member of ???struct <anonymous>??? may result in an unaligned pointer value [-Werror=address-of-packed-member]
+ 1056 |   if (CompareGuid(&(list[i].Type), &X509_GUID) == 0)
+      |                   ^~~~~~~~~~~~~~~
+
+Copying the member of the packed struct to a temporary variable and
+pointing to that variable solves the problem.
+
+Upstream: d57e53f3bddc4bc7299b3d5efd5ba8c547e8dfa5
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ MokManager.c | 22 +++++++++++++---------
+ 1 file changed, 13 insertions(+), 9 deletions(-)
+
+diff --git a/MokManager.c b/MokManager.c
+index e13400b..1a8d666 100644
+--- a/MokManager.c
++++ b/MokManager.c
+@@ -1065,6 +1065,7 @@ static EFI_STATUS write_back_mok_list(MokListNode * list, INTN key_num,
+ 	EFI_STATUS efi_status;
+ 	EFI_SIGNATURE_LIST *CertList;
+ 	EFI_SIGNATURE_DATA *CertData;
++	EFI_GUID type;
+ 	void *Data = NULL, *ptr;
+ 	INTN DataSize = 0;
+ 	int i;
+@@ -1080,8 +1081,8 @@ static EFI_STATUS write_back_mok_list(MokListNode * list, INTN key_num,
+ 			continue;
+ 
+ 		DataSize += sizeof(EFI_SIGNATURE_LIST);
+-		if (CompareMem(&(list[i].Type), &X509_GUID,
+-			       sizeof(EFI_GUID)) == 0)
++		type = list[i].Type; /* avoid -Werror=address-of-packed-member */
++		if (CompareGuid(&type, &X509_GUID) == 0)
+ 			DataSize += sizeof(EFI_GUID);
+ 		DataSize += list[i].MokSize;
+ 	}
+@@ -1103,8 +1104,7 @@ static EFI_STATUS write_back_mok_list(MokListNode * list, INTN key_num,
+ 		CertList->SignatureType = list[i].Type;
+ 		CertList->SignatureHeaderSize = 0;
+ 
+-		if (CompareMem(&(list[i].Type), &X509_GUID,
+-			       sizeof(EFI_GUID)) == 0) {
++		if (CompareGuid(&(CertList->SignatureType), &X509_GUID) == 0) {
+ 			CertList->SignatureListSize = list[i].MokSize +
+ 			    sizeof(EFI_SIGNATURE_LIST) + sizeof(EFI_GUID);
+ 			CertList->SignatureSize =
+@@ -1142,11 +1142,12 @@ static EFI_STATUS write_back_mok_list(MokListNode * list, INTN key_num,
+ static void delete_cert(void *key, UINT32 key_size,
+ 			MokListNode * mok, INTN mok_num)
+ {
++	EFI_GUID type;
+ 	int i;
+ 
+ 	for (i = 0; i < mok_num; i++) {
+-		if (CompareMem(&(mok[i].Type), &X509_GUID,
+-			       sizeof(EFI_GUID)) != 0)
++		type = mok[i].Type; /* avoid -Werror=address-of-packed-member */
++		if (CompareGuid(&type, &X509_GUID) != 0)
+ 			continue;
+ 
+ 		if (mok[i].MokSize == key_size &&
+@@ -1188,6 +1189,7 @@ static void mem_move(void *dest, void *src, UINTN size)
+ static void delete_hash_in_list(EFI_GUID Type, UINT8 * hash, UINT32 hash_size,
+ 				MokListNode * mok, INTN mok_num)
+ {
++	EFI_GUID type;
+ 	UINT32 sig_size;
+ 	UINT32 list_num;
+ 	int i, del_ind;
+@@ -1197,7 +1199,8 @@ static void delete_hash_in_list(EFI_GUID Type, UINT8 * hash, UINT32 hash_size,
+ 	sig_size = hash_size + sizeof(EFI_GUID);
+ 
+ 	for (i = 0; i < mok_num; i++) {
+-		if ((CompareMem(&(mok[i].Type), &Type, sizeof(EFI_GUID)) != 0) ||
++		type = mok[i].Type; /* avoid -Werror=address-of-packed-member */
++		if ((CompareGuid(&type, &Type) != 0) ||
+ 		    (mok[i].MokSize < sig_size))
+ 			continue;
+ 
+@@ -1253,6 +1256,7 @@ static void delete_hash_list(EFI_GUID Type, void *hash_list, UINT32 list_size,
+ static EFI_STATUS delete_keys(void *MokDel, UINTN MokDelSize, BOOLEAN MokX)
+ {
+ 	EFI_STATUS efi_status;
++	EFI_GUID type;
+ 	CHAR16 *db_name;
+ 	CHAR16 *auth_name;
+ 	CHAR16 *err_strs[] = { NULL, NULL, NULL };
+@@ -1361,8 +1365,8 @@ static EFI_STATUS delete_keys(void *MokDel, UINTN MokDelSize, BOOLEAN MokX)
+ 
+ 	/* Search and destroy */
+ 	for (i = 0; i < del_num; i++) {
+-		if (CompareMem(&(del_key[i].Type), &X509_GUID,
+-			       sizeof(EFI_GUID)) == 0) {
++		type = del_key[i].Type; /* avoid -Werror=address-of-packed-member */
++		if (CompareGuid(&type, &X509_GUID) == 0) {
+ 			delete_cert(del_key[i].Mok, del_key[i].MokSize,
+ 				    mok, mok_num);
+ 		} else if (is_sha2_hash(del_key[i].Type)) {
+-- 
+2.30.2
+
