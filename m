From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Fri, 7 Apr 2017 09:28:27 +0200
Subject: [Buildroot] Qt5 build failure (beaglebone_qt5_defconfig)
In-Reply-To: <20170406183218.66cab07e@free-electrons.com>
References: <87f293c7-8aef-14e9-23e4-195a16b564e3@mind.be>
 <trinity-0603182d-d77d-4e0a-bdd1-589503badbe3-1491479231018@3capp-gmx-bs68>
 <CAOf5uwkL9FX3Fq2Dou1jnixat2CWxtWSbXG+Q=RQ=y3pSyjRzA@mail.gmail.com>
 <20170406183218.66cab07e@free-electrons.com>
Message-ID: <CAOf5uwmQTomB0pgpUL4k0CVU3zEcNtGSLZU4TwQF7nOjXR_f2A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

On Thu, Apr 6, 2017 at 6:32 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 6 Apr 2017 18:12:15 +0200, Michael Nazzareno Trimarchi wrote:
>
>> '/home/michael/work/amarula/bticino/buildroot/output/build/linux-52c4aa7cdb93d61f8008f380135beaf7b8fa6593'
>>   DTC     arch/arm/boot/dts/am335x-bone.dtb
>>   DTC     arch/arm/boot/dts/am335x-evm.dtb
>> make[2]: *** No rule to make target
>> 'arch/arm/boot/dts/am335x-bonegreen.dtb'.  Stop.
>> arch/arm/Makefile:314: recipe for target 'am335x-bonegreen.dtb' failed
>
> This is caused by the recent commit
> https://git.buildroot.org/buildroot/commit/configs?id=4b2440b7dcc68369548c0f2be6984fe645fc6bb0
> from Matthias Fritzsche. Matthias, are you sure you tested the
> beaglebone_qt5_defconfig ?
>
> Indeed, beaglebone_defconfig and beaglebone_qt5_defconfig don't use the
> same kernel version, and the one used in beaglebone_qt5_defconfig
> doesn't have the Beagle Bone Green Device Tree.
>
> So either we should revert Matthias patch on beaglebone_qt5_defconfig,
> or someone tests upgrading beaglebone_qt5_defconfig to the same kernel
> version as the one used in beaglebone_defconfig.
>
>> chmod a+x /home/michael/work/amarula/bticino/buildroot/output/build/_fakeroot.fs
>> PATH="/home/michael/work/amarula/bticino/buildroot/output/host/bin:/home/michael/work/amarula/bticino/buildroot/output/host/sbin:/home/michael/work/amarula/bticino/buildroot/output/host/usr/bin:/home/michael/work/amarula/bticino/buildroot/output/host/usr/sbin:/opt/OpenPrinting-Gutenprint/sbin:/opt/OpenPrinting-Gutenprint/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/java-7-oracle/bin:/usr/lib/jvm/java-7-oracle/db/bin:/usr/lib/jvm/java-7-oracle/jre/bin"
>> /home/michael/work/amarula/bticino/buildroot/output/host/usr/bin/fakeroot
>> -- /home/michael/work/amarula/bticino/buildroot/output/build/_fakeroot.fs
>> rootdir=/home/michael/work/amarula/bticino/buildroot/output/target
>> table='/home/michael/work/amarula/bticino/buildroot/output/build/_device_table.txt'
>> genext2fs: couldn't allocate a block (no free space)
>> fs/ext2/ext2.mk:44: recipe for target
>
> This is due to the fact that we removed auto-calculation of the ext4
> filesystem size in
> https://git.buildroot.org/buildroot/commit/?id=c6bca8cef0310bc649240b451989457ce94a8358,
> and we default to 60 MB for the filesystem size, which is not enough
> for this demo. Fixing this is simple: send a patch that adds:
>
> BR2_TARGET_ROOTFS_EXT2_BLOCKS="126976"
>
> to beaglebone_qt5_defconfig (of course after testing that this size is
> sufficient).
>

Ok I will do

> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com



-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
