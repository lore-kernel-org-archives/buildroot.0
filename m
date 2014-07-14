From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Jul 2014 15:25:43 +0200
Subject: [Buildroot] [PATCH 2/2] package/patchelf: new host package
In-Reply-To: <CAAXf6LWUcp6HkaN4PYN9WPwFHgQi5KATLggJQ3remkr+pEhhww@mail.gmail.com>
References: <cover.1405262399.git.yann.morin.1998@free.fr>
 <a8d871e1d1bf5eb507d24eac6f5dd51cda98a326.1405262399.git.yann.morin.1998@free.fr>
 <CAAXf6LWUcp6HkaN4PYN9WPwFHgQi5KATLggJQ3remkr+pEhhww@mail.gmail.com>
Message-ID: <20140714132543.GF3684@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-14 10:18 +0200, Thomas De Schampheleire spake thusly:
> On Sun, Jul 13, 2014 at 4:42 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > In some situations, users may want to tweak the dynamic section of the
> > binaries (for example to add/set the RPATH to $ORIGIN/../lib).
> >
> > Because it is not trivial to do it properly from the Buildroot
> > infrastructure, allow those users to use patchelf (e.g. from a
> > post-build script) to tweak binaries.
> >
> > patchelf is able to:
> >   - modify an existing DT_RUNPATH tags
> >   - add a DT_RUNPATH tag is not already present
> 
> s/is/if/
> 
> >   - do the above to the DT_RPATH tag, too
> >   - set the path to the interpreter
> >   - remove DT_NEEDED tags
> >   - query a inary for the DT_RUNPATH/DT_RPATH tag, or for the
> 
> s/inary/binary/

Both fixed, thanks

Regards,
Yann E. MORIN.

> >     interpreter path
> >
> > Does not really fix #7172, but this is workaround.
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Mike Zick <minimod@morethan.org>
> > ---
> >  package/Config.in.host          |  1 +
> >  package/patchelf/Config.in.host |  7 +++++++
> >  package/patchelf/patchelf.mk    | 12 ++++++++++++
> >  3 files changed, 20 insertions(+)
> >  create mode 100644 package/patchelf/Config.in.host
> >  create mode 100644 package/patchelf/patchelf.mk
> >
> > diff --git a/package/Config.in.host b/package/Config.in.host
> > index 062c6c9..e05bbfa 100644
> > --- a/package/Config.in.host
> > +++ b/package/Config.in.host
> > @@ -13,6 +13,7 @@ menu "Host utilities"
> >         source "package/omap-u-boot-utils/Config.in.host"
> >         source "package/openocd/Config.in.host"
> >         source "package/parted/Config.in.host"
> > +       source "package/patchelf/Config.in.host"
> >         source "package/pwgen/Config.in.host"
> >         source "package/sam-ba/Config.in.host"
> >         source "package/squashfs/Config.in.host"
> > diff --git a/package/patchelf/Config.in.host b/package/patchelf/Config.in.host
> > new file mode 100644
> > index 0000000..d1c8375
> > --- /dev/null
> > +++ b/package/patchelf/Config.in.host
> > @@ -0,0 +1,7 @@
> > +config BR2_PACKAGE_HOST_PATCHELF
> > +       bool "host patchelf"
> > +       help
> > +         PatchELF is a small utility to modify the dynamic linker
> > +         and RPATH of ELF executables.
> > +
> > +         http://nixos.org/patchelf.html
> > diff --git a/package/patchelf/patchelf.mk b/package/patchelf/patchelf.mk
> > new file mode 100644
> > index 0000000..1a8e48d
> > --- /dev/null
> > +++ b/package/patchelf/patchelf.mk
> > @@ -0,0 +1,12 @@
> > +################################################################################
> > +#
> > +# patchelf
> > +#
> > +################################################################################
> > +
> > +PATCHELF_VERSION = 0.8
> > +PATCHELF_SITE = http://releases.nixos.org/patchelf/patchelf-0.8/
> > +PATCHELF_LICENSE = GPLv3
> > +PATCHELF_LICENSE_FILES = COPYING
> > +
> > +$(eval $(host-autotools-package))
> > --
> 
> Best regards,
> Thomas

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
