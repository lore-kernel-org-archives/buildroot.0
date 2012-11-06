From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Tue, 06 Nov 2012 20:37:13 +0200
Subject: [Buildroot] Udev on a live CD system does not appear to
 populate /dev
In-Reply-To: <5099186E.1030409@macrium.com>
References: <5099186E.1030409@macrium.com>
Message-ID: <509958D9.7050108@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

6.11.2012 16:02, Antony Vennard kirjoitti:
> Hi All,
>
> I'm currently looking at using udev for a live cd environment built with
> buildroot, and I'm having trouble getting udev to pick up the machine's
> devices.
>
> I have some questions and some details that will (hopefully) help
> identify my problem
>
> Firstly, my kernel is configured to use devtmpfs:
>
> 681:CONFIG_DEVTMPFS=y
> 682:CONFIG_DEVTMPFS_MOUNT=y
>
> so as I understand it, /dev should be mounted as a tmpfs by the kernel
> and populated with /dev/null, /dev/console etc. Yet, my
> buildroot/output/target contains a dev folder with subdirectories
> created by buildroot.
>
> So, I tried both creating the entries with target/generic_device_table
> for tty0, tty1, console, null. This works, and udev reports it is
> scanning for devices and done, yet /dev never picks up e.g. /dev/sda, or
> /dev/disk/..., or so on. I have, in this configuration, copied
> /usr/lib/udev/rules.d/* to buildroot/output/target/etc/udev/rules.d to
> no avail; as far as I can see whatever rules I supply, even from my
> Fedora or Ubuntu distributions, do not seem to affect udev.
>
> Wondering if this creation method was wrong, I have then removed all of
> the entries in /dev so that the kernel can mount its own devtmpfs. When
> booting, /dev/null and /dev/tty1 are reported as missing. I imagine
> there is nothing in /dev at this stage
Im not sure but I tought that device nodes /dev/null and /dev/console
(and some others)
have to always be created manually
(either with buildroot device tables, by doing the mknod thing or just
by copying those
nodes from host system to output/target/dev or fs/skeleton/dev)
to be of any use.

At least that's what I have done always, created those /dev/null and
/dev/cosole and also
/dev/ram0 etc.. myself into output/target/dev and then make my initramfs
from that directory and
 let the hotplug program (either busybox's own mdev or udev) do the rest.

Here's what I have minimally in my own buildroot's fs/skeleton/dev
folder (which is copied at the end of the buildroot
process into output/target/dev )

crw-------.  1 root root 5, 1 11.1.2012 console
lrwxrwxrwx.  1 root root   10 19.3.2012 log -> ../tmp/log
brw-rw----.  1 root root 7, 0 20.8. 00:58 loop0
crw-------.  1 root root 1, 1 11.1.2012 mem
crw-r--r--.  1 root root 1, 3 12.1.2012 null
drwxr-xr-x.  2 root root 1024 12.1.2012 pts
brw-r-----.  1 root root 5, 0 12.1.2012 ram0
crw-r--r--.  1 root root 5, 0 12.1.2012 tty
crw-------.  1 root root 4, 0 11.1.2012 tty0
crw-------.  1 root root 4, 1 11.1.2012 tty1
crw-------.  1 root root 1, 5 11.1.2012 zero

Now, some of those might not be strictly necessary and should be created
by mdev/udev.
But it's good to have them just in case.

Besides some pre-made device nodes, make sure that you have S10udev in your
output/target/etc/init.d.
That is the one responsible of starting udev.

You can also copy S10udev to fs/skeleton/etc/init.d to make sure that
it's included in
output/target/etc/init.d everytime you make complete new rebuild
(make clean && make)


Im presuming you *are* using initramfs in your early device initialization ?
(if not then you absolutely should. Live CD without initramfs is useless)

Best regards
Stefan
> Various possibly related points:
>  * I thought udev required udevd, yet I can't see that either running or
> available on the ISO, nor can I find a configuration option to create it.
>  * I have D-Bus built for the system, as I read udev required it.
>  * I can see sda1 in /sys/block/sda/sda1; likewise for other attached
> storage devices.
>
> Am I doing anything very wrong? I get the feeling I must be missing
> something for this to not work, yet I'm not sure what.
>
> Can anyone offer any advice? Happy to provide config snippets etc.
>
> Using buildroot 2012.08.
>
> Thanks,
>
> Antony
>
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121106/3d142432/attachment.html>
