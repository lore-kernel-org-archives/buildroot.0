From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 14:24:37 +0100
Subject: [Buildroot] [git commit] tpm2-tss: fix build with
 BR2_FORTIFY_SOURCE_1
Message-ID: <20190116132622.2FDF0880F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=223c4fb704aa187991eb082141536e52499a5428
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configure script passes -U FORTIFY_SOURCE -D FORTIFY_SOURCE=2 by
default, which conflicts with BR2_FORTIFY_SOURCE_1 as -Werror is used:

<cross>-gcc ..  -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 .. -D_FORTIFY_SOURCE=1
<command-line>:0:0: error: "_FORTIFY_SOURCE" redefined [-Werror]

Disable this so the FORTIFY_SOURCE flags in TARGET_CFLAGS (if any) is used
instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-tss/tpm2-tss.mk | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index e2e58a092d..ecd9db11fa 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -12,9 +12,12 @@ TPM2_TSS_INSTALL_STAGING = YES
 TPM2_TSS_DEPENDENCIES = liburiparser openssl host-pkgconf
 TPM2_TSS_CONF_OPTS = --with-crypto=ossl --disable-doxygen-doc
 
-# -fstack-protector-all is used by default. Disable that so the
-# BR2_SSP_* options in the toolchain wrapper are used instead
+# -fstack-protector-all and FORTIFY_SOURCE=2 is used by
+# default. Disable that so the BR2_SSP_* / BR2_FORTIFY_SOURCE_* options
+# in the toolchain wrapper and CFLAGS are used instead
 TPM2_TSS_CONF_ENV = \
-	ax_cv_check_cflags___________Wall__Werror_______fstack_protector_all=no
+	ax_cv_check_cflags___________Wall__Werror_______fstack_protector_all=no \
+	ax_cv_check_ccppflags___________Wall__Werror_______U_FORTIFY_SOURCE=no \
+	ax_cv_check_ccppflags___________Wall__Werror_______D_FORTIFY_SOURCE_2=no
 
 $(eval $(autotools-package))
