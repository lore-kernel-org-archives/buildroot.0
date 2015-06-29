From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 29 Jun 2015 10:35:24 +0200
Subject: [Buildroot] [RFC v4 00/16] Add per-package staging feature
In-Reply-To: <20150628212522.GH3950@free.fr>
References: <1435520570-20332-1-git-send-email-fabio.porcedda@gmail.com>
 <20150628204622.GE3950@free.fr> <20150628230002.608893c0@free-electrons.com>
 <20150628212522.GH3950@free.fr>
Message-ID: <CAHkwnC9Jk+xBu4VHgSZKueMPd0jJP2=3cWOvT0rcofd2ggDogw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 28, 2015 at 11:25 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, Fabio, All,
>
> On 2015-06-28 23:00 +0200, Thomas Petazzoni spake thusly:
>> On Sun, 28 Jun 2015 22:46:22 +0200, Yann E. MORIN wrote:
>> > So, I'm really a bit skeptical. About five time the size for only about
>> > twice the speedup, is it worth it? Sure some people will easily favour
>> > speed over anything else, still the size overhead is really huge.
>>
>> Do you reconsider this comment now that you know the reality about the
>> size impact ? :-)
>
> Hehe! ;-)
>
> Of course, ~5% size overhead for 2+ times the speedup is totally
> acceptable.
>
>> > Otherwise, I have a 2x4 core Xeon @3.4GHz with three SSDs in RAID0 which
>> > might be better as a HW_HIGH system. I can spin a test-build with this
>> > patchset on this machine to see what we get...

Nice machine :)
It have less cores but at higher frequency and it have three SSD in RAID0!
I'm curious to know how much faster is it.

I think the bottleneck on my HW-HIGH is the hard disk.

>> Would definitely be useful. Maybe Fabio can provide you his
>> defconfig-full test case (he gave the defconfig-small case).
>
> Fabio, if you could share your two defconfig (or .config) files, that'd
> be great!

Configs:
https://www.dropbox.com/s/tmdzhluxv69fdib/arm_external_longchaindep_defconfig?dl=0
https://www.dropbox.com/s/9ntz73wo5ua80k9/arm_external_allyespackageconfig_defconfig?dl=0

Branch with this patch set:
   https://github.com/fabio-porcedda/buildroot/tree/pps-v4

Branch without this patch set, on which this patch set was applied, it
has already all the patches for using top-level-parallel make:
   https://github.com/fabio-porcedda/buildroot/tree/pps-v4-base

Before testing the pps-v4 branch or enabling the top-level make i
suggest to test the  arm_external_allyespackageconfig_defconfig to
find if all packages builds on your machine, this defconfig builds
fine on a Fedora 22 and Ubuntu 14.04 (using gnu make 4.1 built from
source).

Command line for testing "arm_external_allyespackageconfig_defconfig"
enabling top-level parallel make:

{ time { b="make -j$((`nproc`+1)) -Orecurse -s" && $b libevas
gst1-plugins-base gst1-plugins-ugly && $b && echo Build OK; }; } 2>&1
| tee log

Pay attention to the fact that the packages "libevas"
"gst1-plugins-base" "gst1-plugins-ugly" must be built for first
otherwise they fail to build (I did not have enough time to analyze
the problem or check if using pps help on this matter).

Thanks
-- 
Fabio Porcedda
