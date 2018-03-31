From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 31 Mar 2018 14:45:18 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/kodi: add Kconfig options to
 remove default skins
In-Reply-To: <20170429203608.17700-2-bernd.kuhls@t-online.de>
References: <20170429203608.17700-1-bernd.kuhls@t-online.de>
 <20170429203608.17700-2-bernd.kuhls@t-online.de>
Message-ID: <9281b36a-59f8-72fc-6c50-c0b0fd7d11fe@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Bernd,

 Getting back to this very old patch...

On 29-04-17 22:36, Bernd Kuhls wrote:
> The skins estuary and estouchy are new in Kodi 17-Krypton and replace
> the skin confluence, used until Kodi 16-Jarvis.
> 
> This patch allows to disable one or both of the new skins, it also takes
> care that at least one skin needs to be enabled. With this patch Kodi
> can be used only with skin confluence.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[snip]
> diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
> index 0b89bdd86..73e44f861 100644
> --- a/package/kodi/kodi.mk
> +++ b/package/kodi/kodi.mk
> @@ -355,6 +355,64 @@ define KODI_CLEAN_UNUSED_ADDONS
>  endef
>  KODI_POST_INSTALL_TARGET_HOOKS += KODI_CLEAN_UNUSED_ADDONS
>  
> +# Skins estuary and estouchy are installed by default and need to be
> +# removed if they are disabled in buildroot
> +ifeq ($(BR2_PACKAGE_KODI_SKIN_ESTUARY),y)
> +define KODI_CLEAN_SKIN_ESTUARY
> +	find $(TARGET_DIR)/usr/share/kodi/addons/skin.estuary/media -name *.gif -delete
> +	find $(TARGET_DIR)/usr/share/kodi/addons/skin.estuary/media -name *.jpg -delete
> +	find $(TARGET_DIR)/usr/share/kodi/addons/skin.estuary/media -name *.png -delete

 It looks a bit weird that you remove stuff when the skin is enabled, so I think
a comment explaining that is warranted.

> +endef
> +KODI_POST_INSTALL_TARGET_HOOKS += KODI_CLEAN_SKIN_ESTUARY
> +else
> +define KODI_REMOVE_SKIN_ESTUARY
> +	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/skin.estuary
> +	$(HOST_DIR)/usr/bin/xml ed -L \

 We now no longer have the usr/ bit, could you fix that?

> +		-d "/addons/addon[text()='skin.estuary']" \
> +		$(KODI_ADDON_MANIFEST)

 Given that there are now several addons to remove, it might be worthwhile to
factor it:

	rm -Rf $(addprefix $(TARGET_DIR)/usr/share/kodi/addons/,\
		$(KODI_ADDONS_TO_REMOVE))
	$(HOST_DIR)/bin/xml ed -L \
 		$(patsubst %,-d "/addons/addon[text()='%']",$(KODI_ADDONS_TO_REMOVE)) \
		$(KODI_ADDON_MANIFEST)

 Probably for a separate patch though.

> +endef
> +KODI_POST_INSTALL_TARGET_HOOKS += KODI_REMOVE_SKIN_ESTUARY
> +endif
> +
> +ifeq ($(BR2_PACKAGE_KODI_SKIN_ESTOUCHY),y)
> +define KODI_CLEAN_SKIN_ESTOUCHY
> +	find $(TARGET_DIR)/usr/share/kodi/addons/skin.estouchy/media -name *.gif -delete
> +	find $(TARGET_DIR)/usr/share/kodi/addons/skin.estouchy/media -name *.jpg -delete
> +	find $(TARGET_DIR)/usr/share/kodi/addons/skin.estouchy/media -name *.png -delete
> +endef
> +KODI_POST_INSTALL_TARGET_HOOKS += KODI_CLEAN_SKIN_ESTOUCHY
> +else
> +define KODI_REMOVE_SKIN_ESTOUCHY
> +	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/skin.estouchy
> +	$(HOST_DIR)/usr/bin/xml ed -L \
> +		-d "/addons/addon[text()='skin.estouchy']" \
> +		$(KODI_ADDON_MANIFEST)
> +endef
> +KODI_POST_INSTALL_TARGET_HOOKS += KODI_REMOVE_SKIN_ESTOUCHY
> +endif
> +
> +# The default value 'skin.estuary' is stored in
> +# xbmc/system/settings/settings.xml.
> +# If skin estuary is disabled this value needs to be changed to avoid
> +# https://github.com/xbmc/xbmc/blob/32a6916059a0b14ab5fc65cedb17b2615c039918/xbmc/Application.cpp#L1124
> +
> +define KODI_SET_DEFAULT_SKIN_ESTOUCHY

 Conditional hooks are normally put within the ifeq, like you did above.

> +	$(SED) 's/skin.estuary/skin.estouchy/#g' $(TARGET_DIR)/usr/share/kodi/system/settings/settings.xml

 #g? Does that exist? I couldn't find an explanation of the # flag in the sed
documentation [1].

> +endef
> +
> +define KODI_SET_DEFAULT_SKIN_CONFLUENCE
> +	$(SED) 's/skin.estuary/skin.confluence/#g' $(TARGET_DIR)/usr/share/kodi/system/settings/settings.xml
> +	$(HOST_DIR)/usr/bin/xml ed -L -O --subnode "/addons" \
> +		-t elem -n "addon" -v "skin.confluence" \
> +		$(KODI_ADDON_MANIFEST)

 Shouldn't this be added to the manifest regardless of whether it is the default
or not? In that case, it should be part of the kodi-skin-confluence package -
which unfortunately would break check-uniq-files...


 Regards,
 Arnout

[1] https://www.gnu.org/software/sed/manual/html_node/The-_0022s_0022-Command.html

> +endef
> +
> +ifeq ($(BR2_PACKAGE_KODI_SKIN_DEFAULT_ESTOUCHY),y)
> +KODI_POST_INSTALL_TARGET_HOOKS += KODI_SET_DEFAULT_SKIN_ESTOUCHY
> +else ifeq ($(BR2_PACKAGE_KODI_SKIN_DEFAULT_CONFLUENCE),y)
> +KODI_POST_INSTALL_TARGET_HOOKS += KODI_SET_DEFAULT_SKIN_CONFLUENCE
> +endif
> +
>  define KODI_INSTALL_BR_WRAPPER
>  	$(INSTALL) -D -m 0755 package/kodi/br-kodi \
>  		$(TARGET_DIR)/usr/bin/br-kodi
> 



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
