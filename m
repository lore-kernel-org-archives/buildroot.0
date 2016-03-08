From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Mar 2016 21:58:00 +0100
Subject: [Buildroot] [PATCH 2/2] help: relocate help messages specific
 to one package
In-Reply-To: <1447857421-9380-2-git-send-email-jezz@sysmic.org>
References: <1447857421-9380-1-git-send-email-jezz@sysmic.org>
 <1447857421-9380-2-git-send-email-jezz@sysmic.org>
Message-ID: <56DF3CD8.1080205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/18/15 15:37, J?r?me Pouiller wrote:
> Use $LOCAL_HELP feature in order to integrate help messages specific
> to one package (linux-menuconfig, etc...) package they are
> related.
>
> It would be possible to do it using kconfig framework, but I was not
> sure it is necessary to document kconfig targets systematicaly.
>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

  With the change LOCAL -> ADDITIONAL:

  Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  Regards,
  Arnout

> ---
>   Makefile                   | 16 ----------------
>   boot/barebox/barebox.mk    |  5 +++++
>   linux/linux.mk             |  7 +++++++
>   package/busybox/busybox.mk |  4 ++++
>   package/uclibc/uclibc.mk   |  4 ++++
>   5 files changed, 20 insertions(+), 16 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 4322da9..8c14281 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -885,22 +885,6 @@ help:
>   	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
>   	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
>   	@echo '  <pkg>-rebuild          - Restart the build from the build step'
> -ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> -	@echo '  busybox-menuconfig     - Run BusyBox menuconfig'
> -endif
> -ifeq ($(BR2_LINUX_KERNEL),y)
> -	@echo '  linux-menuconfig       - Run Linux kernel menuconfig'
> -	@echo '  linux-savedefconfig    - Run Linux kernel savedefconfig'
> -	@echo '  linux-update-defconfig - Save the Linux configuration to the path specified'
> -	@echo '                             by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE'
> -endif
> -ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
> -	@echo '  uclibc-menuconfig      - Run uClibc menuconfig'
> -endif
> -ifeq ($(BR2_TARGET_BAREBOX),y)
> -	@echo '  barebox-menuconfig     - Run barebox menuconfig'
> -	@echo '  barebox-savedefconfig  - Run barebox savedefconfig'
> -endif
>   ifneq ($(LOCAL_HELP),)
>   	@echo
>   	@echo 'Local targets:'
> diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
> index 00e1537..d8dde20 100644
> --- a/boot/barebox/barebox.mk
> +++ b/boot/barebox/barebox.mk
> @@ -116,4 +116,9 @@ $(error No Barebox config file. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG or
>   endif
>   endif
>
> +ifeq ($(BR2_TARGET_BAREBOX),y)
> +	LOCAL_HELP += 'barebox-menuconfig     - Run barebox menuconfig'
> +	LOCAL_HELP += 'barebox-savedefconfig  - Run barebox savedefconfig'
> +endif
> +
>   $(eval $(kconfig-package))
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 9507837..a4d1301 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -390,6 +390,13 @@ endif
>
>   endif # BR_BUILDING
>
> +ifeq ($(BR2_LINUX_KERNEL),y)
> +	LOCAL_HELP += 'linux-menuconfig       - Run Linux kernel menuconfig'
> +	LOCAL_HELP += 'linux-savedefconfig    - Run Linux kernel savedefconfig'
> +	LOCAL_HELP += 'linux-update-defconfig - Save the Linux configuration to the path specified'
> +	LOCAL_HELP += '                             by BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE'
> +endif
> +
>   $(eval $(kconfig-package))
>
>   # Support for rebuilding the kernel after the cpio archive has
> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
> index 7f6dbd6..3e6ca78 100644
> --- a/package/busybox/busybox.mk
> +++ b/package/busybox/busybox.mk
> @@ -262,4 +262,8 @@ $(error No BusyBox configuration file specified, check your BR2_PACKAGE_BUSYBOX_
>   endif
>   endif
>
> +ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> +	LOCAL_HELP += 'busybox-menuconfig     - Run BusyBox menuconfig'
> +endif
> +
>   $(eval $(kconfig-package))
> diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
> index c62a40f..e8af45e 100644
> --- a/package/uclibc/uclibc.mk
> +++ b/package/uclibc/uclibc.mk
> @@ -470,4 +470,8 @@ $(error No uClibc configuration file specified, check your BR2_UCLIBC_CONFIG set
>   endif
>   endif
>
> +ifeq ($(BR2_PACKAGE_UCLIBC),y)
> +	LOCAL_HELP += 'uclibc-menuconfig      - Run uClibc menuconfig'
> +endif
> +
>   $(eval $(kconfig-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
