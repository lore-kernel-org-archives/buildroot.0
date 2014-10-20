From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 20 Oct 2014 15:17:10 -0300
Subject: [Buildroot] [PATCH] package/eudev: tweak initscript
In-Reply-To: <20141020181045.GL3742@free.fr>
References: <1413827120-11083-1-git-send-email-gustavo@zacarias.com.ar>
 <20141020175408.GJ3742@free.fr> <54454D23.3060608@zacarias.com.ar>
 <20141020181045.GL3742@free.fr>
Message-ID: <544551A6.4060807@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/20/2014 03:10 PM, Yann E. MORIN wrote:

> Mine has no timeout, but from man udevadm, the default is 120s:
> 
>    udevadm settle [options]
>        Watches the udev event queue, and exits if all current events are
>        handled.
> 
>        --timeout=seconds
>            Maximum number of seconds to wait for the event queue to
>            become empty. The default value is 120 seconds. A value of
>            0 will check if the queue is empty and always return
>            immediately.
> 
> So, I think 10s are a bit too short, but can not really suggest a better
> default. Maybe we could just keep the default timeout, even though it is
> a bit long?

120s sounds brutal IMHO, you'll have to wait 2 full minutes to see
anything. But yeah we could argue 10s is a bit short, maybe 30s is a
good compromise?

> Whether we wait 10 or 120 seconds, if something's stuck, there's not
> much we can do about it. My distro, however, does this:
> 
>     # wait for the udevd childs to finish
>     log_action_begin_msg "Waiting for /dev to be fully populated"
>     if udevadm settle; then
>         log_action_end_msg 0
>     else
>         log_action_end_msg 0 'timeout'
>     fi
>  
> Which we could actually do (except in a simpler way, like log the
> issue).

Probably something like...
udevadm settle --timeout=30 || echo "udevadm settle timed out!"

> Not only USB mass-storage for root, but eth over USB, too. I've seen a
> USB bus take about 8s to properly initialise and enumerate all the
> devices, and a few seconds more for the USB-eth device to show up, and
> there was an NFS resource to be mounted from /etc/fstab.
> 
> Anyway, this is a corner case.

One would hope you don't switch root to nfs until you get the proper
mount too which would mean a valid ip address as well (this without
using the kernel nfsroot/dhcp client).
Using the kernel subsystem i never tried using ethernet over usb but
presumably rootwait would wait until ip negotiation is done? (again
dunno what happens with the internal dhcp client if eth* isn't ready yet).
Regards.
