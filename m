From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 29 Nov 2014 21:00:29 +0200
Subject: [Buildroot] [PATCH] btrfs-progs: fix static build
In-Reply-To: <20141128224117.7a3f2f95@free-electrons.com>
References: <2de1279dcd485fe0a9dda147272221766bb7e187.1417159092.git.baruch@tkos.co.il>
 <20141128224117.7a3f2f95@free-electrons.com>
Message-ID: <20141129190029.GF2204@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Fri, Nov 28, 2014 at 10:41:17PM +0100, Thomas Petazzoni wrote:
> On Fri, 28 Nov 2014 09:18:12 +0200, Baruch Siach wrote:
> > diff --git a/package/btrfs-progs/btrfs-progs.mk 
> > b/package/btrfs-progs/btrfs-progs.mk
> > index d16fa0d9aa6f..7122df1b0e76 100644
> > --- a/package/btrfs-progs/btrfs-progs.mk
> > +++ b/package/btrfs-progs/btrfs-progs.mk
> > @@ -17,6 +17,10 @@ BTRFS_PROGS_LICENSE_FILES = COPYING
> >  ifeq ($(BR2_PREFER_STATIC_LIB),y)
> >  BTRFS_PROGS_MAKE_TARGET = static
> >  BTRFS_PROGS_MAKE_INSTALL_TARGET = install-static
> > +ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
> > +# Add -lintl for libuuid
> > +BTRFS_PROGS_MAKE_FLAGS += lib_LIBS="-luuid -lblkid -lm -lz -llzo2 -L. -lintl"
> > +endif
> 
> This is really ugly and not maintainable, we are doing this all over
> the place to solve static linking issues, and it's going to be a
> never-ending story. 

I agree it is ugly. The thing is that this list of libraries is copied 
verbatim from btrfs-progs Makefile (except -lintl). I found no way to specify 
additional library dependencies.

> If the package doesn't use pkg-config, can't we at
> least use it here, like:
> 
> 	lib_LIBS="$(shell pkg-config ...)"
> 
>  ?

uuid.pc does not list -lintl because this is something we add locally since 
commit a8273c4272b1b8 (util-linux: fix libintl linking if present). Yann has 
proposed a patch (http://patchwork.ozlabs.org/patch/416000/) adding -lintl to 
uuid.pc when applicable. We'll still need to repeat the rest of the list,
something like:

	lib_LIBS="-luuid -lblkid -lm -lz -llzo2 -L. $(shell pkg-config ...)"

so I'm not sure it buy us much.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
