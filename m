From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 8 Nov 2018 23:20:08 +0100
Subject: [Buildroot] [PATCH v1 2/2] iwd: new package
In-Reply-To: <20181108221851.6e7cf9e5@windsurf.home>
References: <20181105220426.17194-1-ps.report@gmx.net>
 <20181105220426.17194-2-ps.report@gmx.net>
 <20181108221851.6e7cf9e5@windsurf.home>
Message-ID: <20181108232008.679e1642@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Thu, 8 Nov 2018 22:18:51 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Peter,
> 
> On Mon,  5 Nov 2018 23:04:26 +0100, Peter Seiderer wrote:
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/Config.in                             |  1 +
> >  ...til.c-add-missing-ell-utf8.h-include.patch | 46 +++++++++++++++++++
> >  ...cap.c-add-missing-sys-stat.h-include.patch | 46 +++++++++++++++++++
> >  ..._iwd_backtrace_init-availability-det.patch | 32 +++++++++++++
> >  package/iwd/Config.in                         | 14 ++++++
> >  package/iwd/iwd.hash                          |  5 ++
> >  package/iwd/iwd.mk                            | 46 +++++++++++++++++++  
> 
> Entry to DEVELOPERS file is missing.

O.k., will fix...

> 
> > +-#ifdef __GLIBC__
> > ++#if defined(__GLIBC__) && defined(HAVE_EXECINFO_H)  
> 
> The HAVE_EXECINFO_H check is sufficient, checking for __GLIBC__ in
> addition is not very useful.

Mhhh, wanted to keep the symmetry to src/backtrace.h halfway:

 22 #ifdef __GLIBC__
 23 void __iwd_backtrace_init();
 24 void __iwd_backtrace_print(unsigned int offset);
 25 #endif

Would changing this one to '#if defined(HAVE_EXECINFO_H)' o.k?

The header src/backtrace.h is only included from src/main.c
(after including config.h) and (unused) from plugins/ofono.c
(without including config.h)...

> plugins/ofono.c
> > diff --git a/package/iwd/Config.in b/package/iwd/Config.in
> > new file mode 100644
> > index 0000000000..c65e5e05d2
> > --- /dev/null
> > +++ b/package/iwd/Config.in
> > @@ -0,0 +1,14 @@
> > +config BR2_PACKAGE_IWD
> > +	bool "iwd"
> > +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # ell
> > +	depends on !BR2_STATIC_LIBS # ell
> > +	depends on BR2_USE_WCHAR # ell
> > +	select BR2_PACKAGE_ELL
> > +	help
> > +	  iNet Wireless daemon (iwd)
> > +
> > +	  https://iwd.wiki.kernel.org/
> > +
> > +comment "iwd needs a toolchain w/ dynamic library, wchar"
> > +	depends on BR2_STATIC_LIBS
> > +	depends on !BR2_USE_WCHAR  
> 
> This needs to be fixed, like I have done for the ell package.

O.k. will do (thanks for fixing it in the ell package)...

> 
> > +IWD_VERSION = 0.10
> > +IWD_SITE = https://git.kernel.org/pub/scm/network/wireless/iwd.git
> > +IWD_SITE_METHOD = git
> > +# iwd client depends on readline (GPL-3.0+)
> > +IWD_LICENSE = LGPL-2.1+, GPL-3.0+ (client)  
> 
> The , GPL-3.0+ (client) part could instead go...
> 
> > +ifeq ($(BR2_PACKAGE_READLINE),y)
> > +IWD_CONF_OPTS += --enable-client
> > +IWD_DEPENDENCIES += readline  
> 
> ... here, like this:
> 
> IWD_LICENSE := $(IWD_LICENSE), GPL-3.0+ (client)

O.k. will do...

> 
> However, with readline enabled, it doesn't build here:
> 
> In file included from /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/readline/history.h:35:0,
>                  from client/display.c:28:
> /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/readline/rltypedefs.h:71:28: error: unknown type name ?FILE?
>  typedef int rl_getc_func_t PARAMS((FILE *));
>                             ^
> /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/readline/readline.h:429:20: error: unknown type name ?FILE?
>  extern int rl_getc PARAMS((FILE *));
>                     ^
> In file included from client/display.c:29:0:
> /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/readline/readline.h:558:8: error: unknown type name ?FILE?
>  extern FILE *rl_instream;
>         ^
> /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/readline/readline.h:559:8: error: unknown type name ?FILE?
>  extern FILE *rl_outstream;
>         ^
> /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/readline/readline.h:588:8: error: unknown type name ?rl_getc_func_t?
>  extern rl_getc_func_t *rl_getc_function;
>         ^
> /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/readline/readline.h:917:3: error: unknown type name ?FILE?
>    FILE *inf;
>    ^
> /home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/readline/readline.h:918:3: error: unknown type name ?FILE?
>    FILE *outf;
>    ^
> make[3]: *** [Makefile:1878: client/display.o] Error 1
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [Makefile:1187: all] Error 2
> make[1]: *** [package/pkg-generic.mk:232: /home/thomas/projets/buildroot/output/build/iwd-0.10/.stamp_built] Error 2
> make: *** [Makefile:84: _all] Error 2

Did not happen here, mind to share your defconfig?

Regards,
Peter

> 
> Best regards,
> 
> Thomas
