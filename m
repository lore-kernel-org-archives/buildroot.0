From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Jul 2017 15:00:34 +0200
Subject: [Buildroot] [PATCH 1/1] s6-networking: enable SSL if libressl
 is selected
In-Reply-To: <20170723081602.10562-1-eric.le.bihan.dev@free.fr>
References: <20170723081602.10562-1-eric.le.bihan.dev@free.fr>
Message-ID: <8bff027c-d80c-1820-69dc-826ee3edf23e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-07-17 10:16, Eric Le Bihan wrote:
> If LibreSSL is selected, enable the associated backend to build the
> s6-tls* tools.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/s6-networking/s6-networking.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/s6-networking/s6-networking.mk b/package/s6-networking/s6-networking.mk
> index ffaf8bc..6463f5d 100644
> --- a/package/s6-networking/s6-networking.mk
> +++ b/package/s6-networking/s6-networking.mk
> @@ -23,6 +23,11 @@ S6_NETWORKING_CONF_OPTS = \
>  	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
>  	$(SHARED_STATIC_LIBS_OPTS)
>  
> +ifeq ($(BR2_PACKAGE_LIBRESSL),y)
> +S6_NETWORKING_CONF_OPTS += --enable-ssl=libressl

 Does it also support openssl?

 Is there a corresponding --disable-ssl option?

 Regards,
 Arnout

> +S6_NETWORKING_DEPENDENCIES = libressl
> +endif
> +
>  define S6_NETWORKING_CONFIGURE_CMDS
>  	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure $(S6_NETWORKING_CONF_OPTS))
>  endef
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
