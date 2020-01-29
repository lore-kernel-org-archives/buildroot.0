From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 29 Jan 2020 17:28:09 +0000
Subject: [Buildroot] [PATCH 1/1] package/nodejs: use system-icu for
 host-nodejs when available
In-Reply-To: <20200126075848.66484-1-james.hilliard1@gmail.com>
References: <20200126075848.66484-1-james.hilliard1@gmail.com>
Message-ID: <adc2b97f-5089-8f83-f106-f3fa899f3a1c@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/01/2020 07:58, James Hilliard wrote:
> Fixes:
>  - http://autobuild.buildroot.net/results/1ef947553ec762dba6a6202b1cfc84ceed75dbb2/
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/nodejs/nodejs.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index e6eb73d576..abc868c364 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -65,7 +65,7 @@ define HOST_NODEJS_CONFIGURE_CMDS
>  		--shared-openssl-libpath=$(HOST_DIR)/lib \
>  		--shared-zlib \
>  		--no-cross-compiling \
> -		--with-intl=small-icu \
> +		--with-intl=$(if $(BR2_PACKAGE_ICU),system-icu,small-icu) \
>  	)
>  endef
>  
> @@ -80,6 +80,7 @@ define HOST_NODEJS_BUILD_CMDS
>  	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
>  		$(MAKE) -C $(@D) \
>  		$(HOST_CONFIGURE_OPTS) \
> +		$(if $(BR2_PACKAGE_ICU),CXXFLAGS.target="-DU_DISABLE_RENAMING=1") \
>  		LDFLAGS.host="$(HOST_LDFLAGS)" \
>  		NO_LOAD=cctest.target.mk \
>  		PATH=$(@D)/bin:$(BR_PATH)
> @@ -89,6 +90,7 @@ define HOST_NODEJS_INSTALL_CMDS
>  	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python2 \
>  		$(MAKE) -C $(@D) install \
>  		$(HOST_CONFIGURE_OPTS) \
> +		$(if $(BR2_PACKAGE_ICU),CXXFLAGS.target="-DU_DISABLE_RENAMING=1") \
>  		LDFLAGS.host="$(HOST_LDFLAGS)" \
>  		NO_LOAD=cctest.target.mk \
>  		PATH=$(@D)/bin:$(BR_PATH)
> 


I was actually able to fix this by removing `--shared-zlib`, see below.

commit 8ddaef98e72449c41a3255374a5f61da20a167df
Author: Thomas Preston <thomas.preston@codethink.co.uk>
Date:   Fri Jan 24 13:40:49 2020 +0000

    package/nodejs: Remove --shared-zlib configure arg

    The nodejs configure.py file orders zlib headers before the bundled ICU
    headers. The zlib headers happen to be located in the system include
    directory, next to some system ICU headers (not bundled). If these are
    built before nodejs is, nodejs will get confused and try to use the
    system ICU headers instead of the bundled ones.

    Fix this by removing the --shared-zlib configure argument, since we
    search in the system include directory after bundled ICU headers anyway.

    Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index e6eb73d576..205e8a8bd5 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -63,7 +63,6 @@ define HOST_NODEJS_CONFIGURE_CMDS
                --shared-openssl \
                --shared-openssl-includes=$(HOST_DIR)/include/openssl \
                --shared-openssl-libpath=$(HOST_DIR)/lib \
-               --shared-zlib \
                --no-cross-compiling \
                --with-intl=small-icu \
        )
