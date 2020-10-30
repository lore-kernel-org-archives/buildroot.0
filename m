From: Michael Nosthoff <buildroot@heine.tech>
Date: Fri, 30 Oct 2020 08:44:06 +0100
Subject: [Buildroot] 
 =?utf-8?q?=5BPATCH_1/3=5D_package/libabseil-cpp=3A_e?=
 =?utf-8?q?nforce_C++11?=
In-Reply-To: <20201029233600.4b2c8bd8@windsurf.home>
Message-ID: <4e-5f9bc480-3-3a765b40@171143166>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
 
On Thursday, October 29, 2020 23:36 CET, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote: 
 
> On Tue, 27 Oct 2020 18:40:44 +0100
> Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:
> 
> > From: Michael Nosthoff <buildroot@heine.tech>
> > 
> > For gcc < 6 the c++ default is 98. Abseil needs@least 11
> > but doesn't enforce this anymore. So we need to do this.
> > 
> > Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
> 
> Is this fixing a build issue? What was the thing that made you write
> this patch?
> 

I had the links to the broken autobuilders in the Cover letter. Should I put them in the commit instead?

> > +# abseil needs c++ >= 11 but doesn't set this anymore,
> > +# before gcc6 the default is 98.
> > +ifeq ($(BR2_GCC_AT_LEAST_6_0),)
> > +LIBABSEIL_CPP_CONF_OPTS += -DCMAKE_CXX_STANDARD=11
> > +endif
> > +
> > +ifeq ($(BR2_HOST_GCC_AT_LEAST_6_0),)
> > +HOST_LIBABSEIL_CPP_CONF_OPTS += -DCMAKE_CXX_STANDARD=11
> > +endif
> 
> Can we do it unconditionally ?

Sure, that was the fallback before (In the CMakeLists). And grpc also just sets C++11 as fallback.

I just thought that, as abseil is all about "bringing newer C++ features to older C++ versions", it would make sense to build it with C++14/17 when it's the compilers default.
But as grpc is also built with "only" C++11 this might not be the best idea in the first place.

Regards,
Michael
