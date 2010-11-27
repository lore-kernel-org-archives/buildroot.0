From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sat, 27 Nov 2010 22:36:28 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain/crosstool-NG: use
	locales option
Message-ID: <20101127214029.A02CE8CA80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=421b5597f5b8e3d8e2f9f1fb4d6e7bbabd84db0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Push the locales option down to crosstool-NG config

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 2281daf..e944b93 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -223,6 +223,14 @@ CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_SYSROOT_DIR_PREFIX)=.*:\1="":;
 # uClibc specific options
 ifeq ($(BR2_TOOLCHAIN_CTNG_uClibc),y)
 
+# Handle the locales option
+ifneq ($(call qstrip,$(BR2_ENABLE_LOCALE)),)
+CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_LIBC_UCLIBC_LOCALES) is not set:\1=y\n\# CT_LIBC_UCLIBC_LOCALES_PREGEN_DATA is not set:;
+CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_LOCALES_PREGEN_DATA)=.*:\# \1 is not set:;
+else
+CTNG_FIX_DOT_CONFIG_SED += s:^(CT_LIBC_UCLIBC_LOCALES)=.*:\# \1 is not set:;
+endif
+
 # Handle the wide-char option
 ifneq ($(call qstrip,$(BR2_USE_WCHAR)),)
 CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_LIBC_UCLIBC_WCHAR) is not set:\1=y:;
-- 
1.7.2.2
