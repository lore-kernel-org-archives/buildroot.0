From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 31 Mar 2018 16:38:55 +0200
Subject: [Buildroot] [PATCH] ARC: Add support for ARC HS38 with Hardware
 Floating Point
In-Reply-To: <1499695556.6394.30.camel@synopsys.com>
References: <20170710133650.8692-1-abrodkin@synopsys.com>
 <20170710154629.442a4411@windsurf.lan>
 <1499695556.6394.30.camel@synopsys.com>
Message-ID: <cc3196e6-19db-04e0-6c21-01a3cd1b5fd2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Finally coming back to this old patch...

On 10-07-17 16:05, Alexey Brodkin wrote:
> Hi Thomas,
> 
> On Mon, 2017-07-10 at 15:46 +0200, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Mon, 10 Jul 2017 16:36:50 +0300, Alexey Brodkin wrote:
>>>
>>> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
>>> ---
>>> ?arch/Config.in.arc???????| 10 +++++++---
>>> ?package/uclibc/Config.in |??1 +
>>> ?2 files changed, 8 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/Config.in.arc b/arch/Config.in.arc
>>> index 7d341f3136..d0e2286557 100644
>>> --- a/arch/Config.in.arc
>>> +++ b/arch/Config.in.arc
>>> @@ -14,12 +14,15 @@ config BR2_arc770d
>>> ?config BR2_archs38
>>> ?	bool "ARC HS38"
>>> ?
>>> +config BR2_archs38_hf
>>> +	bool "ARC HS38 with hard floating-point"
>>
>> Does it need to be a separate CPU type, or an option when HS38 is
>> selected ?
> 
> Well this is a real "-mcpu" value understood by GCC for ARC
> ------------------------------>8-------------------------------
> arc-linux-gcc --target-help
> ...
> ARC-specific assembler options:
> ? -mcpu=<cpu name>	??(default: hs38), assemble for CPU <cpu name>, one of:
> ??????????????????????????arc700, nps400, arcem, em, em4, em4_dmips, em4_fpus,?
> ??????????????????????????em4_fpuda, quarkse_em, archs, hs, hs34, hs38,?
> ??????????????????????????hs38_linux, arc600, arc600_norm, arc600_mul64,?
> ??????????????????????????arc600_mul32x16, arc601, arc601_norm, arc601_mul64,?
> ??????????????????????????arc601_mul32x16
> ------------------------------>8-------------------------------
> 
> And in itself this is pretty much an alias to a set of HW features
> selected by default in the same ARC HS38 "template" in CPU configuration
> utility. In fact it is "-mcpu=hs38 -mfpu=fpud_all". But when we configure GCC
> with "-mcpu" option it then is used by default, i.e. even if we later build
> a random application with a simple "arc-linux-gcc test.c" it implicitly gets
> optimized for that same "-mcpu"... i.e. there's no need in adding stuff in
> TARGET_ABI variable in Buildroot etc.

 As such, I don't think this is a sufficient reason to make it a separate CPU
option. Rather, I think we should consider what are the likely future
architectures that are going to be added. We now have 750d, 770d and hs38. I
guess there is no floating point option for the 750d and 770d? If there is, then
clearly it would be better to have a separate hf option so it can be used for
the 750d and 770d as well. If not, we should consider a future hs42: is it
likely to have an optional fpu? Or is it likely to always have an fpu?

 Basically, what we want to avoid in the long run is to have many different
subarches which are basically different combinations of options.

 So, in short: making a separate subarch for it is only warranted if you expect
this will be the only one with an optional FPU (or rather, where in practice an
FPU is always there, because obviously on ARC anything is possible).


 Regards,
 Arnout

> 
> For example in OpenEmbedded we went via separate options instead of those
> "templates" as the same toolchain is reused between different builds which
> differs from Buildroot where we build everything for just one HW configuration.
> So IMHO templates approach in Buildroot is more convenient.
> 
>> ?config BR2_ARCH
>>> ?	default "arc"	if BR2_arcle
>>> @@ -37,6 +40,7 @@ config BR2_GCC_TARGET_CPU
>>> ?	default "arc700" if BR2_arc750d
>>> ?	default "arc700" if BR2_arc770d
>>> ?	default "archs"	?if BR2_archs38
>>> +	default "hs38_linux"	?if BR2_archs38_hf
>>
>> gcc really understands -mcpu=hs38_linux ?
>>
>> It seems odd to have the operating system name encoded in the CPU name.
> 
> The rationale behind that naming was to highlight a template which is
> the best option for Linux use-case. I.e. if you want to build a system that
> runs
> Linux on top of ARC HS38 core please consider usage of that "template"
> which has HW features that [may significantly] improve performance of the
> system.
> 
> Still not sure if now you feel more comfortable with that stuff :))
> 
> -Alexey
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
