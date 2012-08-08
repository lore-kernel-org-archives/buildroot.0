From: Sonic Zhang <sonic.adi@gmail.com>
Date: Wed, 8 Aug 2012 10:42:22 +0800
Subject: [Buildroot] [PATCH 1/3] buildroot: target: Add Blackfin
 architecture support in configuration.
In-Reply-To: <DB904C5425BA6F4E8424B3B51A1414D1714D286001@NWD2CMBX1.ad.analog.com>
References: <1344251847-7709-1-git-send-email-sonic.adi@gmail.com>
 <20120806143607.7dca918a@skate>
 <DB904C5425BA6F4E8424B3B51A1414D1714D286001@NWD2CMBX1.ad.analog.com>
Message-ID: <CAJxxZ0PTOjtJiwFVCyK6iZ6XBoQNZhNYtabeQ0rt8mGp0gnMYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 7, 2012 at 11:14 AM, Zhang, Sonic <Sonic.Zhang@analog.com> wrote:
> Hi Thomas,
>
>>-----Original Message-----
>>From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
>>Sent: Monday, August 06, 2012 8:36 PM
>>To: Sonic Zhang
>>Cc: Peter Korsgaard; buildroot at busybox.net; buildroot-devel at lackfin.uclinux.org;
>>Zhang, Sonic
>>Subject: Re: [PATCH 1/3] buildroot: target: Add Blackfin architecture support in
>>configuration.
>>
>>Hello,
>>
>>Le Mon, 6 Aug 2012 19:17:25 +0800,
>>Sonic Zhang <sonic.adi@gmail.com> a ?crit :
>>
>>> From: Sonic Zhang <sonic.zhang@analog.com>
>>>
>>> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
>>> ---
>>>  target/Config.in.arch |   19 +++++++++++++++++++
>>>  1 files changed, 19 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/target/Config.in.arch b/target/Config.in.arch
>>> index 6eaa951..001faf0 100644
>>> --- a/target/Config.in.arch
>>> +++ b/target/Config.in.arch
>>> @@ -131,6 +131,15 @@ config BR2_xtensa
>>>        http://www.tensilica.com/
>>>  endchoice
>>>
>>> +config BR2_ABI_FLAT
>>> +    bool
>>> +    default n
>>> +
>>> +config BR2_ABI_ELF
>>> +    bool
>>> +    default y
>>> +    depends on !BR2_ABI_FLAT
>>
>>Could you expand a bit on why this is needed, and where it will be
>>used? I have seen those used in various places in some of your packages
>>in your Git repository, but I am not sure the use cases were actually
>>valid.
>
> Blackfin toolchain support both the FLAT ABI and ELF(FDPIC) ABI. Some features are different between them, such as the default stack size. The default stack size of FLAT binary is only 4k bytes, while it is 128k for ELF binary. Although 4k is enough for most application, it may be too small for the others such as bonnie++. The flat to enlarge stack size "-Wl,-elf2flt=-s64000" only apply to FLAT toolchain with BF2_ABI_FLAT defined.
>
>
>>
>>>  config BR2_microblaze
>>>      bool
>>>      default y if BR2_microblazeel || BR2_microblazebe
>>> @@ -231,8 +240,18 @@ choice
>>>      default BR2_BFIN_FDPIC
>>>  config BR2_BFIN_FDPIC
>>>      bool "FDPIC"
>>> +    select BR2_ABI_ELF
>>>  config BR2_BFIN_FLAT
>>>      bool "FLAT"
>>> +    select BR2_ABI_FLAT
>>> +    select BR2_PREFER_STATIC_LIB
>>> +config BR2_BFIN_FLAT_SEP_DATA
>>> +    bool "FLAT (Separate data)"
>>> +    select BR2_ABI_FLAT
>>> +    select BR2_PREFER_STATIC_LIB
>>> +config BR2_BFIN_SHARED_FLAT
>>> +    bool "Shared FLAT"
>>> +    select BR2_ABI_FLAT
>>>      select BR2_PREFER_STATIC_LIB
>>>  endchoice
>>
>>Are these "FLAT (Separate data)" and "Shared FLAT" use cases actually
>>used in practice by people? I'm not a Blackfin expert, so I don't know
>>what's used in the field.
>
> Though I don't know if our end customers use shared FLAT in their blackfin based products, we do support these binary formats in blackfin GNU toolchain and Linux distribution for years.

Because Stuart is out these days, I cc David as well.

Regards,

Sonic
