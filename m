From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 02 Aug 2017 09:46:18 +0200
Subject: [Buildroot] [PATCH 2/2] swupdate: support for Lua 5.1 is broken
In-Reply-To: <1501656165.1978.3.camel@embedded.rocks>
References: <20170731211800.5888-1-joerg.krause@embedded.rocks>
 <20170731211800.5888-2-joerg.krause@embedded.rocks>
 <20170801191032.6c2ca207@windsurf.home>
 <1501656165.1978.3.camel@embedded.rocks>
Message-ID: <1501659978.1978.9.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Hi Jordan,

On Wed, 2017-08-02 at 08:42 +0200, J?rg Krause wrote:
> Hi Thomas,
> 
> On Tue, 2017-08-01 at 19:10 +0200, Thomas Petazzoni wrote:
> > Hello,
> > 
> > On Mon, 31 Jul 2017 23:18:00 +0200, J?rg Krause wrote:
> > > Before commit 87b6ac1478821351c92f7ca1c3154550e4713b28 support
> > > for
> > > Lua
> > > was always disabled by the default config file:
> > > 
> > > ```
> > > CONFIG_LUA is not set
> > > ```
> > > 
> > > The commit removed this setting and Lua support is now enabled if
> > > a
> > > Lua
> > > interpreter is enabled. As the swupdate build system uses pkg-
> > > config to check
> > > for the lua library by default (LUAPKG="lua") this throws a lot
> > > of
> > > undefined referenced in case LuaJIT is uses as Lua interpreter,
> > > e.g.:
> > > 
> > > ```
> > > corelib/lib.a(lua_interface.o): In function `l_info':
> > > lua_interface.c:(.text.l_info+0x14): undefined reference to
> > > `luaL_checklstring'
> > > ```
> > > 
> > > However, since version 2017.07 support for Lua 5.1 is broken in
> > > swupdate. Therefore,
> > > remove support for Lua 5.1 and LuaJIT in the swupdate package for
> > > now
> > > until upstream might fix this issue.
> > 
> > Isn't it better to revert the bump to 2017.07 instead of removing
> > functionality that people could be relying on ?
> 
> Lua 5.1 and LuaJIT were never supported if CONFIG_HANDLER_IN_LUA was
> selected. Upstream changed the functionality that the Lua code used
> when enabling CONFIG_HANDLER_IN_LUA is now used in more common places
> and therefore enabled if CONFIG_LUA is enabled.
> 
> That's why, I should have reword the commit message to: "Lua 5.1 is
> not
> supported" instead of "broken".
> 
> I am asking the Stefano Babic, the swupdate maintainer, if he is
> interested in enabling Lua 5.1 support. For now, swupdate is
> explicitly
> tested using Lua 5.3.

Stefano confirmed that he has no plans in adding support for Lua
5.1/LuaJIT himself, but patches are welcome [1].

@Jordan: You've added a patch to allow configuring swupdate with LuaJIT
last year. If you're still interested in support for LuaJIT, please
contact the swupdate maintainer on the swupdate mailing list.

[1] https://groups.google.com/d/msg/swupdate/WAm8npAOd6o/hPWMMkV_AAAJ

J?rg
