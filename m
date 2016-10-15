From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 18:32:51 +0200
Subject: [Buildroot] [PATCH 1/2] configs: update beaglebone_defconfig
In-Reply-To: <1474582849-10730-1-git-send-email-lothar.felten@gmail.com>
References: <1474582849-10730-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <20161015183251.4bc88865@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Sep 2016 00:20:48 +0200, Lothar Felten wrote:
> This patch updates the target config for the beaglebone based on the AM335x
> CPU. It also supports the beagleboneblack, the TI evm and evmsk.
> Device tree blobs for am335x-evm, am335x-evmsk, am335x-bone, am335x-boneblack
> will be built and a sd card image is created with a post-image script.
> The kernel and driver versions match the ti-processor-sdk 02.00.00.00.
> Patches allow the use of old AM335x evm revisions (1 bit sd card) and JTAG
> debugging.
> 
> Kernel JTAG patch:
> By default the kernel will disable the JTAG clock, access via the JTAG port
> will not work after the kernel booted. The AM335x-evm has a JTAG header fitted,
> this patch keeps the JTAG clock alive.
> 
> Uboot SD card patch:
> Early AM335x-evm boards can only use 1 bit communication to the SD card, on
> newer board revisions this might be fixed.
> Forcing 1 bit communication slows down the communication but will work
> regardless if the SD card is attached via 1 or 4 bits.
> If the board has a working 4 bit SD card interface, this patch can be removed,
> this will speed up the access.
> 
> Signed-off-by: Lothar Felten <lothar.felten@gmail.com>

Thanks, I've applied your patch. However, after discussing with Peter,
I removed the 1-bit MMC patch. Indeed, this defconfig is mainly used by
BeagleBone users, and this platform is not affected by the 1-bit
problem. Therefore, we found it to be really annoying to reduce their
MMC performance in U-Boot by a factor of four just because some early
335x EVM boards that almost nobody has access to are broken.

If you really want to have a nice support for these early broken
boards, then we recommend you to cook a U-Boot patch that detects the
board revision, and applies the quirk only in this case. Such a quirk
can be upstreamed in U-Boot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
