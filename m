From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 7 Jun 2013 11:12:41 +0200
Subject: [Buildroot] [PATCH] linux: Fix uImage with appended DTs
	generation
In-Reply-To: <87ip201xjl.fsf@dell.be.48ers.dk>
References: <1369816605-6268-1-git-send-email-maxime.ripard@free-electrons.com>
 <87ip201xjl.fsf@dell.be.48ers.dk>
Message-ID: <20130607091241.GJ14209@lukather>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, May 30, 2013 at 02:07:10PM +0200, Peter Korsgaard wrote:
> >>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:
> 
>  Maxime> Fixes bug #5516 - appended device tree blobs on uImage fails
>  Maxime> Before version 3.7 of the kernel, building the zImage and then the
>  Maxime> uImage will rewrite the zImage in the process, removing the device tree
>  Maxime> we just appended.
> 
>  Maxime> Use mkimage to append the device tree to the uImage and rebuild the
>  Maxime> headers directly.
> 
>  Maxime> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>  Maxime> ---
>  Maxime>  linux/linux.mk | 14 +++++++++++---
>  Maxime>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
>  Maxime> diff --git a/linux/linux.mk b/linux/linux.mk
>  Maxime> index 3877c35..a1166e5 100644
>  Maxime> --- a/linux/linux.mk
>  Maxime> +++ b/linux/linux.mk
>  Maxime> @@ -228,9 +228,17 @@ define LINUX_APPEND_DTB
>  Maxime>  	fi >> $(KERNEL_ARCH_PATH)/boot/zImage
>  Maxime>  endef
>  Maxime>  ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
>  Maxime> -# We need to generate the uImage here after that so that the uImage is
>  Maxime> -# generated with the right image size.
>  Maxime> -LINUX_APPEND_DTB += $(sep)$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) uImage
>  Maxime> +# We need to generate a new u-boot image that takes into
>  Maxime> +# account the extra-size added by the device tree at the end
>  Maxime> +# of the image. To do so, we first need to retrieve both load
>  Maxime> +# address and entry point for the kernel from the already
>  Maxime> +# generate uboot image before using mkimage -l.
> 
> This doesn't seem right. APPENDED_UIMAGE implies APPENDED_DTB, which
> only builds a zImage, so there isn't any uImage to get the load address
> / entry point from.

Hmmm, right.

I don't see how it could have worked in the first place during my tests,
except maybe because of an uncleaned workspace. I'll send a v2.

> 
>  Maxime> +LINUX_APPEND_DTB += $(sep) LOAD=`$(HOST_DIR)/usr/bin/mkimage -l $(LINUX_IMAGE_PATH) |\
>  Maxime> +                    sed -n 's/Load Address: \([0-9]*\)/\1/p'`; \
>  Maxime> +                    ENTRY=`$(HOST_DIR)/usr/bin/mkimage -l $(LINUX_IMAGE_PATH) |\
>  Maxime> +                    sed -n 's/Entry Point: \([0-9]*\)/\1/p'`; \
>  Maxime> +                    $(HOST_DIR)/usr/bin/mkimage -A $(KERNEL_ARCH) -O linux -T kernel -C none -a $${LOAD} -e $${ENTRY} \
>  Maxime> +                    -n 'Linux Buildroot' -d $(KERNEL_ARCH_PATH)/boot/zImage $(LINUX_IMAGE_PATH);
> 
> These regexps don't make much sense to me as the values are in
> hexidecimal (E.G. prefixed with 0x) and the Entry Point: line as an
> extra space before the numbers.
> 
> It would also be good to keep the previous name instead of hardcoding
> Linux Buildroot.
> 
> I think it is simpler and cleaner to simply create the mkimage command
> line with a single sed invocation, E.G. something like:
> 
> LINUX_APPEND_DTB += $(sep) MKIMAGE_ARGS=`$(HOST_DIR)/usr/bin/mkimage -l $(LINUX_IMAGE_PATH) |\
> 	sed -n -e 's/Image Name:[ ]*\(.*\)/-n "\1"/p' -e 's/Load Address:/-a/' -e 's/Entry Point:/-e/'`; \
> 	$(HOST_DIR)/usr/bin/mkimage -A $(KERNEL_ARCH) -O linux \
> 	-T kernel -C none $${MKIMAGE_ARGS} \
> 	-d $(KERNEL_ARCH_PATH)/boot/zImage $(LINUX_IMAGE_PATH);
> 
> (Construct the needed -n / -a / -e options in place).

Yep, Ok, will do.

Thanks!
Maxime
