From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 25 Mar 2018 00:59:53 -0300
Subject: [Buildroot] [PATCH 2/2] tpm2-tools: fix compilation error due to
 uninitialized variable
In-Reply-To: <20180325035953.25906-1-casantos@datacom.ind.br>
References: <20180325035953.25906-1-casantos@datacom.ind.br>
Message-ID: <20180325035953.25906-3-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport a patch alreary submitted upstream, at

  https://github.com/tpm2-software/tpm2-tools/pull/954

Fixes:
  http://autobuild.buildroot.net/results/ae1e151576b365380ab711a1b8ffcd92ad0050e2
  http://autobuild.buildroot.net/results/ee80c2fe54c89589532efd47eb93bd27637c690f

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 ...y-fix-type-may-be-used-uninitialized-warn.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/tpm2-tools/0001-tpm2_certify-fix-type-may-be-used-uninitialized-warn.patch

diff --git a/package/tpm2-tools/0001-tpm2_certify-fix-type-may-be-used-uninitialized-warn.patch b/package/tpm2-tools/0001-tpm2_certify-fix-type-may-be-used-uninitialized-warn.patch
new file mode 100644
index 0000000000..b472666f46
--- /dev/null
+++ b/package/tpm2-tools/0001-tpm2_certify-fix-type-may-be-used-uninitialized-warn.patch
@@ -0,0 +1,36 @@
+From e15b01a1eb27e31964308892fcaa9c7d4f17f181 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.ind.br>
+Date: Sat, 24 Mar 2018 22:46:46 -0300
+Subject: [PATCH] tpm2_certify: fix "'type' may be used uninitialized" warning
+
+get_key_type does not assign a value to 'type' on error conditions,
+which makes the compiler believe that it will be used uninitialized in
+the LOG_ERR call, in set_scheme. In practice this will never happen
+because set_scheme returns immediately if get_key_type retuns false but
+the compiler does not understand that logic and fails because warnings
+are treated as errors.
+
+Adapted for version 3.0.3 from the change submitted upstream:
+
+  https://github.com/tpm2-software/tpm2-tools/pull/954
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+---
+ tools/tpm2_certify.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/tpm2_certify.c b/tools/tpm2_certify.c
+index eaac02f..cbc42a9 100644
+--- a/tools/tpm2_certify.c
++++ b/tools/tpm2_certify.c
+@@ -107,6 +107,7 @@ static bool get_key_type(TSS2_SYS_CONTEXT *sapi_context, TPMI_DH_OBJECT object_h
+             &out_public, &name, &qualified_name, &sessions_data_out));
+     if (rval != TPM_RC_SUCCESS) {
+         LOG_ERR("TPM2_ReadPublic failed. Error Code: 0x%x", rval);
++        *type = TPM_ALG_ERROR;
+         return false;
+     }
+ 
+-- 
+2.14.3
+
-- 
2.14.3
