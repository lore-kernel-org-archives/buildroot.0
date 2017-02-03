From: =?UTF-8?Q?Guillaume_GARDET_-_Olis=c3=a9o?= <guillaume.gardet@oliseo.fr>
Date: Fri, 3 Feb 2017 10:51:56 +0100
Subject: [Buildroot] Firmware auto-loading does not work
In-Reply-To: <871svk8t56.fsf@dell.be.48ers.dk>
References: <5a5c69bf-efc5-e35c-f95c-d303047320c4@oliseo.fr>
 <874m0ngv5h.fsf@dell.be.48ers.dk>
 <7ee11e7f-a489-9f3a-cfd8-3d93f291f695@oliseo.fr>
 <87ziiffdqw.fsf@dell.be.48ers.dk>
 <718ddc67-8e29-1c1b-3a73-74ada73662ab@oliseo.fr>
 <871svk8t56.fsf@dell.be.48ers.dk>
Message-ID: <47a61250-05eb-b3e6-54f6-3bb27e897f0e@oliseo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I found the problem thanks to mdev log:
     mdev[716]: 00:04:57.841774 ACTION:add SUBSYSTEM:firmware DEVNAME:(null) DEVPATH:/devices/platform/musb-omap2430/musb-hdrc.0/usb2/2-1/2-1:1.0/firmware/2-1:1.0 FW:rt2870.bin
     mdev[716]: rule matched, line -1
     mdev[716]: can't change directory to '/sys/devices/platform/musb-omap2430/musb-hdrc.0/usb2/2-1/2-1:1.0/firmware/2-1:1.0': No such file or directory
     mdev[717]: 00:05:57.982454 ACTION:remove SUBSYSTEM:firmware DEVNAME:(null) DEVPATH:/devices/platform/musb-omap2430/musb-hdrc.0/usb2/2-1/2-1:1.0/firmware/2-1:1.0 FW:rt2870.bin
     mdev[717]: 00:05:57.982545 exiting

The thing is that the PATH is not good :
* requested : /sys/devices/platform/musb-omap2430/musb-hdrc.0/usb2/2-1/2-1:1.0/firmware/2-1:1.0
* real: /sys/devices/platform/musb-omap2430.0/musb-hdrc.0/usb2/2-1/2-1:1.0/firmware/2-1:1.0

The only difference is the ".0" missing after musb-omap2430. Any idea why there is this difference?


Guillaume




Le 30/01/2017 ? 16:27, Peter Korsgaard a ?crit :
>>>>>> "Guillaume" == Guillaume GARDET <- Olis?o <guillaume.gardet@oliseo.fr>> writes:
> Hi,
>
>   >> Can you confirm that it works if you enable that option.
>   >>
>
>   > I get back the hardware for testing and it still does not work, even if I enable CONFIG_FEATURE_MDEV_LOAD_FIRMWARE=y :
>   >     phy0 -> rt2x00lib_request_firmware: Info - Loading firmware file 'rt2870.bin'.
>   > and after 60 seconds, I get:
>   >     phy0 -> rt2x00lib_request_firmware: Error - Failed to request Firmware.
>   >     phy0 -> rt2x00lib_request_firmware: Error - Error is '-2'.
>
>   > Whereas the firmware file is in /lib/firmware/
>
>   > Any idea what could be wrong?
>
> Not really. Please double check that you enabled
> CONFIG_FEATURE_MDEV_LOAD_FIRMWARE in busybox. To debug further, I
> suggest you stick some fprintf statements (E.G. to your serial port /
> console) in mdev.c to see if it gets called and what is going on.
>
