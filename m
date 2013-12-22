From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2013 21:47:02 +0100
Subject: [Buildroot] [pkg-luarocks infra V4 06/10] luarocks: new
 infrastructure
In-Reply-To: <20131222183153.4c2c90c8@skate>
References: <1384520859-3189-1-git-send-email-francois.perrad@gadz.org>
 <1384520859-3189-6-git-send-email-francois.perrad@gadz.org>
 <20131222183153.4c2c90c8@skate>
Message-ID: <20131222204702.GD27858@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Francois, All,

On 2013-12-22 18:31 +0100, Thomas Petazzoni spake thusly:
> On Fri, 15 Nov 2013 14:07:35 +0100, Francois Perrad wrote:
[--SNIP--]
> > diff --git a/package/pkg-luarocks.mk b/package/pkg-luarocks.mk
> > new file mode 100644
> > index 0000000..2a20413
> > --- /dev/null
> > +++ b/package/pkg-luarocks.mk
> > @@ -0,0 +1,71 @@
> > +################################################################################
> > +# LuaRocks package infrastructure
> > +# see http://luarocks.org/
> > +#
> > +# This file implements an infrastructure that eases development of
> > +# package .mk files for LuaRocks packages.
> > +# LuaRocks supports various build.type : builtin, make, cmake.
> > +# This luarocks infrastructure supports only the builtin mode,
> > +# the make & cmake modes could be directly handled by generic & cmake infrastructure.
> > +#
> > +# See the Buildroot documentation for details on the usage of this
> > +# infrastructure
> > +#
> > +# In terms of implementation, this LuaRocks infrastructure requires
> > +# the .mk file to only specify metadata informations about the
> > +# package: name, version, etc.
> > +#
> > +################################################################################
> > +
> > +LUAROCKS_RUN = $(HOST_DIR)/usr/bin/luarocks
> 
> This variable could probably be provided by
> package/luarocks/luarocks.mk.

Done.

[--SNIP--]
> > +$(2)_ROCKSPEC				?= $(1)-$($(3)_VERSION).rockspec
> > +$(2)_SOURCE				?= $(1)-$($(3)_VERSION).src.rock
> > +$(2)_SITE				?= $(call qstrip,$(BR2_LUAROCKS_MIRROR))
> > +
> > +#
> > +# Extract step
> > +#
> > +$(2)_EXTRACT_CMDS ?= \
> > +	cd $$($(2)_DIR)/.. && $(LUAROCKS_RUN) unpack $(DL_DIR)/$$($(2)_SOURCE)
> > +
> > +# $(2)_DEPENDENCIES are handled for configure step (too late)
> > +$(1)-extract: host-luarocks
> 
> Ok, I see the problem. However I believe I'd still like to see
> host-luarocks added to $(2)_DEPENDENCIES so that the dependency graph
> is correct, and "make source" / "make external-deps" properly show
> luarocks.

Done.
I've also rephrased the comment, and moved things around to be a bit
more logical (in my eyes, at least).

> > +#
> > +# Build/install step.
> > +#
> > +$(2)_INSTALL_TARGET_CMDS ?= \
> > +	cd $$($(2)_SRCDIR) && $(LUAROCKS_RUN) build --minimal $$($(2)_ROCKSPEC) $$($(2)_BUILD_OPT)
> 
> Maybe the extract and install target steps could be written using a
> define ... endef block instead, for better readability?

Done.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
