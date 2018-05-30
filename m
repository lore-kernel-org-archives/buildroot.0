From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 May 2018 23:07:38 +0200
Subject: [Buildroot] [PATCH v2] toolchain: GCC bug 85180
In-Reply-To: <CANQCQpbxzzgaJQ-TVMK=vT=gsDV2NS3Ta-bVXLK1_M2-bfz2=A@mail.gmail.com>
References: <1527521710-3889-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20180528212932.297eadf7@windsurf.home>
 <CANQCQpZCxiHy34M-V3Suf+N+C=EgAYPTwSYd7RBRVCc11hZssg@mail.gmail.com>
 <CANQCQpZTLyWT29JqqAYz0RsGwA-mWBNFZ_0qapkEqiG3GisEww@mail.gmail.com>
 <20180528224102.423ce611@windsurf.home>
 <CANQCQpbxzzgaJQ-TVMK=vT=gsDV2NS3Ta-bVXLK1_M2-bfz2=A@mail.gmail.com>
Message-ID: <9b0b794c-16e0-460c-32be-38ee2ce79949@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-05-18 23:41, Matthew Weber wrote:
> Thomas,
> 
> On Mon, May 28, 2018 at 3:41 PM, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>> Hello,
>>
>> On Mon, 28 May 2018 15:05:44 -0500, Matthew Weber wrote:
>>
>>>> I tried O0/1/2 without luck.  I just checked though that they were
>>>> actually being used in the verbose boost output and turns out boost is
>>>> forcing a O3 as the last O value in the flags.  So there's a bug....
>>>> I'll see if I can reasonably fix that  and retest.
>>>>
>>>
>>> Looks like there is a bjam property which can be set.  Is this
>>> something we want tweak?  I did a quick test after applying the patch
>>> below and the build was successful.
>>>
>>> --- a/package/boost/boost.mk
>>> +++ b/package/boost/boost.mk
>>> @@ -90,6 +90,7 @@ endif
>>>
>>>  BOOST_OPTS += toolset=gcc \
>>>              threading=multi \
>>> +             optimization=off \
>>>              abi=$(BOOST_ABI) \
>>>              variant=$(if $(BR2_ENABLE_DEBUG),debug,release)
>>>
>>>
>>> I updated per the patch below (O3) and the build failed.  So it does
>>> look like disabling optimization works around the problem.  What's
>>> your thought going forward?  I can retest the other two packages to
>>> see if no optimization fixes them too?
>>
>> Thanks for doing all those tests! Yes, it would be nice to retest if
>> the other packages can be built without optimizations. If that's the
>> case, we can simply disable optimizations for Microblaze for those few
>> packages. It's less annoying that having those additional dependencies
>> that we have to propagate to reverse dependencies.
>>
> 
> Looks like all 3 can build when optimization is set to 0 (off).
> However none of them use the flag we provide and hardcode to either
> O2/3 (I had to manually rework the packages to set the O0 for
> testing).  Assuming this GCC bug patch is probably the way to go at
> this point?
> 
> Is this something that would be resolved when/if we rework the gcc
> wrapper and how we manage flags?

 I think that for optimisation (and debug, and ssp, ...) flags it should be
possible for packages to disable them. Some packages may not work at some
optimisation levels, or they need debug info for some reason, or ... I think
that if we put the optimisation flags inside the wrapper, it will be very hard
for packages to override them. In particular, I think there are some
combinations (e.g. '-Os -O2') that have a different effect than having an
optimisation option by itself. So putting the optimisation options inside the
wrapper may not be the right thing to do.

 Also, if a package explicitly passes some optimisation flag, like boost is
doing here, whatever we do in the wrapper is not going to have any effect
(because the externally passed options come after the wrapper options). So
putting it in the wrapper is definitely not a silver bullet.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
