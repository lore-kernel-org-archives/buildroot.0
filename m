From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 Feb 2021 18:49:38 +0100
Subject: [Buildroot] [RFC PATCH] stm32mp1: modify gpt partitions to fix
 BSP update
In-Reply-To: <20210130204456.793098-1-geomatsi@gmail.com> (Sergey
 Matyukevich's message of "Sat, 30 Jan 2021 23:44:55 +0300")
References: <20210130204456.793098-1-geomatsi@gmail.com>
Message-ID: <87eeht5bnx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sergey" == Sergey Matyukevich <geomatsi@gmail.com> writes:

 > Hi all,
 > BSP update for stm32mp1 boards does not work right out of the box. The
 > first boot is ok, but the second boot fails:

 > NOTICE:  CPU: STM32MP157CAC Rev.B
 > NOTICE:  Model: STMicroelectronics STM32MP157C-DK2 Discovery Board
 > NOTICE:  Board: MB1272 Var2.0 Rev.C-01
 > NOTICE:  BL2: v2.4(release):2020.11-1087-g8fac193e6d-dirty
 > NOTICE:  BL2: Built : 20:58:09, Jan 27 2021
 > ERROR:   Checksum: 0x5023a37 (awaited: 0x5046ea4)
 > ERROR:   Header check failed
 > ERROR:   BL2: Failed to load image id 5 (-12)

 > The root cause is in changes for stm32mp1 trusted defconfig in updated
 > U-Boot: see U-Boot commit 76db1681da52 ("stm32mp1: use a specific SD/eMMC
 > partition for U-Boot enviromnent"). Starting from that commit, U-Boot
 > environment is stored at the end of the U-Boot partition. As a result,
 > saving environment changes GPT partition checksum verified by ATF.

 > IIUC at least the following two approaches can be implemented to make
 > updated BSP work smoothly.

 > The first approach is to modify U-Boot config fragment for stm32mp1 boards
 > and to re-enable saving U-Boot environment on ext4. However this choice
 > implies certain restriction on rootfs ext4 features since it should be
 > writable by U-Boot. See the mentioned U-Boot commit message for details.

 > Another approach is implemented by the attached patch: keep U-Boot
 > environment on a dedicated GPT partition.

 > Thoughts ? Comments ?

If upstream wants to use a separate partition for the environment, then
that is fine by me - But I would prefer to not patch u-boot and just
name the environment partition ssbl.

-- 
Bye, Peter Korsgaard
