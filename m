From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 23:12:44 +0200
Subject: [Buildroot] [PATCH 1/5] nodejs: use the standard configure/make
 options
In-Reply-To: <1397509552-5278-2-git-send-email-s.martin49@gmail.com>
References: <1397509552-5278-1-git-send-email-s.martin49@gmail.com>
 <1397509552-5278-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20140414231244.763b0d3d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Mon, 14 Apr 2014 23:05:48 +0200, Samuel Martin wrote:
> Also cleanup leading whitespace.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/nodejs/nodejs.mk | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index a44bfbd..0d84765 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -23,7 +23,10 @@ define HOST_NODEJS_CONFIGURE_CMDS
>  	# NPM is non-functional without it, and host-openssl isn't part of
>  	# buildroot.
>  	(cd $(@D); \
> -                ./configure \
> +		$(HOST_CONFIGURE_OPTS) \
> +		CFLAGS="$(HOST_CFLAGS)" \
> +		LDFLAGS="$(HOST_LDFLAGS)" \

HOST_CONFIGURE_OPTS already contain CFLAGS and LDFLAGS definitions that
are identical to the explicit ones you're passing. So why are you
passing explicit CFLAGS and LDFLAGS ?

> +		./configure \
>  		--prefix=$(HOST_DIR)/usr \
>  		--without-snapshot \
>  		--without-dtrace \
> @@ -60,6 +63,8 @@ endif
>  define NODEJS_CONFIGURE_CMDS
>  	(cd $(@D); \
>  		$(TARGET_CONFIGURE_OPTS) \
> +		CFLAGS="$(TARGET_CFLAGS)" \
> +		LDFLAGS="$(TARGET_LDFLAGS)" \

Same question here.

>  		LD="$(TARGET_CXX)" \
>  		./configure \
>  		--prefix=/usr \
> @@ -75,7 +80,11 @@ define NODEJS_CONFIGURE_CMDS
>  endef
>  
>  define NODEJS_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		CFLAGS="$(TARGET_CFLAGS)" \
> +		LDFLAGS="$(TARGET_LDFLAGS)" \
> +		LD="$(TARGET_CXX)"

Same question here.

>  endef
>  
>  #
> @@ -107,7 +116,12 @@ endef
>  endif
>  
>  define NODEJS_INSTALL_TARGET_CMDS
> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install \
> +		DESTDIR=$(TARGET_DIR) \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		CFLAGS="$(TARGET_CFLAGS)" \
> +		LDFLAGS="$(TARGET_LDFLAGS)" \
> +		LD="$(TARGET_CXX)"

And here.

>  	$(NODEJS_INSTALL_MODULES)
>  endef
>  

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
