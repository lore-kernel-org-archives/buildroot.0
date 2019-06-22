From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Jun 2019 21:22:27 +0200
Subject: [Buildroot] [PATCH v6 1/2] meson: add per package optional
 compiler/linker flags
In-Reply-To: <20190622211330.10b68b47@windsurf>
References: <20190423205302.14382-1-ps.report@gmx.net>
 <20190612163710.GE2647@scaer> <20190622211330.10b68b47@windsurf>
Message-ID: <20190622192227.GF13664@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-06-22 21:13 +0200, Thomas Petazzoni spake thusly:
> On Wed, 12 Jun 2019 18:37:10 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > > diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> > > index 49e27f5527..70128f6bad 100644
> > > --- a/package/meson/meson.mk
> > > +++ b/package/meson/meson.mk
> > > @@ -60,6 +60,9 @@ define HOST_MESON_INSTALL_CROSS_CONF
> > >  	    -e "s%@TARGET_CFLAGS@%$(HOST_MESON_SED_CFLAGS)%g" \
> > >  	    -e "s%@TARGET_LDFLAGS@%$(HOST_MESON_SED_LDFLAGS)%g" \
> > >  	    -e "s%@TARGET_CXXFLAGS@%$(HOST_MESON_SED_CXXFLAGS)%g" \
> > > +	    -e "s%@PKG_TARGET_CFLAGS@%%g" \
> > > +	    -e "s%@PKG_TARGET_LDFLAGS@%%g" \
> > > +	    -e "s%@PKG_TARGET_CXXFLAGS@%%g" \  
> > 
> > Actually, if someone wants to use that file outside of Buildroot, and
> > also happend to need to pass special C/LD/CXXFLAGS for their package,
> > how are they expected to do so? Can't we just install it as a template
                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > too?
    ^^^^
> 
> If we keep @PKG_TARGET_CFLAGS@, @PKG_TARGET_LDFLAGS@, etc. in the
> cross-compilation.conf, then it is no longer usable as-is: users will
> _have_ to fixup those @PKG_TARGET_foo@, even if they don't need to pass
> additional CFLAGS to their package.
> 
> I think what Peter S. did here is the best we can do. A better solution
> would be for Meson to support command line provided cflags/ldflags, but
> that's not supported, and if it was supported, this whole patch
> wouldn't be necessary.

As I explained on IRC: we would install the file like Peter does, but
also install the template as well, so that:

  - packages that don't need extra flags can be built as-is

  - while for packages that do require extra flag, the user can use the
    template to generate a custom file

and thus we have the best of both worlds.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
