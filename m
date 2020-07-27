From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 23:09:13 +0200
Subject: [Buildroot] [PATCH] package/lz4: simplify build/install logic
In-Reply-To: <20200727162008.14086-1-peter@korsgaard.com>
References: <20200727162008.14086-1-peter@korsgaard.com>
Message-ID: <20200727210913.GP19818@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-07-27 18:20 +0200, Peter Korsgaard spake thusly:
> No functional change.
> 
> Rather than tracking both build targets and sub directory to run 'make
> install' from, use a make loop for the staging/target install logic, similar
> to how we are doing it to for the build step and directly use the Makefile
> in the sub directory rather than the helper lib/lz4 targets in the top level
> Makefile.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/lz4/lz4.mk | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
> index 1cdd39106c..fa309e8dbb 100644
> --- a/package/lz4/lz4.mk
> +++ b/package/lz4/lz4.mk
> @@ -32,29 +32,31 @@ define HOST_LZ4_INSTALL_CMDS
>  		install -C $(@D)
>  endef
>  
> +LZ4_DIRS = lib
> +
>  ifeq ($(BR2_PACKAGE_LZ4_PROGS),y)
> -LZ4_BUILD_TARGETS = lib lz4
> -LZ4_INSTALL_OPTS = install -C $(@D)
> -else
> -LZ4_BUILD_TARGETS = lib
> -LZ4_INSTALL_OPTS = install -C $(@D)/lib
> +LZ4_DIRS += programs
>  endif
>  
>  define LZ4_BUILD_CMDS
> -	$(foreach target,$(LZ4_BUILD_TARGETS),\
> +	$(foreach dir,$(LZ4_DIRS),\
>  		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(LZ4_MAKE_OPTS) \
> -			-C $(@D) $(target)
> +			-C $(@D)/$(dir)
>  	)
>  endef
>  
>  define LZ4_INSTALL_STAGING_CMDS
> -	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(STAGING_DIR) \
> -		PREFIX=/usr $(LZ4_MAKE_OPTS) $(LZ4_INSTALL_OPTS)
> +	$(foreach dir,$(LZ4_DIRS),\
> +		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(STAGING_DIR) \
> +			PREFIX=/usr $(LZ4_MAKE_OPTS) -C $(@D)/$(dir) install
> +	)
>  endef
>  
>  define LZ4_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(TARGET_DIR) \
> -		PREFIX=/usr $(LZ4_MAKE_OPTS) $(LZ4_INSTALL_OPTS)
> +	$(foreach dir,$(LZ4_DIRS),\
> +		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(TARGET_DIR) \
> +			PREFIX=/usr $(LZ4_MAKE_OPTS) -C $(@D)/$(dir) install
> +	)
>  endef
>  
>  $(eval $(generic-package))
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
