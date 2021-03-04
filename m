From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Mar 2021 22:53:08 +0100
Subject: [Buildroot] [git commit] package/libopenssl does not support riscv32
Message-ID: <20210304220634.D61E3860D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c72be5dd2f5aef9162a0ec90465d9220b3546887
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

riscv32 is (surprise!) a 32-bit architecture. But it has been Y2038-safe
from its inception. As such, there are no legacy binaries that may use
the 32-bit time syscalls, and thus they are not available on riscv32.

Code that directly calls to the syscalls without using the C libraries
wrappers thus need to handle this case by themselves. That's what
upstream tried to do with:
    https://github.com/openssl/openssl/commit/5b5e2985f355c8e99c196d9ce5d02c15bebadfbc

We initially carried that patch with 2bb26c1a1d24 (package/libopenssl:
fix build on riscv32).

However, as Arnd Bergmann puts it [0]:

    The patch looks wrong to me: __NR_io_pgetevents_time64 must be used
    whenever time_t is 64-bit wide on a 32-bit architecture, while
    __NR_io_getevents/__NR_io_pgetevents must be used when time_t is the
    same width as 'long'.

    Checking whether __NR_io_getevents is defined is wrong for all
    architectures other than riscv

And Arnd agrees that patch should be reverted [1] [2] (there are further
comments in that stream, that are worth reading).

As such, we've reverted 2bb26c1a1d24 with 6cfb4ad7f76a.

This means we have no working solution to enable openssl on riscv32 for
now. So, rather than fail the build, or backport a dysfunctional patch,
let's just forbid openssl on riscv32.

Drop the default from the choice selection; it was anyway superfluous:
the default of a choice, if left unspecified, is the first entry of the
choice. Also, having a default means we'd have to also propagate the
dependencies of the defaulted-to symbol, which is yet a little bit more
maintenance. Since the chances we get a third implementation of openssl
are pretty slim (very, very slim), reasoning about what is the default
is still very easy.

When propagating dependencies to tpm2-tss' users, we've tried to keep
the architecture dependency toward the top when possible, and otherwise
we've added it together with existing arch dependencies (MMU).

While at it, drop a useless redundant comment in ibm-sw-tpm2: if we
select FORCE_LIBOPENSSL, it is obvious that's because libressl is not
supported... Besides none of the other users of FORCE_LIBOPENSSL have
such a comment.

Fixes:
    http://autobuild.buildroot.org/results/eb9/eb9a64d4ffae8569b5225083f282cf87ffa7c681/
    ...
    http://autobuild.buildroot.org/results/07e/07e413b24ba8adc9558c80267ce16dda339bf032/

[0] https://github.com/openssl/openssl/commit/5b5e2985f355c8e99c196d9ce5d02c15bebadfbc#commitcomment-44782859
[1] https://github.com/openssl/openssl/commit/5b5e2985f355c8e99c196d9ce5d02c15bebadfbc#commitcomment-47826509
[2] https://github.com/openssl/openssl/commit/5b5e2985f355c8e99c196d9ce5d02c15bebadfbc#commitcomment-47830530

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Cc: Mark Corbin <mark@dibsco.co.uk>
---
 package/hostapd/Config.in        | 1 +
 package/ibm-sw-tpm2/Config.in    | 3 ++-
 package/ima-evm-utils/Config.in  | 2 ++
 package/openssl/Config.in        | 8 +++++++-
 package/softether/Config.in      | 2 ++
 package/tpm2-abrmd/Config.in     | 2 ++
 package/tpm2-pkcs11/Config.in    | 2 ++
 package/tpm2-tools/Config.in     | 2 ++
 package/tpm2-totp/Config.in      | 2 ++
 package/tpm2-tss/Config.in       | 2 ++
 package/wpa_supplicant/Config.in | 2 ++
 11 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index 54d2086c09..38cead90ca 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -76,6 +76,7 @@ config BR2_PACKAGE_HOSTAPD_WPS
 
 config BR2_PACKAGE_HOSTAPD_WPA3
 	bool "Enable WPA3 support"
+	depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
diff --git a/package/ibm-sw-tpm2/Config.in b/package/ibm-sw-tpm2/Config.in
index b402ba7150..57781a54bb 100644
--- a/package/ibm-sw-tpm2/Config.in
+++ b/package/ibm-sw-tpm2/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_IBM_SW_TPM2
 	bool "ibm-sw-tpm2"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # ibm-sw-tpm2
+	depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
 	select BR2_PACKAGE_OPENSSL
-	# libressl is not supported
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
 	  This project is an implementation of the TCG TPM 2.0
@@ -14,4 +14,5 @@ config BR2_PACKAGE_IBM_SW_TPM2
 	  https://sourceforge.net/projects/ibmswtpm2/
 
 comment "ibm-sw-tpm2 needs a toolchain w/ threads, dynamic library"
+	depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/ima-evm-utils/Config.in b/package/ima-evm-utils/Config.in
index 6c29c9de28..59df58e5b3 100644
--- a/package/ima-evm-utils/Config.in
+++ b/package/ima-evm-utils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_IMA_EVM_UTILS
 	bool "ima-evm-utils"
 	depends on BR2_USE_MMU # keyutils
+	depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS # tpm2-tss
 	depends on !BR2_STATIC_LIBS # keyutils, tpm2-tss
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_KEYUTILS
@@ -13,4 +14,5 @@ config BR2_PACKAGE_IMA_EVM_UTILS
 
 comment "ima-evm-utils needs dynamic library support"
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS
diff --git a/package/openssl/Config.in b/package/openssl/Config.in
index 5ce91cb80f..dd47091300 100644
--- a/package/openssl/Config.in
+++ b/package/openssl/Config.in
@@ -1,5 +1,11 @@
+config BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
+	bool
+	default y
+	depends on !BR2_RISCV_32
+
 config BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	bool
+	depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
 
 config BR2_PACKAGE_OPENSSL
 	bool "openssl support"
@@ -11,12 +17,12 @@ if BR2_PACKAGE_OPENSSL
 
 choice
 	prompt "ssl library"
-	default BR2_PACKAGE_LIBOPENSSL
 	help
 	  Select OpenSSL or LibreSSL.
 
 config BR2_PACKAGE_LIBOPENSSL
 	bool "openssl"
+	depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
 	select BR2_PACKAGE_ZLIB
 	help
 	  A collaborative effort to develop a robust, commercial-grade,
diff --git a/package/softether/Config.in b/package/softether/Config.in
index bfb45b0315..01104b5d39 100644
--- a/package/softether/Config.in
+++ b/package/softether/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_SOFTETHER
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
@@ -27,4 +28,5 @@ config BR2_PACKAGE_SOFTETHER
 
 comment "softether needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
 	depends on !(BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/tpm2-abrmd/Config.in b/package/tpm2-abrmd/Config.in
index 4931641af4..0c60db8095 100644
--- a/package/tpm2-abrmd/Config.in
+++ b/package/tpm2-abrmd/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_TPM2_ABRMD
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
+	depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS # tpm2-tss
 	depends on !BR2_STATIC_LIBS # tpm2-tss
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_TPM2_TSS
@@ -22,5 +23,6 @@ config BR2_PACKAGE_TPM2_ABRMD
 
 comment "tpm2-abrmd needs a toolchain w/ dynamic library, wchar, threads"
 	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
diff --git a/package/tpm2-pkcs11/Config.in b/package/tpm2-pkcs11/Config.in
index 5d45703223..ec82d72ae3 100644
--- a/package/tpm2-pkcs11/Config.in
+++ b/package/tpm2-pkcs11/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TPM2_PKCS11
 	bool "tpm2-pkcs11"
+	depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS # tpm2-tss
 	depends on !BR2_STATIC_LIBS # tpm2-tss
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBYAML
@@ -12,4 +13,5 @@ config BR2_PACKAGE_TPM2_PKCS11
 	  https://github.com/tpm2-software/tpm2-pkcs11
 
 comment "tpm2-pkcs11 needs a toolchain w/ dynamic library, threads"
+	depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
index 35ca63bf64..642bd9e462 100644
--- a/package/tpm2-tools/Config.in
+++ b/package/tpm2-tools/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TPM2_TOOLS
 	bool "tpm2-tools"
+	depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS # tpm2-tss
 	depends on !BR2_STATIC_LIBS # tpm2-tss
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_OPENSSL
@@ -19,4 +20,5 @@ config BR2_PACKAGE_TPM2_TOOLS
 	  https://github.com/tpm2-software/tpm2-tools
 
 comment "tpm2-tools needs a toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS
diff --git a/package/tpm2-totp/Config.in b/package/tpm2-totp/Config.in
index dcadf5a5f2..7f274fa130 100644
--- a/package/tpm2-totp/Config.in
+++ b/package/tpm2-totp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TPM2_TOTP
 	bool "tpm2-totp"
+	depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS # tpm2-tss
 	depends on !BR2_STATIC_LIBS # tpm2-tss
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM # glibc < 2.20
 	select BR2_PACKAGE_LIBQRENCODE
@@ -19,5 +20,6 @@ config BR2_PACKAGE_TPM2_TOTP
 	  https://github.com/tpm2-software/tpm2-totp
 
 comment "tpm2-totp needs a toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
index 2fc56dbd76..b1ab00dd38 100644
--- a/package/tpm2-tss/Config.in
+++ b/package/tpm2-tss/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TPM2_TSS
 	bool "tpm2-tss"
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBURIPARSER
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
@@ -55,4 +56,5 @@ config BR2_PACKAGE_TPM2_TSS_FAPI
 endif
 
 comment "tpm2-tss needs a toolchain w/ dynamic library"
+	depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS
diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index cba7fa07e1..c6e4de1d48 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -49,6 +49,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WIFI_DISPLAY
 config BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING
 	bool "Enable mesh networking"
 	depends on BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT
+	depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
@@ -83,6 +84,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WPS
 
 config BR2_PACKAGE_WPA_SUPPLICANT_WPA3
 	bool "Enable WPA3 support"
+	depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
