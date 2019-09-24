From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 24 Sep 2019 23:10:40 +0200
Subject: [Buildroot] [PATCH 1/1] linux: add config option to install
 custom dts in in-tree subdir
In-Reply-To: <20190924112006.22823-1-vadim4j@gmail.com>
References: <20190924112006.22823-1-vadim4j@gmail.com>
Message-ID: <9838cd2a-105d-4b71-5b10-a631d0c2d720@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Vadim,

On 24/09/2019 13:20, Vadim Kochan wrote:
> It allows to install custom dts in specified in-tree subdir relative
> to arch/{ARCH}/boot/dts. It might be helpful in case custom dts file
> uses includes located in vendor's dts folder.
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
>  linux/Config.in | 8 ++++++++
>  linux/linux.mk  | 9 +++++++--
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 0e3cabf107..f48efbc3fb 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -400,6 +400,14 @@ config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
>  	  You can provide a list of dts paths to copy and
>  	  build, separated by spaces.
>  
> +config BR2_LINUX_KERNEL_CUSTOM_DTS_INTREE_SUBDIR
> +	string "Out-of-tree Device Tree Source file in-tree install path"
> +	help
> +	  Relative path to arch/${ARCH}/boot/dts where install
> +	  out-of-tree device tree source files. Some custom Device Tree
> +	  source file might need to be located in vendor's subfolder
> +	  (arch/arm64/boot/dts/xxx) to include its *.dtsi files.

 I'm not exactly happy with this option. I have the feeling that it will be
difficult for people to find and understand this option when they need it. The
fact that the dts files are copied into the kernel tree is a bit of Buildroot
internal kitchen IMO.

 Actually, for me it feels logical that an external dts is built with an
implicit -I$(LINUX_BUILD_DIR)/arch/$(ARCH)/boot/dts - so I would naturally tend
to include dtsi files as "vendor/soc.dtsi" rather than a plain "soc.dtsi". In
other words, the current situation just works for me. However, I do understand
that the typical use case is that you copy an existing dts from the kernel and
hack at it, and such a dts of course doesn't have the "vendor/" part in its
include statements.

 Another thing is that I feel it is a limiting factor that you can have only one
subdir. Maybe for one dts you want it to go to vendor foo, but for another to
vendor bar. Probably not an issue in practice, since you'll rarely build a
single config for boards with different SoCs.

 Ideally, the subdir information would somehow be encoded in the CUSTOM_DTS_PATH
itself - like it already is for the INTREE case. But I can't think of a
non-kludgy way to do that.


 Bottom like: I'd really like this UI, but I can't think of anything better.

> +
>  config BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT
>  	bool "Build Device Tree with overlay support"
>  	help
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 95bde1aba5..cfbfb7c0b4 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -158,11 +158,16 @@ LINUX_VERSION_PROBED = `$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-d
>  
>  LINUX_DTS_NAME += $(call qstrip,$(BR2_LINUX_KERNEL_INTREE_DTS_NAME))
>  
> +CUSTOM_DTS_INTREE_SUBDIR = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_INTREE_SUBDIR))
> +CUSTOM_DTS_INTREE_SUBDIR_PATH = $(if $(CUSTOM_DTS_INTREE_SUBDIR),$(CUSTOM_DTS_INTREE_SUBDIR)/)

 You could just do

CUSTOM_DTS_INTREE_SUBDIR = $(addsuffix /,$(call
qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_INTREE_SUBDIR)))


> +
>  # We keep only the .dts files, so that the user can specify both .dts
>  # and .dtsi files in BR2_LINUX_KERNEL_CUSTOM_DTS_PATH. Both will be
>  # copied to arch/<arch>/boot/dts, but only the .dts files will
>  # actually be generated as .dtb.
> -LINUX_DTS_NAME += $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
> +LINUX_CUSTOM_DTS_NAME = $(basename $(filter %.dts,$(notdir $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)))))
> +
> +LINUX_DTS_NAME += $(addprefix $(CUSTOM_DTS_INTREE_SUBDIR_PATH),$(LINUX_CUSTOM_DTS_NAME))

 I think adding the extra variable makes it harder to read. IMO it's better to
split it over several lines to improve readability. Also, I think it's better to
keep the addprefix close to the notdir since they're related (manipulating the
directory). So I'd put something like:

LINUX_DTS_NAME = \
	$(basename \
	  $(filter %.dts,\
	    $(addprefix $(CUSTOM_DTS_INTREE_SUBDIR),\
	      $(notdir \
	        $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH))))))


(LISP anyone? :-)

 But maybe I'm exaggerating...

 Yeah, forget everything I said. The patch is OK as is, but I just want to give
it some time for other people to come up with a better idea for the UI.


 Regards,
 Arnout


>  LINUX_DTBS = $(addsuffix .dtb,$(LINUX_DTS_NAME))
>  
> @@ -451,7 +456,7 @@ endif
>  # issues.
>  define LINUX_BUILD_CMDS
>  	$(foreach dts,$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)), \
> -		cp -f $(dts) $(LINUX_ARCH_PATH)/boot/dts/
> +		cp -f $(dts) $(LINUX_ARCH_PATH)/boot/dts/$(CUSTOM_DTS_INTREE_SUBDIR_PATH)
>  	)
>  	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) all
>  	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
> 
