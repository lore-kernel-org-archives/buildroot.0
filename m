From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Mon, 27 Dec 2010 22:43:09 +0100
Subject: [Buildroot] continued issues with AR
In-Reply-To: <20101226081522.9979373ky6jfze80@www.home.zuerker.org>
References: <20101225102011.66586l6anzqeak0s@www.home.zuerker.org>
	<1293296176.4625.87.camel@coalu.atr>
	<20101226081522.9979373ky6jfze80@www.home.zuerker.org>
Message-ID: <1293486189.18257.30.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dimanche 26 d?cembre 2010 ? 08:15 -0600, Heiko Zuerker a ?crit :
> Quoting Lionel Landwerlin <llandwerlin@gmail.com>:
> 
> > Le samedi 25 d?cembre 2010 ? 10:20 -0600, Heiko Zuerker a ?crit :
> >> Hey,
> >>
> >> it seems like I keep running into issues where it tries to use my
> >> local ar, instead of the one from the external toolchain.
> >> I'm not familiar with the workings behind the scenes of buildroot, but
> >> is it possible that something is missing somewhere?
> >> Do we need to always set i.e. AR=$(TARGET_AR) ?
> >> Could the same be happening for other files like ld,gcc and so on?
> >>
> >
> > Yup,
> >
> > As some others packages, lvm2 does not use automake. So makefiles
> > remains mostly "hand written"...
> >
> > With fully autotooled packages, we define CC/AR/LD/etc... variables at
> > configure time, so the configure script generates the makefiles with
> > proper CC/AR/LD/etc... variables definitions.
> > With semi autotooled packages as lvm2, we rely on what as been written
> > by the lvm2 developers.
> >
> > One solution could be to define a kind of Makefile.half.autotool.in top
> > makefile to handle these specials cases (which do not seem that special
> > after all), in which we would define AR/CC/LD/etc... at build time (most
> > of them are defined in TARGET_CONFIGURE_OPTS already).
> >
> > What do you think ?
> 
> Wouldn't it make sense to always define the variables, using a subset  
> of TARGET_CONFIGURE_OPTS? Don't we always need them to point to the  
> cross compiler?

It really depends on the package's makefiles... Take zlib for example,
even if it does not use autoconf and automake, at build time, it still
uses the CC/AR/LD variables given at configure time.

I'm not sure about the right solution to this problem (the
TARGET_CONFIGURE_OPTS subset looks simpler)... Maybe someone knows why
we don't use to set CC/AR/etc... at build time ?

> 
> Or maybe some configuration variable you could specify in the  
> Makefile, which then takes care of all the magic.

Some makefile uses a CROSS prefix to set all the CC/AR/etc... variables.
I think it's a good idea, but I don't think we can afford to teach every
single developer how to write its makefiles.

After all, that's what autotools are made for, hide you all the
complicated/tedious/boring stuff like that and let you express in a
simple way what you want to build.

Regards,

--
Lionel Landwerlin
