From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 21:50:46 +0100
Subject: [Buildroot] [git commit] tpm2-tss: fix build without stack smashing
 protection (SSP)
Message-ID: <20181202071556.8E9DE8843B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d81767c98857869d46012189ea97c078ee211bad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Restore a configuration environment setup that was incorrectly removed
along with the upgrade to version 2.1.0.

Fixes:
  http://autobuild.buildroot.net/results/44221140fb8e2ddcb7d624e657b92a59375c02dd
  http://autobuild.buildroot.net/results/08b2a8a4bdd1c38703626a4fc37dab31dce98f49
  http://autobuild.buildroot.net/results/e469b47a6c8f1e8812325fd2860345105052316c
  http://autobuild.buildroot.net/results/f230fe6bbeb8b22d2b5b7cfb3f0ac4b3b936dc37
  http://autobuild.buildroot.net/results/ceb824033888086f6dde22c66d5b5f692a253c7e
  http://autobuild.buildroot.net/results/f863947a7384cb754706e6c346d222be59ad4136

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tpm2-tss/tpm2-tss.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 3bb0702916..f005e5d6b8 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -12,4 +12,8 @@ TPM2_TSS_INSTALL_STAGING = YES
 TPM2_TSS_DEPENDENCIES = liburiparser openssl host-pkgconf
 TPM2_TSS_CONF_OPTS = --with-crypto=ossl --disable-doxygen-doc
 
+# configure.ac doesn't contain a link test, so it doesn't detect when
+# libssp is missing.
+TPM2_TSS_CONF_ENV = ax_cv_check_cflags___________Wall__Werror_______fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
+
 $(eval $(autotools-package))
