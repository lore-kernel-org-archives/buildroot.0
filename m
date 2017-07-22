From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 22 Jul 2017 15:28:35 +0200
Subject: [Buildroot] [PATCH 08/20] system: with no init system,
 only allow custom skeleton
In-Reply-To: <005008f3ac1cdbd8de65006d578d43c555355d0f.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <005008f3ac1cdbd8de65006d578d43c555355d0f.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <3bd7e441-4317-20f9-9e7f-9a06168ced61@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-07-17 19:25, Yann E. MORIN wrote:
> When there is no init system (i.e. a custom one), our bundled default
> skeleton is most probably un-fit for that (non-)init system.
> 
> This will be the case when we introduce per init system skeletons. The
> systemd skeleton will be unfit except for a systemd init; the sysv
> skeleton will be unfit except for a sysv-like init system.
> 
> In case they are using no init system (really, a custom one), the user
> should be responsible for providing their own, custom skeleton as well.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 NACK on this one. Our skeleton (as in, the contents of system/skeleton) is
already init-agnostic. If you use another init system (shell script, or no init
at all because you just use it as a chroot, or whatever), you will *still* need
that skelecton. Indeed, the skeleton contains things like the /sys and /dev
directories, a passwd file, ....

 If there are things in that skeleton that you don't need for a custom init
system, then they probably shouldn't even be in the skeleton.

 Regards,
 Arnout

> ---
>  system/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/system/Config.in b/system/Config.in
> index 828df4217e..ed539dcbe0 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -3,11 +3,17 @@ menu "System configuration"
>  choice
>  	prompt "Root FS skeleton"
>  
> +# When not using an init system (i.e. a custom one), our default skeleton
> +# is most probably unfit; so, allow only the custom skeleton in that case.
>  config BR2_ROOTFS_SKELETON_DEFAULT
>  	bool "default target skeleton"
> +	depends on !BR2_INIT_NONE
>  	help
>  	  Use default target skeleton
>  
> +comment "default target skeleton needs an init system"
> +	depends on BR2_INIT_NONE
> +
>  config BR2_ROOTFS_SKELETON_CUSTOM
>  	bool "custom target skeleton"
>  	help
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
