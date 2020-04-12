From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 14:59:09 +0200
Subject: [Buildroot] [pkg-luarocks v2 3/5] pkg-luarocks: add support of
 host-luarocks-package
In-Reply-To: <20200322080706.19806-3-francois.perrad@gadz.org>
References: <20200322080706.19806-1-francois.perrad@gadz.org>
 <20200322080706.19806-3-francois.perrad@gadz.org>
Message-ID: <20200412145909.67168054@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Mar 2020 09:07:04 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

So I have applied, but after splitting this into two patches. See below.

>  LUAROCKS_CONFIG_DIR = $(HOST_DIR)/etc
> -LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/luarocks/config-$(LUAINTERPRETER_ABIVER).lua
> +LUAROCKS_CONFIG_FILE_DEFAULT = $(LUAROCKS_CONFIG_DIR)/luarocks/config-$(LUAINTERPRETER_ABIVER).lua
> +LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/luarocks/config.lua
> +HOST_LUAROCKS_CONFIG_FILE = $(LUAROCKS_CONFIG_DIR)/luarocks/host-config.lua

I've split out the fact that we use a different configuration file for
the target into a separate commit.

>  define HOST_LUAROCKS_INSTALL_CMDS
> -	rm -f $(LUAROCKS_CONFIG_FILE)
> +	rm -f $(LUAROCKS_CONFIG_FILE_DEFAULT)
>  	$(MAKE1) -C $(@D) install
> +	cp $(LUAROCKS_CONFIG_FILE_DEFAULT) $(LUAROCKS_CONFIG_FILE)
>  	cat $(HOST_LUAROCKS_PKGDIR)/luarocks-br-config.lua >> $(LUAROCKS_CONFIG_FILE)

I've used:

	cat foo1 foo2 > foo

instead of:

	cp foo1 foo
	cat foo2 >> foo

But, can't we instead use some Lua statement/directive to have the
common config file included by both the host and target configuration
files ? That would be a bit nicer than having to concatenate them here.

See the two final commits:

  https://git.buildroot.org/buildroot/commit/?id=a850cdce5373408890a2b35de31db04963870143
  https://git.buildroot.org/buildroot/commit/?id=060eb0e7e4fe67f86f0027383c6f74ee46eb3aa0

Could you submit a patch that adds a host luarocks package, so at least
this feature is used by one package in the tree ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
