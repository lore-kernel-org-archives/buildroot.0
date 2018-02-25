From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Feb 2018 00:20:54 +0100
Subject: [Buildroot] [PATCH 1/1] linux: allow both in-tree and custom
 dts files
In-Reply-To: <20180221195316.8496-1-simon.vanderveldt@gmail.com>
References: <20180221195316.8496-1-simon.vanderveldt@gmail.com>
Message-ID: <37664d3f-0c64-4120-7c89-e11a70a45705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Simon,

 Thank you for your contribution.

On 21-02-18 20:53, Simon van der Veldt wrote:
> For some boards, for example the Raspberry Pi, it's necessary to build in-tree dts files as well
> as custom/out of tree dts-files (dt-blob.bin).

 Indeed, this makes a lot of sense, and will make more sense when overlays
become commonplace.

 I have applied to next, with a few changes, as noted below.


> The existing logic made these two options exclusive, this commit changes that to allow both
> in-tree as well as custom sources for dts files.

 Please wrap the commit message at 72 columns.

> 
> Signed-off-by: Simon van der Veldt <simon.vanderveldt@gmail.com>
> ---
>  linux/Config.in | 19 +++++++------------
>  linux/linux.mk  |  5 +++--
>  2 files changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 0e1e4c287b..38b0334ed7 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -363,10 +363,6 @@ config BR2_LINUX_KERNEL_DTB_IS_SELF_BUILT
>  config BR2_LINUX_KERNEL_APPENDED_DTB
>  	bool
>  
> -choice
> -	prompt "Device tree source"
> -	default BR2_LINUX_KERNEL_USE_INTREE_DTS
> -
>  config BR2_LINUX_KERNEL_USE_INTREE_DTS
>  	bool "Use a device tree present in the kernel"
>  	help
> @@ -374,14 +370,6 @@ config BR2_LINUX_KERNEL_USE_INTREE_DTS
>  	  the kernel sources. The dts files are located
>  	  in the arch/<arch>/boot/dts folder.
>  
> -config BR2_LINUX_KERNEL_USE_CUSTOM_DTS
> -	bool "Use a custom device tree file"
> -	help
> -	  Use a custom device tree file, i.e, a device
> -	  tree file that does not belong to the kernel
> -	  source tree.
> -endchoice
> -
>  config BR2_LINUX_KERNEL_INTREE_DTS_NAME
>  	string "Device Tree Source file names"
>  	depends on BR2_LINUX_KERNEL_USE_INTREE_DTS
> @@ -390,6 +378,13 @@ config BR2_LINUX_KERNEL_INTREE_DTS_NAME
>  	  the trailing .dts. You can provide a list of
>  	  dts files to build, separated by spaces.
>  
> +config BR2_LINUX_KERNEL_USE_CUSTOM_DTS
> +	bool "Use a custom device tree file"
> +	help
> +	  Use a custom device tree file, i.e, a device
> +	  tree file that does not belong to the kernel
> +	  source tree.

 I think that his option and BR2_LINUX_KERNEL_USE_INTREE_DTS are now redundant.
Indeed, we can just check if the string is non-empty. That said, it's better to
do this as a separate patch, and anyway there is no agreement between Buildroot
developers whether it's better to have an explicit boolean Kconfig variable or
whether to use the non-emptiness.

 I've also been thinking about the possibility to have just a single string
option with all dts'es, but that would be complicated for no real gain.

> +
>  config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
>  	string "Device Tree Source file paths"
>  	depends on BR2_LINUX_KERNEL_USE_CUSTOM_DTS
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 5300b9cfc5..58a38aa0e0 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -120,12 +120,13 @@ LINUX_VERSION_PROBED = `$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-d
>  
>  ifeq ($(BR2_LINUX_KERNEL_USE_INTREE_DTS),y)
>  KERNEL_DTS_NAME = $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))

 I've changed this into +=, so it can be safely moved around without overwriting
the assignment below.

> -else ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
> +endif

 I've added an empty line here since the conditions are now really separate.


 Regards,
 Arnout

> +ifeq ($(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),y)
>  # We keep only the .dts files, so that the user can specify both .dts
>  # and .dtsi files in BR2_LINUX_KERNEL_CUSTOM_DTS_PATH. Both will be
>  # copied to arch/<arch>/boot/dts, but only the .dts files will
>  # actually be generated as .dtb.
> -KERNEL_DTS_NAME = $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
> +KERNEL_DTS_NAME += $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
>  endif
>  
>  KERNEL_DTBS = $(addsuffix .dtb,$(KERNEL_DTS_NAME))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
