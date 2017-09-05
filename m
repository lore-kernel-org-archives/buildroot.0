From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 21:44:47 +0200
Subject: [Buildroot] [PATCH 1/2] shairport-sync: fix static link with
 mbedtls
In-Reply-To: <87aa32f0dbacc3252ade43fc605e7f2c310e6465.1504638326.git.baruch@tkos.co.il>
References: <87aa32f0dbacc3252ade43fc605e7f2c310e6465.1504638326.git.baruch@tkos.co.il>
Message-ID: <20170905214447.7e75c2da@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  5 Sep 2017 22:05:25 +0300, Baruch Siach wrote:

>  # Avahi or tinysvcmdns (shaiport-sync bundles its own version of tinysvcmdns).
>  # Avahi support needs libavahi-client, which is built by avahi if avahi-daemon
>  # and dbus is selected. Since there is no BR2_PACKAGE_LIBAVAHI_CLIENT config
> @@ -38,6 +40,10 @@ SHAIRPORT_SYNC_CONF_OPTS += --with-ssl=openssl
>  else
>  SHAIRPORT_SYNC_DEPENDENCIES += mbedtls
>  SHAIRPORT_SYNC_CONF_OPTS += --with-ssl=mbedtls
> +SHAIRPORT_SYNC_CONF_LIBS += -lmbedx509 -lmbedcrypto
> +ifeq ($(BR2_PACKAGE_MBEDTLS_COMPRESSION),y)
> +SHAIRPORT_SYNC_CONF_LIBS += -lz
> +endif
>  endif

This is crazy. Can we submit a mbedtls patch adding a pkg-config file ?
They are open to it it seems:
https://github.com/ARMmbed/mbedtls/issues/228. Of course,
shairport-sync would have to be modified to use it.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
