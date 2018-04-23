From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Apr 2018 10:08:49 +0200
Subject: [Buildroot] [PATCH v3 5/6] zstd: add libzstd support
In-Reply-To: <20180416193953.19924-5-ps.report@gmx.net>
References: <20180416193953.19924-1-ps.report@gmx.net>
 <20180416193953.19924-5-ps.report@gmx.net>
Message-ID: <20180423080849.GM12688@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-04-16 21:39 +0200, Peter Seiderer spake thusly:
> Add patch to split libzstd install target into pc, static, shared
> and includes target. Call only the needed ones for the buildroot
> staging/target install steps (respect the static/shared configuration).
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[--SNIP--]
> diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
> index 98f8f779aa..6be36cf398 100644
> --- a/package/zstd/zstd.mk
> +++ b/package/zstd/zstd.mk
[--SNIP--]
> @@ -36,15 +37,60 @@ else
>  ZSTD_OPTS += HAVE_LZ4=0
>  endif
>  
> +ifeq ($(BR2_STATIC_LIBS),y)
>  define ZSTD_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> +		-C $(@D)/lib libzstd.a
>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
>  		-C $(@D) zstd
>  endef
> +else ifeq ($(BR2_SHARED_LIBS),y)
> +define ZSTD_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> +		-C $(@D)/lib libzstd
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> +		-C $(@D) zstd
> +endef
> +else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +define ZSTD_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> +		-C $(@D) lib zstd
> +endef
> +endif

I don't like much that we redefine the BUILD_CMDS, INSTALL_TARGET_CMDS,
and INSTALL_STAGING_CMDS multiple times under various conditions. When
we have that situation, we tend to define additional macros, like so:

ifeq ($(BR2_STATIC_LIBS),y)
ZSTD_BUILD_LIBS = libzstd.a
ZSTD_INSTALL_LIBS = install-static
else ifeq ($(BR2_SHARED_LIBS),y)
ZSTD_BUILD_LIBS = libzstd
ZSTD_INSTALL_LIBS = install-shared
else
ZSTD_BUILD_LIBS = libzstd.a libzstd
ZSTD_INSTALL_LIBS = install-static install-shared
endif

define ZSTD_BUILD_CMDS
    $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
        -C $(@D)/lib $(ZSTD_BUILD_LIBS)
    $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
        -C $(@D) zstd
endef

define ZSTD_INSTALL_STAGING_CMDS
    $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
        DESTDIR=$(STAGING_DIR) PREFIX=/usr -C $(@D)/lib \
        install-pc install-includes $(ZSTD_INSTALL_LIBS)
endef

define ZSTD_INSTALL_TARGET_CMDS
    $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
        DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/programs install
    $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
        DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/lib $(ZSTD_INSTALL_LIBS)
endef

Note: yes, the target install would also install the static libs, but
they will be removed in target-finalize anyway. So, given this matches
our usual practice, and that it makes the code smaller and easier to
read, I'd suggest we go this route.

Regards,
Yann E. MORIN.

> +ifeq ($(BR2_STATIC_LIBS),y)
> +define ZSTD_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> +		DESTDIR=$(STAGING_DIR) PREFIX=/usr -C $(@D)/lib \
> +		install-pc install-static install-includes
> +endef
> +else ifeq ($(BR2_SHARED_LIBS),y)
> +define ZSTD_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> +		DESTDIR=$(STAGING_DIR) PREFIX=/usr -C $(@D)/lib \
> +		install-pc install-shared install-includes
> +endef
> +else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
> +define ZSTD_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> +		DESTDIR=$(STAGING_DIR) PREFIX=/usr -C $(@D)/lib \
> +		install
> +endef
> +endif
> +
> +ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> +define ZSTD_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> +		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/lib install-shared
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
> +		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/programs install
> +endef
> +else
>  define ZSTD_INSTALL_TARGET_CMDS
>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) $(ZSTD_OPTS) \
>  		DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D)/programs install
>  endef
> +endif
>  
>  # note: no 'HAVE_...' options for host library build only
>  define HOST_ZSTD_BUILD_CMDS
> -- 
> 2.16.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
