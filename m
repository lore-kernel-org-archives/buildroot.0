From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Sep 2012 22:53:53 +0200
Subject: [Buildroot] [PATCH 1/2] pkgconf: new package
In-Reply-To: <1348600115-27059-1-git-send-email-gustavo@zacarias.com.ar>
References: <1348600115-27059-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <506219E1.5070508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/25/12 21:08, Gustavo Zacarias wrote:
> pkgconf is a drop-in replacement for pkg-config that doesn't need
> itself to build and just requires a C89 compiler.
>
> Instead of using a patch for hardcoded sysroot support (as the patch to
> pkg-config does) we instead rely on a wrapper script that takes the
> appropiate action.
>
> Signed-off-by: Gustavo Zacarias<gustavo@zacarias.com.ar>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Minor nits below.

[snip]
> +HOST_PKGCONF_CONF_OPT = \
> +	--with-pkg-config-dir="$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig"

  Since we anyway need a wrapper, wouldn't it be more consistent
to set PKG_CONFIG_PATH there instead?

> +
> +define PKGCONF_LINK_PKGCONFIG
> +	ln -sf pkgconf $(TARGET_DIR)/usr/bin/pkg-config
> +endef

  As long as pkg-config exists, I would wrap this in a
ifeq ($(BR2_PACKAGE_PKG_CONFIG),)


> +
> +define HOST_PKGCONF_INSTALL_WRAPPER
> +	$(INSTALL) -m 0755 -D package/pkgconf/pkg-config.in \
> +		$(HOST_DIR)/usr/bin/pkg-config
> +	$(SED) 's, at HOST_DIR@,$(HOST_DIR),' $(HOST_DIR)/usr/bin/pkg-config
> +	$(SED) 's, at STAGING_DIR@,$(STAGING_DIR),' $(HOST_DIR)/usr/bin/pkg-config
> +endef

  If for whatever reason, host-pkg-config is also built, the script
will be overwritten.  So to be safe, I'd remove host-pkg-config as well
(as a third patch).

> +
> +PKGCONF_POST_INSTALL_TARGET_HOOKS += PKGCONF_LINK_PKGCONFIG
> +HOST_PKGCONF_POST_INSTALL_HOOKS += HOST_PKGCONF_INSTALL_WRAPPER
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> +
> +PKG_CONFIG_HOST_BINARY:=$(HOST_DIR)/usr/bin/pkg-config

  Although this is just copy-pasted from pkg-config.mk, that's no reason
to break the buildroot conventions :-)

PKG_CONFIG_HOST_BINARY = $(HOST_DIR)/usr/bin/pkg-config



  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
