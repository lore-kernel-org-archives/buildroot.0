From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 25 Feb 2014 21:15:40 +0100
Subject: [Buildroot] [PATCH] wpa_supplicant: rework .config file editing
In-Reply-To: <CAAXf6LU+cHz3JFQc_5Sor5qy0RUO+LvU3E5p=E8YiW5R6Ue53g@mail.gmail.com>
References: <1391524759-3371-1-git-send-email-s.martin49@gmail.com>
 <CAAXf6LU+cHz3JFQc_5Sor5qy0RUO+LvU3E5p=E8YiW5R6Ue53g@mail.gmail.com>
Message-ID: <CAHXCMM+mxt+bQHFL_jKJ7bwTcsAhzxY8bFCuLyM5z+Z4r=+tOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ping?

On Wed, Feb 5, 2014 at 12:49 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> On Tue, Feb 4, 2014 at 3:39 PM, Samuel Martin <s.martin49@gmail.com> wrote:
>> From: Sven Neumann <s.neumann@raumfeld.com>
>>
>> Do all substitutions on the .config file in a single sed command.
>> Make the .config file editing a lot more readable. Based on ideas
>> brought up by Arnout Vandecappelle on the mailing-list.
>>
>> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>>  (build-test with all features enabled)
>> [Samuel: rebase on head of master]
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> ---
>>  package/wpa_supplicant/wpa_supplicant.mk | 109 ++++++++++++-------------------
>>  1 file changed, 40 insertions(+), 69 deletions(-)
>>
>> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
>> index 920f96a..d2b21c2 100644
>> --- a/package/wpa_supplicant/wpa_supplicant.mk
>> +++ b/package/wpa_supplicant/wpa_supplicant.mk
>> @@ -15,63 +15,57 @@ WPA_SUPPLICANT_DBUS_NEW_SERVICE = fi.w1.wpa_supplicant1
>>  WPA_SUPPLICANT_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
>>  WPA_SUPPLICANT_LDFLAGS = $(TARGET_LDFLAGS)
>>
>> +WPA_SUPPLICANT_CONFIG_EDITS =
>> +
>> +WPA_SUPPLICANT_CONFIG_SET =
>> +
>> +WPA_SUPPLICANT_CONFIG_ENABLE = \
>> +       CONFIG_IEEE80211N       \
>> +       CONFIG_IEEE80211R       \
>> +       CONFIG_INTERWORKING     \
>> +       CONFIG_DELAYED_MIC      \
>> +       CONFIG_INTERNAL_LIBTOMMATH
>> +
>> +WPA_SUPPLICANT_CONFIG_DISABLE = \
>> +       CONFIG_DRIVER_ATMEL     \
>> +       CONFIG_SMARTCARD
>> +
>>  ifeq ($(BR2_PACKAGE_LIBNL),y)
>>         WPA_SUPPLICANT_DEPENDENCIES += libnl
>> -define WPA_SUPPLICANT_LIBNL_CONFIG
>> -       echo 'CONFIG_LIBNL32=y' >>$(WPA_SUPPLICANT_CONFIG)
>> -endef
>> +       WPA_SUPPLICANT_CONFIG_SET += CONFIG_LIBNL32
>>  else
>> -define WPA_SUPPLICANT_LIBNL_CONFIG
>> -       $(SED) 's/^\(CONFIG_DRIVER_NL80211.*\)/#\1/' $(WPA_SUPPLICANT_CONFIG)
>> -endef
>> +       WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_DRIVER_NL80211
>>  endif
>>
>>  ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_EAP),y)
>> -define WPA_SUPPLICANT_EAP_CONFIG
>> -       $(SED) 's/\(#\)\(CONFIG_EAP_AKA.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
>> -       $(SED) 's/\(#\)\(CONFIG_EAP_FAST.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
>> -       $(SED) 's/\(#\)\(CONFIG_EAP_GPSK.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
>> -       $(SED) 's/\(#\)\(CONFIG_EAP_IKEV2.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
>> -       $(SED) 's/\(#\)\(CONFIG_EAP_PAX.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
>> -       $(SED) 's/\(#\)\(CONFIG_EAP_PSK.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
>> -       $(SED) 's/\(#\)\(CONFIG_EAP_SAKE.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
>> -       $(SED) 's/\(#\)\(CONFIG_EAP_SIM.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
>> -       $(SED) 's/\(#\)\(CONFIG_EAP_TNC.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
>> -       $(SED) 's/\(#\)\(CONFIG_TLSV1.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
>> -endef
>> +       WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_EAP_AKA          \
>> +                                       CONFIG_EAP_FAST         \
>> +                                       CONFIG_EAP_GPSK         \
>> +                                       CONFIG_EAP_IKEV2        \
>> +                                       CONFIG_EAP_PAX          \
>> +                                       CONFIG_EAP_PSK          \
>> +                                       CONFIG_EAP_SAKE         \
>> +                                       CONFIG_EAP_SIM          \
>> +                                       CONFIG_EAP_TNC
>>  else
>> -define WPA_SUPPLICANT_EAP_CONFIG
>> -       $(SED) 's/^\(CONFIG_EAP.*\)/#\1/' $(WPA_SUPPLICANT_CONFIG)
>> -endef
>> +       WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_EAP
>>  endif
>>
>>  ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT),y)
>> -define WPA_SUPPLICANT_AP_CONFIG
>> -       echo 'CONFIG_AP=y' >>$(WPA_SUPPLICANT_CONFIG)
>> -endef
>> +       WPA_SUPPLICANT_CONFIG_SET += CONFIG_AP
>>  endif
>>
>>  ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPS),y)
>> -define WPA_SUPPLICANT_WPS_CONFIG
>> -       $(SED) 's/\(#\)\(CONFIG_WPS.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
>> -endef
>> +       WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_WPS
>>  endif
>>
>> -define WPA_SUPPLICANT_LIBTOMMATH_CONFIG
>> -       $(SED) 's/\(#\)\(CONFIG_INTERNAL_LIBTOMMATH.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
>> -endef
>> -
>>  # Try to use openssl if it's already available
>>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>>         WPA_SUPPLICANT_DEPENDENCIES += openssl
>> -define WPA_SUPPLICANT_TLS_CONFIG
>> -       $(SED) 's/\(#\)\(CONFIG_TLS=openssl\)/\2/' $(WPA_SUPPLICANT_CONFIG)
>> -       $(SED) 's/\(#\)\(CONFIG_EAP_PWD.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
>> -endef
>> +       WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
>> +       WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_EAP_PWD
>>  else
>> -define WPA_SUPPLICANT_TLS_CONFIG
>> -       $(SED) 's/\(#\)\(CONFIG_TLS=\).*/\2internal/' $(WPA_SUPPLICANT_CONFIG)
>> -endef
>> +       WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
>>  endif
>>
>>  ifeq ($(BR2_PACKAGE_DBUS),y)
>> @@ -81,9 +75,7 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
>>                 PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
>>
>>  ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD),y)
>> -define WPA_SUPPLICANT_DBUS_OLD_CONFIG
>> -       $(SED) 's/\(#\)\(CONFIG_CTRL_IFACE_DBUS=\)/\2/' $(WPA_SUPPLICANT_CONFIG)
>> -endef
>> +       WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_CTRL_IFACE_DBUS=
>>  define WPA_SUPPLICANT_INSTALL_DBUS_OLD
>>         $(INSTALL) -D \
>>           $(@D)/wpa_supplicant/dbus/$(WPA_SUPPLICANT_DBUS_OLD_SERVICE).service \
>> @@ -92,9 +84,7 @@ endef
>>  endif
>>
>>  ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_NEW),y)
>> -define WPA_SUPPLICANT_DBUS_NEW_CONFIG
>> -       $(SED) 's/\(#\)\(CONFIG_CTRL_IFACE_DBUS_NEW=\)/\2/' $(WPA_SUPPLICANT_CONFIG)
>> -endef
>> +       WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_CTRL_IFACE_DBUS_NEW
>>  define WPA_SUPPLICANT_INSTALL_DBUS_NEW
>>         $(INSTALL) -D \
>>           $(@D)/wpa_supplicant/dbus/$(WPA_SUPPLICANT_DBUS_NEW_SERVICE).service \
>> @@ -103,17 +93,9 @@ endef
>>  endif
>>
>>  ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION),y)
>> -define WPA_SUPPLICANT_DBUS_INTROSPECTION_CONFIG
>> -       $(SED) 's/\(#\)\(CONFIG_CTRL_IFACE_DBUS_INTRO=\)/\2/' $(WPA_SUPPLICANT_CONFIG)
>> -endef
>> +       WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_CTRL_IFACE_DBUS_INTRO
>>  endif
>>
>> -define WPA_SUPPLICANT_DBUS_CONFIG
>> -       $(WPA_SUPPLICANT_DBUS_OLD_CONFIG)
>> -       $(WPA_SUPPLICANT_DBUS_NEW_CONFIG)
>> -       $(WPA_SUPPLICANT_DBUS_INTROSPECTION_CONFIG)
>> -endef
>> -
>>  endif
>>
>>  ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG),y)
>> @@ -124,22 +106,11 @@ endif
>>
>>  define WPA_SUPPLICANT_CONFIGURE_CMDS
>>         cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
>> -       $(SED) 's/\(#\)\(CONFIG_HS20.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
>> -       $(SED) 's/\(#\)\(CONFIG_IEEE80211N.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
>> -       $(SED) 's/\(#\)\(CONFIG_IEEE80211R.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
>> -       $(SED) 's/\(#\)\(CONFIG_IEEE80211W.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
>> -       $(SED) 's/\(#\)\(CONFIG_INTERWORKING.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
>> -       $(SED) 's/\(#\)\(CONFIG_DELAYED_MIC.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
>> -       $(SED) 's/\(CONFIG_DRIVER_ATMEL\)/#\1/' $(WPA_SUPPLICANT_CONFIG)
>> -       $(SED) 's/\(CONFIG_SMARTCARD\)/#\1/' $(WPA_SUPPLICANT_CONFIG)
>> -       $(WPA_SUPPLICANT_LIBTOMMATH_CONFIG)
>> -       $(WPA_SUPPLICANT_TLS_CONFIG)
>> -       $(WPA_SUPPLICANT_EAP_CONFIG)
>> -       $(WPA_SUPPLICANT_WPS_CONFIG)
>> -       $(WPA_SUPPLICANT_LIBNL_CONFIG)
>> -       $(WPA_SUPPLICANT_DBUS_CONFIG)
>> -       $(WPA_SUPPLICANT_AP_CONFIG)
>> -       $(WPA_SUPPLICANT_DEBUG_CONFIG)
>> +       sed -i $(patsubst %,-e 's/^\(%\)/#\1/',$(WPA_SUPPLICANT_CONFIG_DISABLE)) \
>> +              $(patsubst %,-e 's/^#\(%\)/\1/',$(WPA_SUPPLICANT_CONFIG_ENABLE)) \
>> +              $(patsubst %,-e '1i%=y',$(WPA_SUPPLICANT_CONFIG_SET)) \
>> +              $(patsubst %,-e %,$(WPA_SUPPLICANT_CONFIG_EDITS)) \
>> +              $(WPA_SUPPLICANT_CONFIG)
>>  endef
>>
>>  define WPA_SUPPLICANT_BUILD_CMDS
>> --
>> 1.8.5.3
>
> Note: this patch has been part of Patchwork cleanup #4, and therefore
> deserves priority :)
>
> Best regards,
> Thomas



-- 
Samuel
