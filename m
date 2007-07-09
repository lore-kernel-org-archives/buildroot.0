From: Julien Letessier <julien.letessier@technosens.fr>
Date: Mon, 9 Jul 2007 15:41:35 +0200
Subject: [Buildroot] $(TARGET_CONFIGURE_OPTS) $(MAKE) vs $(MAKE)
	$(TARGET_CONFIGURE_OPTS)
In-Reply-To: <20070709122041.GA30238@real.realitydiluted.com>
References: <20070706155558.GA18954@real.realitydiluted.com>
	<20070707130132.GU4096@aon.at>
	<1183824383.19912.5.camel@elrond.sweden.atmel.com>
	<20070707172925.GV4096@aon.at>
	<1183837025.19912.17.camel@elrond.sweden.atmel.com>
	<20070707211606.GZ4096@aon.at>
	<05fb01c7c0e9$275c45a0$dcc4af0a@atmel.com>
	<20070709082550.GA19774@aon.at> <20070709092108.GA20627@aon.at>
	<20070709122041.GA30238@real.realitydiluted.com>
Message-ID: <f0528b5b0707090641j2bd8c39ap101012d7716ba67b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm following the discussion and would like to make a point:
all of this is irrelevant for packages that use the GNU auto* tools properly
(i.e. a whole lot of packages).

Their configure script uses the TARGET_CONFIGURE_OPTS to generate correct
makefiles, and no flags should thereafter be passed to $(MAKE) directly (or
they'll break).
So IMO,
   $(MAKE) -C $(FOO_DIR) $(TARGET_CONFIGURE_OPTS)
will almost always break such a package. Even packages that just
   $(MAKE) -C $(FOO_DIR) CC=$(TARGET_CC)
break more often than not.

The whole discussion is only relevant for packages (like openssh) that do
*not* use the GNU build system.
Again, IMHO, such packages should be fixed using patches instead of trying
to coerce buildroot into building them with a common method, e.g. by
changing
   CC = gcc
   CFLAGS = -g -O2 -I./whatever
in such packages into
   CC = $(TARGET_CC)
   CFLAGS = $(TARGET_CFLAGS) -I./whatever
using a patch, on a case-by-case basis. Again, I feel that packages that
require this are scarse.


My 2/100 euros.
-- ju

2007/7/9, Steven J. Hill <sjhill@realitydiluted.com>:
>
> > This hunk of yours is really broken:
> > TARGET_CONFIGURE_OPTS=... \
> >                 CC="$(TARGET_CROSS)gcc $(TARGET_CFLAGS)" \
> >                 GCC="$(TARGET_CROSS)gcc $(TARGET_CFLAGS)" \
> >                 CXX="$(TARGET_CROSS)g++ $(TARGET_CFLAGS)" \
> >                 CPP="$(TARGET_CROSS)cpp $(TARGET_CFLAGS)" \
> >
> > 1) These are the compilers and not compiler plus flags.
> >
> See comment below about packages breaking.
>
> > 2) CFLAGS are wrong as CXXFLAGS
> >
> So when compiling C++ code, and if I want the -Os and other options,
> how do you suggest we pass them.
>
> > 3) since your change we end up using the default flags from the
> > packages, which more often than not default to -O2. Let me refer you to
> > options.c of gcc (or the respective docs for the gory details).
> >
> Thanks, I am able to read code.
>
> > I am going to revert this change for now. What were you trying to
> > do/solve?
> >
> A number of packages break unless the above is done. By overriding
> CFLAGS in the top-level makefile, CFLAGS in packages themselves get
> overridden and fail to build. Essentially if you do not like the
> method above, then a bunch of packages will need to be changed in
> order to work properly with CFLAGS be specified at the very top.
>
> -Steve
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>



-- 
Julien Letessier
<julien.letessier@technosens.fr>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070709/16e56ae1/attachment.htm 
