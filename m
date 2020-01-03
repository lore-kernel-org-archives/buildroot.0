From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 3 Jan 2020 18:24:26 +0100
Subject: [Buildroot] [PATCH] package/libnss: fix ppc 32-bit build failure
In-Reply-To: <820d953e-9100-8217-b317-1b226b4aba18@xes-inc.com>
References: <20200102181740.116227-1-giulio.benetti@benettiengineering.com>
 <23dbb404-03fa-f18f-607d-62cf8ef43a5f@xes-inc.com>
 <c965305f-ed37-02ce-971c-1253fe056402@benettiengineering.com>
 <820d953e-9100-8217-b317-1b226b4aba18@xes-inc.com>
Message-ID: <4ef10e39-bef2-9327-ae2c-ecc9a3943e75@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincent, Thomas, Yann, All,

On 1/3/20 5:22 PM, Vincent Fazio wrote:
> Giulio,
> 
> On 1/2/20 3:41 PM, Giulio Benetti wrote:
>> Hi Vincent,
>>
>> On 1/2/20 9:54 PM, Vincent Fazio wrote:
>>> Giulio,
>>>
>>> Are you dropping this file for 32bit builds due to the Altivec
>>> requirements? General Altivec instructions are available on 32bit chips,
>>> such as those from Freescale/NXP. The e600 is a product that comes to
>>> mind. IMO, the Makefile should include the file if the architecture is
>>> 'ppc'. I think it makes sense that the source file should determine what
>>> it compiles down to. It's possible the hw acceleration logic for PPC
>>> changes later and this is one more file that would need to be touched.
>>>
>>> Unfortunately, this is where it gets a bit more complicated...
>>>
>>> The backing instruction for the vec_xl_be compiler intrinsic is lxvd2x
>>> (a VSX instruction). Technically I think this instruction was available
>>> in the Power ISA as early as 2.06, but GCC is only advertising the
>>> intrinsic as of ISA 3.0 (Power 9+).
>>> https://gcc.gnu.org/onlinedocs/gcc-8.3.0/gcc/PowerPC-Built-in-Functions.html#PowerPC-Built-in-Functions
>>>
>>>
>>> I've always had issues reading the logic behind GCC's instruction
>>> generation and I don't have 8+ handy... I'm not sure if there's a guard
>>> to prevent the lxvd2x instruction from being emitted or not when
>>> resolving vec_xl_be and, say, '-maltivec -mpcu=7450' is specified. If
>>> there isn't, I'd expect either an illegal instruction exception or for
>>> the kernel to emulate it magically. If there is, I'd expect GCC to
>>> either compile a compatible instruction shim or to simply error out.
>>>
>>> Regardless, given the way the hardware acceleration is written currently
>>> to require that compiler intrinsic, USE_PPC_CRYPTO may need to be
>>> guarded by __builtin_cpu_supports("arch_3_00")
>>
>> They are all good suggestions but I think they are more NSS related
>> than Buildroot related. What I'm trying to do here is to avoid build
>> failure in Buildroot and as much as possible to try to contribute
>> upstream. As you've mentioned above 32-bit supports Altivec, but the
>> problem at the moment is that USE_PPC_CRYPTO is defined in gcm.h only
>> if __powerpc64__ is defined, this means that they only tested it for
>> that architecture(ppc64 and ppc64le). So at the moment I'd prefer keep
>> 32-bit Altivec supported devices without gcm altivec acceleration. But
>> if you have a patch that takes into account 32-bits Altivec too,
>> please upload it here:
>>
> For Buildroot, we can likely key off
> ifneq($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)

Yes, this is a good idea.

> and sed delete the '-mcrypto
> -maltivec' flags from lib/freebl/Makefile... 

It's better to avoid this kind of blind hack. I'd prefer to introduce a 
patch in NSS which adds a NSS_ALTIVEC_DISABLE to avoid building 
gcm-ppc.c. So combined with your suggestion above we can do something like:

ifeq($(BR2_POWERPC_CPU_HAS_ALTIVEC),)
NSS_ALTIVEC_DISABLE=1
endif

The -mcrypto enables -mvsx
> and causes gcc to emit instructions the target CPU may not support,
> that's why it should be removed. Luckily, we can make some assumptions
> that if ALTIVEC isn't supported, VSX and Crypto functions arent either
> since they're introduced in the same or later ISA revisions.

So let's assume this.

>> https://bugzilla.mozilla.org/show_bug.cgi?id=1606689
>>
>> so we fix this problem once!
> I'm not sure this can be done "cleanly" given how this is currently
> structured. I've added a comment in the bug. Not all 64bit PPC
> processors have Altivec (e5500 does not). 

Yes, I see now.

> Plus this goes a bit beyond
> that since the functions they're using require at least Power ISA 3.0.
> The source package should probably inherit CFLAGS instead of assuming it
> can define it given the complexities of PPC cpu tuning.

 From NSS point of view this would be fixed by introducing 
NSS_ALTIVEC_DISABLE, but from Buildroot point of view this should be 
done by adding a new variable like BR2_POWERPC_AT_LEAST_ISA_X_X

But I don't know if it's worth the effort.

What about above?

-- 
Giulio Benetti
Benetti Engineering sas

>>
>> Maybe we can live chat on BR IRC if you join it.
> I'm idling there today
>>
>>
>> Thanks for reviewing so in depth.
>> Best regards
> 
