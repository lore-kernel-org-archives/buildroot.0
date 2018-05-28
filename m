From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 28 May 2018 16:41:06 -0500
Subject: [Buildroot] [PATCH v2] toolchain: GCC bug 85180
In-Reply-To: <20180528224102.423ce611@windsurf.home>
References: <1527521710-3889-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20180528212932.297eadf7@windsurf.home>
 <CANQCQpZCxiHy34M-V3Suf+N+C=EgAYPTwSYd7RBRVCc11hZssg@mail.gmail.com>
 <CANQCQpZTLyWT29JqqAYz0RsGwA-mWBNFZ_0qapkEqiG3GisEww@mail.gmail.com>
 <20180528224102.423ce611@windsurf.home>
Message-ID: <CANQCQpbxzzgaJQ-TVMK=vT=gsDV2NS3Ta-bVXLK1_M2-bfz2=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, May 28, 2018 at 3:41 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Mon, 28 May 2018 15:05:44 -0500, Matthew Weber wrote:
>
>> > I tried O0/1/2 without luck.  I just checked though that they were
>> > actually being used in the verbose boost output and turns out boost is
>> > forcing a O3 as the last O value in the flags.  So there's a bug....
>> > I'll see if I can reasonably fix that  and retest.
>> >
>>
>> Looks like there is a bjam property which can be set.  Is this
>> something we want tweak?  I did a quick test after applying the patch
>> below and the build was successful.
>>
>> --- a/package/boost/boost.mk
>> +++ b/package/boost/boost.mk
>> @@ -90,6 +90,7 @@ endif
>>
>>  BOOST_OPTS += toolset=gcc \
>>              threading=multi \
>> +             optimization=off \
>>              abi=$(BOOST_ABI) \
>>              variant=$(if $(BR2_ENABLE_DEBUG),debug,release)
>>
>>
>> I updated per the patch below (O3) and the build failed.  So it does
>> look like disabling optimization works around the problem.  What's
>> your thought going forward?  I can retest the other two packages to
>> see if no optimization fixes them too?
>
> Thanks for doing all those tests! Yes, it would be nice to retest if
> the other packages can be built without optimizations. If that's the
> case, we can simply disable optimizations for Microblaze for those few
> packages. It's less annoying that having those additional dependencies
> that we have to propagate to reverse dependencies.
>

Looks like all 3 can build when optimization is set to 0 (off).
However none of them use the flag we provide and hardcode to either
O2/3 (I had to manually rework the packages to set the O0 for
testing).  Assuming this GCC bug patch is probably the way to go at
this point?

Is this something that would be resolved when/if we rework the gcc
wrapper and how we manage flags?

Matt
