From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 22 Jul 2017 23:47:10 +0200
Subject: [Buildroot] [PATCH 10/20] package/skeleton: select it rather
 than default to y
In-Reply-To: <197425c9ca54aae186faeff352635f6b7250d8be.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <197425c9ca54aae186faeff352635f6b7250d8be.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <c007a7b8-7412-505c-004e-0bbbd3de7e61@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-07-17 19:25, Yann E. MORIN wrote:
> Our current skeleton is tailored to sysv-like init systems; it is not
> fit for systemd-based systems. So, in upcoming changes, we'll add
> another skeleton for systemd.
> 
> This means we can no longer have the current skeleton default to 'y', or
> it would be enabled also for systemd, which would be incorrect.
> 
> So, we remove the default to 'y' but have it selected by the default
> skeleton choice.
> 
> However, we do not yet have a way to directly build (really, install)
> the custom skeleton, it is built (really, installed) as a dependency of
> the default skeleton. So we must also forcibly select the default
> skeleton when using a custom one.
> 
> Until we have the mean to do only one or the other; i.e. when we have a
                    means

> virtual skeleton.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 You're going about it in a pretty complicated way. I think it would have been
simpler to rename skeleton to skeleton-common and introducing the skeleton
virtual package in one commit, and then start splitting them up. However, you've
done it this way now, and it works, so

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout


> ---
>  package/skeleton/Config.in | 1 -
>  system/Config.in           | 2 ++
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/skeleton/Config.in b/package/skeleton/Config.in
> index d25147bd92..b22ac66b35 100644
> --- a/package/skeleton/Config.in
> +++ b/package/skeleton/Config.in
> @@ -1,5 +1,4 @@
>  config BR2_PACKAGE_SKELETON
>  	bool
> -	default y
>  	help
>  	  The basic skeleton for your rootfs.
> diff --git a/system/Config.in b/system/Config.in
> index 5cb921f108..9b42fbbbac 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -8,6 +8,7 @@ choice
>  config BR2_ROOTFS_SKELETON_DEFAULT
>  	bool "default target skeleton"
>  	depends on !BR2_INIT_NONE
> +	select BR2_PACKAGE_SKELETON
>  	help
>  	  Use default target skeleton
>  
> @@ -16,6 +17,7 @@ comment "default target skeleton needs an init system"
>  
>  config BR2_ROOTFS_SKELETON_CUSTOM
>  	bool "custom target skeleton"
> +	select BR2_PACKAGE_SKELETON
>  	help
>  	  Use custom target skeleton.
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
