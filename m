From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Dec 2016 00:26:49 +0100
Subject: [Buildroot] [PATCH 1/1] linux: Setting a repo_version is
 mandatory for custom repositories
In-Reply-To: <1481012002-30425-1-git-send-email-christian.kellermann@solectrix.de>
References: <1481012002-30425-1-git-send-email-christian.kellermann@solectrix.de>
Message-ID: <58df8b4b-2d61-b93d-c96b-69ac9a4c084c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-12-16 09:13, Christian Kellermann wrote:
> If not set the system will use an empty string which will result in
> download errors for 'linux-.tar.gz' packages.
> 
> This patch makes it obvious to the user that the variable needs to be
> set.

 Good idea! However...

> 
> Signed-off-by: Christian Kellermann <christian.kellermann@solectrix.de>
> ---
>  linux/linux.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 7e826cc..f8a2cd9 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -35,6 +35,14 @@ LINUX_SOURCE = linux-$(LINUX_VERSION).tar.xz
>  ifeq ($(BR2_LINUX_KERNEL_CUSTOM_VERSION),y)
>  BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
>  endif
> +
> +# When a custom repository has been set, check for the repository version
> +ifeq ($(BR2_LINUX_KERNEL_CUSTOM_SVN)$(BR2_LINUX_KERNEL_CUSTOM_GIT)$(BR2_LINUX_KERNEL_CUSTOM_HG),y)
> +ifeq ($(BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION),)

 Unless I'm very mistaken, this will never trigger, because the option will be
"" instead of empty when it has not been set by the user. So it should be
qstrip'ped.

 I think it is more convenient to check $(LINUX_VERSION).

 You can also drop the outer condition, so that it also checked for
BR2_LINUX_KERNEL_CUSTOM_VERSION. But then of course it should still be in an
ifeq ($(BR2_LINUX_KERNEL),y) condition. And you should check if the CUSTOM_LOCAL
and OVERRIDE_SRCDIR options still work correctly.

 And while you're at it, perhaps you can do the same for LINUX_SITE.


 Regards,
 Arnout

> +$(error No custom repository version set. Check your BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION setting)
> +endif
> +endif
> +
>  # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
>  # to use the $(word) function. We support versions such as 4.0, 3.1,
>  # 2.6.32, 2.6.32-rc1, 3.0-rc6, etc.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
