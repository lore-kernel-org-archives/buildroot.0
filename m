From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Jul 2017 02:19:55 +0200
Subject: [Buildroot] [PATCH 01/14 v4] system: with no init system,
 only allow custom skeleton
In-Reply-To: <291153589ecb2247033d5b23ae6bc9b852eef7f3.1501017251.git.yann.morin.1998@free.fr>
References: <cover.1501017251.git.yann.morin.1998@free.fr>
 <291153589ecb2247033d5b23ae6bc9b852eef7f3.1501017251.git.yann.morin.1998@free.fr>
Message-ID: <54457986-8fca-7e1f-6569-ab7689509d15@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-07-17 23:14, Yann E. MORIN wrote:
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
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 There is actually a problem with this one. A lot of our tests in
support/testing, as well as the test-pkg script and the autobuilders, will build
with BR2_INIT_NONE=y but without specifying a custom skeleton. That makes this
series essentially non-bisectable.

 Thomas, Peter, how bad a problem do you think this is?

 Yann, how bad would it be to rebase the series without this patch? At first
sight, up to patch 7 should be independent of it...

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
