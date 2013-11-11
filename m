From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Mon, 11 Nov 2013 09:21:30 +0000
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <5280A0D3.1080605@imgtec.com>
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
 <20131109191543.414f5694@skate> <5280A0D3.1080605@imgtec.com>
Message-ID: <5280A19A.7030109@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/11/2013 09:18 AM, Markos Chandras wrote:
> Hi,>
>>> Detail of failures
>>> ===================
>>>
>>>        mips |                   aespipe-2.4c | NOK |
>>> http://autobuild.buildroot.net/results/da0268df99b9bf920d88121e7c3d33d41a57d951/
>>>
>>
>> Unknown problem (error: C compiler cannot create executables). Markos,
>> as our MIPS guy, can you have a look at this one?
>
> Ok I will
>
>>
>>>      mipsel |                  fdk-aac-0.1.2 | NOK |
>>> http://autobuild.buildroot.net/results/cb87635832f4a1128f174a25c264f716399c52d4/
>>>
>>
>> MIPS specific problem. We're building for mips1, but fdk-aac uses some
>> instructions not available on mips1. Maybe we should only enable
>> fdk-aac for some more capable variant of MIPS instruction sets.
>
> This needs for 'your-peter' branch to be merged first which contains the
> change from -mtune->-march for MIPS. I checked and that branch was still
> not merged so this will have to wait.
>
>>
>>>        mips |                      gmp-5.1.3 | NOK |
>>> http://autobuild.buildroot.net/results/69b0804cbfbb24c70f90435a37fb56a118247a57/
>>>
>>
>> configure: error: could not find a working compiler, see config.log
>> for details
>>
>> Markos, can you have a look?
> Yep
>
>>
>>>         arm |         gst1-plugins-bad-1.2.0 | NOK |
>>> http://autobuild.buildroot.net/results/b99eb6a9067cee885da88bff64ee447c37e31e0c/
>>>
>>>         arm |         gst1-plugins-bad-1.2.0 | NOK |
>>> http://autobuild.buildroot.net/results/b320bb61650c58e9c855e3136f5f6d7bf5e4ef56/
>>>
>>
>> Same problem in both cases, related to the DirectFB plugin. Peter, you
>> are the one taking care of Gstreamer most of the time, can you have a
>> look into this?
>>
>>>      x86_64 |           host-protobuf-c-0.15 | NOK |
>>> http://autobuild.buildroot.net/results/5d163e750808f2fdd8098cb58240bada12b770a9/
>>>
>>>    mips64el |           host-protobuf-c-0.15 | NOK |
>>> http://autobuild.buildroot.net/results/038340dfbbbedbcfcb98ad5dbf828bc03fe26af6/
>>>
>>
>> Weird compilation problem, seems really caused by an issue in
>> protobuf-c itself. Gustavo, you're the one who added protobuf-c, can
>> you have a look at this?
>>
>>>        bfin |                       icu-51.2 | NOK |
>>> http://autobuild.buildroot.net/results/e0a1130feb1784b3d4fefe1224943d93409a3494/
>>>
>>>        bfin |                       icu-51.2 | NOK |
>>> http://autobuild.buildroot.net/results/85c082a693ef795cecf0ef9204b7c9c0850d4b74/
>>>
>>
>> Problem building icu on Blackfin:
>>
>> *** ERROR - configure could not detect your platform
>>
>> Sonic, Zhang, can you have a look into this?
>>
>>>       avr32 |                libcap-ng-0.7.3 | NOK |
>>> http://autobuild.buildroot.net/results/3df16d60f6bbb679129cd568df4440be6f35cd9f/
>>>
>>
>> The missing TLS problem on AVR32. We still haven't found the solution
>> to handle this one. As I've suggested previously, I would simply make
>> TLS support unconditional in Buildroot as soon as thread support is
>> enabled, and then mark libcap-ng as not available on AVR32. Of course,
>> if you have an external toolchain without TLS support, you're on your
>> own.
>>
>>> microblaze |                libglib2-2.36.3 | NOK |
>>> http://autobuild.buildroot.net/results/6f0066f56f10d3f17023e698fd3ba1bd2d00c4c1/
>>>
>>> microblaze |                libglib2-2.36.3 | NOK |
>>> http://autobuild.buildroot.net/results/79d2df836063167f12f5bba177297a041bb7c16f/
>>>
>>
>> Missing compiler intrinsics and fallocate in the Microblaze toolchain.
>> We're waiting for Spenser Gilliland to finish the Microblaze internal
>> toolchain support, so that we can ditch the crappy Microblaze external
>> toolchains.
>>
>>>    mips64el |                 libiscsi-1.6.0 | NOK |
>>> http://autobuild.buildroot.net/results/39e8e0ebbeb196276492b928b41cc0b0fe1e9ec3/
>>>
>>>    mips64el |                 libiscsi-1.6.0 | NOK |
>>> http://autobuild.buildroot.net/results/efb87b17c49170f6377631371438911b18029cea/
>>>
>>
>> The usual problem of ld being used instead of gcc, causing problem on
>> mips64el. However, you can't do partial linking with gcc, so a libtool
>> fix is needed.
>>
>> Markos, I know you've identified the libtool fix for this. Could you
>> backport it on top of libtool 2.4.2 (that we have in Buildroot), add it
>> as a patch in package/libtool/, and then mark LIBISCSI_AUTORECONF =
>> YES so that the libtool stuff gets regenerated with a known-working
>> version?
>
> Yes it is on my TODO list. I tried beackporting it to Gentoo but it does
> not apply cleanly as it is. So it needs a little bit a work (not
> anything serious as far as I can tell)
>

Apologies if you got the message twice. The e-mail client messed up the 
buildroot address.

-- 
markos
