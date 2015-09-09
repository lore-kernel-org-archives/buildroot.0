From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Sep 2015 11:40:32 +0200
Subject: [Buildroot] [RFC 2/6] system: clarify /dev management using
 devtmpfs + {mdev, eudev}
In-Reply-To: <1441747734-18730-3-git-send-email-luca@lucaceresoli.net>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-3-git-send-email-luca@lucaceresoli.net>
Message-ID: <55EFFE90.8090200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08-09-15 23:28, Luca Ceresoli wrote:
> We're going to introduce /dev management with mdev only (no devtmpfs),
> which will be called "Dynamic using mdev only".
> 
> In preparation to that addition, clarify the current /dev managements
> systems which use devtmpfs with an additional tool. Otherwise
> "Dynamic using mdev" and "Dynamic using mdev only" wight look quite
> undistinguishable to mortals...

 I would squash the change to the manual with patch 5/6 and squash the changes
to the Config.in prompts into patch 3/6, since these changes are related.

 But the updated text looks good to me, so:
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Oh, perhaps you could add a brief help text to the choice options? You can more
or less copy and paste the text from the manual. If you do add help text, do it
as a separate patch at the end of the series so it doesn't have to be updated
again after the introduction of mdev-only.


 Regards,
 Arnout

> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  docs/manual/configure.txt | 7 ++++---
>  system/Config.in          | 4 ++--
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
> index dd34eef..997be2b 100644
> --- a/docs/manual/configure.txt
> +++ b/docs/manual/configure.txt
> @@ -295,7 +295,7 @@ different solutions to handle the +/dev+ directory :
>     responsibility to enable those two options (if you fail to do so,
>     your Buildroot system will not boot).
>  
> - * The third solution is *Dynamic using mdev*. This method also relies
> + * The third solution is *Dynamic using devtmpfs + mdev*. This method also relies
>     on the _devtmpfs_ virtual filesystem detailed above (so the
>     requirement to have +CONFIG_DEVTMPFS+ and +CONFIG_DEVTMPFS_MOUNT+
>     enabled in the kernel configuration still apply), but adds the
> @@ -314,7 +314,7 @@ different solutions to handle the +/dev+ directory :
>     about +mdev+ and the syntax of its configuration file, see
>     http://git.busybox.net/busybox/tree/docs/mdev.txt.
>  
> - * The fourth solution is *Dynamic using eudev*. This method also
> + * The fourth solution is *Dynamic using devtmpfs + eudev*. This method also
>     relies on the _devtmpfs_ virtual filesystem detailed above, but
>     adds the +eudev+ userspace daemon on top of it. +eudev+ is a daemon
>     that runs in the background, and gets called by the kernel when a
> @@ -327,7 +327,8 @@ different solutions to handle the +/dev+ directory :
>  The Buildroot developers recommendation is to start with the *Dynamic
>  using devtmpfs only* solution, until you have the need for userspace
>  to be notified when devices are added/removed, or if firmwares are
> -needed, in which case *Dynamic using mdev* is usually a good solution.
> +needed, in which case *Dynamic using devtmpfs + mdev* is usually a
> +good solution.
>  
>  Note that if +systemd+ is chosen as init system, /dev management will
>  be performed by the +udev+ program provided by +systemd+.
> diff --git a/system/Config.in b/system/Config.in
> index fad829d..5bf5048 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -110,11 +110,11 @@ config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS
>  	bool "Dynamic using devtmpfs only"
>  
>  config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV
> -	bool "Dynamic using mdev"
> +	bool "Dynamic using devtmpfs + mdev"
>  	select BR2_PACKAGE_BUSYBOX
>  
>  config BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
> -	bool "Dynamic using eudev"
> +	bool "Dynamic using devtmpfs + eudev"
>  	depends on BR2_USE_WCHAR
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_USE_MMU # eudev
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
