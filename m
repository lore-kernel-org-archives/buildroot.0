From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 May 2018 22:41:02 +0200
Subject: [Buildroot] [PATCH v2] toolchain: GCC bug 85180
In-Reply-To: <CANQCQpZTLyWT29JqqAYz0RsGwA-mWBNFZ_0qapkEqiG3GisEww@mail.gmail.com>
References: <1527521710-3889-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20180528212932.297eadf7@windsurf.home>
 <CANQCQpZCxiHy34M-V3Suf+N+C=EgAYPTwSYd7RBRVCc11hZssg@mail.gmail.com>
 <CANQCQpZTLyWT29JqqAYz0RsGwA-mWBNFZ_0qapkEqiG3GisEww@mail.gmail.com>
Message-ID: <20180528224102.423ce611@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 May 2018 15:05:44 -0500, Matthew Weber wrote:

> > I tried O0/1/2 without luck.  I just checked though that they were
> > actually being used in the verbose boost output and turns out boost is
> > forcing a O3 as the last O value in the flags.  So there's a bug....
> > I'll see if I can reasonably fix that  and retest.
> >  
> 
> Looks like there is a bjam property which can be set.  Is this
> something we want tweak?  I did a quick test after applying the patch
> below and the build was successful.
> 
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -90,6 +90,7 @@ endif
> 
>  BOOST_OPTS += toolset=gcc \
>              threading=multi \
> +             optimization=off \
>              abi=$(BOOST_ABI) \
>              variant=$(if $(BR2_ENABLE_DEBUG),debug,release)
> 
> 
> I updated per the patch below (O3) and the build failed.  So it does
> look like disabling optimization works around the problem.  What's
> your thought going forward?  I can retest the other two packages to
> see if no optimization fixes them too?

Thanks for doing all those tests! Yes, it would be nice to retest if
the other packages can be built without optimizations. If that's the
case, we can simply disable optimizations for Microblaze for those few
packages. It's less annoying that having those additional dependencies
that we have to propagate to reverse dependencies.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
