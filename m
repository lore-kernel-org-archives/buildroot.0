From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 8 Feb 2014 22:06:50 +0100
Subject: [Buildroot] [PATCH] linux: don't automatically set
 uevent_helper with mdev /dev management
In-Reply-To: <87k3d55nw8.fsf@dell.be.48ers.dk>
References: <769563a34e142e85ec4c.1391761259@argentina>
 <87wqh6640h.fsf@dell.be.48ers.dk>
 <CAAXf6LV=o61iJVycRW-+4boS08=Ar39-uxgUqj6XoqcbzSHmrA@mail.gmail.com>
 <87ob2i63cg.fsf@dell.be.48ers.dk>
 <CAAXf6LWNtuuivOXDhqMbK+3kh6t1vBHCOmU1D-9+PJqi_wjLjw@mail.gmail.com>
 <87k3d55nw8.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LU1YT7Ypua=Frs0gSikDLJ_E-sWaKPn4BMY0Mz2sUHOWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sat, Feb 8, 2014 at 9:51 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
> Hi,
>
>  >> No, mdev -s only scans /sys for devices and create the corresponding
>  >> device nodes (already done by devtmpfs) and execute whatever commands
>  >> you have defined, it afaik doesn't handle module load or firmware requests.
>
>  > When you say 'module load', the only relevant consequence of that is
>  > the creation of nodes in /sys that may need corresponding entries in
>  > /dev right? So this is covered by the S10mdev script, as far as I see.
>  > What else would happen in 'module load' that mdev does not cover?
>
> I mean module load as in automatic loading of kernel modules
> modprobe. The kernel generates hotplug events with the needed modalias
> that mdev can pass to modprobe, but our mdev.conf is not setup to do that.
>
> Here's a blog post about it:
>
> https://frankpzh.wordpress.com/2011/04/16/kmod-udev-and-modprobe/
>
>  > However, the kernel configuration says: "This should not be used
>  > today, because usual systems create many events at bootup or device
>  > discovery in a very short time frame. One forked process per event can
>  > create so many processes that it creates a high system load, or on
>  > smaller systems it is known to create out-of-memory situations during
>  > bootup."
>
> Yes, the "modern" way to send these events (E.G. what udev is using) is
> afaik through netlink instead of forking a process for each, but if you
> want to handle these events through mdev then there's not really any way
> around it.
>
>
>  > So then I wonder, how is it supposed to work for module load and
>  > firmware loading if you can't use this option. Or put another way: are
>  > you sure we need to set the uevent_helper_path for that?
>
> If you want to be notified of hotplug events (and don't use netlink),
> then you have to set it.
>
> Out of interest I did a quick test with qemu_arm_versatile_defconfig and
> the following patch:
>
> diff -u package/busybox/S10mdev output/target/etc/init.d/S10mdev
> --- package/busybox/S10mdev     2013-10-24 09:55:30.270408593 +0200
> +++ output/target/etc/init.d/S10mdev    2014-02-08 21:26:48.450713447 +0100
> @@ -7,6 +7,8 @@
>    start)
>         echo "Starting mdev..."
>         echo /sbin/mdev >/proc/sys/kernel/hotplug
> +       echo -n "seqnum: "
> +       cat /sys/kernel/uevent_seqnum
>         /sbin/mdev -s
>         ;;
>    stop)
>
> And I see the kernel triggers 357 hotplug events before we get
> here. Looking at the pid number after bootup and login that also seems
> to match (428 with CONFIG_UEVENT_HELPER_PATH="/sbin/mdev" and 73 when
> set to the empty string), but I don't see any significant boot speed
> difference here.
>
> So, I'm not saying I don't believe you or that it perhaps wouldn't be
> better to handle the initial hotplug events with mdev, just that it less
> "correct" - But mdev is afaik inherently racy, so perhaps not doing it
> would be the "least bad" approach (and gives us same behaviour if kernel
> isn't built by buildroot).
>

Thanks for the clarifications and test.
An alternative is to provide an option in buildroot to select the
behavior: either the current behavior (install mdev as hotplug helper
by setting the kernel config) or the proposed behavior in this patch
by removing that.
Then every project can make its own tradeoff...

What do you think of that?

Thanks,
Thomas
