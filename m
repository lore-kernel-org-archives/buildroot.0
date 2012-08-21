From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Aug 2012 18:08:10 +0200
Subject: [Buildroot] [PATCH] package/autotool infra: create missing m4
	dir
In-Reply-To: <20120821113312.3bea26a0@skate>
References: <1345294113-11303-1-git-send-email-yann.morin.1998@free.fr>
 <20120821113312.3bea26a0@skate>
Message-ID: <201208211808.10782.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Tuesday 21 August 2012 11:33:12 Thomas Petazzoni wrote:
> Le Sat, 18 Aug 2012 14:48:33 +0200,
> "Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :
> 
> > When a package needs to be auto-reconfigured, it may be missing the m4/
> > sub-dir, especially when we use the package from its VCS.
> > 
> > Grep configure.{ac,in} tp find the location of the m4/ sub-dir (defaulting
> > to the root of the package), and create it.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > ---
> > 
> > This is a tentative patch for RFC.
> > ---
> >  package/pkg-autotools.mk |    1 +
> >  1 files changed, 1 insertions(+), 0 deletions(-)
> > 
> > diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> > index 785daab..f199ac6 100644
> > --- a/package/pkg-autotools.mk
> > +++ b/package/pkg-autotools.mk
> > @@ -173,6 +173,7 @@ endif
> >  #
> >  define AUTORECONF_HOOK
> >  	@$$(call MESSAGE,"Autoreconfiguring")
> > +	M4_DIR=$$$$(sed -r -e '/.*AC_CONFIG_MACRO_DIR\(\[(.*)\]\).*/!d; s//\1/g;' $$($$(PKG)_SRCDIR)configure.*) && mkdir -p "$$($$(PKG)_SRCDIR)$$$${M4_DIR:-m4}"
> >  	$(Q)cd $$($$(PKG)_SRCDIR) && $(AUTORECONF) $$($$(PKG)_AUTORECONF_OPT)
> >  	$(Q)if test "$$($$(PKG)_LIBTOOL_PATCH)" = "YES"; then \
> >  		for i in `find $$($$(PKG)_SRCDIR) -name ltmain.sh`; do \
> 
> Thanks for doing this. I am not yet totally convinced, 

Yep, that's why I advertised it as an RFC. ;-)

> but it needs
> some discussion. I find this approach a bit fragile, and I'm not sure
> it will cover all possibilities: I've seen packages doing more funky
> things than just creating the AC_CONFIG_MACRO_DIR directory in their
> autogen.sh/bootstrap script. For example, calling glibtoolize or
> intltoolize, which I'm not sure are automatically being called by
> autoreconf (but I may be wrong).
> 
> So, I see two alternative approaches to yours (I'm not saying those
> alternatives are better, just mentioning them to open the discussion):
> 
>  1. Add an explicit <pkg>_AC_CONFIG_MACRO_DIR option, which defaults to
>     m4, and which can be overridden by the package .mk file. The
>     autotools infrastructure then creates in the source tree a
>     directory of this name before doing the autoreconfiguration.
> 
>  2. Make the autoreconf command configurable. I.e, by default the
>     autotools infrastructure does $(AUTORECONF)
>     $$($$(PKG)_AUTORECONF_OPT), but maybe we could use a
>     $$($$(PKG)_AUTORECONF_CMDS) instead, so that you could do 'mkdir
>     $(@D)/m4; $(@D)/autogen.sh' if you need, etc.
> 
> Thoughts?

Well...
1) is pretty easy to do, but might not cover all cases, far from it, from
what you said above. But it might be "good enough" it is catters for 90+%
of packages.

2) should be relatively easy too, and is very versatile. OTOH, if one needs
to run the buildroot's standard $(AUTORECONF), it can become a bit more
complex.

So, what is the current state of packages in buildroot?

- 2 packages create a m4/ sub-dir:
    $ grep -c -r -E 'mkdir .*m4' * |grep -v -E ':0$'                                                                                                                        
    libiscsi/libiscsi.mk:1    mine, not yet upstream, missing m4/ dir
    sysprof/sysprof.mk:1      uses POST_PATCH_HOOK

  --> so option 1) would really catter for only two packages

- 3 packages declare one or more PRE_CONFIG hooks:
    $ cd package; grep -c -r -E 'PRE_CONFIGURE_HOOKS[[:space:]]*[+:]?=' . \
      |grep -v -E ':0$'
    cups/cups.mk:1            calls only autoconf, standard autreconf breaks
    libiscsi/libiscsi.mk:1    mine, not yet upstream, missing m4/ dir
    socat/socat.mk:1          does not use automake, needs autoconf only

  --> so option 2) would really catter for only two packages

I guess that's not really important to provide such a mechanism.
Forget about my patch. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
