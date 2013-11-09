From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 09 Nov 2013 17:46:07 -0300
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131109191543.414f5694@skate>
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
 <20131109191543.414f5694@skate>
Message-ID: <527E9F0F.9010206@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/09/2013 03:15 PM, Thomas Petazzoni wrote:

>>     x86_64 |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/5d163e750808f2fdd8098cb58240bada12b770a9/
>>   mips64el |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/038340dfbbbedbcfcb98ad5dbf828bc03fe26af6/
> 
> Weird compilation problem, seems really caused by an issue in
> protobuf-c itself. Gustavo, you're the one who added protobuf-c, can
> you have a look at this?

What's the host gcc version / distribution?
I suspect that's at work since the only dep for protobuf-c is
host-protobuf and the host toolchain.

>>        arm |                  mplayer-1.1.1 | NOK | http://autobuild.buildroot.net/results/8f946e28b11b2ab1ba0d9688286c665488de0486/
> 
> libmpeg2/motion_comp_arm_s.S: Assembler messages:
> libmpeg2/motion_comp_arm_s.S:29: Error: selected processor does not support ARM mode `pld [r1]'
> libmpeg2/motion_comp_arm_s.S:39: Error: selected processor does not support ARM mode `pld [r1]'
> 
> That's an ARMv4t configuration. Maybe building mplayer on ARMv4t is not
> possible. Adding a bunch of depends on !BR2_arm<something> is probably
> the solution here. Gustavo, maybe?

Likely the best option, there's probably not much point in using mplayer
on anything lower than ARMv6 IMHO (or maybe v5 with hard FP) for
performance reasons.
I'll disable it for anything lower than v5.

>> microblaze |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/82acbea862ee0bb5288ab498d86772bc475d3a53/
>>        arm |                   nettle-2.7.1 | NOK | http://autobuild.buildroot.net/results/88ea0cc0815f865e1a144d39231fdc9b47e689b0/
> 
> On Microblaze, a compiler error. Should be fixed by the internal
> toolchain support for Microblaze. Waiting for Spenser on this :)
> 
> On ARM, the failure is due to nettle tests requiring C++ support. It
> would be good to disable the compilation of those tests. Gustavo,
> you're the one looking after nettle in general, can you look into this?

Actually it's a problem with static linking with C++ since the nettle
test that uses C++ is conditional on AC_PROG_CXX and works happily fine
without static linking.

The problem is that you're not handling static libs in
package/gcc/gcc-final/gcc-final.mk from HOST_GCC_FINAL_USR_LIBS, only
shared ones, hence libstdc++.a is missing since it's not copied anywhere
else (from the gcc packaging, might have been that way too before it).
No happy C++ for static users :(

Care to concoct a patch or shall i?

>>    aarch64 |                     php-5.3.27 | NOK | http://autobuild.buildroot.net/results/08d3255303f7ceda8a1ecfcf56ad665f00829632/
> 
> /usr/include/bits/predefs.h:20:3: error: #error "Never use <bits/predefs.h> directly; include <features.h> instead."
>  # error "Never use <bits/predefs.h> directly; include <features.h> instead."
> 
> Gustavo, you like PHP, no ? :-)

You keep assuming i like things because i tweak/touch them :)
PHP isn't to blame here, don't pick on the big kid, predefs.h isn't even
mentioned in any of the files of the whole php tarball.
Guess it's the toolchain or some package that's used by php, i'll look
into it but really aarch64 on a gut feeling i'll say it's the toolchain.

Regards.
