From: Vincent Fazio <vfazio@xes-inc.com>
Date: Fri, 31 Jan 2020 09:17:36 -0600
Subject: [Buildroot] [PATCH 1/1] toolchain/toolchain-buildroot: PPC64
 support in musl requires ALTIVEC
In-Reply-To: <CANQCQpYoHcf5Uddexi9uVrdZ-7QhVQpD6FV8s5w=LvAPX2CfJQ@mail.gmail.com>
References: <20200131144106.18054-1-vfazio@xes-inc.com>
 <2389f55d-8fc4-041a-95e6-acceb9ed297b@smile.fr>
 <CANQCQpYoHcf5Uddexi9uVrdZ-7QhVQpD6FV8s5w=LvAPX2CfJQ@mail.gmail.com>
Message-ID: <f115369e-4793-45de-6e9f-0c3a79f3a265@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew,

On 1/31/20 9:11 AM, Matthew Weber wrote:
> Vincent,
>
> On Fri, Jan 31, 2020 at 8:56 AM Romain Naour <romain.naour@smile.fr> wrote:
>> Hi Vincent,
>>
>> Le 31/01/2020 ? 15:41, Vincent Fazio a ?crit :
>>> musl assumes all PPC64(LE) CPUs support ALTIVEC instructions. However,
>>> the e5500 does not support ALTIVEC so builds targeting this CPU using
>>> musl will generate illegal instructions.
>>>
>>> Disable musl if the PPC64(LE) CPU does not support ALTIVEC instructions.
>> Thanks for this patch.
> Thanks as well for the patch.  It actually applies to both LE and BE
> e5500 targets
The config change takes this into account. The e5500 was an example CPU 
but the change is effective for any endianness of PPC64 that does not 
support ALTIVEC (in case a new scenario pops up). As far as i'm aware, 
the e5500 is big endian only.

I will update the commit message & title to be more clear.
>> Can you add these two links from my toolchains-builder instance:
>> https://gitlab.com/kubu93/toolchains-builder/-/jobs/418092743
>> https://gitlab.com/kubu93/toolchains-builder/-/jobs/418092744
>>
>> Also I'm adding Matt in Cc:
>>
>> Best regards,
>> Romain
>>
>>> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
>>> ---
>>>   toolchain/toolchain-buildroot/Config.in | 6 ++++--
>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
>>> index a980f766ac..09a46822c9 100644
>>> --- a/toolchain/toolchain-buildroot/Config.in
>>> +++ b/toolchain/toolchain-buildroot/Config.in
>>> @@ -83,8 +83,10 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
>>>        bool "musl"
>>>        depends on BR2_aarch64     || BR2_arm   || BR2_armeb   || BR2_i386 || \
>>>                   BR2_microblaze  || BR2_mips  || BR2_mipsel  || BR2_mips64 || \
>>> -                BR2_mips64el    || BR2_or1k  || BR2_powerpc || BR2_powerpc64 || \
>>> -                BR2_powerpc64le || BR2_RISCV_64 || BR2_sh   || BR2_x86_64
>>> +                BR2_mips64el    || BR2_or1k  || BR2_powerpc || BR2_RISCV_64 || \
>>> +                BR2_sh          || BR2_x86_64 || \
>>> +                ((BR2_powerpc64 || BR2_powerpc64le) && BR2_POWERPC_CPU_HAS_ALTIVEC)
>>> +                # musl assumes all PPC64 targets support ALTIVEC instructions
>>>        depends on !BR2_powerpc_SPE # not supported, build breaks
>>>        # sh2 nommu is supported by musl, but we don't have support
>>>        # for it in Buildroot.
>>>
>
-- 
Vincent Fazio
Embedded Software Engineer - Linux
Extreme Engineering Solutions, Inc
http://www.xes-inc.com
