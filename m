From: Mike <mikez@OpenPlayer.org>
Date: Sun, 5 Jul 2015 07:15:26 -0500
Subject: [Buildroot] Hash checking infrastructure
In-Reply-To: <20150705094452.GI3647@free.fr>
References: <20150704140142.3aa5c982@core2quad.morethan.org>
 <20150704214734.GC3634@free.fr>
 <20150704213628.21ff7e6e@core2quad.morethan.org>
 <20150705000050.7c2be969@core2quad.morethan.org>
 <20150705094452.GI3647@free.fr>
Message-ID: <20150705071526.64f5a6df@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 5 Jul 2015 11:44:52 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Mike, All,
> 
> On 2015-07-05 00:00 -0500, Mike spake thusly:
> [--SNIP--]
> > I fell into this strange behavior when trying a simple(tm)
> > LuaJIT version bump (from 2.0.3 -> 2.0.4).
> 
> Note that we already have luajit 2.0.4 in Buildroot.
> 
> Regards,
> Yann E. MORIN.
> 

@Thomas P & Yann -
Thanks for checking and reporting no problems.
I presume you where both using the current head.

I have been working on this for a few days now,
so my work was against the head of a few days ago.

I.E: Back in the "old days" (hours?) when it still
had only 2.0.3 in it.

- - - -

I don't see any signs of enabling a Lua module in
the .config snippet that Thomas P. sent.

Not just any Lua module, but one that uses the
LuaRocks infrastructure.

Why?
Because to install the host LuaRocks infrastructure
causes a host-Lua to be built.

At the moment, I am thinking that part is what falls
into the hash checking of a non-existent tar-ball.

The related part of my .config:

BR2_LUAROCKS_MIRROR="http://rocks.moonscript.org"
# BR2_PACKAGE_LUA is not set
BR2_PACKAGE_PROVIDES_LUAINTERPRETER="luajit"
BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION="5.1"
BR2_PACKAGE_HAS_LUAINTERPRETER=y
BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS=y
BR2_PACKAGE_LUAJIT=y

# Right here is the significant difference:
BR2_PACKAGE_LUALOGGING=y
BR2_PACKAGE_LUAPOSIX=y

- - - - -

Which is why my question about the auto-builder:

Once it had picked one of the Lua providers, did
it also go on to pick some (or all) of the Lua
modules.

From the lack of noise on the subject in the
auto-builder reports, I suspect not.

I.E: Some of the modules do not properly set
Lua-Include-Path (however named) and they just
are not going to build that way.  ;)

- - - - -

Come Monday morning, I'll do a pull to pick up the
recent changes made when the version was bump'd.

Then start over.

Thanks again,
Mike
