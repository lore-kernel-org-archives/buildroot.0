From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Apr 2019 22:42:55 +0200
Subject: [Buildroot] [git commit] package/tpm2-tss: add upstream patch to
 drop hardcoded -lgcrypt from tss2-esys.pc
Message-ID: <20190408204813.C4D108D334@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55c4f7ca4b3616cbc48f464d9f803eb10f7a908d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tss2-esys.pc contains a hardcoded -lgcrypt even though the openssl crypto
backend (as in Buildroot) may be used, leading to linker errors when using
esys.

Given that tpm2-tss doesn't allow static linking, there is no need to
explicitly list the crypto library dependency.

Cherry pick an upstream patch to fix this.  Notice that the upstream patch
also changes the default crypto backend to openssl.  As this isn't stricly
needed (we explicitly configure for openssl) and requires autoreconv, drop
the configure.ac hunk from the patch.

https://github.com/tpm2-software/tpm2-tss/pull/1173

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...c-switch-default-ESAPI-crypto-backend-to-.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/package/tpm2-tss/0002-configure.ac-switch-default-ESAPI-crypto-backend-to-.patch b/package/tpm2-tss/0002-configure.ac-switch-default-ESAPI-crypto-backend-to-.patch
new file mode 100644
index 0000000000..a864293d58
--- /dev/null
+++ b/package/tpm2-tss/0002-configure.ac-switch-default-ESAPI-crypto-backend-to-.patch
@@ -0,0 +1,32 @@
+From aa8d9b2bb2faeb0c6cc03548cc363d90d3414f15 Mon Sep 17 00:00:00 2001
+From: Tadeusz Struk <tadeusz.struk@intel.com>
+Date: Tue, 23 Oct 2018 16:04:25 -0700
+Subject: [PATCH] configure.ac: switch default ESAPI crypto backend to openSSL
+
+Switch the default ESAPI crypto backend to openSSL.
+This should also fix the problem with forcing applications to
+link against libgcrypt.
+
+Fixes: #1169
+
+Signed-off-by: Tadeusz Struk <tadeusz.struk@intel.com>
+[Peter: drop configure.ac hunk, only drop hard coded -lcrypt from .pc]
+(cherry picked from commit a5ff71abeda9a5aea269812de32afb79ef3fcb4d)
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ lib/tss2-esys.pc.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/tss2-esys.pc.in b/lib/tss2-esys.pc.in
+index 792f0191..ecb01bc1 100644
+--- a/lib/tss2-esys.pc.in
++++ b/lib/tss2-esys.pc.in
+@@ -4,4 +4,4 @@ URL: https://github.com/tpm2-software/tpm2-tss
+ Version: @VERSION@
+ Requires: tss2-mu tss2-sys
+ Cflags: -I at includedir@
+-Libs: -ltss2-esys -lgcrypt -L at libdir@
++Libs: -ltss2-esys -L at libdir@
+-- 
+2.11.0
+
