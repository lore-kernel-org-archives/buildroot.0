From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Oct 2017 20:54:24 +0200
Subject: [Buildroot] [PATCH] prosody: bump to version 0.10.0
In-Reply-To: <20171014133956.25082-1-francois.perrad@gadz.org>
References: <20171014133956.25082-1-francois.perrad@gadz.org>
Message-ID: <20171016205424.357bf369@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 14 Oct 2017 15:39:56 +0200, Francois Perrad wrote:
> this version is not restricted to Lua 5.1
> the configure step is refactored with the variable PROSODY_CONF_OPTS
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Thanks for this bump. One question below though.


> -PROSODY_VERSION = 0.9.12
> +PROSODY_VERSION = 0.10.0
>  PROSODY_SITE = https://prosody.im/downloads/source
>  PROSODY_LICENSE = MIT
>  PROSODY_LICENSE_FILES = COPYING
> -PROSODY_DEPENDENCIES = openssl libidn
> +PROSODY_DEPENDENCIES = host-luainterpreter luainterpreter libidn openssl

Why do we need host-luainterpreter? There wasn't such a dependency in
the previous version.

> -ifeq ($(BR2_PACKAGE_LUA_5_1),y)
> -PROSODY_DEPENDENCIES += lua
> -endif
> +PROSODY_CONF_OPTS = \
> +	--with-lua-bin="$(HOST_DIR)/usr/bin" \
> +	--with-lua="$(STAGING_DIR)/usr" \
> +	--lua-version=$(LUAINTERPRETER_ABIVER) \
> +	--c-compiler=$(TARGET_CC) \
> +	--cflags="$(TARGET_CFLAGS)" \
> +	--linker=$(TARGET_CC) \
> +	--ldflags="$(TARGET_LDFLAGS) -shared" \
> +	--sysconfdir=/etc/prosody \
> +	--prefix="/usr"
>  
>  ifeq ($(BR2_PACKAGE_LUAJIT),y)
> -PROSODY_DEPENDENCIES += luajit
> +PROSODY_CONF_OPTS += --runwith=luajit
>  endif
>  
>  define PROSODY_CONFIGURE_CMDS
> -	cd $(@D) && \
> -		$(TARGET_CONFIGURE_OPTS) \
> -		./configure --prefix=/usr \
> -		--c-compiler=$(TARGET_CC) \
> -		--cflags="$(TARGET_CFLAGS)" \
> -		--linker=$(TARGET_CC) \
> -		--ldflags="$(TARGET_LDFLAGS) -shared" \
> -		--sysconfdir=/etc/prosody \
> -		--with-lua=$(STAGING_DIR)/usr
> +	cd $(@D) && ./configure $(PROSODY_CONF_OPTS)

Even though the refactoring of CONF_OPTS is related to the bump, it
would have been nice to have it as a separate patch, prior to the bump.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
