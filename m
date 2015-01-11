From: Lou Crittenden <loucrittenden63@gmail.com>
Date: Sat, 10 Jan 2015 20:00:15 -0600
Subject: [Buildroot] Fwd: Fwd: Fwd: [PATCH v3] linux: add fbtft kernel
	extension
In-Reply-To: <trinity-cade7727-b61a-4758-988e-0268c9c439a2-1420639940468@3capp-gmx-bs16>
References: <trinity-9aa0a0aa-dd80-4a62-a8bb-a195c3837d2c-1420497256500@3capp-gmx-bs51>
 <CAFGceHG3iJt2L1746hoM-O-hB_++n9Zh3g4hOWjqbkSyo49jSg@mail.gmail.com>
 <CAFGceHEEwwRbCC5Go-mWHf0t5JXHLAvALPpUqPKNbRmDxJVb7w@mail.gmail.com>
 <trinity-cade7727-b61a-4758-988e-0268c9c439a2-1420639940468@3capp-gmx-bs16>
Message-ID: <CAFGceHF1wdmB36HVv8RNht=1x6X0rs87zVBOqsi8m=b+rMr5Cw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for this info. I have some questions to ask:

I saw that you have updated your patch. What did you do to it?

Did you have to manually create the /etc/modules-load.d and /etc/modprobe.d
folders and the text files you named in your setup? Mine didn't have those.
I manually made the directories and text files as laid out but the device
still didn't work.

How did you build the fbtft drivers in your menuconfig: as add-on modules
(with the option asterisked) or built-in (with the option checkmarked)?

I couldn't find a "waveshare32b" model in any driver list, so I'm using the
"flexfb" module that my factory image uses. Still no go.

What I've done thus far:
I used lsmod on the flexfb.ko, and while the command goes through fine
without error, but nothing happens with the display (what am I missing
parameters wise?). I then ran dd if=/dev/urandom of=/dev/fb1. Nothing.

I ran insmod /lib/modules/3.12.28/kernel/drivers/video/fbtft/ili9340.ko. It
complains "cannot load module: no such file or directory" even if I use an
absolute path where "ili9340.ko" is located.


I have my buildroot .config file in the attachments if you wish to take a
look at my setup to compare and maybe edit/reupload.

---------- Forwarded message ----------
From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, Jan 7, 2015 at 8:12 AM
Subject: Aw: Fwd: Fwd: [Buildroot] [PATCH v3] linux: add fbtft kernel
extension
To: Lou Crittenden <loucrittenden63@gmail.com>
Cc: buildroot at busybox.net


Hello Lou,

> Gesendet: Mittwoch, 07. Januar 2015 um 14:06 Uhr
> Von: "Lou Crittenden" <loucrittenden63@gmail.com>
> An: buildroot at busybox.net, "Peter Seiderer" <ps.report@gmx.net>
> Betreff: Fwd: Fwd: [Buildroot] [PATCH v3] linux: add fbtft kernel
extension
>
> Alright, I have the buildroot built and a resultant bootable system, but
the screen doesn't initialize. Did you have to
> create an /etc/modules file and the corresponding /etc/init.d script to
load the modules/drivers at boot or something?
>

Sorry, forgot to mention this part in my 'instruction' e-mail (but a
description was already included in [1]).

For your case the following configuration changes should be needed:

On the sd-card boot partition:
- cmdline.txt: add 'fbcon=map:10 fbcon=font:VGA8x8'

On the sd-card root partition:
- add /etc/modules-load.d/fbtft.conf with 'fbtft_device'
- add /etc/modprobe.d/00-fbtft.conf with 'options fbtft_device
name=waveshare32b'

If this works for you its fine, if not try to load the fbtft_device module
via
insmod and play with the module parameters....and take a look at the
dmesg commnd output....on success a second frame buffer device /dev/fb1
should
be available (/dev/fb0 is the hdmi output)...

$ dd if=/dev/urandom of=/dev/fb1

should fill your waveshare device with random snow...

Or take a look at [2] and [3], seems similare displays...

Regards,
Peter


[1] http://lists.busybox.net/pipermail/buildroot/2014-December/116096.html
[2] https://github.com/notro/rpi-firmware/issues/6
[3]https://github.com/notro/fbtft/issues/215

>
> ---------- Forwarded message ----------
> From: Lou Crittenden <loucrittenden63@gmail.com>
> Date: Mon, Jan 5, 2015 at 5:03 PM
> Subject: Re: Fwd: [Buildroot] [PATCH v3] linux: add fbtft kernel extension
> To: Peter Seiderer <ps.report at gmx.net[ps.report@gmx.net]>,
buildroot at busybox.net[buildroot at busybox.net]
>
>
> Yes, I'm using a waveshare32b. I bought it from here:
http://www.ebay.com/itm/331320440420[http://www.ebay.com/itm/331320440420]
>
> I didn't know this was an ili9340 device. I've tried looking up the
controller type, but it's been difficult, as they are a
> little sketchy. I was able to enable this screen in raspbmc through the
use of the "flexfb" driver, as the factory raspbian
> image also uses this driver. The touchscreen controller is an ads7846.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150110/f0a0e8f6/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 79732 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150110/f0a0e8f6/attachment-0001.obj>
