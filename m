From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Jul 2021 23:04:32 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/tpm2-tools:
 backport CVE-2021-3565 security fix
Message-ID: <20210712203149.3EEFF954FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18c59c32a09074c1a1883226c816d756888884db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes CVE-2021-3565: A flaw was found in tpm2-tools in versions before 5.1.1
and before 4.3.2.  tpm2_import used a fixed AES key for the inner wrapper,
potentially allowing a MITM attacker to unwrap the inner portion and reveal
the key being imported.  The highest threat from this vulnerability is to
data confidentiality.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...m2_import-fix-fixed-AES-key-CVE-2021-3565.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/tpm2-tools/0001-tpm2_import-fix-fixed-AES-key-CVE-2021-3565.patch b/package/tpm2-tools/0001-tpm2_import-fix-fixed-AES-key-CVE-2021-3565.patch
new file mode 100644
index 0000000000..c0a433251f
--- /dev/null
+++ b/package/tpm2-tools/0001-tpm2_import-fix-fixed-AES-key-CVE-2021-3565.patch
@@ -0,0 +1,47 @@
+From c069e4f179d5e6653a84fb236816c375dca82515 Mon Sep 17 00:00:00 2001
+From: William Roberts <william.c.roberts@intel.com>
+Date: Fri, 21 May 2021 12:22:31 -0500
+Subject: [PATCH] tpm2_import: fix fixed AES key CVE-2021-3565
+
+tpm2_import used a fixed AES key for the inner wrapper, which means that
+a MITM attack would be able to unwrap the imported key. Even the
+use of an encrypted session will not prevent this. The TPM only
+encrypts the first parameter which is the fixed symmetric key.
+
+To fix this, ensure the key size is 16 bytes or bigger and use
+OpenSSL to generate a secure random AES key.
+
+Fixes: #2738
+
+Signed-off-by: William Roberts <william.c.roberts@intel.com>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ tools/tpm2_import.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/tools/tpm2_import.c b/tools/tpm2_import.c
+index cfb6f207..f44326c8 100644
+--- a/tools/tpm2_import.c
++++ b/tools/tpm2_import.c
+@@ -118,7 +118,17 @@ static tool_rc key_import(ESYS_CONTEXT *ectx, TPM2B_PUBLIC *parent_pub,
+     TPM2B_DATA enc_sensitive_key = {
+         .size = parent_pub->publicArea.parameters.rsaDetail.symmetric.keyBits.sym / 8
+     };
+-    memset(enc_sensitive_key.buffer, 0xFF, enc_sensitive_key.size);
++
++    if(enc_sensitive_key.size < 16) {
++        LOG_ERR("Calculated wrapping keysize is less than 16 bytes, got: %u", enc_sensitive_key.size);
++        return tool_rc_general_error;
++    }
++
++    int ossl_rc = RAND_bytes(enc_sensitive_key.buffer, enc_sensitive_key.size);
++    if (ossl_rc != 1) {
++        LOG_ERR("RAND_bytes failed: %s", ERR_error_string(ERR_get_error(), NULL));
++        return tool_rc_general_error;
++    }
+ 
+     /*
+      * Calculate the object name.
+-- 
+2.20.1
+
