From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 4 Mar 2021 20:36:02 +0100
Subject: [Buildroot] [PATCH] package/libopenssl does not support riscv32
In-Reply-To: <20210304111432.1787074-1-yann.morin.1998@free.fr>
References: <20210304111432.1787074-1-yann.morin.1998@free.fr>
Message-ID: <12e04566-0852-7096-c65d-ba1795b3f277@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Yann,

On 04/03/2021 12:14, Yann E. MORIN wrote:

> Drop the default from the choice selection; it was anyway superfluous:
> the default of a choice, if left unspecified, is the first entry of the
> choice.

 Bikeshedding time!

 IMHO, it is still good to have an explicit default. Its effect remains exactly
the same (if the default cannot be selected due to missing dependencies, the
first available options will be chosen), but it makes it clear for the reader
what is the default, and it makes sure that inserting a new option or reordering
the options doesn't affect the default.

[snip]
>  config BR2_PACKAGE_HOSTAPD_WPA3
>  	bool "Enable WPA3 support"
> +	depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS

 We normally add a comment of depends on. But I guess it's pretty obvious here.

>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
>  	help


[snip]
> diff --git a/package/tpm2-tss/Config.in b/package/tpm2-tss/Config.in
> index 2fc56dbd76..b1ab00dd38 100644
> --- a/package/tpm2-tss/Config.in
> +++ b/package/tpm2-tss/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_TPM2_TSS

 Unfortunately, TPM2_TSS is selected by ima-evm-utils, tpm2-abrmd, tpm2-pkcs11,
tpm2-tools, tpm2-totp. Fortunately, it doesn't recurse any further.

[snip]
>  config BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING

 WPA_SUPPLICANT is selected by connman but fortunately no mesh or WPA3. We got
lucky there!


 With the propagation of the TPM2_TSS dependency (and for those, a comment
*should* be added), you can add my

 Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

and apply directly to master.

 Regards,
 Arnout

>  	bool "Enable mesh networking"
>  	depends on BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT
> +	depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
>  	help
> @@ -83,6 +84,7 @@ config BR2_PACKAGE_WPA_SUPPLICANT_WPS
>  
>  config BR2_PACKAGE_WPA_SUPPLICANT_WPA3
>  	bool "Enable WPA3 support"
> +	depends on BR2_PACKAGE_LIBOPENSSL_ARCH_SUPPORTS
>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
>  	help
> 
