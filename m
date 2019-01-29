From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 23:06:58 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] tpm2-tools: drop
 dependency on tpm2-abrmd
Message-ID: <20190129220610.5641E82640@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e17b25da283757d030f59182b6dea5bd290aa6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

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
(cherry picked from commit 7b8feba51df4955193c4d58902bb1002c92b430b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-tools/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
index e5feb18786..e19a6ea4e6 100644
--- a/package/tpm2-tools/Config.in
+++ b/package/tpm2-tools/Config.in
@@ -9,7 +9,6 @@ config BR2_PACKAGE_TPM2_TOOLS
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_TPM2_ABRMD # run-time
 	select BR2_PACKAGE_TPM2_TSS
 	help
 	  TPM (Trusted Platform Module) 2.0 CLI tools based on system
@@ -18,6 +17,11 @@ config BR2_PACKAGE_TPM2_TOOLS
 	  and manage non-volatile storage through a TPM2.0 HW
 	  implementation.
 
+	  Notice: An in-kernel resource manager is provided by the
+	  Linux kernel since 4.12. Depending on use cases and kernel
+	  version, the user space resource manager provided by
+	  tpm2-abrmd may be needed.
+
 	  https://github.com/tpm2-software/tpm2-tools
 
 comment "tpm2-tools needs a uClibc or glibc toolchain w/ C++, wchar, threads"
