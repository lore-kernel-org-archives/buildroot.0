From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 24 Mar 2021 23:27:03 +0100
Subject: [Buildroot] Buildroot: enable lib/firmware/brcm for rpi0w
In-Reply-To: <75b24e8f6fe588935be2f1320d172d68@umbiko.net>
References: <mailman.13.1616500803.19462.buildroot@busybox.net>
 <75b24e8f6fe588935be2f1320d172d68@umbiko.net>
Message-ID: <20210324232703.46b691fe@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Laurentiu-Cristian, Andreas,

On Wed, 24 Mar 2021 06:37:23 +0000, Andreas Ziegler <br015@umbiko.net> wrote:

> Hello Laurentiu-Cristian,
>
> > Subject: [Buildroot] Buildroot: enable lib/firmware/brcm for rpi0w
>
> > output/target/lib/firmware/brcm/brcmfmac43430-sdio.raspberrypi-rpi.txt
>
> The nvram file with 'raspberrypi' in its name is not present in the
> rpi-wifi-firmware blob; you need to create it yourself. As an example,
> this is what I use in a post-build script for a RPi4:
>
>    ### create missing nvram file for Raspberry Pi 4
>    _TARGET_DIR="${TARGET_DIR}/lib/firmware"
>    src_file=brcm/brcmfmac43455-sdio.txt
>    dst_file=brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
>    if [ -f ${_TARGET_DIR}/${src_file} ] && ! [ -h
> ${_TARGET_DIR}/${dst_file} ]; then
> 	ln -rs ${_TARGET_DIR}/${src_file} ${_TARGET_DIR}/${dst_file}
>    fi

Or use BR2_PACKAGE_LINUX_FIRMWARE/BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX
already containing the file brcmfmac43455-sdio.raspberrypi,4-model-b.txt
([1], but according to [2],[3],[4] the linux-firmware provided files are
'older than that used by the Raspbian distribution, and has (in certain situations)
significantly worse performance than it (and indeed with some APs, will not
associate at all).')?

Did not (yet) compare the various provided firmware files:

- http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
- github,LibreELEC,brcmfmac_sdio-firmware-rpi
- https://github.com/RPi-Distro/firmware-nonfree/tree/master/brcm

Regards,
Peter

[1] https://git.buildroot.net/buildroot/tree/package/linux-firmware/linux-firmware.mk#n602
[2] https://forums.gentoo.org/viewtopic-t-1108138-start-0.html
[3] https://forums.gentoo.org/viewtopic-p-8398532.html#8398532
[4] https://forum.manjaro.org/t/significant-wifi-speed-increase-with-latest-firmware/43607

>
> Kind regards,
> Andreas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
