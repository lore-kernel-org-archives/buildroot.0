From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Mar 2019 01:36:12 +0100
Subject: [Buildroot] [PATCH 4/4] toolchain: allow PIC/PIE without RELRO
In-Reply-To: <11977_1552286921_5C8604BE_11977_87_1_9c1d9253-d6be-4870-a4dd-b45f5c87742f@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
References: <cover.1552286891.git.yann.morin@orange.com>
 <11977_1552286921_5C8604BE_11977_87_1_9c1d9253-d6be-4870-a4dd-b45f5c87742f@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
Message-ID: <3c26a901-4f69-163b-266a-5627f818b75c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/03/2019 07:48, yann.morin at orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> In commit 7484c1c3b806 (toolchain/toolchain-wrapper: add BR2_RELRO_),
> we added the PIC/PIE flags, but based on the RELRO_FULL condition.
> 
> It is however totally possible to do a PIC/PIE executable without
> RELRO_FULL, as it is also valid to do a PIC/PIE build with RELRO_PARTIAL.
> 
> Add a new option that now governs the PIC/PIE flags.
> 
> Note: it is unknown if RELRO_FULL really needs PIC/PIE or not, so we
> keep the current situation, where RELRO-FULL forces PIC/PIE compilation.

 I just checked on my host, and a simple test program compiled with -no-pie
-Wl,-z,relro -Wl,-z,now does work, so indeed the two seem to be independent.

 I guess it's historical accident that the global full relro and PIE are
typically introduced together. From what I understand, they are pretty much
independent.

 Regards,
 Arnout

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin@orange.com>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  Config.in                      | 8 ++++++++
>  toolchain/toolchain-wrapper.c  | 2 +-
>  toolchain/toolchain-wrapper.mk | 4 ++++
>  3 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Config.in b/Config.in
> index d5a0460f98..31fea3ab34 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -712,6 +712,13 @@ endmenu
>  
>  comment "Security Hardening Options"
>  
> +config BR2_PIC_PIE
> +	bool "Build code with PIC/PIE"
> +	depends on BR2_SHARED_LIBS
> +	help
> +	  Generate Position-Independent Code (PIC) and link
> +	  Position-Independent Executables (PIE).
> +
>  choice
>  	bool "Stack Smashing Protection"
>  	default BR2_SSP_ALL if BR2_ENABLE_SSP # legacy
> @@ -794,6 +801,7 @@ config BR2_RELRO_PARTIAL
>  
>  config BR2_RELRO_FULL
>  	bool "Full"
> +	select BR2_PIC_PIE
>  	help
>  	  This option includes the partial configuration, but also marks
>  	  the GOT as read-only at the cost of initialization time during
> diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> index d605a7d648..a38f827786 100644
> --- a/toolchain/toolchain-wrapper.c
> +++ b/toolchain/toolchain-wrapper.c
> @@ -370,7 +370,7 @@ int main(int argc, char **argv)
>  		*cur++ = "-Wno-builtin-macro-redefined";
>  	}
>  
> -#ifdef BR2_RELRO_FULL
> +#ifdef BR2_PIC_PIE
>  	/* Patterned after Fedora/Gentoo hardening approaches.
>  	 * https://fedoraproject.org/wiki/Changes/Harden_All_Packages
>  	 * https://wiki.gentoo.org/wiki/Hardened/Toolchain#Position_Independent_Executables_.28PIEs.29
> diff --git a/toolchain/toolchain-wrapper.mk b/toolchain/toolchain-wrapper.mk
> index e48e765a8e..67cec5c1cf 100644
> --- a/toolchain/toolchain-wrapper.mk
> +++ b/toolchain/toolchain-wrapper.mk
> @@ -45,6 +45,10 @@ ifeq ($(BR2_CCACHE_USE_BASEDIR),y)
>  TOOLCHAIN_WRAPPER_ARGS += -DBR_CCACHE_BASEDIR='"$(BASE_DIR)"'
>  endif
>  
> +ifeq ($(BR2_PIC_PIE),y)
> +TOOLCHAIN_WRAPPER_ARGS += -DBR2_PIC_PIE
> +endif
> +
>  ifeq ($(BR2_RELRO_PARTIAL),y)
>  TOOLCHAIN_WRAPPER_ARGS += -DBR2_RELRO_PARTIAL
>  else ifeq ($(BR2_RELRO_FULL),y)
> 
