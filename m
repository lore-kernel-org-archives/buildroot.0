From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 16 Jan 2014 18:51:21 +0100
Subject: [Buildroot] [PATCH v6 4/5] systemd: bump to v207.
In-Reply-To: <1389627907-7821-5-git-send-email-eric.le.bihan.dev@free.fr>
References: <1389627907-7821-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1389627907-7821-5-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <CAHXCMMKi20cf2THNYw4kmF8E50Ph8DeZgcDh3J2bw5RbAc8g6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric,


2014/1/13 Eric Le Bihan <eric.le.bihan.dev@free.fr>

> This patch bumps systemd to v207 but also declares it as a provider for the
> udev virtual package.
>
> Starting with systemd 183, udev has been merged into
> systemd. The udev daemon is now installed as /lib/systemd/systemd-udevd.
> This means that /dev management using udev is only available if systemd
> is chosen as init system.
>
> When configuring systemd, the following options are available:
>
> - activation of systemd-journal-gatewayd, to access the journal via
>   HTTP.
> - activation of extra features like journal compression and sealing.
>
> Support for uClibc has also been removed because:
>
> - upstream has no interest in supporting uClibc.
> - using a shrinked libc brings no advantage, given the size of all the
>   programs included in Systemd. So using glibc does not matter.
>
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  Config.in.legacy                             |    2 +-
>  linux/linux.mk                               |    1 +
>  package/systemd/Config.in                    |   56 +++++++++++++--
>  package/systemd/systemd-fix-getty-unit.patch |   36 +++++-----
>  package/systemd/systemd-fix-page-size.patch  |   43 -----------
>  package/systemd/systemd-uclibc-fix.patch     |   59 ----------------
>  package/systemd/systemd.mk                   |   98
> ++++++++++++++++++--------
>  package/udev/udev.mk                         |    4 ++
>  system/Config.in                             |   26 +++++--
>  9 files changed, 165 insertions(+), 160 deletions(-)
>  delete mode 100644 package/systemd/systemd-fix-page-size.patch
>  delete mode 100644 package/systemd/systemd-uclibc-fix.patch
>
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 5d80842..f56308f 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -240,7 +240,7 @@ config BR2_PACKAGE_UDEV
>         select BR2_PACKAGE_HAS_UDEV
>         help
>           The 'udev' package is now a virtual package. It is
> -         currently only provided by 'eudev'.
> +         currently provided by 'eudev' or 'systemd'.
>
>
>
>  ###############################################################################
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 17365a0..e12dd39 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -194,6 +194,7 @@ define LINUX_CONFIGURE_CMDS
>                 $(call
> KCONFIG_ENABLE_OPT,CONFIG_FUNCTION_TRACER,$(@D)/.config))
>         $(if $(BR2_PACKAGE_SYSTEMD),
>                 $(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config))
>
+               $(call
> KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config))
>
Since you are adding a command in the if-block, there is an extra ")" at
the end of the CONFIG_CGROUPS command line.


>         $(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
>                 $(call
> KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
>         yes '' | $(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D)
> oldconfig
>

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140116/5ca86510/attachment.html>
