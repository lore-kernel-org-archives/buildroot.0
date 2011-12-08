From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Dec 2011 22:30:00 +0100
Subject: [Buildroot] [PATCH] linux: support "local" as download method
In-Reply-To: <CAEvN+1j08xz+a+sz_3vmUa8tQ18xnv+9KR2MA9E_ub-SZeerEA@mail.gmail.com>
References: <1323255396-28263-1-git-send-email-tjlee@ambarella.com>
 <CAEvN+1j08xz+a+sz_3vmUa8tQ18xnv+9KR2MA9E_ub-SZeerEA@mail.gmail.com>
Message-ID: <20111208223000.72d8e084@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

What this patch does is already possible through the "override source
directory" mechanism, which is available for every package.

It's true that the Linux package is special in that it is very likely
that many people will want to use a local source directory, but I'm
fearing that we will end up adding many of those
"<something>_CUSTOM_LOCAL" option that just duplicate what is possible
thanks to the override source directory mechanism.

See http://free-electrons.com/blog/buildroot-2011-11/ for more details
on this source directory override mechanism.

Best regards,

Thomas

Le Wed, 7 Dec 2011 20:09:20 +0800,
Tzu-Jung Lee <roylee17@gmail.com> a ?crit :

> Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
> ---
> ?linux/Config.in | ? 10 ++++++++++
> ?linux/linux.mk ?| ? ?3 +++
> ?2 files changed, 13 insertions(+), 0 deletions(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index dc6aa73..4053c41 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -53,6 +53,12 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT
> ? ? ? ? ?This option allows Buildroot to get the Linux kernel source
> ? ? ? ? ?code from a Git repository.
> 
> +config BR2_LINUX_KERNEL_CUSTOM_LOCAL
> + ? ? ? bool "Custom local source tree"
> + ? ? ? help
> + ? ? ? ? This option allows Buildroot to get the Linux kernel source
> + ? ? ? ? code from a local repository.
> +
> ?endchoice
> 
> ?config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
> @@ -72,6 +78,10 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
> ? ? ? ?string "Custom Git version"
> ? ? ? ?depends on BR2_LINUX_KERNEL_CUSTOM_GIT
> 
> +config BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH
> + ? ? ? string "Custom Local path"
> + ? ? ? depends on BR2_LINUX_KERNEL_CUSTOM_LOCAL
> +
> ?config BR2_LINUX_KERNEL_VERSION
> ? ? ? ?string
> ? ? ? ?default "3.1.4" if BR2_LINUX_KERNEL_3_1
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 5c5a1d2..d5617a2 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -13,6 +13,9 @@ LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
> ?else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
> ?LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL))
> ?LINUX_SITE_METHOD = git
> +else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_LOCAL),y)
> +LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH))
> +LINUX_SITE_METHOD = local
> ?else
> ?LINUX_SOURCE = linux-$(LINUX_VERSION).tar.bz2
> ?# In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
> --
> 1.7.8
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
