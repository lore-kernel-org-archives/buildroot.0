From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Feb 2020 09:10:41 +0100
Subject: [Buildroot] [PATCH] package/lvm2: lvmetad systemd integration
In-Reply-To: <20200227074651.21424-1-p.debruijn@unilogic.nl>
References: <20200227074651.21424-1-p.debruijn@unilogic.nl>
Message-ID: <20200227091041.19cc911f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Pascal,

On Thu, 27 Feb 2020 08:46:51 +0100
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> lvmetad is usually combined with event-based system services that
> automatically run pvscan --cache on disks added or removed.  This
> way, the cache is automatically updated with metadata from new disks
> when they appear.  LVM udev rules and systemd services implement this
> automation.  Automatic scanning is usually combined with automatic
> activation.  For more information, see pvscan(8).
> 
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  package/lvm2/Config.in | 3 +++
>  package/lvm2/lvm2.mk   | 5 +++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
> index de5b972e99..a828c31714 100644
> --- a/package/lvm2/Config.in
> +++ b/package/lvm2/Config.in
> @@ -44,6 +44,9 @@ config BR2_PACKAGE_LVM2_APP_LIBRARY
>  	help
>  	  Install application library (liblvm2app).
>  
> +	  Enable this if you need systemd integration,
> +	  like automatic activation of LVM logical volumes.
> +
>  comment "lvm2 application library needs a glibc or uClibc toolchain"
>  	depends on BR2_TOOLCHAIN_USES_MUSL
>  
> diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
> index 43370b03bf..1c3ff564b3 100644
> --- a/package/lvm2/lvm2.mk
> +++ b/package/lvm2/lvm2.mk
> @@ -54,6 +54,11 @@ else
>  LVM2_CONF_OPTS += --disable-applib
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LVM2_APP_LIBRARY)$(BR2_PACKAGE_SYSTEMD),yy)
> +LVM2_CONF_OPTS += --enable-lvmetad
> +LVM2_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install install_systemd_units install_systemd_generators

Looking at the install_systemd_units target, it does install much more
than just a unit file for lvmetad.

So I think the two things should be decoupled:

 (1) When systemd is enabled, use install_systemd_units and
     install_systemd_generators.

 (2) Have an additional Config.in option to enable/disable the build of
     lvmetad

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
