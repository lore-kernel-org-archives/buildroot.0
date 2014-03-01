From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 1 Mar 2014 19:23:56 +0100
Subject: [Buildroot] [UNSURE]Issue with the luarocks infra and legal-info
In-Reply-To: <20140301165018.2743ec23@skate>
References: <20140301165018.2743ec23@skate>
Message-ID: <CAB0FRsvJNxpkSMYjhnLAC2i91iXF-BwJKg4-PTCy4bYWY6ULEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-03-01 16:50 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello Fran?ois,
>
> I've discovered an issue with the luarocks package infrastructure that
> apparently we didn't notice during its review. The problem is that the
> luarocks package infrastructure makes the extract step of a lua package
> depend on host-luarocks.
>
> The problem with this is that the legal-info infrastructure does run
> the extract step of all packages in order to extract their source code
> and get the license files. In the case of luarocks packages, this
> triggers the build of host-luarocks, itself triggering the build of
> host-lua and the selected lua-interpreter. But lua-interpreter is a
> target package, so it depends on the toolchain, so the toolchain is
> also built. This is rather annoying for the legal-info make target,
> which should be relatively quick and normally not build anything or
> only small things.
>
> Is there anything that can be done to improve this? Does host-luarocks
> really need to depend on the target lua interpreter?
>

Before the Luarocks infrastructure, only native Lua modules have an
explicit dependency with luainterpreter.
With the Luarocks infrastructure, all Lua modules need an implicit
dependency with luainterpreter (we don't need to split native and pure
Lua module cases).
These is done in 2 places :
in http://git.buildroot.net/buildroot/tree/package/pkg-luarocks.mk#n44 with
     $(2)_DEPENDENCIES    += host-luarocks luainterpreter
in http://git.buildroot.net/buildroot/tree/package/luarocks/luarocks.mk#n12
     HOST_LUAROCKS_DEPENDENCIES = host-lua luainterpreter

The good place is the first one. So, you could write :
     HOST_LUAROCKS_DEPENDENCIES = host-lua
and perhaps soon with the first virtual host package :
     HOST_LUAROCKS_DEPENDENCIES = host-luainterpreter

Fran?ois

> Thanks in advance for your suggestions,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
