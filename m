From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 1 Nov 2018 12:59:22 +0100
Subject: [Buildroot] [PATCH v6 1/2] board: amarula: Add A64-Relic support
In-Reply-To: <20181026130358.11776-1-jagan@amarulasolutions.com>
References: <20181026130358.11776-1-jagan@amarulasolutions.com>
Message-ID: <5400d862-d44e-c5ab-b3e6-b3b68193862e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Jagan,

On 26/10/18 15:03, Jagan Teki wrote:
> Add initial support for Amarula A64-Relic board
> with below features:
> - U-Boot 2018.07
> - Linux 4.17.0-rc6
> - Default packages from buildroot
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

 I was about to apply, but U-Boot doesn't seem to build without swig:

PYMOD   scripts/dtc/pylibfdt/_libfdt.so
unable to execute 'swig': No such file or directory
error: command 'swig' failed with exit status 1
make[5]: *** [scripts/dtc/pylibfdt/Makefile:27: scripts/dtc/pylibfdt/_libfdt.so]
Error 1

 I believe this has been discussed before but I can't find it.

 Also (but not needed to fix before acceptance):

[snip]
> +7. Write images from host onto eMMC using fastboot
> +  $ cd output/images
> +  $ sudo fastboot -i 0x1f3a flash loader1 sunxi-spl.bin
> +  $ sudo fastboot -i 0x1f3a flash loader2 u-boot.itb
> +  $ sudo fastboot -i 0x1f3a flash esp boot.vfat
> +  $ sudo fastboot -i 0x1f3a flash system rootfs.ext4

 Wouldn't it be simpler to have just a single partition that contains the kernel
and device tree in /boot in the ext4 partition? Of course, that requires
changing the default U-Boot environment, but it seems to me to be simpler than
this dual-partition approach.

 Also it isn't clear to me why the extlinux.conf is needed when we're actually
using U-Boot, but I guess there must be a reason for it :-)

 Regards,
 Arnout
