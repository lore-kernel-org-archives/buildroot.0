From: Shinya Kuribayashi <skuribay@ruby.dti.ne.jp>
Date: Tue, 09 Oct 2007 22:57:32 +0900
Subject: [Buildroot] [MIPS] toolchain/gcc/Config.in broken
In-Reply-To: <20071009122700.GB15786@aon.at>
References: <470ADDA8.3080105@ruby.dti.ne.jp> <20071009070816.GP20951@aon.at>
	<470B5043.5010606@ruby.dti.ne.jp> <20071009122700.GB15786@aon.at>
Message-ID: <470B88CC.9040705@ruby.dti.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
>> [1] mips: Before recently toolchain config rework (2007-09-19 build)
<snip>
> I don't know offhand what abi that defaults to. Can you check this,
> perhaps?

Yes, confirmed with r19885 (2007-09-18).
At that time, we used to configure ABI and ISA as a uClibc config,
right? I always configured O32 ABI and MIPS32, no doubt:

*
* Target Architecture Features and Options
*
Target ABI
> 1. O32 ABI (CONFIG_MIPS_O32_ABI) (NEW)
  2. N32 ABI (CONFIG_MIPS_N32_ABI) (NEW)
  3. N64 ABI (CONFIG_MIPS_N64_ABI) (NEW)
choice[1-3?]: 1
Target Processor Architecture
> 1. Generic (MIPS I) (CONFIG_MIPS_ISA_1) (NEW)
  2. MIPS II (CONFIG_MIPS_ISA_2) (NEW)
  3. MIPS III (CONFIG_MIPS_ISA_3) (NEW)
  4. MIPS IV (CONFIG_MIPS_ISA_4) (NEW)
  5. MIPS32 (CONFIG_MIPS_ISA_MIPS32) (NEW)
  6. MIPS64 (CONFIG_MIPS_ISA_MIPS64) (NEW)
choice[1-6?]: 5

But it seems these configs were not directly passed to GCC configs
according to mips-linux-gcc -v, or GCC config.status.

>> [3] mips: Current trunk build with a change (for testing)
>>
>> skuribay at debian:~/devel/buildroot$ svn diff
>> Index: target/Config.in.arch
>> ===================================================================
>> --- target/Config.in.arch       (revision 20207)
>> +++ target/Config.in.arch       (working copy)
>> @@ -689,7 +689,7 @@
>>        default iwmmxt          if BR2_iwmmxt
>>        default 32              if BR2_mipsel && BR2_MIPS_OABI
>>        default n32             if BR2_mipsel && BR2_MIPS_EABI
>> -       default o64             if BR2_mips && BR2_MIPS_OABI
>> +       default 32              if BR2_mips && BR2_MIPS_OABI
> 
> I'm pretty sure that this is not really correct either.

Yes, it's just a trial whether --with-abi=32 works for mips or not.
I don't know what is appropriate in this case, sorry.

> I will extend these (for mips) to include "ABI32" which boils down to
> 32.
> But think about your change for a second. For mips EB you want to allow
> for 32bit (1,2,32*) and 64bit where 32bit OABI should use =32 but 64bit
> OABI should use =o64 as opposed to 64bit ABI32 (=32), 64bit EABI
> (=eabi), 64bit ABI64 (=64), at least AFAICT.
> 
> Does this sound appropriate to you?

Ditto, it's hard for me to answer. I should learn more about GCC config.
Anyone MIPS guys?

Anyway thanks for your consideration,

    Shinya Kuribayashi
