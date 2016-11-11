From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 11 Nov 2016 06:37:06 +0200
Subject: [Buildroot] Enable option of nodeJS 4.1.2 in buildroot 2015.11
In-Reply-To: <CALD51P8hSabOW+SdV0Ycc46Ar4Pqn0jZuyazKhUUQcqKvsg6qA@mail.gmail.com>
References: <CALD51P8hSabOW+SdV0Ycc46Ar4Pqn0jZuyazKhUUQcqKvsg6qA@mail.gmail.com>
Message-ID: <20161111043706.nrzzr7ca5nybi2ir@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Lijun QIN,

On Thu, Nov 10, 2016 at 07:28:13PM -0600, Lijun QIN wrote:
> Hello Buildroot supporter,
> 
> I have Buildroot 2015.11 with some Marvell flavor.
> According to Mavell's instructions, I did
> (1) make mvebu_armv7_le_defconfig
> (2) select external toolchain gcc5.2-HF
> (3) I run make menuconfig, trying to select Node.JS 4.1.2 package in
> Interpreter languages and scripting selection, but only node.JS 0.10.40 is
> available.

That's because nodejs 4.1.2 on Buildroot 2015.11 (and 6.7.0 on current master) 
depends on BR2_ARM_CPU_HAS_VFPV2:

config BR2_PACKAGE_NODEJS_V8_ARCH_SUPPORTS
        bool
        # On supported architectures other than ARM, no special requirement
        default y if !BR2_arm
        # On ARM, at least ARMv6+ with VFPv2+ is needed
        default y if !BR2_ARM_CPU_ARMV5 && BR2_ARM_CPU_HAS_VFPV2

The comment seems indicates that BR2_ARM_CPU_HAS_VFPV3 should also be fine. 
You may try changing this line to

        default y if !BR2_ARM_CPU_ARMV5 && (BR2_ARM_CPU_HAS_VFPV2 || BR2_ARM_CPU_HAS_VFPV3)

Yann, you added this dependency in commit f443386c5d. Is that the right fix?

baruch

> # BR2_ARM_FPU_VFPV2 is not set
> BR2_ARM_FPU_VFPV3=y

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
