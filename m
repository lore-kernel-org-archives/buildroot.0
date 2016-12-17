From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 15:58:09 +0100
Subject: [Buildroot] [PATCH] linux: Setting a repo_version is mandatory
 for custom repositories
In-Reply-To: <1481542057-19945-2-git-send-email-christian.kellermann@solectrix.de>
References: <58df8b4b-2d61-b93d-c96b-69ac9a4c084c@mind.be>
 <1481542057-19945-1-git-send-email-christian.kellermann@solectrix.de>
 <1481542057-19945-2-git-send-email-christian.kellermann@solectrix.de>
Message-ID: <20161217155809.36ca37ba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Dec 2016 12:27:37 +0100, Christian Kellermann wrote:

> diff --git a/linux/linux.mk b/linux/linux.mk
> index 7e826cc..2460ebd 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -35,6 +35,18 @@ LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
>  ifeq ($(BR2_LINUX_KERNEL_CUSTOM_VERSION),y)
>  BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
>  endif
> +
> +# When a custom repository has been set, check for the repository version
> +ifeq ($(BR2_LINUX_KERNEL_CUSTOM_SVN)$(BR2_LINUX_KERNEL_CUSTOM_GIT)$(BR2_LINUX_KERNEL_CUSTOM_HG),y)
> +ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION)),)
> +$(error No custom repository version set. Check your BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION setting)
> +endif
> +ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL)),)
> +$(error No custom repo URL set. Check your BR2_LINUX_KERNEL_CUSTOM_REPO_URL setting)
> +endif
> +
> +endif

I moved this chunk closer to other checks done by linux.mk, towards the
bottom of the file.

> +# When a custom repository has been set, check for the repository version
> +ifeq ($(BR2_LINUX_KERNEL_CUSTOM_SVN)$(BR2_LINUX_KERNEL_CUSTOM_GIT)$(BR2_LINUX_KERNEL_CUSTOM_HG),y)
> +ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION)),)
> +$(error No custom repository version set. Check your BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION setting)
> +endif
> +ifeq ($(call qstrip,$(LINUX_HEADERS_SITE)),)
> +$(error No header site URL set. Check your BR2_LINUX_KERNEL_CUSTOM_REPO_URL setting)
> +endif
> +endif

These checks were not needed, as they basically replicate the same
checks as the previous chunk, except for LINUX_HEADERS_SITE being
empty, but that's already checked by the common package infrastructure.

Applied with those modifications. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
