From: Steven J. Hill <sjhill@realitydiluted.com>
Date: Mon, 9 Jul 2007 07:20:42 -0500
Subject: [Buildroot] $(TARGET_CONFIGURE_OPTS) $(MAKE) vs
	$(MAKE)	$(TARGET_CONFIGURE_OPTS)
In-Reply-To: <20070709092108.GA20627@aon.at>
References: <20070706155558.GA18954@real.realitydiluted.com>
	<000201c7c087$9e70d0a0$dcc4af0a@atmel.com>
	<20070707130132.GU4096@aon.at>
	<1183824383.19912.5.camel@elrond.sweden.atmel.com>
	<20070707172925.GV4096@aon.at>
	<1183837025.19912.17.camel@elrond.sweden.atmel.com>
	<20070707211606.GZ4096@aon.at>
	<05fb01c7c0e9$275c45a0$dcc4af0a@atmel.com>
	<20070709082550.GA19774@aon.at> <20070709092108.GA20627@aon.at>
Message-ID: <20070709122041.GA30238@real.realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> This hunk of yours is really broken:
> TARGET_CONFIGURE_OPTS=... \
>                 CC="$(TARGET_CROSS)gcc $(TARGET_CFLAGS)" \
>                 GCC="$(TARGET_CROSS)gcc $(TARGET_CFLAGS)" \
>                 CXX="$(TARGET_CROSS)g++ $(TARGET_CFLAGS)" \
>                 CPP="$(TARGET_CROSS)cpp $(TARGET_CFLAGS)" \
> 
> 1) These are the compilers and not compiler plus flags.
>
See comment below about packages breaking.

> 2) CFLAGS are wrong as CXXFLAGS
>
So when compiling C++ code, and if I want the -Os and other options,
how do you suggest we pass them.

> 3) since your change we end up using the default flags from the
> packages, which more often than not default to -O2. Let me refer you to
> options.c of gcc (or the respective docs for the gory details).
> 
Thanks, I am able to read code.

> I am going to revert this change for now. What were you trying to
> do/solve?
>
A number of packages break unless the above is done. By overriding
CFLAGS in the top-level makefile, CFLAGS in packages themselves get
overridden and fail to build. Essentially if you do not like the
method above, then a bunch of packages will need to be changed in
order to work properly with CFLAGS be specified at the very top.

-Steve
