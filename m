From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 9 Aug 2016 21:48:13 +0200
Subject: [Buildroot] [PATCH 1/1] libical: Create option to use builtin
 tzdata
In-Reply-To: <20160809155550.GF845@tarshish>
References: <1470751327-64254-1-git-send-email-marc@khouri.ca>
 <20160809155550.GF845@tarshish>
Message-ID: <20160809194813.GD5779@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marc, Baruch, All,

On 2016-08-09 18:55 +0300, Baruch Siach spake thusly:
> On Tue, Aug 09, 2016 at 10:02:07AM -0400, Marc Khouri wrote:
> > libical requires time zone data (either system or internal) in order
> > to use time zone related functions. This commit adds an option to
> > build libical with its internal time zone data. If no time zone data
> > is present, segfaults occur in applications which use time zone functions.
> > 
> > Option documentation:
> > https://github.com/libical/libical/blob/v1.0.1/CMakeLists.txt#L23
> > 
> > Signed-off-by: Marc Khouri <marc@khouri.ca>
> > ---
> >  package/libical/Config.in  | 12 ++++++++++++
> >  package/libical/libical.mk |  4 ++++
> >  2 files changed, 16 insertions(+)
> > 
> > diff --git a/package/libical/Config.in b/package/libical/Config.in
> > index 48170e9..e183ad0 100644
> > --- a/package/libical/Config.in
> > +++ b/package/libical/Config.in
> > @@ -9,6 +9,18 @@ config BR2_PACKAGE_LIBICAL
> >  
> >  	  http://libical.github.io/libical
> >  
> > +if BR2_PACKAGE_LIBICAL
> > +
> > +config BR2_PACKAGE_LIBICAL_BUILTIN_TZDATA
> > +	bool "use built-in timezone data"
> > +	help
> > +	  Build using libical's (instead of the system's) timezone data.
> > +
> > +	  libical requires either built-in or system timezone data in order
> > +	  to support time zone functions.
> > +
> > +endif
> > +
> >  comment "libical needs a toolchain w/ C++, dynamic library, wchar"
> >  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
> >  		BR2_STATIC_LIBS
> > diff --git a/package/libical/libical.mk b/package/libical/libical.mk
> > index e8cb3f8..a8bcefb 100644
> > --- a/package/libical/libical.mk
> > +++ b/package/libical/libical.mk
> > @@ -14,4 +14,8 @@ LIBICAL_LICENSE_FILES = LICENSE
> >  # Gentoo/alpinelinux as well
> >  LIBICAL_CONF_OPTS = -DSHARED_ONLY=true
> >  
> > +ifeq ($(BR2_PACKAGE_LIBICAL_BUILTIN_TZDATA),y)
> > +LIBICAL_CONF_OPTS += -DUSE_BUILTIN_TZDATA=true
> > +endif
> 
> Why not detect this automatically? Something like (untested):
> 
> ifeq ($(BR2_PACKAGE_TZDATA),)
> LIBICAL_CONF_OPTS += -DUSE_BUILTIN_TZDATA=true
> endif

I am not too fond of using bundle stuff when we already have the
required support for it. So, if libical needs TZ info, forcibly enable
it (or depend on it).

The only gotcha is that we don;t install TZ for musl. However, from the
look of it, it should be ready to support tzdata, so our current
limitation is probably just incorrect. I'm trying to confirm that.

In the meantime, you should select BR2_TARGET_TZ_INFO from the libical
Config.in, but only if not musl. And in the .mk, use the suggestion by
Baruch.

So:

    Config.in:

        config BR2_PACKAGE_LIBICAL
            bool "libical"
            depends on blabla
            select BR2_TARGET_TZ_INFO if BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC

    libical.mk:

        ifeq ($(BR2_TARGET_TZ_INFO),)
        LIBICAL_CONF_OPTS += -DUSE_BUILTIN_TZDATA=true
        endif

Which means that on glibc or uClibc, we'd rely on the system-wide
tzdata, but on musl we'd use the bundled one.

Regards,
Yann E. MORIN.

> baruch
> 
> -- 
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
