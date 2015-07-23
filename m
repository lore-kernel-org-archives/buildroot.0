From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 08:57:18 +0200
Subject: [Buildroot] build libstdc++.so.6
In-Reply-To: <1437608087647-106967.post@n4.nabble.com>
References: <1436634230228-105322.post@n4.nabble.com>
 <20150712002830.018e4bc0@free-electrons.com>
 <1437584173498-106871.post@n4.nabble.com>
 <20150722220012.01206096@free-electrons.com>
 <1437608087647-106967.post@n4.nabble.com>
Message-ID: <20150723085718.745044df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Jul 2015 16:34:47 -0700 (PDT), glscantlen wrote:

> No doubt about that !
> If you don't mind I would appreciate any assistance.
> I have a github where I am trying to assemble instructions for others
> to see what I've done. goto:
> https://github.com/glscantlen/instructions/blob/master/README
> https://github.com/glscantlen/instructions/blob/master/Buildroot_XU3_MPlayer/build_xu3_mplayer.ins

As I suspected, this is *really* much more complicated than it needs to
be, and some of the steps are clearly violating the best practices of
Buildroot usage.

Some comments:

 1/ Don't download the Linaro toolchain manually, let Buildroot do it.

 2/ Don't download/build U-Boot manually, let Buildroot do it

 3/ You can try to use the genimage tool to generate the complete
    filesystem image rather than doing all those manual dd commands and
    fiddling with partprobe and al. See board/wandboard/genimage.cfg
    for an example in Buildroot. In the end, your instructions should
    be as simple as board/wandboard/readme.txt.

 4/ Don't manually explain the addition of your X.org armsoc driver
    package. Put your Buildroot Git tree somewhere, and use it.
    Manually describing changes is completely unreliable and
    inefficient. Also, please submit this package for integration in
    the upstream Buildroot.

 5/ Don't add anything to system/skeleton/, this is completely *ugly*.
    For youtube-dl, create a Buildroot package. For other changes, use
    a rootfs overlay (see the Buildroot manual for details). To
    adjust /etc/network/interfaces for DHCP on eth0, just set the
    option BR2_SYSTEM_DHCP.

 6/ Don't download/build the Linux kernel manually, let Buildroot do
    it.

 7/ Don't put a view of what needs to be enabled in menuconfig, just
    ship a defconfig for your configuration.

 8/ Don't manually fiddle with the Mali driver, create a Buildroot
    package for it.

All in all, if your documentation is not just:

	make <foobar>_defconfig
	make
	<some simple instructions to transfer the image to the SD card or using fastboot>

Then you got something wrong.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
