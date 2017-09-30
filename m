From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Sep 2017 23:16:37 +0200
Subject: [Buildroot] [PATCH v2] package/prosody: new package
In-Reply-To: <1505132302-20308-1-git-send-email-nidujay@gmail.com>
References: <1504909108-18547-2-git-send-email-nidujay@gmail.com>
 <1505132302-20308-1-git-send-email-nidujay@gmail.com>
Message-ID: <20170930211637.GB14040@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dushara, All,

On 2017-09-11 22:18 +1000, Dushara Jayasinghe spake thusly:
> As stated by the upstream developers, Prosody only supports
> lua-5.1 or luajit (which is a lua-5.1 interpreter):
> 
> > Response from zash at zash.se:
> >
> >> I pegged the package to lua 5,1 based on the contents of the
> >> INSTALL file. Is this a hard requirement?
> >
> > Up until Prosody 0.9 Lua 5.1 is required. However LuaJIT
> > implements Lua 5.1 so it works.
> 
> The license terms are not very consistent: the source files all
> state to be "MIT/X11 licensed" and defer to the COPYING file for
> details, but that file only has the text for the MIT license.
> Thus, we believe the license to be MIT/X11, as stated in the source
> files.
> 
> This installs the base system with certificates for two domains:
> localhost and example.com
> 
> The default runtime configuration is tweaked during installation
> to properly setup logging and pid-file directories.
> 
> Prosody doesn't like being executed as root, and thus the daemon
> is executed as the user prosody. The startup script creates the
> pid file write location with appropriate permissions.
> 
> Signed-off-by: Dushara Jayasinghe <nidujay@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

But one minor nit, see below...

[--SNIP--]
> diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
> new file mode 100644
> index 0000000..4a88d8f
> --- /dev/null
> +++ b/package/prosody/prosody.mk
> @@ -0,0 +1,70 @@
> +################################################################################
> +#
> +# prosody
> +#
> +################################################################################
> +
> +PROSODY_VERSION = 0.9.12
> +PROSODY_SOURCE = prosody-$(PROSODY_VERSION).tar.gz

This is the default, so is not needed.

There is no need for you to respin just for that. It can be fixed by the
comitter.

Regards,
Yann E. MORIN.

> +PROSODY_SITE = https://prosody.im/downloads/source
> +PROSODY_LICENSE = MIT
> +PROSODY_LICENSE_FILES = COPYING
> +PROSODY_DEPENDENCIES = openssl libidn
> +
> +ifeq ($(BR2_PACKAGE_LUA_5_1),y)
> +PROSODY_DEPENDENCIES += lua
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LUAJIT),y)
> +PROSODY_DEPENDENCIES += luajit
> +endif
> +
> +define PROSODY_CONFIGURE_CMDS
> +	cd $(@D) && \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		./configure --prefix=/usr \
> +		--c-compiler=$(TARGET_CC) \
> +		--cflags="$(TARGET_CFLAGS)" \
> +		--linker=$(TARGET_CC) \
> +		--ldflags="$(TARGET_LDFLAGS) -shared" \
> +		--sysconfdir=/etc/prosody \
> +		--with-lua=$(STAGING_DIR)/usr
> +endef
> +
> +define PROSODY_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> +endef
> +
> +define PROSODY_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
> +endef
> +
> +define PROSODY_INSTALL_INIT_SYSV
> +	$(INSTALL) -D -m 0755 package/prosody/S50prosody \
> +		$(TARGET_DIR)/etc/init.d/S50prosody
> +endef
> +
> +define PROSODY_USERS
> +	prosody -1 nogroup -1 * - - - Prosody user
> +endef
> +
> +# make install installs a Makefile and meta data to generate certs
> +define PROSODY_REMOVE_CERT_GENERATOR
> +	rm -f $(TARGET_DIR)/etc/prosody/certs/Makefile
> +	rm -f $(TARGET_DIR)/etc/prosody/certs/*.cnf
> +endef
> +
> +PROSODY_POST_INSTALL_TARGET_HOOKS += PROSODY_REMOVE_CERT_GENERATOR
> +
> +# 1. Enable posix functionality
> +# 2. Log to syslog
> +# 3. Specify pid file write location
> +# 4. Enable virtual host example.com
> +define PROSODY_TWEAK_DEFAULT_CONF
> +	$(INSTALL) -D package/prosody/prosody.cfg.lua \
> +		$(TARGET_DIR)/etc/prosody/prosody.cfg.lua
> +endef
> +
> +PROSODY_POST_INSTALL_TARGET_HOOKS += PROSODY_TWEAK_DEFAULT_CONF
> +
> +$(eval $(generic-package))
> -- 
> 2.1.4
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
