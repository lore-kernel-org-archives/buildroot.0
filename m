From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 22 Mar 2018 17:27:48 -0300
Subject: [Buildroot] [PATCH 2/6] tpm2-tss: allow building without stack
 smashing protection (SSP)
In-Reply-To: <20180322202752.2562-1-casantos@datacom.ind.br>
References: <20180322202752.2562-1-casantos@datacom.ind.br>
Message-ID: <20180322202752.2562-3-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable SSP if the toolchain does not support it. This must be done
explicitly because configure.ac passes -fstack-protector-all to the
compiler but doesn't contain a link test, so it doesn't detect when
libssp is missing.

Fixes:
  http://autobuild.buildroot.net/results/f98749311c5a4338f5fbd6d29c9ca29ac6c24abd
  http://autobuild.buildroot.net/results/4112a001038eb5e04c67c7b5c79280813d196911
  http://autobuild.buildroot.net/results/451fcf7e36ea8774967b84279abb89ffb0fd6923
  http://autobuild.buildroot.net/results/8e1181836249105be28f04a59cf6d31afcea91d7
  http://autobuild.buildroot.net/results/49151df111ad3d03c70551e4516c3d3b36e12d70
  http://autobuild.buildroot.net/results/42d625c579a8a16fb0c0a3df441ea186c3d52b9a
  http://autobuild.buildroot.net/results/b0af881e080c4fcc6094489c037ee853fdf42869
  http://autobuild.buildroot.net/results/0909d94af3f9589dd6b8897e2501c05b421262c4
  http://autobuild.buildroot.net/results/2fd0ee29c0b28cb1fee1b43433ab8373f49ca397
  http://autobuild.buildroot.net/results/3fa19441fd2594b064c8ff759df8849705100a65
  http://autobuild.buildroot.net/results/8675d2aa8f1e8e568a42bc0dbfae8f3721e86796
  http://autobuild.buildroot.net/results/786de50b53fa9a325c92a5d48f3928082eff0045
  http://autobuild.buildroot.net/results/a575b340f7cc562c1b87eb31d4304131b52698a7
  http://autobuild.buildroot.net/results/0b1d50d9e266d889d7e848275ebfbce45ccb419d
  http://autobuild.buildroot.net/results/d632b0e1efbb5e133dfb6595554badea9e31c492
  http://autobuild.buildroot.net/results/0c95459bfa82048d7e99661cf5f2d6d393179090
  http://autobuild.buildroot.net/results/bd494dc69fb0da46065f10a3cd8a4cab0bcbcc9b
  http://autobuild.buildroot.net/results/b397e44cd17b3d576cc55f02d5463e9c14743907
  http://autobuild.buildroot.net/results/40ed7a3b519c18102df515b5c4b993ed9a488236
  http://autobuild.buildroot.net/results/e5fc04c2ded86e03eb174a89845a50f52e407d48
  http://autobuild.buildroot.net/results/95a7c14da225d9e42545ee7a155f461303c62aa6
  http://autobuild.buildroot.net/results/25ebda7a13afa4790ad28018f42c46a795f3c284
  http://autobuild.buildroot.net/results/1bc081b78c625f13327c733fc734e36fe28ecc2a
  http://autobuild.buildroot.net/results/273108e2798155464109b9fb4d16884e7d0f9ab3
  http://autobuild.buildroot.net/results/f677d340cd42ea7242d4102fbb5fa6091a05e8ef
  http://autobuild.buildroot.net/results/ae15b625260801b494bbfa541ef86edcdbaedfe0

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/tpm2-tss/tpm2-tss.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index f5169a2770..6a46868b22 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -11,4 +11,8 @@ TPM2_TSS_LICENSE_FILES = LICENSE
 TPM2_TSS_INSTALL_STAGING = YES
 TPM2_TSS_DEPENDENCIES = liburiparser host-pkgconf
 
+# configure.ac doesn't contain a link test, so it doesn't detect when 
+# libssp is missing.
+TPM2_TSS_CONF_ENV = ax_cv_check_cflags___________Wall__Werror_______fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
+
 $(eval $(autotools-package))
-- 
2.14.3
