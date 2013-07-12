From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 12 Jul 2013 07:27:43 -0300
Subject: [Buildroot] [PATCH] busybox: register mdev as hotplug helper
In-Reply-To: <CAAXf6LVSOCLS54uAwJHH6DwenrexRY=17v_PoOe_KTnmWWTvWg@mail.gmail.com>
References: <1373574654-32427-1-git-send-email-gustavo@zacarias.com.ar>
 <CAAXf6LVSOCLS54uAwJHH6DwenrexRY=17v_PoOe_KTnmWWTvWg@mail.gmail.com>
Message-ID: <51DFDA1F.60904@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/12/2013 04:01 AM, Thomas De Schampheleire wrote:
> In linux/linux.mk, there mdev is already set as hotplug helper in the
> kernel configuration.
> How does this change relate to it? At first sight, it seems unnecessary.
> 
> I did notice that setting mdev as hotplug helper in the kernel
> configuration, can seriously impact boot performance. On a board with
> a not so fast single core processor (around 500MHz) boot time until
> userspace became about 10 seconds coming from 2s. We solved this by
> setting no helper in the kernel configuration (and telling buildroot
> to use just devtmpfs instead of mdev), and manually copying S10mdev to
> the rootfs. Then, mdev is run once during userspace init.
> This doesn't give automatic firmware loading, but that would be solved
> by your above patch, I think.
> 
> Did anyone else notice such slowdown behavior?

I actually came up with this patch because a user on a pandaboard had
issues getting the wifi up (wl127x, needs firmware).
At first he was running a static device tree configuration which
explained the problem.
He then switched to mdev and things didn't work, and switching to udev
did make it work.
So i looked at S10mdev and saw that the hotplug helper wasn't registered.
It's likely that he didn't make clean between switching to mdev and the
kernel hence didn't get reconfigured/rebuilt and that was the problem.
However as you say, if the kernel has pre-registered the hotplug helper
in the configuration all the hotplug events at boot time are probably
getting called (all the bus interfaces and whatnot).
I tend to use my own initscripts tree since it's quite tweaked regarding
the bare default (i basically nuke all of buildroots initscripts and
replace them with my own), and on an arm920t (slow really, 180 mhz) i
have no major delay when using this method.
The only "drawback" would be missing usb devices if they're already
plugged in and the usb controller driver isn't a module - but really
that's coldplug-world.
Regards.
