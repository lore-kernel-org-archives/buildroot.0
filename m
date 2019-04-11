From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 18:25:22 +0200
Subject: [Buildroot] [git commit] package/tpm2-totp: blacklist Codesourcery
 ARM toolchain
Message-ID: <20190411162236.D6AC78E3FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=32904f9852b5c2fd3d3af752b934d755583bf732
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/6c9bb17920749409e5a0c3388ccda411c6c7cfb4/

tpm2-totp uses _DEFAULT_SOURCE to make the htobe64() macro available,
support for which was only added in glibc 2.20:

https://www.gnu.org/software/libc/manual/html_node/Feature-Test-Macros.html#index-_005fDEFAULT_005fSOURCE

From glibc 2.20 NEWS:

* The _BSD_SOURCE and _SVID_SOURCE feature test macros are no longer
  supported; they now act the same as _DEFAULT_SOURCE (but generate a
  warning).  Except for cases where _BSD_SOURCE enabled BSD interfaces that
  conflicted with POSIX (support for which was removed in 2.19), the
  interfaces those macros enabled remain available when compiling with
  _GNU_SOURCE defined, with _DEFAULT_SOURCE defined, or without any feature
  test macros defined.

This could be worked around by defining _BSD_SOURCE for this old toolchain
(cannot be done unconditionally as it generated warnings for modern glibc
versions), but given that platforms using this old toolchain are unlikely to
have a TPM 2.0 and use it for TOTP, simply blacklist it instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tpm2-totp/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tpm2-totp/Config.in b/package/tpm2-totp/Config.in
index ca630e4584..0dbbdea228 100644
--- a/package/tpm2-totp/Config.in
+++ b/package/tpm2-totp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TPM2_TOTP
 	bool "tpm2-tools"
 	depends on !BR2_STATIC_LIBS # tpm2-tss
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM # glibc < 2.20
 	select BR2_PACKAGE_LIBQRENCODE
 	select BR2_PACKAGE_TPM2_TSS
 	help
@@ -19,3 +20,4 @@ config BR2_PACKAGE_TPM2_TOTP
 
 comment "tpm2-totp needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
