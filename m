From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Aug 2018 23:13:12 +0200
Subject: [Buildroot] [PATCH/next/RFC 1/1] package/nodejs: use
 host-libopenssl
In-Reply-To: <20180819165158.25255-1-bernd.kuhls@t-online.de>
References: <20180819165158.25255-1-bernd.kuhls@t-online.de>
Message-ID: <20180820211312.GL15347@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2018-08-19 18:51 +0200, Bernd Kuhls spake thusly:
> host-nodejs is configured to build openssl by using its included openssl
> source code which is based on openssl 1.0.2. If host-libopenssl was
> already built its header files are being picked up during host-nodejs
> build, this was verified by adding debug code to
> $(HOST_DIR)/include/openssl/opensslv.h.
> 
> This situation was not a problem as long as host-libopenssl was the
> same version than the openssl code included in nodejs.
> 
> Some code in host-nodejs-8.11.4/src/node_crypto.cc is guarded by
> 
> 	#if OPENSSL_VERSION_NUMBER < 0x10100000L
> 
> to be used only with openssl 1.0.x.
> 
> This leads to problems if host-libopenssl 1.1.x was built before. Due
> to the usage of its header files some code in node_crypto.cc is not
> built leading to many linking errors later on, for example:
> 
> node_crypto.cc:(.text+0x1a1): undefined reference to `DH_get0_pqg'
> 
> When the nodejs package originally was added to buildroot back in
> March 2013:
> https://git.buildroot.net/buildroot/commit/?id=b31bc7d4387095091a109eb879464d54d37a5eab
> 
> We did not have a host-libopenssl package back then, it was added one
> month later:
> https://git.buildroot.net/buildroot/commit/?id=7842789cb539b6b64d61b03f5c8dbe6813f01da7
> 
> To fix the problem we use host-libopenssl for host-nodejs.
> By using host-libopenssl the build time of nodejs is reduced by ~15s.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/nodejs/nodejs.mk | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index e2c94ba8db..165f3f109a 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -10,7 +10,7 @@ NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
>  NODEJS_DEPENDENCIES = host-python host-nodejs c-ares \
>  	libhttpparser libuv zlib \
>  	$(call qstrip,$(BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL_DEPS))
> -HOST_NODEJS_DEPENDENCIES = host-python host-zlib
> +HOST_NODEJS_DEPENDENCIES = host-libopenssl host-python host-zlib
>  NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
>  NODEJS_LICENSE_FILES = LICENSE
>  
> @@ -50,10 +50,6 @@ define HOST_NODEJS_CONFIGURE_CMDS
>  	mkdir -p $(@D)/bin
>  	ln -sf $(HOST_DIR)/bin/python2 $(@D)/bin/python
>  
> -	# Build with the static, built-in OpenSSL which is supplied as part of
> -	# the nodejs source distribution.  This is needed on the host because
> -	# NPM is non-functional without it, and host-openssl isn't part of
> -	# buildroot.
>  	(cd $(@D); \
>  		$(HOST_CONFIGURE_OPTS) \
>  		PATH=$(@D)/bin:$(BR_PATH) \
> @@ -63,6 +59,9 @@ define HOST_NODEJS_CONFIGURE_CMDS
>  		--without-snapshot \
>  		--without-dtrace \
>  		--without-etw \
> +		--shared-openssl \
> +		--shared-openssl-includes=$(HOST_DIR)/include/openssl \
> +		--shared-openssl-libpath=$(HOST_DIR)/lib \
>  		--shared-zlib \
>  		--with-intl=none \
>  	)
> -- 
> 2.18.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
