From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Mar 2017 17:30:50 +0100
Subject: [Buildroot] [PATCH] polarssl: remove unmaintained
In-Reply-To: <20170316130434.26287-1-gustavo@zacarias.com.ar>
References: <20170316130434.26287-1-gustavo@zacarias.com.ar>
Message-ID: <67b7cab9-ede2-3d37-04db-6d6411df94d5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 16-03-17 14:04, Gustavo Zacarias wrote:
> The 1.2.x branch is no longer maintained, so remove it since it's
> likely security-vulnerable.
> 
> mbedtls is the modern replacement which was renamed from polarssl when
> ARM bought them up.
> However major releases broke API so polarssl 1.2.x isn't always
> interchangeable with polarssl/mbedtls 1.3.x (interim mixed naming
> because of new ownership) or newer 2.x series.
> 
> Fortunately we don't have any package in the tree that uses polarssl
> exclusively.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

 Two nits below, with that:
 Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 First, Thomas is still mentioned in the DEVELOPERS file.

 Second...

[snip]
> diff --git a/package/bctoolbox/bctoolbox.mk b/package/bctoolbox/bctoolbox.mk
> index 7826975..f19f36e 100644
> --- a/package/bctoolbox/bctoolbox.mk
> +++ b/package/bctoolbox/bctoolbox.mk
> @@ -13,6 +13,7 @@ BCTOOLBOX_INSTALL_STAGING = YES
>  # Set CMAKE_SKIP_RPATH to prevent bctoolbox from adding the rpath to
>  # shared library.
>  BCTOOLBOX_CONF_OPTS = \
> +	-DENABLE_POLARSSL=OFF \
>  	-DENABLE_STRICT=OFF \
>  	-DENABLE_TESTS_COMPONENT=OFF \
>  	-DENABLE_TESTS=OFF \
> @@ -28,13 +29,6 @@ else
>  BCTOOLBOX_CONF_OPTS += -DENABLE_MBEDTLS=OFF
>  endif

 There's a comment above this chunk saying that we prefer mbedtls over polarssl.
That is no longer relevant and can be removed completely.

 Regards,
 Arnout

>  
> -ifeq ($(BR2_PACKAGE_POLARSSL),y)
> -BCTOOLBOX_DEPENDENCIES += polarssl
> -BCTOOLBOX_CONF_OPTS += -DENABLE_POLARSSL=ON
> -else
> -BCTOOLBOX_CONF_OPTS += -DENABLE_POLARSSL=OFF
> -endif
> -
>  ifeq ($(BR2_STATIC_LIBS),y)
>  BCTOOLBOX_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
>  else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
