From: Sonic Zhang <sonic.adi@gmail.com>
Date: Wed, 17 Apr 2013 15:50:01 +0800
Subject: [Buildroot] [PATCH v5 6/7] arch: toolchain: Install blackfin
 FDPIC and FLAT libraries in external toolchain makefile.
In-Reply-To: <20130416232925.759eb9df@skate>
References: <1365761909-15305-1-git-send-email-sonic.adi@gmail.com>
 <1365761909-15305-6-git-send-email-sonic.adi@gmail.com>
 <20130416232925.759eb9df@skate>
Message-ID: <CAJxxZ0PoEysfHc23PHfqkVktvoGiQoDBNd+-z3PTOL40=Zfwhg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Apr 17, 2013 at 5:29 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Sonic Zhang,
>
> On Fri, 12 Apr 2013 18:18:28 +0800, Sonic Zhang wrote:
>> diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
>> index f755c8d..917282d 100644
>> --- a/arch/Config.in.bfin
>> +++ b/arch/Config.in.bfin
>> @@ -62,6 +62,28 @@ config BR2_bf561
>>       bool "bf561"
>>  endchoice
>>
>> +config BR2_BFIN_INSTALL_FDPIC_SHARED
>> +     bool "Install FDPIC shared libraries"
>> +     depends on !BR2_BINFMT_FDPIC
>> +     help
>> +       The Linux kernel supports running both FDPIC and FLAT applications
>> +       concurrently if the binary format specific libraries are installed properly.
>> +       This option allows developer to install FDPIC libraries into a buildroot
>> +       rootfs image built with binary format that is not FDPIC.
>> +
>> +config BR2_BFIN_INSTALL_FLAT_SHARED
>> +     depends on BR2_BINFMT_FLAT_SHARED
>> +     default y
>> +
>> +config BR2_BFIN_INSTALL_FLAT_SHARED
>> +     bool "Install FLAT shared libraries"
>
> Same name as the previous option.

This is intended. When option BINFMT_FLAT_SHARED is selected option
BR2_BFIN_INSTALL_FLAT_SHARED should always be set to y. While other
BINFMT is selected, BR2_BFIN_INSTALL_FLAT_SHARED is optional for
developer to decide.


>
>> +     depends on !BR2_BINFMT_FLAT_SHARED
>> +     help
>> +       The Linux kernel supports running both FDPIC and FLAT applications
>> +       concurrently if the binary format specific libraries are installed properly.
>> +       This option allows developer to install FLAT libraries into a buildroot
>> +       rootfs image built with binary format that is not shared FLAT.
>
> I think those options should be preference of the external toolchain,
> so in toolchain/toolchain-external/Config.in. Because if we ever
> support internal toolchain for Blackfin, they won't be multilib
> toolchains, so it won't make sense to have those options.
>
>> +ifeq ($(BR2_bfin,y)
>
> Do you actually test the patches you're posting?

Yes, but when I prepare patches for upstream, I apply to a different
branch, and sometimes make typo error.

Regards,

Sonic
