From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Sep 2012 00:04:08 +0200
Subject: [Buildroot] [PATCH] wpa-supplicant: add options to enable the
 new DBus interface
In-Reply-To: <1347525267-4536-2-git-send-email-s.neumann@raumfeld.com>
References: <1347525267-4536-1-git-send-email-s.neumann@raumfeld.com>
 <1347525267-4536-2-git-send-email-s.neumann@raumfeld.com>
Message-ID: <5058EFD8.4010809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/13/12 10:34, Sven Neumann wrote:
> Allow to configure the DBus interfaces that the wpa_supplicant
> binary should support (old or new or both). Also allow to
> enable introspection support on the new DBus interface.
>
> Signed-off-by: Sven Neumann<s.neumann@raumfeld.com>

   Since nobody is reviewing it even after your resend, I'll do it.
However, I'm not familiar with wpa_supplicant and I don't have
internet access now, so I may miss some things.

  I have a few comments, but nothing major (the spaces are the
only thing that really have to be fixed). So

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>   package/wpa_supplicant/Config.in         |   19 ++++++++++++++
>   package/wpa_supplicant/wpa_supplicant.mk |   42 ++++++++++++++++++++++++++----
>   2 files changed, 56 insertions(+), 5 deletions(-)
>
> diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
> index d7cefe3..d41913e 100644
> --- a/package/wpa_supplicant/Config.in
> +++ b/package/wpa_supplicant/Config.in
> @@ -30,6 +30,25 @@ config BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT
>   	  (optionally, with WPS); this links in parts of hostapd functionality
>   	  into wpa_supplicant.
>
> +config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD
> +	bool "Enable support for old DBus control interface"
> +        depends on BR2_PACKAGE_DBUS

   Use 1 tab instead of 8 spaces (below as well).

  Also, I think it's better to make this
     select BR2_PACKAGE_DBUS
     depends on BR2_TOOLCHAIN_HAS_THREADS

  Also, since this only installs a .service file, and it used to be
always enabled before, I would make at least one of the two
DBus interfaces enabled by default.

> +	help
> +	  Enable support for old DBus control interface
> +	  (fi.epitest.hostap.WPASupplicant).
> +
> +config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW
> +	bool "Enable support for new DBus control interface"
> +        depends on BR2_PACKAGE_DBUS
> +	help
> +	  Enable support for new DBus control interface (fi.w1.wpa_supplicant1).
> +
> +config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION
> +	bool "Introspection support for new DBus control interface"

  Just write 'Introspection support'. This config will be indented
under the 'new DBus control interface', so that's clear enough.

> +        depends on BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW
> +	help
> +	  Add introspection support for new DBus control interface.
> +
>   config BR2_PACKAGE_WPA_SUPPLICANT_WPS
>   	bool "Enable support for WPS"
>   	help
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index d8c916b..207eec1 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -10,7 +10,8 @@ WPA_SUPPLICANT_LICENSE = GPLv2/BSD-3c
>   WPA_SUPPLICANT_LICENSE_FILES = README
>   WPA_SUPPLICANT_CONFIG = $(WPA_SUPPLICANT_DIR)/wpa_supplicant/.config
>   WPA_SUPPLICANT_SUBDIR = wpa_supplicant
> -WPA_SUPPLICANT_DBUS_SERVICE = fi.epitest.hostap.WPASupplicant
> +WPA_SUPPLICANT_DBUS_OLD_SERVICE = fi.epitest.hostap.WPASupplicant
> +WPA_SUPPLICANT_DBUS_NEW_SERVICE = fi.w1.wpa_supplicant1
>   WPA_SUPPLICANT_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
>   WPA_SUPPLICANT_LDFLAGS = $(TARGET_LDFLAGS)
>
> @@ -84,9 +85,41 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
>   	WPA_SUPPLICANT_MAKE_ENV = \
>   		PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)"	\
>   		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
> -define WPA_SUPPLICANT_DBUS_CONFIG
> +
> +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD),y)
> +define WPA_SUPPLICANT_DBUS_OLD_CONFIG
>   	$(SED) 's/\(#\)\(CONFIG_CTRL_IFACE_DBUS=\)/\2/' $(WPA_SUPPLICANT_CONFIG)

  The \(\) around the # are redundant.

  Since there are a few sed scripts here, it would be nicer to write:

ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD),y)
WPA_SUPPLICANT_CONFIG_EDIT += -e 's/#\(CONFIG_CTRL_IFACE_DBUS=\)/\1/'
define WPA_SUPPLICANT_INSTALL_DBUS_OLD
...
endef
endif

...

ifneq ($(WPA_SUPPLICANT_CONFIG_EDIT),)
define WPA_SUPPLICANT_DBUS_CONFIG
     $(SED) $(WPA_SUPPLICANT_CONFIG_EDIT) $(WPA_SUPPLICANT_CONFIG)
endef
endif



  Regards,
  Arnout

>   endef
> +define WPA_SUPPLICANT_INSTALL_DBUS_OLD
> +	$(INSTALL) -D \
> +	  $(@D)/wpa_supplicant/dbus/$(WPA_SUPPLICANT_DBUS_OLD_SERVICE).service \
> +	  $(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_OLD_SERVICE).service
> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW),y)
> +define WPA_SUPPLICANT_DBUS_NEW_CONFIG
> +	$(SED) 's/\(#\)\(CONFIG_CTRL_IFACE_DBUS_NEW=\)/\2/' $(WPA_SUPPLICANT_CONFIG)
> +endef
> +define WPA_SUPPLICANT_INSTALL_DBUS_NEW
> +	$(INSTALL) -D \
> +	  $(@D)/wpa_supplicant/dbus/$(WPA_SUPPLICANT_DBUS_NEW_SERVICE).service \
> +	  $(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_NEW_SERVICE).service
> +endef
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION),y)
> +define WPA_SUPPLICANT_DBUS_INTROSPECTION_CONFIG
> +	$(SED) 's/\(#\)\(CONFIG_CTRL_IFACE_DBUS_INTRO=\)/\2/' $(WPA_SUPPLICANT_CONFIG)
> +endef
> +endif
> +
> +define WPA_SUPPLICANT_DBUS_CONFIG
> +	$(WPA_SUPPLICANT_DBUS_OLD_CONFIG)
> +	$(WPA_SUPPLICANT_DBUS_NEW_CONFIG)
> +	$(WPA_SUPPLICANT_DBUS_INTROSPECTION_CONFIG)
> +endef
> +
>   endif
>
>   define WPA_SUPPLICANT_CONFIGURE_CMDS
> @@ -131,9 +164,8 @@ define WPA_SUPPLICANT_INSTALL_DBUS
>   	$(INSTALL) -D \
>   	  $(@D)/wpa_supplicant/dbus/dbus-wpa_supplicant.conf \
>   	  $(TARGET_DIR)/etc/dbus-1/system.d/wpa_supplicant.conf
> -	$(INSTALL) -D \
> -	  $(@D)/wpa_supplicant/dbus/$(WPA_SUPPLICANT_DBUS_SERVICE).service \
> -	  $(TARGET_DIR)/usr/share/dbus-1/system-services/$(WPA_SUPPLICANT_DBUS_SERVICE).service
> +	$(WPA_SUPPLICANT_INSTALL_DBUS_OLD)
> +	$(WPA_SUPPLICANT_INSTALL_DBUS_NEW)
>   endef
>   endif
>


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
