From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Sep 2012 22:33:20 +0200
Subject: [Buildroot] [PATCH 3/3] wpa_supplicant: introduce macros for
 editing the .config file
In-Reply-To: <1348049503-1469-4-git-send-email-s.neumann@raumfeld.com>
References: <5058EFD8.4010809@mind.be>
 <1348049503-1469-1-git-send-email-s.neumann@raumfeld.com>
 <1348049503-1469-4-git-send-email-s.neumann@raumfeld.com>
Message-ID: <505A2C10.8040407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/19/12 12:11, Sven Neumann wrote:
> Make the substitutions on the .config file more readable by
> introducing macros to enable, disable certain options similar
> to the macros we use for editing KConfig files.
>
> Signed-off-by: Sven Neumann<s.neumann@raumfeld.com>

  Nice!

  Did you use a sed (or editor) regexp to do the substitution?  If yes,
it makes sense to document that regexp in the commit message.  That
helps to review it, and can also be useful for others who are inspired
to do a similar modification.

> ---
>   package/wpa_supplicant/wpa_supplicant.mk |   62 ++++++++++++++++++------------
>   1 file changed, 37 insertions(+), 25 deletions(-)
>
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> index e8d55d3..5337e5f 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -15,49 +15,61 @@ WPA_SUPPLICANT_DBUS_NEW_SERVICE = fi.w1.wpa_supplicant1
>   WPA_SUPPLICANT_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/libnl3/
>   WPA_SUPPLICANT_LDFLAGS = $(TARGET_LDFLAGS)
>
> +define WPA_SUPPLICANT_CONFIG_DISABLE
> +	$(SED) 's/^\($(1).*\)/#\1/' $(WPA_SUPPLICANT_CONFIG)
> +endef
> +
> +define WPA_SUPPLICANT_CONFIG_ENABLE
> +	$(SED) 's/#\($(1).*\)/\1/' $(WPA_SUPPLICANT_CONFIG)
> +endef
> +
> +define WPA_SUPPLICANT_CONFIG_SET
> +	echo '$(1)=y'>>  $(WPA_SUPPLICANT_CONFIG)
> +endef
> +
>   ifeq ($(BR2_PACKAGE_LIBNL),y)
>   	WPA_SUPPLICANT_DEPENDENCIES += libnl
>   define WPA_SUPPLICANT_LIBNL_CONFIG
> -	echo 'CONFIG_LIBNL32=y'>>$(WPA_SUPPLICANT_CONFIG)
> +	$(call WPA_SUPPLICANT_CONFIG_SET,CONFIG_LIBNL32)
>   endef
>   else
>   define WPA_SUPPLICANT_LIBNL_CONFIG
> -	$(SED) 's/^\(CONFIG_DRIVER_NL80211.*\)/#\1/' $(WPA_SUPPLICANT_CONFIG)
> +	$(call WPA_SUPPLICANT_CONFIG_DISABLE,CONFIG_DRIVER_NL80211)
>   endef
>   endif

  While you're at it, I'd like to avoid calling sed dozens of times,
by writing it like this:

----
WPA_SUPPLICANT_CONFIG_DISABLE = -e 's/^\($(1).*\)/#\1/'
WPA_SUPPLICANT_CONFIG_ENABLE  = -e 's/#\($(1).*\)/\1/'
WPA_SUPPLICANT_CONFIG_SET     = -e '1i$(1)=y'

ifeq ($(BR2_PACKAGE_LIBNL),y)
WPA_SUPPLICANT_DEPENDENCIES += libnl
WPA_SUPPLICANT_CONFIG_EDITS += $(call WPA_SUPPLICANT_CONFIG_SET,CONFIG_LIBNL32)
else
WPA_SUPPLICANT_CONFIG_EDITS += $(call WPA_SUPPLICANT_CONFIG_DISABLE,CONFIG_LIBNL32)
endif

...

define WPA_SUPPLICANT_CONFIGURE_CMDS
	cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
	$(SED) $(WPA_SUPPLICANT_CONFIG_EDITS) $(WPA_SUPPLICANT_CONFIG)
endef
----


  Of course, using 'sed 1i...' instead of 'echo ... >>' means those options
will be at the beginning rather than at the end, but I don't think that
should make a difference.


  I just love hacking make, so here's another alternative:

----
ifeq ($(BR2_PACKAGE_LIBNL),y)
WPA_SUPPLICANT_DEPENDENCIES += libnl
WPA_SUPPLICANT_CONFIG_SET += CONFIG_LIBNL32
else
WPA_SUPPLICANT_CONFIG_DISABLE += CONFIG_LIBNL32
endif

...

define WPA_SUPPLICANT_CONFIGURE_CMDS
	cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
	$(SED) $(patsubst %,-e 's/^\(%\)/#\1/',$(WPA_SUPPLICANT_CONFIG_DISABLE)) \
	       $(patsubst %,-e 's/^#\(%\)/\1/',$(WPA_SUPPLICANT_CONFIG_ENABLE)) \
	       $(patsubst %,-e '1i%=y',$(WPA_SUPPLICANT_CONFIG_SET)) \
	       $(WPA_SUPPLICANT_CONFIG)
endef
----


  Regards,
  Arnout

[snip]
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
