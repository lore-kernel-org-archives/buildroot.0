From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Oct 2014 20:10:45 +0200
Subject: [Buildroot] [PATCH] package/eudev: tweak initscript
In-Reply-To: <54454D23.3060608@zacarias.com.ar>
References: <1413827120-11083-1-git-send-email-gustavo@zacarias.com.ar>
 <20141020175408.GJ3742@free.fr> <54454D23.3060608@zacarias.com.ar>
Message-ID: <20141020181045.GL3742@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, All,

On 2014-10-20 14:57 -0300, Gustavo Zacarias spake thusly:
> On 10/20/2014 02:54 PM, Yann E. MORIN wrote:
> 
> > Hmmm... This exit won't do much: it exits a sub-shell, so the initscript
> > will still continue...
> 
> I've focused on fixing the one problem, i didn't audit the whole script.

Sorry, that was not a critcism of your patch. I just noticed it by
chance...

> >> -        udevadm trigger --action=add
> >> -        udevadm settle
> >> +        udevadm trigger --type=subsystems --action=add
> >> +        udevadm trigger --type=devices --action=add
> >> +        udevadm settle --timeout=10
> > 
> > Why did you add a timeout, and not explain it?
> > 
> > Also, are 10 seconds really enough? What happens if a device takes
> > longer than 10s to initialise (and it is needed to boot, like a slow
> > USB mass-storage) ?
> 
> It just seems prudent to avoid a stall, but yeah forgot to mention it,
> it's the usual practice in many distros.

Mine has no timeout, but from man udevadm, the default is 120s:

   udevadm settle [options]
       Watches the udev event queue, and exits if all current events are
       handled.

       --timeout=seconds
           Maximum number of seconds to wait for the event queue to
           become empty. The default value is 120 seconds. A value of
           0 will check if the queue is empty and always return
           immediately.

So, I think 10s are a bit too short, but can not really suggest a better
default. Maybe we could just keep the default timeout, even though it is
a bit long?

Whether we wait 10 or 120 seconds, if something's stuck, there's not
much we can do about it. My distro, however, does this:

    # wait for the udevd childs to finish
    log_action_begin_msg "Waiting for /dev to be fully populated"
    if udevadm settle; then
        log_action_end_msg 0
    else
        log_action_end_msg 0 'timeout'
    fi
 
Which we could actually do (except in a simpler way, like log the
issue).

> You've got rootwait & friends for that, remember this is post mount-root
> so it doesn't matter there.

Not only USB mass-storage for root, but eth over USB, too. I've seen a
USB bus take about 8s to properly initialise and enumerate all the
devices, and a few seconds more for the USB-eth device to show up, and
there was an NFS resource to be mounted from /etc/fstab.

Anyway, this is a corner case.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> And if you're doing initramfs then
> switching/pivoting to some other root, well, you're scripting it, you
> should take care of it there since you're doing the mount.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
