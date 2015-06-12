From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Jun 2015 19:46:20 +0200
Subject: [Buildroot] [PATCH 01/11 v2] package-infra: add helper to build
 kernel modules
In-Reply-To: <557A0F36.2060208@mind.be>
References: <cover.1433964001.git.yann.morin.1998@free.fr>
 <a9355834b4604ad9989556affbddeb9926343abd.1433964001.git.yann.morin.1998@free.fr>
 <557A0F36.2060208@mind.be>
Message-ID: <20150612174620.GA3583@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-06-12 00:44 +0200, Arnout Vandecappelle spake thusly:
> On 06/10/15 21:22, Yann E. MORIN wrote:
> > The Linux kernel offers a nice and easy-to-use infra to build
> > out-of-tree kernel modules.
[--SNIP--]
> > diff --git a/package/pkg-kernel-module.mk b/package/pkg-kernel-module.mk
> > new file mode 100644
> > index 0000000..608c9e6
> > --- /dev/null
> > +++ b/package/pkg-kernel-module.mk
> > @@ -0,0 +1,89 @@
> > +################################################################################
> > +# kernel module infrastructure for building Linux kernel modules
> > +#
> > +# This file implements an infrastructure that eases development of package
> > +# .mk files for out-of-tree Linux kernel modules. It should be used for all
> > +# packages that build a Linux kernel module using the kernel's out-of-tree
> > +# buildsystem, unless they use a complex custom build-system.
> 
>  buildsystem, build-system. What about consistently choosing "build system"? :-)

I think we've settled for "buildsystem" in other places, so I'll stick
to that (and fix here).

> > +# In terms of implementation, this infrastructure relies on another package
> > +# infrastructure, and only defines post-build and post-install hooks, so that
> > +# packages can both build user-space (with any of the other *-package infra)
> > +# and/or build kernel modules.
> 
> # The kernel-module infrastructure requires the packages that use it to also
> # include another package infrastructure. kernel-module only defines post-build

s/include/use/ because we're not 'including' pkg infras, we're not even
calling them, we're evaluating them. So I'd still word that as 'use' if
you don't mind. ;-)

> # and post-install hooks. This allows the package to build both kernel modules
> # and/or user-space components (with any of the other *-package infra).

Otherwise, OK, it's simpler and more explixit thn what I wrote.

> > +#
> > +# As such, it is to be used in conjunction with another *-package infra,
> > +# like so:
> > +#
> > +#   $(eval $(kernel-module))
> > +#   $(eval $(generic-package))
> > +#
> > +# Note: if the caller needs access to the kernel modules (either after they
> > +# are built or after they are installed), it will have to define its own
> > +# post-build/install hooks after calling kernel-module, but before calling
> 
>  after -> *after*

OK. I guess ditto for: before -> *before* , no?

> > +# the other *-package infra, like so:
> > +#
> > +#   $(eval $(kernel-module))
> > +#   define FOO_MOD_TWEAK
> > +#   	# do something
> > +#   endef
> > +#   FOO_POST_BUILD_HOOKS += FOO_MOD_TWEAK
> > +#   $(eval $(generic-package))
> > +#
> > +# Note: this infra does not check that the kernel is enabled; it is expected
> > +# to be enforced at the Kconfig level with proper 'depends on'.
> > +################################################################################
> > +
> > +################################################################################
> > +# inner-kernel-module -- generates the make targets needed to support building
> > +# a kernel module
> > +#
> > +#  argument 1 is the lowercase package name
> 
>  Is there any reason to keep this, since it's not used?

Well, I wanted to keep it as much aligned to existing infras as
possible, even though we're not using it.

> > +#  argument 2 is the uppercase package name
> > +################################################################################
> > +
> > +define inner-kernel-module
> > +
> > +# The kernel must be built first.
> > +$(2)_DEPENDENCIES += linux
> > +
> > +# This is only defined in some infrastructures (e.g. autotools, cmake), but
> > +# not in others (generic). So define it if not already defined.
>                               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>                               So define it here as well.

OK.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
