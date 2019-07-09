From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 9 Jul 2019 19:17:17 +0200
Subject: [Buildroot] [RFC] BR2_EXTERNAL linux-kernel-extensions support
In-Reply-To: <20190709005820.595-1-robert.mccabe@rockwellcollins.com>
References: <20190709005820.595-1-robert.mccabe@rockwellcollins.com>
Message-ID: <a9b8d5c5-441c-899d-5031-653ece0d4a4a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/07/2019 02:58, robert.mccabe at rockwellcollins.com wrote:
> From: "McCabe, Robert J" <robert.mccabe@rockwellcollins.com>
> 
> Allows external projects to inject custom code inside the Linux source
> tree.
> 
> Although a simple change that *shouldn't* be controversial I'm troubled
> by the comment a few lines above:
> 
>    #However, since the files we include here are in the same directory as
>    #the current Makefile, we are OK. But this is a hard requirement: files
>    #included here *must* be in the same directory!
> 
> I'm not seeing why this is a "hard requirement" ...

 It's explained above: to identify the package name, the generic-package macro
uses the directory of the last entry in MAKEFILE_LIST. MAKEFILE_LIST contains
the list of all files included up to that point. So, by including extra files
from within linux.mk, the package name (which should be 'linux') will be set to
the directory in which the last included file resides...

> 
> Signed-off-by: McCabe, Robert J <robert.mccabe@rockwellcollins.com>
> ---
>  linux/linux.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 2b5d096e14..af3de401d1 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -514,6 +514,12 @@ endef
>  # included here *must* be in the same directory!
>  include $(sort $(wildcard linux/linux-ext-*.mk))
> 
> +define INCLUDE_EXTERNAL_LINUX_EXTENSIONS
> +-include $(sort $(wildcard $(1)/linux/linux-ext-*.mk))

 ... However, here you make sure that the directory is *still* called 'linux',
so all is well.

> +endef
> +$(foreach ext,$(BR2_EXTERNAL_DIRS), \
> +       $(eval $(call INCLUDE_EXTERNAL_LINUX_EXTENSIONS,$(ext))))

 I don't really like this eval construct very much. I think it's cleaner to do

-include $(sort $(wildcard $(foreach ext,$(BR2_EXTERNAL_DIRS), \
	$(ext)/linux/linux-ext-*.mk)))

[as always, untested.]

 Regards,
 Arnout

> +
>  LINUX_PATCH_DEPENDENCIES += $(foreach ext,$(LINUX_EXTENSIONS),\
>         $(if $(BR2_LINUX_KERNEL_EXT_$(call UPPERCASE,$(ext))),$(ext)))
> 
> --
> 2.17.1
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
