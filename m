From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 7 Oct 2014 20:06:59 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-10-05
In-Reply-To: <CANQCQpYdn-iNPbKb0FPVHbONKcsrfKscPJ1d1mfyn0ZYQcz66w@mail.gmail.com>
References: <20141006063013.D7B26101723@stock.ovh.net>
 <20141006094333.211d8a76@free-electrons.com>
 <CANQCQpYH7XGPbR_p2-wZqrhLMu_-GyR0HBqiwEEtgK9GX60QVg@mail.gmail.com>
 <20141006214408.2af48bbb@free-electrons.com>
 <CANQCQpaPvCgGzzukyUAASZqO9-d28Q7UwUemsjvc9xtJ5TTeKg@mail.gmail.com>
 <1412626268.2656.6.camel@abrodkin-8560l.internal.synopsys.com>
 <CANQCQpYo55QJoGPNcg7ZfEq5O+9qQO9f-G5wocD+NDDj=HuBRA@mail.gmail.com>
 <1412627319.2656.9.camel@abrodkin-8560l.internal.synopsys.com>
 <CANQCQpYdn-iNPbKb0FPVHbONKcsrfKscPJ1d1mfyn0ZYQcz66w@mail.gmail.com>
Message-ID: <CANQCQpbvHPvPwDH-yz94e2zEmHk_R9iNw1gsopygfUdMn8Oi9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexey, Thomas,

On Mon, Oct 6, 2014 at 3:41 PM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Hi Alexey,
>
> On Mon, Oct 6, 2014 at 3:28 PM, Alexey Brodkin
> <Alexey.Brodkin@synopsys.com> wrote:
>> Hi Matthew,
>>
>> On Mon, 2014-10-06 at 15:20 -0500, Matthew Weber wrote:
>>> Ok, good point. I wonder if it's something that could be set by
>>> default during the toolchain detection based on GCC >= 4.7 and
>>> existence of atomicops.h?
>>
>> Well definitely that's possible.
>> You may see how it's implemented here -
>> http://git.buildroot.net/buildroot/tree/package/gcc/gcc.mk#n112
>>
>> But
>> 1. Are you sure that with GCC >= 4.7 atomic ops are always there?
>
> Not sure yet, the atomicops.h file actually is part of the protobuf
> package not gcc (my confusion on that one).  So I'll have to do some
> research on the generic atomics implementation that they do in that
> header and figure-out why the >= 4.7 dependency is checked when this
> package builds.   It might just be what this package picked as a
> minimum version for it's generic atomics implementation.

I think I may have got some clarification from Fedora's updates to how
they built ARM packages.

"....consider using the GCC built-in functions to implement the
necessary functionality. According to the GCC documentation, there are
two alternatives, __sync built-in functions for atomic memory access
(as of GCC-4.1, considered legacy) and Built-in functions for memory
model aware atomic operations (__atomic, as of GCC-4.7).

The __sync built-in functions are more widely supported (older
versions of GCC), but are now considered 'legacy', and will be
deprecated. In addition, they do not provide support for older ARM
processors (ARMv5 and older). The __atomic built-in functions are the
replacement for __sync, and do provide support for ARMv5 through
fall-back library functions, but only support the C++11 memory model
(GCC-4.7 or newer). ....  "
(http://fedoraproject.org/wiki/Architectures/ARM/GCCBuiltInAtomicOperations)

So the check for GCC4.7 in the code for protobuf is correct.  When I
checked the atomic operations it implemented in the generic atomics
header (using the GCC calls), they were correct for the newer model of
__atomic built-ins.  So maybe a GCC version check is required to set
"BR2_ARCH_HAS_ATOMICS".  I assuming this option is only relevant when
a newer compiler GCC >=4.7 is used?


>
>> 2. I assume it is only applicable to one particular architecture?
> At this point I'm not sure if it's just specific to how this package
> is checking or if it would be something that could be checked for.
> protobuf implements custom atomics for specific architectures and
> defaults to a requirement of GCC >= 4.7.  Looking at buildroot in
> general, I'm wondering if the only thing that's missing is a minimum
> GCC version if atomics is enabled (need to still confirm this and it
> would probably be arch independent)
>
>>
>> -Alexey
>
>
>
> --
> Matthew L Weber / Pr Software Engineer
> Airborne Information Systems / Security Systems and Software
> MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
> www.rockwellcollins.com
>
> Note: Any Export License Required Information and License Restricted
> Third Party Intellectual Property (TPIP) content must be encrypted and
> sent to matthew.weber at corp.rockwellcollins.com.



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
