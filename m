From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 9 Mar 2021 16:50:19 -0500
Subject: [Buildroot] [PATCH 2/2] Revert "package/libopenssl does not
 support riscv32"
In-Reply-To: <d7edef3a49ae3f4eb404b34ca85bd648df8a4b92.1615325812.git.yann.morin.1998@free.fr>
References: <cover.1615325812.git.yann.morin.1998@free.fr>
 <d7edef3a49ae3f4eb404b34ca85bd648df8a4b92.1615325812.git.yann.morin.1998@free.fr>
Message-ID: <CAKmqyKNaPgnmyvcVZmkW_yrag7HpNBLPzr-ug9H6b=40KKb5mA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 9, 2021 at 4:37 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Now that we have a backport from upstream with a proper fix for the
> build on riscv32 *and* a proper implementationfor 64-bit time structs,
> we can re-activate the build on riscv32.
>
> This partially reverts commit c72be5dd2f5aef9162a0ec90465d9220b3546887.
>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
> Cc: Mark Corbin <mark@dibsco.co.uk>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  package/hostapd/Config.in        | 1 -
>  package/ibm-sw-tpm2/Config.in    | 2 --
>  package/ima-evm-utils/Config.in  | 2 --
>  package/openssl/Config.in        | 7 -------
>  package/softether/Config.in      | 2 --
>  package/tpm2-abrmd/Config.in     | 2 --
>  package/tpm2-pkcs11/Config.in    | 2 --
>  package/tpm2-tools/Config.in     | 2 --
>  package/tpm2-totp/Config.in      | 2 --
>  package/tpm2-tss/Config.in       | 2 --
>  package/wpa_supplicant/Config.in | 2 --
>  11 files changed, 26 deletions(-)
>
> diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
> index 38cead90ca..54d2086c09 100644
> --- a/package/hostapd/Config.in
> +++ b/package/hostapd/Config.in
> @@ -76,7 +76,6 @@ config BR2_PACKAGE_HOSTAPD_WPS
>
>  config BR2_PACKAGE_HOSTAPD_WPA3
>         bool "Enable WPA3 support"
> -       depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
>         select BR2_PACKAGE_OPENSSL
>         select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
>         help
> diff --git a/package/ibm-sw-tpm2/Config.in b/package/ibm-sw-tpm2/Config.in
> index 57781a54bb..179fa73951 100644
> --- a/package/ibm-sw-tpm2/Config.in
> +++ b/package/ibm-sw-tpm2/Config.in
> @@ -2,7 +2,6 @@ config BR2_PACKAGE_IBM_SW_TPM2
>         bool "ibm-sw-tpm2"
>         depends on BR2_TOOLCHAIN_HAS_THREADS
>         depends on !BR2_STATIC_LIBS # ibm-sw-tpm2
> -       depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
>         select BR2_PACKAGE_OPENSSL
>         select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
>         help
> @@ -14,5 +13,4 @@ config BR2_PACKAGE_IBM_SW_TPM2
>           https://sourceforge.net/projects/ibmswtpm2/
>
>  comment "ibm-sw-tpm2 needs a toolchain w/ threads, dynamic library"
> -       depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
>         depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> diff --git a/package/ima-evm-utils/Config.in b/package/ima-evm-utils/Config.in
> index 59df58e5b3..6c29c9de28 100644
> --- a/package/ima-evm-utils/Config.in
> +++ b/package/ima-evm-utils/Config.in
> @@ -1,7 +1,6 @@
>  config BR2_PACKAGE_IMA_EVM_UTILS
>         bool "ima-evm-utils"
>         depends on BR2_USE_MMU # keyutils
> -       depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS # tpm2-tss
>         depends on !BR2_STATIC_LIBS # keyutils, tpm2-tss
>         select BR2_PACKAGE_OPENSSL
>         select BR2_PACKAGE_KEYUTILS
> @@ -14,5 +13,4 @@ config BR2_PACKAGE_IMA_EVM_UTILS
>
>  comment "ima-evm-utils needs dynamic library support"
>         depends on BR2_USE_MMU
> -       depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
>         depends on BR2_STATIC_LIBS
> diff --git a/package/openssl/Config.in b/package/openssl/Config.in
> index dd47091300..f69e85978f 100644
> --- a/package/openssl/Config.in
> +++ b/package/openssl/Config.in
> @@ -1,11 +1,5 @@
> -config BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
> -       bool
> -       default y
> -       depends on !BR2_RISCV_32
> -
>  config BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
>         bool
> -       depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
>
>  config BR2_PACKAGE_OPENSSL
>         bool "openssl support"
> @@ -22,7 +16,6 @@ choice
>
>  config BR2_PACKAGE_LIBOPENSSL
>         bool "openssl"
> -       depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
>         select BR2_PACKAGE_ZLIB
>         help
>           A collaborative effort to develop a robust, commercial-grade,
> diff --git a/package/softether/Config.in b/package/softether/Config.in
> index 01104b5d39..bfb45b0315 100644
> --- a/package/softether/Config.in
> +++ b/package/softether/Config.in
> @@ -3,7 +3,6 @@ config BR2_PACKAGE_SOFTETHER
>         depends on BR2_TOOLCHAIN_HAS_THREADS
>         depends on BR2_USE_MMU # fork()
>         depends on BR2_USE_WCHAR
> -       depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
>         select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>         select BR2_PACKAGE_OPENSSL
>         select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
> @@ -28,5 +27,4 @@ config BR2_PACKAGE_SOFTETHER
>
>  comment "softether needs a toolchain w/ wchar, threads"
>         depends on BR2_USE_MMU
> -       depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
>         depends on !(BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
> diff --git a/package/tpm2-abrmd/Config.in b/package/tpm2-abrmd/Config.in
> index 0c60db8095..4931641af4 100644
> --- a/package/tpm2-abrmd/Config.in
> +++ b/package/tpm2-abrmd/Config.in
> @@ -3,7 +3,6 @@ config BR2_PACKAGE_TPM2_ABRMD
>         depends on BR2_USE_WCHAR # libglib2
>         depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
>         depends on BR2_USE_MMU # libglib2
> -       depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS # tpm2-tss
>         depends on !BR2_STATIC_LIBS # tpm2-tss
>         select BR2_PACKAGE_LIBGLIB2
>         select BR2_PACKAGE_TPM2_TSS
> @@ -23,6 +22,5 @@ config BR2_PACKAGE_TPM2_ABRMD
>
>  comment "tpm2-abrmd needs a toolchain w/ dynamic library, wchar, threads"
>         depends on BR2_USE_MMU
> -       depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
>         depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
>                 BR2_STATIC_LIBS
> diff --git a/package/tpm2-pkcs11/Config.in b/package/tpm2-pkcs11/Config.in
> index ec82d72ae3..5d45703223 100644
> --- a/package/tpm2-pkcs11/Config.in
> +++ b/package/tpm2-pkcs11/Config.in
> @@ -1,6 +1,5 @@
>  config BR2_PACKAGE_TPM2_PKCS11
>         bool "tpm2-pkcs11"
> -       depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS # tpm2-tss
>         depends on !BR2_STATIC_LIBS # tpm2-tss
>         depends on BR2_TOOLCHAIN_HAS_THREADS
>         select BR2_PACKAGE_LIBYAML
> @@ -13,5 +12,4 @@ config BR2_PACKAGE_TPM2_PKCS11
>           https://github.com/tpm2-software/tpm2-pkcs11
>
>  comment "tpm2-pkcs11 needs a toolchain w/ dynamic library, threads"
> -       depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
>         depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
> diff --git a/package/tpm2-tools/Config.in b/package/tpm2-tools/Config.in
> index 642bd9e462..35ca63bf64 100644
> --- a/package/tpm2-tools/Config.in
> +++ b/package/tpm2-tools/Config.in
> @@ -1,6 +1,5 @@
>  config BR2_PACKAGE_TPM2_TOOLS
>         bool "tpm2-tools"
> -       depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS # tpm2-tss
>         depends on !BR2_STATIC_LIBS # tpm2-tss
>         select BR2_PACKAGE_LIBCURL
>         select BR2_PACKAGE_OPENSSL
> @@ -20,5 +19,4 @@ config BR2_PACKAGE_TPM2_TOOLS
>           https://github.com/tpm2-software/tpm2-tools
>
>  comment "tpm2-tools needs a toolchain w/ dynamic library"
> -       depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
>         depends on BR2_STATIC_LIBS
> diff --git a/package/tpm2-totp/Config.in b/package/tpm2-totp/Config.in
> index 7f274fa130..dcadf5a5f2 100644
> --- a/package/tpm2-totp/Config.in
> +++ b/package/tpm2-totp/Config.in
> @@ -1,6 +1,5 @@
>  config BR2_PACKAGE_TPM2_TOTP
>         bool "tpm2-totp"
> -       depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS # tpm2-tss
>         depends on !BR2_STATIC_LIBS # tpm2-tss
>         depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM # glibc < 2.20
>         select BR2_PACKAGE_LIBQRENCODE
> @@ -20,6 +19,5 @@ config BR2_PACKAGE_TPM2_TOTP
>           https://github.com/tpm2-software/tpm2-totp
>
>  comment "tpm2-totp needs a toolchain w/ dynamic library"
> -       depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
>         depends on BR2_STATIC_LIBS
>         depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
> diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
> index b1ab00dd38..2fc56dbd76 100644
> --- a/package/tpm2-tss/Config.in
> +++ b/package/tpm2-tss/Config.in
> @@ -1,7 +1,6 @@
>  config BR2_PACKAGE_TPM2_TSS
>         bool "tpm2-tss"
>         depends on !BR2_STATIC_LIBS # dlfcn.h
> -       depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
>         select BR2_PACKAGE_LIBURIPARSER
>         select BR2_PACKAGE_OPENSSL
>         select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
> @@ -56,5 +55,4 @@ config BR2_PACKAGE_TPM2_TSS_FAPI
>  endif
>
>  comment "tpm2-tss needs a toolchain w/ dynamic library"
> -       depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
>         depends on BR2_STATIC_LIBS
> diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
> index 788409ed3f..27ad22430a 100644
> --- a/package/wpa_supplicant/Config.in
> +++ b/package/wpa_supplicant/Config.in
> @@ -76,7 +76,6 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WIFI_DISPLAY
>  config BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING
>         bool "Enable mesh networking"
>         depends on BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT
> -       depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
>         select BR2_PACKAGE_OPENSSL
>         select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
>         help
> @@ -112,7 +111,6 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WPS
>
>  config BR2_PACKAGE_WPA_SUPPLICANT_WPA3
>         bool "Enable WPA3 support"
> -       depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
>         select BR2_PACKAGE_OPENSSL
>         select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
>         help
> --
> 2.25.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
