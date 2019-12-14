From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 15 Dec 2019 00:26:02 +0100
Subject: [Buildroot] [PATCH 4/4] package/tpm2-tools: bump to version 4.1
In-Reply-To: <20191214232602.3337220-1-fontaine.fabrice@gmail.com>
References: <20191214232602.3337220-1-fontaine.fabrice@gmail.com>
Message-ID: <20191214232602.3337220-4-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop patch (already in version)
- Update hash of license file (copyrights retained since version 4.0 and
  https://github.com/tpm2-software/tpm2-tools/commit/e4b469724eaa6eff0a1ce3bce9fd2ab9e010cd3b)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-type-may-be-used-uninitialized-warn.patch | 36 -------------------
 package/tpm2-tools/tpm2-tools.hash            |  4 +--
 package/tpm2-tools/tpm2-tools.mk              |  2 +-
 3 files changed, 3 insertions(+), 39 deletions(-)
 delete mode 100644 package/tpm2-tools/0001-tpm2_certify-fix-type-may-be-used-uninitialized-warn.patch

diff --git a/package/tpm2-tools/0001-tpm2_certify-fix-type-may-be-used-uninitialized-warn.patch b/package/tpm2-tools/0001-tpm2_certify-fix-type-may-be-used-uninitialized-warn.patch
deleted file mode 100644
index 327f5e403b..0000000000
--- a/package/tpm2-tools/0001-tpm2_certify-fix-type-may-be-used-uninitialized-warn.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 295cd8f7fb8e1a1ad8f64d981e99969a364d941e Mon Sep 17 00:00:00 2001
-From: Carlos Santos <casantos@datacom.ind.br>
-Date: Sat, 24 Mar 2018 22:46:46 -0300
-Subject: [PATCH] tpm2_certify: fix "'type' may be used uninitialized" warning
-
-get_key_type does not assign a value to 'type' on error conditions,
-which makes the compiler believe that it will be used uninitialized in
-the LOG_ERR call, in set_scheme. In practice this will never happen
-because set_scheme returns immediately if get_key_type retuns false but
-the compiler does not understand that logic and fails because warnings
-are treated as errors.
-
-Adapted for version 3.1.3 from the change submitted upstream:
-
-  https://github.com/tpm2-software/tpm2-tools/pull/954
-
-Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
----
- tools/tpm2_certify.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tools/tpm2_certify.c b/tools/tpm2_certify.c
-index 0575072..e562586 100644
---- a/tools/tpm2_certify.c
-+++ b/tools/tpm2_certify.c
-@@ -98,6 +98,7 @@ static bool get_key_type(TSS2_SYS_CONTEXT *sapi_context, TPMI_DH_OBJECT object_h
-             &out_public, &name, &qualified_name, &sessions_data_out));
-     if (rval != TPM2_RC_SUCCESS) {
-         LOG_ERR("TPM2_ReadPublic failed. Error Code: 0x%x", rval);
-+        *type = TPM2_ALG_ERROR;
-         return false;
-     }
- 
--- 
-2.19.1
-
diff --git a/package/tpm2-tools/tpm2-tools.hash b/package/tpm2-tools/tpm2-tools.hash
index d2bd31cdee..9d36d70f78 100644
--- a/package/tpm2-tools/tpm2-tools.hash
+++ b/package/tpm2-tools/tpm2-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 2f515200e9a7958ee13015150f7958c8a332eb071c2564c33f81ebe32c4f6033  tpm2-tools-3.1.4.tar.gz
-sha256 3d6b149c8b042bd5f3db678d587fbe55230d071ca084bd38dcae451679c6dd45  LICENSE
+sha256 07ce37f552ed47f582fbc3423bc316fea64012ef15a92a25766a36534524dcf2  tpm2-tools-4.1.tar.gz
+sha256 e10dce74279166bf7bc463eb6e462c2025bceb3e50cadfe865d92c1c3dc0bb21  LICENSE
diff --git a/package/tpm2-tools/tpm2-tools.mk b/package/tpm2-tools/tpm2-tools.mk
index e7423db67a..4f3d64f4a3 100644
--- a/package/tpm2-tools/tpm2-tools.mk
+++ b/package/tpm2-tools/tpm2-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_TOOLS_VERSION = 3.1.4
+TPM2_TOOLS_VERSION = 4.1
 TPM2_TOOLS_SITE = https://github.com/tpm2-software/tpm2-tools/releases/download/$(TPM2_TOOLS_VERSION)
 TPM2_TOOLS_LICENSE = BSD-3-Clause
 TPM2_TOOLS_LICENSE_FILES = LICENSE
-- 
2.24.0
