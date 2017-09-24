From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 13:52:38 +0200
Subject: [Buildroot] [PATCH 1/2] shairport-sync: fix static link with
 mbedtls
In-Reply-To: <87aa32f0dbacc3252ade43fc605e7f2c310e6465.1504638326.git.baruch@tkos.co.il>
References: <87aa32f0dbacc3252ade43fc605e7f2c310e6465.1504638326.git.baruch@tkos.co.il>
Message-ID: <908ec92f-0bbc-8d76-b9e0-232c43ec6d6a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-09-17 21:05, Baruch Siach wrote:
> mbedtls provided libraries are interdependent. libmbedtls depends on
> libmbedx509. Both depend on libmbedcrypto. When compression is enabled
> libz is also needed.
> 
> Fixes:
> http://autobuild.buildroot.net/results/79d/79d9aff5edb6a767c38efb54256a4f20fc36a6ee/
> 
> Cc: J?rg Krause <joerg.krause@embedded.rocks>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

 Applied to master, thanks.

 I also double-checked that shairport-sync is the only package that suffers from
this problem. Other packages (e.g. hiawatha, curl, ...) build fine statically.

 Regards,
 Arnout

> ---
>  package/shairport-sync/shairport-sync.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
> index 208a9b3b1e33..75e1ae85e3d2 100644
> --- a/package/shairport-sync/shairport-sync.mk
> +++ b/package/shairport-sync/shairport-sync.mk
> @@ -19,6 +19,8 @@ SHAIRPORT_SYNC_CONF_OPTS = --with-alsa \
>  	--with-pipe \
>  	--with-stdout
>  
> +SHAIRPORT_SYNC_CONF_ENV += LIBS="$(SHAIRPORT_SYNC_CONF_LIBS)"
> +
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
>  
>  ifeq ($(BR2_PACKAGE_SHAIRPORT_SYNC_LIBSOXR),y)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
