From: Sven Neumann <s.neumann@raumfeld.com>
Date: Fri, 28 Sep 2012 09:05:39 +0200
Subject: [Buildroot] [PATCH 2/2] wpa_supplicant: rework .config file
 editing
In-Reply-To: <5064D6CA.7030602@mind.be>
References: <50622890.2000107@mind.be>
 <1348755331-22000-1-git-send-email-s.neumann@raumfeld.com>
 <1348755331-22000-3-git-send-email-s.neumann@raumfeld.com>
 <5064D6CA.7030602@mind.be>
Message-ID: <1348815939.2986.0.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2012-09-28 at 00:44 +0200, Arnout Vandecappelle wrote:
> On 27/09/12 16:15, Sven Neumann wrote:
> > Do all substitutions on the .config file in a single sed command.
> > Make the .config file editing a lot more readable. Based on ideas
> > brought up by Arnout Vandecappelle on the mailing-list.
> >
> > Signed-off-by: Sven Neumann<s.neumann@raumfeld.com>
> [snip]
> >  # Try to use openssl or gnutls if it's already available
> >  ifeq ($(BR2_PACKAGE_OPENSSL),y)
> >  	WPA_SUPPLICANT_DEPENDENCIES += openssl
> > -define WPA_SUPPLICANT_TLS_CONFIG
> > -	$(SED) 's/\(#\)\(CONFIG_TLS=openssl\)/\2/' $(WPA_SUPPLICANT_CONFIG)
> > -	$(SED) 's/\(#\)\(CONFIG_EAP_PWD.*\)/\2/' $(WPA_SUPPLICANT_CONFIG)
> > -endef
> > +	WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
> 
>   The \ in front of # is a leftover from \(.  Same below.

OK, I'll fix that.

> > +	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_EAP_PWD
> >   else
> >   ifeq ($(BR2_PACKAGE_GNUTLS),y)
> >   	WPA_SUPPLICANT_DEPENDENCIES += gnutls
> > -define WPA_SUPPLICANT_TLS_CONFIG
> > -	$(SED) 's/\(#\)\(CONFIG_TLS=\).*/\2gnutls/' $(WPA_SUPPLICANT_CONFIG)
> > -endef
> > +	WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1gnutls/'
> >   else
> > -define WPA_SUPPLICANT_TLS_CONFIG
> > -	$(SED) 's/\(#\)\(CONFIG_TLS=\).*/\2internal/' $(WPA_SUPPLICANT_CONFIG)
> > -endef
> > +	WPA_SUPPLICANT_CONFIG_EDITS += 's/\#\(CONFIG_TLS=\).*/\1internal/'
> >   endif
> >   endif
> >
> > @@ -87,9 +80,7 @@ ifeq ($(BR2_PACKAGE_DBUS),y)
> >   		PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig"
> >
> >   ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DBUS_OLD),y)
> > -define WPA_SUPPLICANT_DBUS_OLD_CONFIG
> > -	$(SED) 's/\(#\)\(CONFIG_CTRL_IFACE_DBUS=\)/\2/' $(WPA_SUPPLICANT_CONFIG)
> > -endef
> > +	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_CTRL_IFACE_DBUS=
> 
>   Why the trailing = ?

So that it doesn't match on CONFIG_CTRL_IFACE_DBUS_NEW.


Thanks for yet another review,
Sven
