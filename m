From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Sep 2016 01:13:53 +0200
Subject: [Buildroot] [PATCH] openal: Explicitly enable/disable NEON
 support to avoid trouble with precompiled toolchains
In-Reply-To: <ed871b54-3861-1b9e-e557-eb46e0887acc@dawncrow.de>
References: <1472387820-6783-1-git-send-email-nerv@dawncrow.de>
 <20160828155006.0abb2572@free-electrons.com>
 <ed871b54-3861-1b9e-e557-eb46e0887acc@dawncrow.de>
Message-ID: <840ddd5c-14cd-0d69-e9d2-5cc3b6e9ceef@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-08-16 16:10, Andr? Hentschel wrote:
> Am 28.08.2016 um 15:50 schrieb Thomas Petazzoni:
>> Hello,
>>
>> Why do you think the problem is with "precompiled" toolchains only?
> 
> Because the bug is about mismatch between target settings made in the buildroot config and the toolchain default target settings.

 I also believe that the same problem would occur with an internal build, but
couldn't be bothered to test it :-)

> 
>>
>> On Sun, 28 Aug 2016 14:37:00 +0200, Andr? Hentschel wrote:
>>> Fixes:
>>> http://autobuild.buildroot.net/results/d7ccef77a355ccc23f26d012e8441af931469ae4
>>> http://autobuild.buildroot.net/results/b5777a0ed33f6bb7a5fc0486ea21ecef58615dac
>>> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
>>> ---
>>>  package/openal/openal.mk | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/package/openal/openal.mk b/package/openal/openal.mk
>>> index 2916aa6..8205f9e 100644
>>> --- a/package/openal/openal.mk
>>> +++ b/package/openal/openal.mk
>>> @@ -50,4 +50,11 @@ ifeq ($(BR2_STATIC_LIBS),y)
>>>  OPENAL_CONF_OPTS += -DLIBTYPE=STATIC
>>>  endif
>>>  
>>> +# Explicitly enable/disable NEON support to avoid trouble with precompiled toolchains
>>> +ifeq ($(BR2_ARM_FPU_NEON)$(BR2_ARM_FPU_NEON_VFPV4),y)
>>
>> I believe you should use BR2_ARM_CPU_HAS_NEON instead.
> 
> Thought so too, looked into it, failed. It really depends on the FPU setting.
> I know there's no other package doing this kind of check...
> Other options are to always disable neon or to extend the checking in openal cmake script with a patch.
> (I won't be able to patch it as my cmake skills are very low)

 The checking in the cmake script is fairly basic: it just checks for the
presence of the arm_neon.h header with the intrinsics. That header will always
be there (except for Linaro toolchains, which are as usual broken: the header is
in /usr/lib/include, which isn't in the search path).

 The error is that we build everything with e.g. -mfpu=vfpv3, while the neon
intrinsics are marked always_inline so they will be inlined in the vfpv3
function. That is not possible (you need to save registers to switch between VFP
and NEON, so you can't mix the two in the same function). So, any FPU selection
that is not NEON will trigger the issue.

 However, a better solution would be to pass -mfpu=neon or -mfpu=neon-vfpv4 to
the compilation of the files that use neon intrinsics. But that's more for
upstream to fix.

 So, I'd give it my
 Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
but the comment has to be improved.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
