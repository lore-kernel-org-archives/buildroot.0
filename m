From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Jan 2019 22:19:51 +0100
Subject: [Buildroot] [git commit] tpm2-tools: drop dependency on tpm2-abrmd
Message-ID: <20190128211912.E570C81972@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b8feba51df4955193c4d58902bb1002c92b430b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tpm2-tools is commonly used with the resource manager, tpm2-abrmd - But it
CAN be used without, E.G. by setting the TPM2TOOLS_TCTI_NAME environment
variable to communicate directly with the kernel driver:

export TPM2TOOLS_TCTI_NAME=device

Either directly with the TPM device (/dev/tpmN) or through the in-kernel
resource manager provided by Linux kernel since 4.12 (/dev/tpmrmN)

For some use cases (E.G. initramfs) it makes sense to use tpm2-tools
without abrmd, so remove the tpm2-abrmd select, and instead a note in the
help text that it may be needed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-tools/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
index cc87e2a1bf..d8660a8f71 100644
--- a/package/tpm2-tools/Config.in
+++ b/package/tpm2-tools/Config.in
@@ -8,7 +8,6 @@ config BR2_PACKAGE_TPM2_TOOLS
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_TPM2_ABRMD # run-time
 	select BR2_PACKAGE_TPM2_TSS
 	help
 	  TPM (Trusted Platform Module) 2.0 CLI tools based on system
@@ -17,6 +16,11 @@ config BR2_PACKAGE_TPM2_TOOLS
 	  and manage non-volatile storage through a TPM2.0 HW
 	  implementation.
 
+	  Notice: An in-kernel resource manager is provided by the
+	  Linux kernel since 4.12. Depending on use cases and kernel
+	  version, the user space resource manager provided by
+	  tpm2-abrmd may be needed.
+
 	  https://github.com/tpm2-software/tpm2-tools
 
 comment "tpm2-tools needs a toolchain w/ dynamic library, wchar, threads"
