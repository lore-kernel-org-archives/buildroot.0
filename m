From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Sep 2012 08:16:45 +0200
Subject: [Buildroot] [PATCH 8/9] firefox: GNU gnash flash plugin needs
 gconf dependency
In-Reply-To: <1346855344-15081-9-git-send-email-stefan.froberg@petroprogram.com>
References: <1346855344-15081-1-git-send-email-stefan.froberg@petroprogram.com>
 <1346855344-15081-9-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <5059634D.8030503@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/05/12 16:29, Stefan Fr?berg wrote:
>
> Signed-off-by: Stefan Fr?berg<stefan.froberg@petroprogram.com>
> ---
>   package/Config.in       |    1 +
>   package/gconf/Config.in |   11 +++++++++++
>   package/gconf/gconf.mk  |   26 ++++++++++++++++++++++++++
>   3 files changed, 38 insertions(+), 0 deletions(-)
>   create mode 100644 package/gconf/Config.in
>   create mode 100644 package/gconf/gconf.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 92c957e..fb4ec28 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -510,6 +510,7 @@ endmenu
>   menu "Miscellaneous"
>   source "package/collectd/Config.in"
>   source "package/empty/Config.in"
> +source "package/gconf/Config.in"
>   source "package/mobile-broadband-provider-info/Config.in"
>   source "package/shared-mime-info/Config.in"
>   source "package/sound-theme-borealis/Config.in"
> diff --git a/package/gconf/Config.in b/package/gconf/Config.in
> new file mode 100644
> index 0000000..770e707
> --- /dev/null
> +++ b/package/gconf/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_GCONF
> +	bool "gconf"
> +	select BR2_PACKAGE_INTLTOOL

  Unlikely. You probably want to depend on host-intltool.

> +	select BR2_PACKAGE_DBUS_GLIB

  This means you also need
	select BR2_PACKAGE_DBUS
	depends on BR2_TOOLCHAIN_HAS_THREADS

...
comment "gconf requires a toolchain with thread support"
	depends on !BR2_TOOLCHAIN_HAS_THREADS


> +	select BR2_PACKAGE_LIBXML2
> +	help
> +	  The GConf package contains a configuration database system used by many GNOME
> +	  applications.

  Word-wrap at 80 columns.

> +
> +	  http://ftp.gnome.org/pub/gnome/sources/GConf/3.2

  Is there no real website to refer to?

> +

  Spurious line at end of file.

> diff --git a/package/gconf/gconf.mk b/package/gconf/gconf.mk
> new file mode 100644
> index 0000000..8eefc05
> --- /dev/null
> +++ b/package/gconf/gconf.mk
> @@ -0,0 +1,26 @@
> +#############################################################
> +#
> +# GConf
> +#
> +#############################################################
> +
> +GCONF_VERSION = 3.2.0
> +GCONF_SOURCE = GConf-$(GCONF_VERSION).tar.xz
> +GCONF_SITE = http://ftp.gnome.org/pub/gnome/sources/GConf/3.2/

  For situations like this, we typically use
GCONF_VERSION_MAJOR = 3.2
GCONF_VERSION       = $(GCONF_VERSION_MAJOR).0
GCONF_SITE          = http://ftp.gnome.org/pub/gnome/sources/GConf/$(GCONF_VERSION_MAJOR)
GCONF_SOURCE        = GConf-$(GCONF_VERSION).tar.xz

  (As an aside: I personally prefer aligning the =, and I find
it more natural to put SOURCE after SITE. But those are not real
buildroot 'rules').

> +GCONF_DEPENDENCIES = dbus-glib intltool libxml2

  host-intltool, most likely.

> +GCONF_INSTALL_STAGING = YES
> +GCONF_CONF_OPT += --sysconfdir=/etc --libexecdir=/usr/lib/GConf --disable-orbit

  --sysconfdir=/etc is already in the standard configure
options.

  For --libexecdir, we usually use /usr/lib without subdirectory.

> +GCONF_LICENSE = GPLv2

  I haven't checked, but I would expect the gnome people to make
it GPLv2+.  Can you verify again?

> +GCONG_LICENSE_FILE = COPYING
> +
> +define GCONF_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +
> +	(cd $(@D); \

  cd is unneeded here.

> +	install -v -m755 -d $(TARGET_DIR)/etc/gconf/gconf.xml.system)

  mkdir -p is better. Though I don't see why you need to create an
empty directory...

  Also, it's better to put this in POST_INSTALL_TARGET_HOOKS,
then you don't have to re-insert the default install commands.

> +
> +endef
> +
> +$(eval $(autotools-package))
> +
> +

  Spurious newlines at end of file.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
