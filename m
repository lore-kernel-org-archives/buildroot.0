From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Jan 2019 11:15:21 +0100
Subject: [Buildroot] [PATCH v2 6/7] tpm2-tools: do not enforce dependency on
 tpm2-abrmd
In-Reply-To: <20190115101522.21042-1-peter@korsgaard.com>
References: <20190115101522.21042-1-peter@korsgaard.com>
Message-ID: <20190115101522.21042-6-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tpm2-tools is commonly used with the resource manager, tpm2-abrmd - But it
CAN be used without, E.G.  by setting the TPM2TOOLS_TCTI_NAME environment
variable to communicate directly with the kernel driver:

export TPM2TOOLS_TCTI_NAME=device

For some use cases (E.G.  initramfs) it makes sense to use tpm2-tools
without abrmd, so downgrade the dependency from select to imply, so abrmd is
enabled by default but can be explicitly disabled.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-tools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
index cc87e2a1bf..f4622b4ec9 100644
--- a/package/tpm2-tools/Config.in
+++ b/package/tpm2-tools/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_TPM2_TOOLS
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_TPM2_ABRMD # run-time
+	imply BR2_PACKAGE_TPM2_ABRMD # run-time
 	select BR2_PACKAGE_TPM2_TSS
 	help
 	  TPM (Trusted Platform Module) 2.0 CLI tools based on system
-- 
2.11.0
