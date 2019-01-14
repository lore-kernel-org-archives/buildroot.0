From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Jan 2019 23:33:49 +0100
Subject: [Buildroot] [PATCH] tpm2-tss: fix build with BR2_FORTIFY_SOURCE_1
Message-ID: <20190114223349.7071-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The configure script passes -U FORTIFY_SOURCE -D FORTIFY_SOURCE=2 by
default, which conflicts with BR2_FORTIFY_SOURCE_1 as -Werror is used:

<cross>-gcc ..  -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 .. -D_FORTIFY_SOURCE=1
<command-line>:0:0: error: "_FORTIFY_SOURCE" redefined [-Werror]

Disable this so the FORTIFY_SOURCE flags in TARGET_CFLAGS (if any) are used
instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-tss/tpm2-tss.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index f005e5d6b8..5b57973c6e 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -16,4 +16,10 @@ TPM2_TSS_CONF_OPTS = --with-crypto=ossl --disable-doxygen-doc
 # libssp is missing.
 TPM2_TSS_CONF_ENV = ax_cv_check_cflags___________Wall__Werror_______fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
 
+# configure.ac uses FORTIFY_SOURCE=2 by default. Disable that so the
+# BR2_FORTIFY_SOURCE_* options in CFLAGS are used instead
+sTPM2_TSS_CONF_ENV += \
+	ax_cv_check_ccppflags___________Wall__Werror_______U_FORTIFY_SOURCE=no \
+	ax_cv_check_ccppflags___________Wall__Werror_______D_FORTIFY_SOURCE_2=no
+
 $(eval $(autotools-package))
-- 
2.11.0
