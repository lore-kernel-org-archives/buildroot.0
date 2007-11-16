From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 16 Nov 2007 13:44:46 +0200
Subject: [Buildroot] Alsa problem with arm 2.6.23.1 and uclibc
In-Reply-To: <473D70A4.3000901@studiofuga.com>
References: <473D70A4.3000901@studiofuga.com>
Message-ID: <473D82AE.5040907@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Federico!

I'm observing the same problem with ALSA as you.

> ioctl(4, USBDEVFS_CONTROL, 0xbef809cc)  = 0
> ioctl(4, UI_DEV_CREATE, 0xbef80ab0)     = 0
> ioctl(4, USBDEVFS_CONNECTINFO, 0xbef80634) = 0
> ioctl(4, USBDEVFS_HUB_PORTINFO, 0xbef80748) = -1 ENOTTY (Inappropriate
> ioctl for device)

Think these lines are key to understanding what the problem is.

Regards,
Ivan


ing. Federico Fuga wrote:
> Hi,
> 
> Do you know of any problem with alsa and uclibc and kernel 2.6.23 on arm?
> I built a uclibc buildroot, now all works fine except alsa. Aplay can
> see the devices, but alsactl cannot change the mixer levels:
> 
> # aplay  -l
> **** List of PLAYBACK Hardware Devices ****
> card 0: EMX270 [EM-X270], device 0: AC97 HiFi AC97 HiFi-AC97-0 []
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> card 0: EMX270 [EM-X270], device 1: AC97 Aux AC97 Aux-AC97-1 []
>   Subdevices: 1/1
>   Subdevice #0: subdevice #0
> # aplay  -L
> default:CARD=EMX270
>     EM-X270,
>     Default Audio Device
> null
>     Discard all samples (playback) or generate zero samples (capture)
> # alsactl restore
> alsactl: set_control:1159: Cannot write control '2:0:0:Speaker Playback
> Volume:0' : Inappropriate ioctl for device
> # alsactl store -f /root/sample
> alsactl: get_control:218: Cannot read control '2,0,0,Speaker Playback
> Volume,0': Inappropriate ioctl for device
> 
> The devices in /dev/snd seems ok:
> 
> # ls /dev/snd/ -l
> crw-rw-rw-    1 root     root     116,   0 Dec 31 17:00 controlC0
> crw-rw-rw-    1 root     root     116,  24 Dec 31 17:00 pcmC0D0c
> crw-rw-rw-    1 root     root     116,  16 Dec 31 17:00 pcmC0D0p
> crw-rw-rw-    1 root     root     116,  17 Dec 31 17:00 pcmC0D1p
> crw-rw-rw-    1 root     root     116,  33 Dec 31 17:00 timer
> 
> The strange thing is that in an Angstrom Linux based on glibc and the
> same kernel and alsa-lib/utils/libasound version (same patches, same
> all) it works without problems.
> last few lines of strace output of alsactl restore :
> 
> open("/usr/lib/libasound.so.2", O_RDONLY) = 4
> fstat(4, {st_mode=S_IFREG|0755, st_size=959649, ...}) = 0
> close(4)                                = 0
> open("/dev/snd/controlC0", O_RDONLY)    = 4
> close(4)                                = 0
> open("/dev/snd/controlC0", O_RDWR)      = 4
> ioctl(4, USBDEVFS_CONTROL, 0xbef809cc)  = 0
> ioctl(4, UI_DEV_CREATE, 0xbef80ab0)     = 0
> ioctl(4, USBDEVFS_CONNECTINFO, 0xbef80634) = 0
> ioctl(4, USBDEVFS_HUB_PORTINFO, 0xbef80748) = -1 ENOTTY (Inappropriate
> ioctl for device)
> 
> Any idea?
> 
> Thank you in advance!
> best regards,
> 
> ing. Federico Fuga
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot


-- 

--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
