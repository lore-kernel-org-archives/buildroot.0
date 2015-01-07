From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 7 Jan 2015 15:12:20 +0100
Subject: [Buildroot] Fwd: Fwd: [PATCH v3] linux: add fbtft kernel
 extension
In-Reply-To: <CAFGceHEEwwRbCC5Go-mWHf0t5JXHLAvALPpUqPKNbRmDxJVb7w@mail.gmail.com>
References: <trinity-9aa0a0aa-dd80-4a62-a8bb-a195c3837d2c-1420497256500@3capp-gmx-bs51>
 <CAFGceHG3iJt2L1746hoM-O-hB_++n9Zh3g4hOWjqbkSyo49jSg@mail.gmail.com>,
 <CAFGceHEEwwRbCC5Go-mWHf0t5JXHLAvALPpUqPKNbRmDxJVb7w@mail.gmail.com>
Message-ID: <trinity-cade7727-b61a-4758-988e-0268c9c439a2-1420639940468@3capp-gmx-bs16>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Lou,

> Gesendet:?Mittwoch, 07. Januar 2015 um 14:06 Uhr
> Von:?"Lou Crittenden" <loucrittenden63@gmail.com>
> An:?buildroot at busybox.net, "Peter Seiderer" <ps.report@gmx.net>
> Betreff:?Fwd: Fwd: [Buildroot] [PATCH v3] linux: add fbtft kernel extension
> 
> Alright, I have the buildroot built and a resultant bootable system, but the screen doesn't initialize. Did you have to
> create an /etc/modules file and the corresponding /etc/init.d script to load the modules/drivers at boot or something?
> ?

Sorry, forgot to mention this part in my 'instruction' e-mail (but a description was already included in [1]).

For your case the following configuration changes should be needed:

On the sd-card boot partition:
- cmdline.txt: add 'fbcon=map:10 fbcon=font:VGA8x8'

On the sd-card root partition:
- add /etc/modules-load.d/fbtft.conf with 'fbtft_device'
- add /etc/modprobe.d/00-fbtft.conf with 'options fbtft_device name=waveshare32b'

If this works for you its fine, if not try to load the fbtft_device module via
insmod and play with the module parameters....and take a look at the
dmesg commnd output....on success a second frame buffer device /dev/fb1 should
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
> To: Peter Seiderer <ps.report at gmx.net[ps.report@gmx.net]>, buildroot at busybox.net[buildroot at busybox.net]
> 
> ?
> Yes, I'm using a waveshare32b. I bought it from here: http://www.ebay.com/itm/331320440420[http://www.ebay.com/itm/331320440420]
> 
> I didn't know this was an ili9340 device. I've tried looking up the controller type, but it's been difficult, as they are a
> little sketchy. I was able to enable this screen in raspbmc through the use of the "flexfb" driver, as the factory raspbian
> image also uses this driver. The touchscreen controller is an ads7846.
