From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 27 Nov 2014 10:12:01 +0200
Subject: [Buildroot] [PATCH] system/device_table.txt: add /dev/null entry
In-Reply-To: <87fvd5oz47.fsf@dell.be.48ers.dk>
References: <0a2f80f7ceb3272bf534f85fbf5030df36cae191.1417070676.git.baruch@tkos.co.il>
 <87fvd5oz47.fsf@dell.be.48ers.dk>
Message-ID: <20141127081201.GQ2374@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, Nov 27, 2014 at 08:56:40AM +0100, Peter Korsgaard wrote:
> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
> 
>  > /dev/null is the "console" for system startup commands listed in the default
>  > /etc/inittab. These commands fail when /dev/null isn't there. This breaks
>  > BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV, as /proc and /sys are not mounted when
>  > mdev runs, causing the following errors:
> 
>  > can't open /dev/null: No such file or directory
>  > can't open /dev/null: No such file or directory
>  > can't open /dev/null: No such file or directory
>  > can't open /dev/null: No such file or directory
>  > can't open /dev/null: No such file or directory
>  > can't open /dev/null: No such file or directory
>  > ...
> 
> Hmm, is this on a kernel without devtmpfs? Devtmpfs is expected to be
> used with mdev (and we automatically enable it if you build a kernel
> with BR).

I am currently using a kernel built with no devtmpfs support. Don't we support 
mdev without devtmpfs anymore? Once I added /dev/null the system seems to boot 
successfully as is, with /dev fully populated.

> > Starting mdev...
>  > /etc/init.d/S10mdev: line 19: can't create /proc/sys/kernel/hotplug: nonexistent directory
>  > mdev: /sys/class: No such file or directory
> 
> So you don't have /proc and /sys? Is this also a custom rootfs skeleton
> / inittab? With the default one we do a mount -a before running /etc/init.d/rcS.

I use the default inittab. The thing is that since /dev/null is missing, all 
inittab commands having "null" as console don't run, as I explained in the 
commit log above.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
