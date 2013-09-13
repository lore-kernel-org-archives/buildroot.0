From: Ruud Commandeur <RCommandeur@clb.nl>
Date: Fri, 13 Sep 2013 13:20:59 +0200
Subject: [Buildroot] C++ Compiling
References: <15AE5A936F5E3A42A9144E66875A0A8934DC07@server1-derijp.CLB-Benelux.lokaal><CAGm1_kvR5zLfHRrcnKmoTSetC9SsiqOj2=xV2Xxa1502CkC8KA@mail.gmail.com><15AE5A936F5E3A42A9144E66875A0A8934DC0F@server1-derijp.CLB-Benelux.lokaal>
 <87li31noih.fsf@dell.be.48ers.dk>
Message-ID: <15AE5A936F5E3A42A9144E66875A0A8934DC1C@server1-derijp.CLB-Benelux.lokaal>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 

> -----Oorspronkelijk bericht-----
> Van: Peter Korsgaard [mailto:jacmet at gmail.com] Namens Peter Korsgaard
> Verzonden: vrijdag 13 september 2013 9:56
> Aan: Ruud Commandeur
> CC: Yegor Yefremov; buildroot at uclibc.org
> Onderwerp: Re: C++ Compiling
> 
> >>>>> "Ruud" == Ruud Commandeur <RCommandeur@clb.nl> writes:
> 
> Hi,
> 
>  Ruud> OK, I did not think of using CMake yet. Since Boost is 
> mostly header
>  Ruud> files, I thought it would be no different from my other simple
>  Ruud> C-application. I build this with a generic-package like this:
> 
>  Ruud> define CLB_TEST_APP_BUILD_CMDS
>  Ruud> 	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
> 
> Presumably you need to pass CXX="$(TARGET_CXX)" or even 
> better just use
> TARGET_CONFIGURE_OPTS that set them all.
> 
> -- 
> Bye, Peter Korsgaard
> 

Thank you both for pointing me in the right direction. It was indeed a
C/C++ issue.
I tried both the CXX and CONFIGURE_OPTS version. Since I had a package
with both
a .cpp and a .c target, I prefer the last one. With CXX it was my .c
target that was
built for a 386.

---------------------------clb-test-app.mk------------------------------
--
define CLB_TEST_APP_BUILD_CMDS
#	$(MAKE) CXX="$(TARGET_CXX)" LD="$(TARGET_LD)" -C $(@D) all
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef
------------------------------------------------------------------------
--

Anyway, this is all Makefile stuff at which I'm still not an expert
after 20 years of practice :-)
Well, at least not for the C++ part.

Specific for the boost-part I finally had to add 2 libraries for the
linking to succeed:

-----------------------------Makefile-----------------------------------
--
LDLIBS     += -lboost_system -lboost_filesystem

$(EXEC1): $(OBJS1)
	$(CC) $(LDFLAGS) -o $@ $(OBJS1)

$(EXEC2): $(OBJS2)
	$(CXX) $(LDFLAGS) -o $@ $(OBJS2) $(LDLIBS)
------------------------------------------------------------------------
--

Thanks,

Ruud
