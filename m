From: Julien Letessier <julien.letessier@technosens.fr>
Date: Tue, 10 Jul 2007 13:51:52 +0200
Subject: [Buildroot] $(TARGET_CONFIGURE_OPTS) $(MAKE) vs $(MAKE)
	$(TARGET_CONFIGURE_OPTS)
In-Reply-To: <20070709163358.GA23895@aon.at>
References: <20070707130132.GU4096@aon.at> <20070707172925.GV4096@aon.at>
	<1183837025.19912.17.camel@elrond.sweden.atmel.com>
	<20070707211606.GZ4096@aon.at>
	<05fb01c7c0e9$275c45a0$dcc4af0a@atmel.com>
	<20070709082550.GA19774@aon.at> <20070709092108.GA20627@aon.at>
	<20070709122041.GA30238@real.realitydiluted.com>
	<f0528b5b0707090641j2bd8c39ap101012d7716ba67b@mail.gmail.com>
	<20070709163358.GA23895@aon.at>
Message-ID: <f0528b5b0707100451h758a3c44w8e1ba12dacd591bf@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2007/7/9, Bernhard Fischer <rep.dot.nop@gmail.com>:

>So IMO,
> >  $(MAKE) -C $(FOO_DIR) $(TARGET_CONFIGURE_OPTS)
> >will almost always break such a package. Even packages that just
> >  $(MAKE) -C $(FOO_DIR) CC=$(TARGET_CC)
> >break more often than not.
>
> yes. we should not change stuff after the configure stage.


Agreed.
IMO no vars should be passed to $(MAKE) unless mandatory (e.g.
INSTALL_DIR=$(STAGING_DIR)/usr)


>>> 2) CFLAGS are wrong as CXXFLAGS
> >>>
> >>So when compiling C++ code, and if I want the -Os and other options,
> >>how do you suggest we pass them.
>
> Unfortunately we will have to have TARGET_CXXFLAGS or filter out flags
> from CFLAGS that are rejected by the CXX compiler. The latter is of
> course ugly and will most likely not work reliably.
> I do not see a viable alternative to TARGET_CXXFLAGS (or fortran, ada,
> java, objc, you-name-it for that matter).



Agreed. One set of flags per compiler is perfectly reasonable.


>>A number of packages break unless the above is done. By overriding
> >>CFLAGS in the top-level makefile, CFLAGS in packages themselves get
> >>overridden and fail to build. Essentially if you do not like the
> >>method above, then a bunch of packages will need to be changed in
> >>order to work properly with CFLAGS be specified at the very top.
>
> Patching the affected packages is cumbersome and complicates
> maintenance. Just thinking loud.. what about patching the cross-compiler
> to use -Os unconditionally for any or no -O? Not really nice either, i
> fear. The native compiler would not be affected by this.
>
> What do you think?
>

Again, IMO very few (~10) packages will need to be fixed, so I'd prefer
patching the packages themselves. Besides, most of them *are* fixed already.

If the only flag problem is the -O* problem, fixing the cross-compiler might
be an option... except that GCC (especially the 4.2 branch) has a lot of
regressions with -Os. Even though no bad code will be generated (AFAIK),
some sources will crash the compiler, others will take any non-reasonable
amount of time/memory to compile. E.g. xf86ScanPci.c in the X server
requires >5GB of memory and about forever to compile on my build host with
-Os (for no apparent reason).

Besides, there are other flags to take care of... once we've started a list
of flags to 'force' gcc to use, this will never be over. Why not forcing the
compiler to use -mcpu=$(SUBARCH), -g, ad lib.

Cheers,
-- 
Julien Letessier
<julien.letessier@technosens.fr>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070710/2629ef82/attachment.htm 
