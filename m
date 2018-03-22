From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Mar 2018 23:59:00 +0100
Subject: [Buildroot] [git commit] tpm2-abrmd: allow building without stack
 smashing protection (SSP)
Message-ID: <20180322230316.CB6F8838A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2bd679c9dcd48a5ba3445f99524303bed9cf252
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable SSP if the toolchain does not support it. This must be done
explicitly because configure.ac passes -fstack-protector-all to the
compiler but doesn't contain a link test, so it doesn't detect when
libssp is missing.

Fixes:
  http://autobuild.buildroot.net/results/83ad1f33f523321f841e70d2d8cf5ce861dee217
  http://autobuild.buildroot.net/results/cef047751534fef23d1022e9a276424bc84bf461
  http://autobuild.buildroot.net/results/6048355337804f7841dffa1655f44b9f6db56314
  http://autobuild.buildroot.net/results/d934a2ea90e7bf1c7b93dbb367998abab536daf4
  http://autobuild.buildroot.net/results/c0daaf37b8d1515d62d2441ba6aa57125437e191
  http://autobuild.buildroot.net/results/9482ea5554938865e0061dcbdcf3c2c918b96954
  http://autobuild.buildroot.net/results/282a8b6769f19f0a40089207bc54e7302663751f

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm2-abrmd/tpm2-abrmd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/tpm2-abrmd/tpm2-abrmd.mk b/package/tpm2-abrmd/tpm2-abrmd.mk
index 0d6a167210..b918ceaa4b 100644
--- a/package/tpm2-abrmd/tpm2-abrmd.mk
+++ b/package/tpm2-abrmd/tpm2-abrmd.mk
@@ -11,6 +11,10 @@ TPM2_ABRMD_LICENSE_FILES = LICENSE
 TPM2_ABRMD_INSTALL_STAGING = YES
 TPM2_ABRMD_DEPENDENCIES = dbus libglib2 tpm2-tss host-pkgconf
 
+# configure.ac doesn't contain a link test, so it doesn't detect when
+# libssp is missing.
+TPM2_ABRMD_CONF_ENV = ax_cv_check_cflags___fstack_protector_all=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
+
 TPM2_ABRMD_CONF_OPTS += \
 	--with-systemdsystemunitdir=$(if $(BR2_INIT_SYSTEMD),/usr/lib/systemd/system,no) \
 	--with-udevrulesdir=$(if $(BR2_PACKAGE_HAS_UDEV),/usr/lib/udev/rules.d,no)
