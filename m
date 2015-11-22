From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Nov 2015 22:02:40 +0100
Subject: [Buildroot] [PATCH 3/3] package/gcc: align gcc-final
 configure-cmds to the generic ones
In-Reply-To: <56522CB7.3000807@mind.be>
References: <cover.1448202976.git.yann.morin.1998@free.fr>
 <4d9f7a6896c496372a4f415987e60eeeac79225b.1448202976.git.yann.morin.1998@free.fr>
 <56522CB7.3000807@mind.be>
Message-ID: <20151122210240.GC3603@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-11-22 21:59 +0100, Arnout Vandecappelle spake thusly:
> On 22-11-15 15:39, Yann E. MORIN wrote:
> > Since 7d6c79 (Compile static versions of gcc libraries) was applied, the
> > generic configure commands have been updated, but those changes have not
> > been propagated to the gcc-final custom configure commands.
> > 
> > Update the gcc-final custom configure commands to better match the
> > generic ones.
> > 
> > We do not propagate --disable-dependency-tracking because it breaks the
> > build, and --enable-shared (because of 169141a).
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  package/gcc/gcc-final/gcc-final.mk | 25 ++++++++++++++++++++-----
> >  1 file changed, 20 insertions(+), 5 deletions(-)
> > 
> > diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> > index dbdb615..53199c3 100644
> > --- a/package/gcc/gcc-final/gcc-final.mk
> > +++ b/package/gcc/gcc-final/gcc-final.mk
> > @@ -36,16 +36,31 @@ HOST_GCC_FINAL_PRE_CONFIGURE_HOOKS += HOST_GCC_CONFIGURE_SYMLINK
> >  #
> >  # So we must completely override the generic commands and provide our own.
> >  #
> > +# Except for --disable-dependency-tracking which breaks the build, and
> > +# --enable-shared (see 169141a, gcc-final: disable shared build for
> > +# static), we reproduce the exact same command as the autotools infra
> > +# uses.
> > +#
> >  define  HOST_GCC_FINAL_CONFIGURE_CMDS
> >  	(cd $(HOST_GCC_FINAL_SRCDIR) && rm -rf config.cache; \
> > -		$(HOST_CONFIGURE_OPTS) \
> > -		CFLAGS="$(HOST_CFLAGS)" \
> > -		LDFLAGS="$(HOST_LDFLAGS)" \
> > -		$(HOST_GCC_FINAL_CONF_ENV) \
> > -		./configure \
> > +	$(HOST_CONFIGURE_OPTS) \
> > +	CFLAGS="$(HOST_CFLAGS)" \
> > +	LDFLAGS="$(HOST_LDFLAGS)" \
> > +	$(HOST_GCC_FINAL_CONF_ENV) \
> 
>  I do agree with the whitespace change.
> 
> > +	CONFIG_SITE=/dev/null \
> 
>  This makes sense to me as well.
> 
> > +	./configure \
> >  		--prefix="$(HOST_DIR)/usr" \
> >  		--sysconfdir="$(HOST_DIR)/etc" \
> > +		--localstatedir="$(HOST_DIR)/var" \
> 
>  This one is pointless but harmless.
> 
> >  		--enable-static \
> > +		--disable-gtk-doc \
> > +		--disable-gtk-doc-html \
> > +		--disable-doc \
> > +		--disable-docs \
> > +		--disable-documentation \
> > +		--disable-debug \
> > +		--with-xmlto=no \
> > +		--with-fop=no \
> 
>  But all of this gains us nothing IMHO, and is in a way harmful because it will
> produce warnings. We accept those warnings for the generic configure commands
> because it gives us the advantage of avoiding that we forget to add them when
> creating a package, but in this case I really don't see the point.

The point is to diverge as little as possible from the generic command.

Even if some options are useless, or cause the same warning as if we
were using the generic command, they are replicated here. Only those
options we really do not want are omitted.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
