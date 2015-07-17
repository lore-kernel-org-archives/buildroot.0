From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Fri, 17 Jul 2015 09:01:32 -0700
Subject: [Buildroot] [RFC/PATCH] linux: remove the zImage before rebuild
In-Reply-To: <1411773774-7712-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1411773774-7712-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <55A926DC.9010803@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guido, I just ran across this discussion <http://patchwork.ozlabs.org/patch/394002/> in patchwork, and wanted to say I hit the same thing this week (and spent a few hours figuring out what had gone wrong). Has there been any activity on the problem recently?

Hollis Blanchard
Mentor Graphics Emulation Division

On 09/26/2014 04:22 PM, Guido Mart?nez wrote:
> Currently, if we run "make linux-rebuild", the device tree blob gets
> appended twice to the kernel image, rendering the latter append useless.
>
> Fix this by removing the zImage before building, so the DTB append runs
> on a fresh kernel image. This is not optimal as the final Linux linking
> step is run again, but at least we get sensible results.
>
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> ---
> Hi guys,
>
> Has anyone ran into the above problem? It was a small headache for me,
> so I wrote this small patch.
>
> It's not great, the right thing to do would be copying the zImage out
> of the kernel tree and appending the DTB there, but my attempt at doing
> that broke some other builds. This should work every time.
>
>
>  linux/linux.mk | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 2fb7437..14c2b8e 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -263,6 +263,10 @@ endif
>  # Compilation. We make sure the kernel gets rebuilt when the
>  # configuration has changed.
>  define LINUX_BUILD_CMDS
> +	# Remove the previous image, if it exists, to prevent appending
> +	# multiple DTBs
> +	rm -f $(KERNEL_ARCH_PATH)/boot/zImage
> +
>  	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
>  		cp $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)) $(KERNEL_ARCH_PATH)/boot/dts/)
>  	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150717/de46db10/attachment.html>
