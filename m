From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 25 Mar 2021 22:20:17 +0100
Subject: [Buildroot] Buildroot: enable lib/firmware/brcm for rpi0w
In-Reply-To: <ed68882a97bad7976f53b30716196c96@umbiko.net>
References: <mailman.13.1616500803.19462.buildroot@busybox.net>
 <75b24e8f6fe588935be2f1320d172d68@umbiko.net>
 <20210324232703.46b691fe@gmx.net>
 <ed68882a97bad7976f53b30716196c96@umbiko.net>
Message-ID: <20210325222017.39c79288@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andreas,

On Thu, 25 Mar 2021 09:45:09 +0000, Andreas Ziegler <br015@umbiko.net> wrote:

> Hello Peter,
>
> Thank you for this detailed information!
>
> On 2021-03-24 22:27, Peter Seiderer wrote:
>
> > Or use
> > BR2_PACKAGE_LINUX_FIRMWARE/BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX
> > already containing the file
> > brcmfmac43455-sdio.raspberrypi,4-model-b.txt
> > ([1], but according to [2],[3],[4] the linux-firmware provided files
> > are
> > 'older than that used by the Raspbian distribution, and has (in
> > certain situations)
> > significantly worse performance than it (and indeed with some APs, will
> > not
> > associate at all).')?
> >
> > Did not (yet) compare the various provided firmware files:
> >
>
> I performed some tests this morning; the linux-firmware version is
> indeed considerably older than the rpi-wifi-firmware one (buildroot
> 2021.02-git):

Many thanks for doing the tests!

>
> rpi-wifi-firmware [1]
> [raspi]# dmesg | grep brcm
> [    1.016287] brcmfmac: brcmf_fw_alloc_request: using
> brcm/brcmfmac43455-sdio for chip BCM4345/6
> [    1.163138] brcmfmac: brcmf_fw_alloc_request: using
> brcm/brcmfmac43455-sdio for chip BCM4345/6
> [    1.170984] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4345/6 wl0:
> Mar 23 2020 02:19:54 version 7.45.206 (r725000 CY) FWID 01-88ee44ea
>
> linux-firmwlare [2]
> [raspi]# dmesg | grep brcmfmac
> [    1.014318] brcmfmac: brcmf_fw_alloc_request: using
> brcm/brcmfmac43455-sdio for chip BCM4345/6
> [    1.015164] usbcore: registered new interface driver brcmfmac
> [    1.123380] brcmfmac: brcmf_fw_alloc_request: using
> brcm/brcmfmac43455-sdio for chip BCM4345/6
> [    1.131265] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4345/6 wl0:
> Mar  1 2015 07:29:38 version 7.45.18 (r538002) FWID 01-6a2c8ad4
>
> Both worked (at least on my hardware: 'Machine model: Raspberry Pi 4
> Model B Rev 1.1' running 5.10.21-rt33-v8) and data rate over WiFi was
> not different for both versions.
>
> The version from [3] is quite recent:
>
> RPi-Distro / firmware-nonfree
> [raspi]# dmesg | grep brcmfmac
> [    1.036680] brcmfmac: brcmf_fw_alloc_request: using
> brcm/brcmfmac43455-sdio for chip BCM4345/6
> [    1.037717] usbcore: registered new interface driver brcmfmac
> [    1.183610] brcmfmac: brcmf_fw_alloc_request: using
> brcm/brcmfmac43455-sdio for chip BCM4345/6
> [    1.188657] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4345/6 wl0:
> Jan  4 2021 19:56:29 version 7.45.229 (617f1f5 CY) FWID 01-2dbd9d2e
>
> Also here, no change in throughput.
>
> The LibreELEC repository (rpi-wifi-firmware) seems to have adopted this
> version in commit 7dbd877545ae15069f2bd0e73893af942500e23d on Jan. 25.

So a good reason to stay with LibreELEC (and fix the firmware package to
provide raspberrypi,4-model-b.txt as a link or copy, do you know if missing
it has some disadvantages or produces only the firmware load warning or is
there a fallback to plain brcmfmac43455-sdio.txt?), keeping up with
RPi-Distro...

>
> Armbian-firmware, by the way, is on version 7.45.154 (2018-02-27).
>
> There seem to be some bigger changes in the pipeline: linux-firmware
> removed the Broadcom redistributed binaries in January [4] for the
> 20210208 release; instead Cypress firmware should be used. The upstream
> repository for this firmware seems to be murata-wireless /
> cyw-fmac-fw [5]
>
> I need to look into this in detail at some other time ...

Seems kind of (another) firmware mess...., different versions at different
repositories...., all with the same name (instead of clear version string)...

Regards,
Peter

>
> Kind regards,
> Andreas
>
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
> (version 20201022)
> [2]
> https://github.com/LibreELEC/brcmfmac_sdio-firmware-rpi/tree/9c0ffe9a7f0753b36ed88f7981905a989d940ea9
> [3] https://github.com/RPi-Distro/firmware-nonfree/tree/master/brcm
> [4]
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?h=20210208&id=0f0aefd733f70beae4c0246edbd2c158d5ce974c
> [5] https://github.com/murata-wireless/cyw-fmac-fw/
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
