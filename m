From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Oct 2020 09:15:22 +0100
Subject: [Buildroot] [PATCH 1/3]  package/libabseil-cpp: enforce C++11
In-Reply-To: <4e-5f9bc480-3-3a765b40@171143166>
References: <20201029233600.4b2c8bd8@windsurf.home>
 <4e-5f9bc480-3-3a765b40@171143166>
Message-ID: <20201030091522.53c77303@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 30 Oct 2020 08:44:06 +0100
"Michael Nosthoff" <buildroot@heine.tech> wrote:

> > Is this fixing a build issue? What was the thing that made you write
> > this patch?
> 
> I had the links to the broken autobuilders in the Cover letter. Should I put them in the commit instead?

Sorry, I had missed the cover letters, since I'm mainly looking at
patches through patchwork. And yes, the link to the autobuilder failure
should be in the commit log, like this:

Fixes:

  http://autobuild.buildroot.org/...

> > > +# abseil needs c++ >= 11 but doesn't set this anymore,
> > > +# before gcc6 the default is 98.
> > > +ifeq ($(BR2_GCC_AT_LEAST_6_0),)
> > > +LIBABSEIL_CPP_CONF_OPTS += -DCMAKE_CXX_STANDARD=11
> > > +endif
> > > +
> > > +ifeq ($(BR2_HOST_GCC_AT_LEAST_6_0),)
> > > +HOST_LIBABSEIL_CPP_CONF_OPTS += -DCMAKE_CXX_STANDARD=11
> > > +endif  
> > 
> > Can we do it unconditionally ?  
> 
> Sure, that was the fallback before (In the CMakeLists). And grpc also just sets C++11 as fallback.
> 
> I just thought that, as abseil is all about "bringing newer C++
> features to older C++ versions", it would make sense to build it with
> C++14/17 when it's the compilers default. But as grpc is also built
> with "only" C++11 this might not be the best idea in the first place.

In fact, let's turn this around: if abseil uses C++11 features, then it
should by itself pass -std=c++11 to the compiler, by setting the
appropriate CXX_STANDARD in its CMakeLists.txt. There is no reason
Buildroot should have to help here. So isn't an abseil CMakeLists.txt
fix (submitted upstream) more appropriate here ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
