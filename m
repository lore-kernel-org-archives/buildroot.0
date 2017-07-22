From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Jul 2017 01:49:58 +0200
Subject: [Buildroot] [PATCH 15/20] package/skeleton: introduce sysv- and
 systemd-specific skeletons
In-Reply-To: <4cba79eb00daaaea1bd8bdb5a49a2aefd39b390d.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <4cba79eb00daaaea1bd8bdb5a49a2aefd39b390d.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <0f62a3f9-76f0-75ed-762b-d5fbae224fad@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-07-17 19:25, Yann E. MORIN wrote:
> Currently, we use the same skeleton for sysv-like init systems and
> systemd, even though systemd has some peculiarities that makes out
                                                                 our
> default skeleton unfit.
> 
> So, we'll need to provide different skeletons (really, only part of it)
> for sysv-like and systemd.
> 
> Introduce two new skeleton packages, aptly named skeleton-sysv and
> skeleton-systemd, one for each, that are both providers of the skeleton
> package, in lieue of the skeleton-common, which is now a simple
> dependency of both the two new skeletons.
> 
> Those packages are empty for now. In followup changes:
>   - sysv-specific stuff will be moved out of skeleton-common and into
>     skeleton-sysv;
>   - systemd-specific stuff will be added to skeleton-systemd.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 But...

[snip]
> +config BR2_PACKAGE_SKELETON_SYSTEMD
> +	bool
> +	select BR2_PACKAGE_HAS_SKELETON
> +	select BR2_PACKAGE_SKELETON_COMMON
> +
> +config BR2_PACKAGE_PROVIDES_SKELETON
> +	default "skeleton-systemd" if BR2_PACKAGE_SKELETON_SYSTEMD

 Again, we usually do it with if...config...endif. Same for sysv, obviously.

[snip]
> @@ -12,7 +12,9 @@ choice
>  config BR2_ROOTFS_SKELETON_DEFAULT
>  	bool "default target skeleton"
>  	depends on !BR2_INIT_NONE
> -	select BR2_PACKAGE_SKELETON_COMMON
> +	select BR2_PACKAGE_SKELETON_SYSV if BR2_INIT_SYSV
> +	select BR2_PACKAGE_SKELETON_SYSV if BR2_INIT_BUSYBOX
> +	select BR2_PACKAGE_SKELETON_SYSTEMD if BR2_INIT_SYSTEMD

 This works, but I'm thinking of an alternative, let's see if it flies:

 Instead of choosing the different skeletons here, we could do it in the select
of BR2_INIT_*. Indeed, you have a skeleton for each init option. Of course, all
the selects there would have to look like

	select BR2_PACKAGE_SKELETON_SYSV if BR2_ROOTFS_SKELETON_DEFAULT


 I'm not entirely sure if it's an improvement, but I have the feeling it's
easier to follow if the different skeleton options are put together with the
different init options.

 Regards,
 Arnout


>  	help
>  	  Use default target skeleton
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
