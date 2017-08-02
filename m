From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 19:59:14 +0200
Subject: [Buildroot] [PATCH v5 10/14] package/skeleton: introduce sysv-
 and systemd-specific skeletons
In-Reply-To: <20170801225224.16899-11-arnout@mind.be>
References: <20170801225224.16899-1-arnout@mind.be>
 <20170801225224.16899-11-arnout@mind.be>
Message-ID: <20170802195914.3043a4d8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 2 Aug 2017 00:52:20 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:

> diff --git a/package/skeleton-common/Config.in b/package/skeleton-common/Config.in
> index 5675e873cf..e18d6d0ff0 100644
> --- a/package/skeleton-common/Config.in
> +++ b/package/skeleton-common/Config.in
> @@ -1,6 +1,17 @@
>  config BR2_PACKAGE_SKELETON_COMMON
>  	bool
> +
> +# skeleton-common is normally a dependency of another skeleton.
> +# BR2_PACKAGE_SKELETON_COMMON_ONLY can be selected if skeleton-common
> +# is the only provider of the skeleton.
> +config BR2_PACKAGE_SKELETON_COMMON_ONLY
> +	bool
> +	select BR2_PACKAGE_SKELETON_COMMON
>  	select BR2_PACKAGE_HAS_SKELETON

I was not really happy with this BR2_PACKAGE_SKELETON_COMMON_ONLY
solution, where skeleton-common is sometimes a provider of the
skeleton virtual package, sometimes not. It feels a bit hackish.

So I've replaced that with what I believe is a simpler and cleaner
solution, even if it requires a little bit more code: I've added a
skeleton-none package. At the point of this commit, it is completely
identical to skeleton-sysv and skeleton-systemd: it does nothing but
depend on skeleton-common. But this way, we have a clean situation
where the skeleton virtual package has four providers: skeleton-none,
skeleton-sysv, skeleton-systemd and skeleton-custom. All of
skeleton-none, skeleton-sysv and skeleton-systemd depend on
skeleton-common.

> +endif
> diff --git a/package/skeleton-common/skeleton-common.mk b/package/skeleton-common/skeleton-common.mk
> index bf75077a85..e9b87c3fd3 100644
> --- a/package/skeleton-common/skeleton-common.mk
> +++ b/package/skeleton-common/skeleton-common.mk
> @@ -11,8 +11,6 @@
>  SKELETON_COMMON_ADD_TOOLCHAIN_DEPENDENCY = NO
>  SKELETON_COMMON_ADD_SKELETON_DEPENDENCY = NO
>  
> -SKELETON_COMMON_PROVIDES = skeleton

Removing this was correct when skeleton-common was *not* a provider of
skeleton (i.e when skeleton-common is a dependency of skeleton-sysv or
skeleton-systemd). But it should have been kept in the
BR2_PACKAGE_SKELETON_COMMON_ONLY, because in this case, skeleton-common
was directly a provider of the skeleton virtual package.

But thanks to the addition of a skeleton-none package, skeleton-common
is really never a provider of skeleton, and therefore removing this
line unconditionally becomes correct.

Hopefully I haven't messed up my change introducing skeleton-none :-)

>  config BR2_ROOTFS_SKELETON_DEFAULT
>  	bool "default target skeleton"
> -	select BR2_PACKAGE_SKELETON_COMMON
> +	select BR2_PACKAGE_SKELETON_SYSV if BR2_INIT_SYSV
> +	select BR2_PACKAGE_SKELETON_SYSV if BR2_INIT_BUSYBOX
> +	select BR2_PACKAGE_SKELETON_SYSTEMD if BR2_INIT_SYSTEMD
> +	select BR2_PACKAGE_SKELETON_COMMON_ONLY if BR2_INIT_NONE

So this last line is now:

	select BR2_PACKAGE_SKELETON_NONE if BR2_INIT_NONE

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
