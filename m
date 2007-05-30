From: Tom <fivemiletom@gmail.com>
Date: Wed, 30 May 2007 09:03:11 -0700
Subject: [Buildroot] mpfr error on cygwin for arm
In-Reply-To: <20070530094734.GD20055@aon.at>
References: <4656F77D.30303@teamboyce.co.uk> <465737B9.8070008@gmail.com>
	<20070525200333.GT24585@aon.at> <4657D933.8060109@gmail.com>
	<20070526094801.GC15885@aon.at> <465CEA84.70700@gmail.com>
	<20070530094734.GD20055@aon.at>
Message-ID: <465DA03F.7000809@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernhard,


will do changes below.

Bernhard Fischer wrote:
 > Better put this into the toolchain/Makefile.in, like:
 > +ifeq ($(BR2_PREFER_STATIC_LIB),y)
 > +BR2_SHARED_LIBS:=--enable-static --disable-shared
 > +else
 > +BR2_SHARED_LIBS:=--disable-static --enable-shared
 > +endif
 > and use ./configure $(BR2_SHARED_LIBS) ...

will try this.

 >
 >> +
 >> +ifeq ($(EXEEXT),".exe")
 >> +GMP_CPP_FLAGS:=-DDLL_EXPORT
 >> +else
 >> +GMP_CPP_FLAGS:=-DDLL_EXPORT
 >> +endif
 >
 > This can't be right.

True. The non-.exe case should be empty, sorry.

 > [snip]
 >
 >> buildroot.orig/toolchain_build_arm/uClibc-0.9.29/extra/config/Makefile
 >> 2007-04-17 04:38:21.000000000 -0700
 >> +++ buildroot/toolchain_build_arm/uClibc-0.9.29/extra/config/Makefile
 >> 2007-05-29 19:34:47.200380600 -0700
 >> @@ -21,7 +21,7 @@
 >> 	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@)
 >> $(HOST_LOADLIBES) $< -o $@
 >>
 >> $(host-cmulti): %: $(host-cobjs) $(host-cshlib)
 >> -	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@)
 >> $(HOST_LOADLIBES) $($@-objs) -o $@
 >> +	$(HOSTCC) $(HOST_EXTRACFLAGS) $(HOSTCFLAGS) $(HOSTCFLAGS_$@)
 >> $(HOST_LOADLIBES) $($@-objs) -lintl -o $@
 >
 > Shouldn't this libintel rather go into HOST_LOADLIBES for windows?

It seems there is an issue with the sequence. (Just moving this -lintl 
before the $($@-objs) caused it to fail.)
