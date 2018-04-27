From: Andreas Ziegler <br015@umbiko.net>
Date: Fri, 27 Apr 2018 09:59:01 +0200
Subject: [Buildroot] enc28j60 ethernet module doesn't work on rpi0
In-Reply-To: <mailman.21.1524657611.10868.buildroot@busybox.net>
References: <mailman.21.1524657611.10868.buildroot@busybox.net>
Message-ID: <0fa76360ff8efd2158cac7f627b5406f@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jacek,

> Date: Tue, 24 Apr 2018 19:19:41 +0000
> From: Jacek Drewniak <yahuza.pl@gmail.com>
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] enc28j60 ethernet module doesn't work on rpi0

> It seems that problem is with loading modules at all. Now after 
> `Starting
> mdev...` I can see that others modules loaded: gpiomem, watchdog.

This may be related to your init system. Probably mdev was not started 
previously or did not pick up kernel events. Check if mdev is 
initialized somewhere during system initialization. For example, if you 
use busybox, there should be a /etc/init.d/S10mdev script. Also mdev 
needs a line for modprobe in /etc/mdev.conf. This config item is present 
in the current buildroot configuration, but was missing before 2016.

>> - I can modprobe enc28j60.ko and it appears in lsmod but nothing else
>> happens (no eth0 in ifconfig)

If you start the interface manually after loading the driver using 'ifup 
eth0', it should be visible.

Kind regards,
Andreas
