From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 6 Oct 2014 14:47:41 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-10-05
In-Reply-To: <20141006214408.2af48bbb@free-electrons.com>
References: <20141006063013.D7B26101723@stock.ovh.net>
 <20141006094333.211d8a76@free-electrons.com>
 <CANQCQpYH7XGPbR_p2-wZqrhLMu_-GyR0HBqiwEEtgK9GX60QVg@mail.gmail.com>
 <20141006214408.2af48bbb@free-electrons.com>
Message-ID: <CANQCQpaPvCgGzzukyUAASZqO9-d28Q7UwUemsjvc9xtJ5TTeKg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Gustoavo,

On Mon, Oct 6, 2014 at 2:44 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Matthew Weber,
>
> On Mon, 6 Oct 2014 14:22:29 -0500, Matthew Weber wrote:
>
>> I've got the fixes captured and hope to have something tomorrow after
>> testing.  I also noticed in the build results from the day before,
>> protobuf 2.6 has some failures with a specific powerpc toolchain
>> (looks like atomics). I should also have fixes for that in the next
>> series.
>
> Great, thanks!
>
> Regarding the PowerPC result at
> http://autobuild.buildroot.org/results/d45/d459457d0046cf96b56c5fc0660eca326d90401d/build-end.log,
> it looks weird, because the code is:
>
> #elif defined(__ppc__)
> #define GOOGLE_PROTOBUF_ARCH_PPC 1
> #define GOOGLE_PROTOBUF_ARCH_32_BIT 1
> #elif defined(__GNUC__) && \
>  (((__GNUC__ == 4) && (__GNUC_MINOR__ >= 7)) || (__GNUC__ > 4))
> // We fallback to the generic GCC >= 4.7 implementation in atomicops.h
> # if __LP64__
> #  define GOOGLE_PROTOBUF_ARCH_64_BIT 1
> # else
> #  define GOOGLE_PROTOBUF_ARCH_32_BIT 1
> # endif
> #else
> #error Host architecture was not detected as supported by protobuf
> #endif
>
> Since the failure is on PowerPC, __ppc__ should be defined, and we
> shouldn't have the #error.

They actually cleaned up the library and now default to the GCC
provided generics.  So in the case of PPC it doesn't even need a
definition in this file.  However.....  These powerpc builds use a gcc
4.5 compiler which doesn't provide the generic atomicops
implementation which is only exposed if GCC >= 4.7.  I looked at the
BR2_ARCH_HAS_ATOMICS option as a possible dependency
to fix this but it seems like that option is always set if the ARCH
supports it.  Not necessarily based on if a toolchain provides a
generic.  Thoughts?

>
> Maybe Gustavo, you know if __ppc__ is not defined on certain PPC platforms?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
