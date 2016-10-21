From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 Oct 2016 21:45:52 +0200
Subject: [Buildroot] [PATCH] ci20_defconfig: disable madd instructions
 to avoid FPU bug
In-Reply-To: <20161019113229.02a9d8c3@free-electrons.com>
References: <20161018122421.64118-1-Vincent.Riera@imgtec.com>
 <20161018145413.37ae0751@free-electrons.com>
 <68e76d80-a505-e029-941a-fe43d9780536@imgtec.com>
 <20161019113229.02a9d8c3@free-electrons.com>
Message-ID: <d058213e-21f3-59e3-49ae-103d4fce6a8c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-10-16 11:32, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 19 Oct 2016 09:47:03 +0100, Vicente Olivert Riera wrote:
> 
>> We could add an Ingenic XBurst entry in the MIPS CPU selection, and then
>> add that -mno-fused-madd option to the wrapper based on that selection.
>>
>> If you are OK with that, please let me know and I'll cook the patch.
> 
> If I understand correctly:
> 
>  - JZ4780 is the SoC
>  - XBurst is the core
>  - MIPS32r2 is the ISA
> 
> So indeed, it makes sense to add an option for XBurst, in order to
> mimic what we do on ARM.
> 
> Ideally, we should mimic what we do on ARM, and only list in
> "Target architecture variants" the cores and not the ISA. How many
> vendors are doing MIPS cores, and how many cores are they doing?

 I believe that for MIPS, every vendor uses their own core, and that there is an
almost one-to-one mapping between SoC family and core. AFAIU it's only the
instruction set that is standardized. My gcc supports 74 cores... Do we really
want to add all of these?

 That said, now we already have a bit a mixed situation: we have a few
processors and a few generic options in Config.in.mips. But I expect that
Buildroot will often be used on SoCs where either Buildroot or GCC doesn't have
a processor-specific option yet, so the generic ones will still be needed.

> If you look at ARM, we have the following situation:
> 
>  - Freescale, TI, Atmel, Marvell, Qualcomm, Nvidia, etc. are doing SoCs
>    They are way too many for Buildroot to have a list of them.
> 
>  - Very few vendors are doing cores. Most of the SoC vendors are using
>    the cores from ARM. For example, we have ARM926, Cortex-A7, Cortex-A8,
>    Cortex-A53, etc.

 That's the difference of course. ARM owns the core, while MIPS is a more or
less open architecture. Not open enough, of course, which is why RISC-V was started.

 Regards,
 Arnout


>    Those are the ones that are listed in "Target Architecture Variant",
>    and we use the selected option to know the ISA.
> 
>  - ISAs are ARMv4, ARMv5, ARMv6, ARMv7, ARMv8, with a few variants.
> 
> So having a similar model for MIPS would be ideal.
> 
> Best regards,
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
