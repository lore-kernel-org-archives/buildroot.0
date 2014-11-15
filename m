From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Sat, 15 Nov 2014 20:58:05 +0100
Subject: [Buildroot] [git commit] nodejs: disable ssl2 and ssl3 when
 openssl is not built
In-Reply-To: <20141111205928.DE2F7B3FF0@busybox.osuosl.org>
References: <20141111205928.DE2F7B3FF0@busybox.osuosl.org>
Message-ID: <1416081485.2386.21.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Di, 2014-11-11 at 21:41 +0100, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=e712638b4adc6e18b3ce99ab37b94530e9aa786f
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> The nodejs version 0.10.33 is compiled with SSLv2 and SSLv3 protocol
> support by default so it fails to build if the package openssl was not
> built.
> 
> To fix this build failure disable SSLv2 and SSLv3 protcol suppport if
> the openssl package is not built.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/e1fb34818ff1167aa008b4011befb9fd14c81293
>   http://autobuild.buildroot.net/results/8b72b0c311f2f7f7430aca5f7cca1f7d82d1c213
>   http://autobuild.buildroot.net/results/e5f87dc635e0e6a6d1cc234529a433e12d810097
>   http://autobuild.buildroot.net/results/3c4a5be556cfbd0d0e632757887ebc2f1de64bba
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/nodejs/nodejs.mk |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 312aaa9..32e19b7 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -75,7 +75,8 @@ define NODEJS_CONFIGURE_CMDS
>  		--prefix=/usr \
>  		--without-snapshot \
>  		--shared-zlib \
> -		$(if $(BR2_PACKAGE_OPENSSL),--shared-openssl,--without-ssl) \
> +		$(if $(BR2_PACKAGE_OPENSSL),--shared-openssl,\
> +			--without-ssl --without-ssl2 --without-ssl3) \
>  		$(if $(BR2_PACKAGE_NODEJS_NPM),,--without-npm) \
>  		--without-dtrace \
>  		--without-etw \

The build failure is not fixed by this patch:
http://autobuild.buildroot.net/results/0bf/0bf17bf710db051d491123482c90f2f72810804b/

Actual this patch does nothing since --without-ssl2 and --without-ssl3
are only evaluated if --without-ssl is not set:

# cat configure
        [snip]
        def configure_openssl(o):
          o['variables']['node_use_openssl'] = b(not
        options.without_ssl)
          o['variables']['node_shared_openssl'] =
        b(options.shared_openssl)
          o['variables']['openssl_no_asm'] = (
            1 if options.openssl_no_asm else 0)
        
          if options.without_ssl:
            return
        
          if options.ssl2:
            o['defines'] += ['OPENSSL_NO_SSL2=1']
        
          if options.ssl3:
            o['defines'] += ['OPENSSL_NO_SSL3=1']
        [snip]

The build failure is caused by a bug in src/node.cc which makes it
impossible to build nodejs without ssl support.

So this leaves us with the option to enable ssl support for nodejs, and
just disable ssl2 and ssl3, eg.:
$(if $(BR2_PACKAGE_OPENSSL),--shared-openssl,--without-ssl2
--without-ssl3).

I think it is even a good idea to enable ssl by default for nodejs.
