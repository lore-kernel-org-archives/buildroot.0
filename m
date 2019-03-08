From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 8 Mar 2019 19:19:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/swupdate: fix static build
 without lua
In-Reply-To: <20190307224345.4336952c@windsurf>
References: <20190304214720.13703-1-fontaine.fabrice@gmail.com>
 <20190307224345.4336952c@windsurf>
Message-ID: <CAPi7W81MtxfKomR77Gar4eKw4ianFAPGUBn3c9XfSpjNZ7Bj8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,
Le jeu. 7 mars 2019 ? 22:43, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Fabrice,
>
> On Mon,  4 Mar 2019 22:47:20 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > diff --git a/package/swupdate/0001-Makefile-fix-static-build.patch b/package/swupdate/0001-Makefile-fix-static-build.patch
> > new file mode 100644
> > index 0000000000..56901f9871
> > --- /dev/null
> > +++ b/package/swupdate/0001-Makefile-fix-static-build.patch
> > @@ -0,0 +1,62 @@
> > +From 15a324f8c67548f219256a5a75ba8123cc5bdac6 Mon Sep 17 00:00:00 2001
> > +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +Date: Mon, 4 Mar 2019 21:51:36 +0100
> > +Subject: [PATCH] Makefile: fix static build
> > +
> > +Don't build and install lua_swupdate.so if HAVE_LUA isn't set to y
> > +otherwise build will fail if the toolchain only suports building static
> > +libraries
> > +
> > +Fixes:
> > + - http://autobuild.buildroot.org/results/c11c4d26983e0347d96f3dda62e6d72b031967bb
> > +
> > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +[Upstream status: https://github.com/sbabic/swupdate/pull/49]
> > +---
> > + Makefile | 12 +++++++++---
> > + 1 file changed, 9 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index cfeb9a6..cac99b5 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -369,11 +369,15 @@ tools-bins     := $(patsubst $(tools-y)/%.c,$(tools-y)/%,$(wildcard $(tools-y)/*.c))
> > + tools-bins-unstr:= $(patsubst %,%_unstripped,$(tools-bins))
> > + tools-all   := $(tools-objs)
> > +
> > ++ifeq ($(HAVE_LUA),y)
> > ++lua_swupdate        := lua_swupdate.so
> > ++endif
>
> I am a bit confused. How could lua_swupdate.so build at all (even in
> shared library configurations) when HAVE_LUA is not enabled ?
>
> I see the patch has been applied upstream, so I guess it is correct,
> but still that confuses me a bit. Or maybe lua_swupdate.so doesn't link
> with Lua ?
The issue (fixed by the patch) is that swudpate always tries to build
lua_swupdate.so even if there is no object files in this shared
library when CONFIG_LUA is not set.

Here is an extract of bindings/Makefile (see
https://github.com/sbabic/swupdate/commit/624904cc18003fae413011563dac83a333f10509):
obj-$(CONFIG_LUA) += auxiliar.o lua_swupdate.o

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Best Regards,

Fabrice
