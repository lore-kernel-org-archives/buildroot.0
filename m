From: Nikolay Dimitrov <picmaster@mail.bg>
Date: Wed, 12 Aug 2015 17:58:43 +0300
Subject: [Buildroot] [PATCH] linux: handle read-only dts files
In-Reply-To: <1439338309-19690-1-git-send-email-hollis_blanchard@mentor.com>
References: <1439338309-19690-1-git-send-email-hollis_blanchard@mentor.com>
Message-ID: <55CB5F23.7000708@mail.bg>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Holis,

On 08/12/2015 03:11 AM, Hollis Blanchard wrote:
> Some fine version control systems make all files read-only. The custom DTS file
> may therefore be read-only, and that permission is preserved when copying into
> the Linux build directory. A subsequent rebuild tries to 'cp' again, which
> fails with a "Permission denied" error unless the -f option is used.
>
> Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
> ---
>   linux/linux.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 375a9e1..a4c4733 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -270,7 +270,7 @@ endif
>   # configuration has changed.
>   define LINUX_BUILD_CMDS
>   	$(if $(BR2_LINUX_KERNEL_USE_CUSTOM_DTS),
> -		cp $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)) $(KERNEL_ARCH_PATH)/boot/dts/)
> +		cp -f $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)) $(KERNEL_ARCH_PATH)/boot/dts/)
>   	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
>   	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then 	\
>   		$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ;	\
>

Is there a reason for the custom DTS to exist in both places?

Regards,
Nikolay
