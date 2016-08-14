From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 15 Aug 2016 00:09:46 +0200
Subject: [Buildroot] [PATCH] system: sysvinit needs MMU
In-Reply-To: <1471107441-15881-1-git-send-email-yann.morin.1998@free.fr>
References: <1471107441-15881-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20e20bf5-1a43-374a-f2c7-646c6d63a919@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13-08-16 18:57, Yann E. MORIN wrote:
> It uses spawn() and thus fork(), so it needs an MMU.

 spawn() is defined by sysvinit itself, so it doesn't make much sense to mention
that here.

 Otherwise:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> 
> Fixes a build issue reported on IRC for a cortex-m4 build:
>     http://pastebin.com/dGCsy0sr
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/sysvinit/Config.in | 1 +
>  system/Config.in           | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/package/sysvinit/Config.in b/package/sysvinit/Config.in
> index ab67ed6..94f1612 100644
> --- a/package/sysvinit/Config.in
> +++ b/package/sysvinit/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_SYSVINIT
>  	bool "sysvinit"
> +	depends on BR2_USE_MMU # fork()
>  	depends on BR2_INIT_SYSV
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	help
> diff --git a/system/Config.in b/system/Config.in
> index 5855707..353421a 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -106,6 +106,7 @@ config BR2_INIT_BUSYBOX
>  
>  config BR2_INIT_SYSV
>  	bool "systemV"
> +	depends on BR2_USE_MMU # sysvinit
>  	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # sysvinit
>  	select BR2_PACKAGE_INITSCRIPTS
>  	select BR2_PACKAGE_SYSVINIT
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
