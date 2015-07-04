From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Jul 2015 15:26:39 +0200
Subject: [Buildroot] [PATCH v5 2/2] pkg-luarocks: fix top-level parallel
 makefile support
In-Reply-To: <1435738247-9015-3-git-send-email-fabio.porcedda@gmail.com>
References: <1435738247-9015-1-git-send-email-fabio.porcedda@gmail.com>
 <1435738247-9015-3-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150704152639.1c1cc720@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Wed,  1 Jul 2015 10:10:47 +0200, Fabio Porcedda wrote:

> -LUAROCKS_RUN = LUA_PATH="$(HOST_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/?.lua" \
> -	$(LUA_RUN) $(HOST_DIR)/usr/bin/luarocks
> +LUAROCKS_RUN_ENV = LUA_PATH="$(HOST_DIR)/usr/share/lua/$(LUAINTERPRETER_ABIVER)/?.lua"
> +LUAROCKS_RUN_CMD = $(LUA_RUN) $(HOST_DIR)/usr/bin/luarocks
> +
> +LUAROCKS_RUN = $(LUAROCKS_RUN_ENV) $(LUAROCKS_RUN_CMD)

I've removed completely LUAROCKS_RUN, and used LUAROCKS_RUN_ENV and
LUAROCKS_RUN_CMD in the last place where LUAROCKS_RUN was used.

Applied with these changes, thanks!

However, won't we see some similar issues with other packages? Should
we preventively do a flock on HOST_DIR/STAGING_DIR/TARGET_DIR when
installing to host/staging/target respectively, so that we are sure
that at any given time, we don't have two packages installing at the
same time in one of the directories? Theoretically, this shouldn't be
needed if all packages install their own files, or if they have the
proper dependencies when they are overwriting files from another
package.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
