From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 19:41:46 +0100
Subject: [Buildroot] [UNSURE]Issue with the luarocks infra and legal-info
In-Reply-To: <CAB0FRsvJNxpkSMYjhnLAC2i91iXF-BwJKg4-PTCy4bYWY6ULEQ@mail.gmail.com>
References: <20140301165018.2743ec23@skate>
 <CAB0FRsvJNxpkSMYjhnLAC2i91iXF-BwJKg4-PTCy4bYWY6ULEQ@mail.gmail.com>
Message-ID: <20140301194146.4814ee45@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fran?ois Perrad,

On Sat, 1 Mar 2014 19:23:56 +0100, Fran?ois Perrad wrote:

> Before the Luarocks infrastructure, only native Lua modules have an
> explicit dependency with luainterpreter.
> With the Luarocks infrastructure, all Lua modules need an implicit
> dependency with luainterpreter (we don't need to split native and pure
> Lua module cases).

Right, but most likely this dependency on the target Lua interpreter is
only need before *building* Lua modules, not before *extracting* Lua
modules. Which is, if I understood correctly, what you propose below.

> These is done in 2 places :
> in http://git.buildroot.net/buildroot/tree/package/pkg-luarocks.mk#n44 with
>      $(2)_DEPENDENCIES    += host-luarocks luainterpreter
> in http://git.buildroot.net/buildroot/tree/package/luarocks/luarocks.mk#n12
>      HOST_LUAROCKS_DEPENDENCIES = host-lua luainterpreter
> 
> The good place is the first one. So, you could write :
>      HOST_LUAROCKS_DEPENDENCIES = host-lua
> and perhaps soon with the first virtual host package :
>      HOST_LUAROCKS_DEPENDENCIES = host-luainterpreter

Right. It's still a bit annoying to have to build host-luarocks and
host-lua to do 'make legal-info', but it's certainly a lot more
reasonable that having to build the toolchain :-)

Could you integrate a patch that does this simplification in the next
version of your Lua improvements?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
