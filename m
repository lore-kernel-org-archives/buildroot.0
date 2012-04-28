From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 28 Apr 2012 17:26:33 +0200
Subject: [Buildroot] [PATCH 1/2] udev: replace UDEV_ALL_EXTRAS with more
	fine-grained options
In-Reply-To: <1334657953-29113-1-git-send-email-s.neumann@raumfeld.com>
References: <1334657953-29113-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <201204281726.34517.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 17 April 2012 12:19:12 Sven Neumann wrote:
> Replace the BR2_PACKAGE_UDEV_ALL_EXTRAS options with a bunch of
> configuration choices that allow more fine-grainded control over
                                                  ^ Spelling

> the features that should be built into udev.
> 
> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
> ---
>  package/udev/Config.in |   39 ++++++++++++++++++++++++++++++---------
>  package/udev/udev.mk   |   41 ++++++++++++++++++++++++++++++-----------
>  2 files changed, 60 insertions(+), 20 deletions(-)
> 
> diff --git a/package/udev/Config.in b/package/udev/Config.in
> index d3244d1..55daa01 100644
> --- a/package/udev/Config.in
> +++ b/package/udev/Config.in
> @@ -15,20 +15,41 @@ config BR2_PACKAGE_UDEV
>  
>  if BR2_PACKAGE_UDEV
>  
> +config BR2_PACKAGE_UDEV_ACL
> +	bool "enable acl permissions"
	select BR2_PACKAGE_ACL

> +	help
> +	  Enable enable local user acl permissions support
> +
> +config BR2_PACKAGE_UDEV_GUDEV
> +	bool "enable GObject libudev support"
	select BR2_PACKAGE_LIBGLIB2

> +	help
> +	  Enable GObject libudev support
> +
> +config BR2_PACKAGE_UDEV_HWDATA
> +	bool "enable hardware data"
	select BR2_PACKAGE_HWDATA

> +	help
> +	  Enable hardware identification and configuration data
> +
> +config BR2_PACKAGE_UDEV_INTROSPECTION
> +	bool "enable GObject introspection"
	select BR2_PACKAGE_LIBGLIB2

 And doesn't this depend on BR2_PACKAGE_UDEV_GUDEV?

> +	help
> +	  Enable GObject introspection support
> +
> +config BR2_PACKAGE_UDEV_KEYMAP
> +	bool "enable keymap fixup"
> +	help
> +	  Enable keymap fixup support
> +
> +config BR2_PACKAGE_UDEV_MTD
> +	bool "enable MTD support"
> +	help
> +	  Enable MTD probe support
> +
>  config BR2_PACKAGE_UDEV_RULES_GEN
>  	bool "enable rules generator"
>  	help
>  	  Enable persistant rules generator
>  
> -config BR2_PACKAGE_UDEV_ALL_EXTRAS
> -	bool "enable all extras"
> -	select BR2_PACKAGE_ACL
> -	select BR2_PACKAGE_HWDATA
> -	select BR2_PACKAGE_LIBGLIB2
> -	help
> -	  Enable all extras with external dependencies like
> -	  libacl, hwdata and libglib2
> -
>  endif
>  
>  comment "udev requires /dev mgmnt set to udev under System configuration"
> diff --git a/package/udev/udev.mk b/package/udev/udev.mk
> index 726aed6..13c0895 100644
> --- a/package/udev/udev.mk
> +++ b/package/udev/udev.mk
> @@ -15,24 +15,43 @@ UDEV_CONF_OPT =			\
>  	--sbindir=/sbin		\
>  	--with-rootlibdir=/lib	\
>  	--libexecdir=/lib	\
> -	--with-usb-ids-path=/usr/share/hwdata/usb.ids	\
> -	--with-pci-ids-path=/usr/share/hwdata/pci.ids	\
>  	--with-firmware-path=/lib/firmware		\
> -	--disable-introspection
> +	--with-usb-ids-path=/usr/share/hwdata/usb.ids	\
> +	--with-pci-ids-path=/usr/share/hwdata/pci.ids

 I guess this reordering of the config options is meaningless?

>  
>  UDEV_DEPENDENCIES = host-gperf host-pkg-config util-linux kmod
>  
> -ifeq ($(BR2_PACKAGE_UDEV_RULES_GEN),y)
> -UDEV_CONF_OPT += --enable-rule_generator
> +ifeq ($(BR2_PACKAGE_UDEV_ACL),y)
> +UDEV_CONF_OPT += --enable-udev_acl
> +UDEV_DEPENDENCIES += acl
 Probably cleaner to explicitly disable it in the else case.

> +endif
> +
> +ifeq ($(BR2_PACKAGE_UDEV_GUDEV),y)
 Probably cleaner to explicitly enable it.

> +UDEV_DEPENDENCIES += libglib2
> +else
> +UDEV_CONF_OPT += --disable-gudev
> +endif
> +
> +ifeq ($(BR2_PACKAGE_UDEV_HWDATA),y)
> +UDEV_DEPENDENCIES += hwdata
 Is there no enable/disable option for this?

>  endif
>  
> -ifeq ($(BR2_PACKAGE_UDEV_ALL_EXTRAS),y)
> -UDEV_DEPENDENCIES += acl hwdata libglib2
> -UDEV_CONF_OPT +=		\
> -	--enable-udev_acl
> +ifeq ($(BR2_PACKAGE_UDEV_INTROSPECTION),y)
> +UDEV_DEPENDENCIES += libglib2
 Probably cleaner to explicitly enable it.

>  else
> -UDEV_CONF_OPT +=		\
> -	--disable-gudev
> +UDEV_CONF_OPT += --disable-introspection
> +endif
> +
> +ifneq ($(BR2_PACKAGE_UDEV_KEYMAP),y)
 Probably cleaner to explicitly enable it.

> +UDEV_CONF_OPT += --disable-keymap
> +endif
> +
> +ifneq ($(BR2_PACKAGE_UDEV_MTD),y)
 Probably cleaner to explicitly enable it.

> +UDEV_CONF_OPT += --disable-mtd_probe
> +endif
> +
> +ifeq ($(BR2_PACKAGE_UDEV_RULES_GEN),y)
 Probably cleaner to explicitly disable it.

> +UDEV_CONF_OPT += --enable-rule_generator
>  endif
>  
>  ifeq ($(BR2_PACKAGE_SYSTEMD),y)
> 

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
