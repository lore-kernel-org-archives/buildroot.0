From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Feb 2016 13:09:13 +0100
Subject: [Buildroot] Loading modules with device tree after rootfs is
	mounted
In-Reply-To: <87wppqsbfo.fsf@dell.be.48ers.dk>
References: <CANqk_c9oEnF32aeNnPzki0vr1E4-s-xxGyC5+dHAwAw6rHkLAg@mail.gmail.com>
 <56AE904B.2030906@mind.be> <87wppqsbfo.fsf@dell.be.48ers.dk>
Message-ID: <56D191E9.3050604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/27/16 11:19, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>  > On 30-01-16 18:56, Tim Michals wrote:
>  >> I've created new buildroot defconfig for Udoo Neo board, u-boot, linux kernel
>  >> boots and busybox prompt is active and accepts commands.  The issue is several
>  >> drivers (wifi, camera, etc) are built as kernel modules and stored on ext4
>  >> rootfs.  How can the kernel load these modules via the device tree from the rootfs? 
> 
>  >  The kernel doesn't automatically load modules, you need a userspace hotplug
>  > helper to handle that. You have the following options:
> 
>  > 1. modprobe the required drivers in an init script (no hotplugging).
>  > 2. Write a hotplug script that modprobes as required (google it).
>  > 3. Use mdev as the /dev handler and add a modprobe handler in mdev.conf (google it).
> 
> We should really fix our mdev setup to do this correctly out of the
> box. I don't usually use mdev, but I've just tried it on the pandaboard
> which has the same problems as the kernel config builds almost
> everything as modules.
> 
> As far as I can see from looking at the code and googling it, we need
> to:
> 
> - Add a line to mdev.conf to support dynamic module loading:
> 
> # load modules
> $MODALIAS=.*    0:0 660 @modprobe "$MODALIAS"

 that's right.

> 
> - Add a line to the init script for cold plugging modules (E.G. modules
> for which the devices were already present before mdev was added as the
> hotplug handler). mdev -s should arguable handle this, but it doesn't.

 Well, mdev was not originally meant to do the module probing, it's more of a
hack on top of it. mdev was meant for changing names and permissions of device
nodes. So in the coldplug (mdev -s) it will just handle the device nodes it
finds in /sys/class.

> 
> find /sys/ -name modalias | xargs sort -u | xargs modprobe -abq

 I wouldn't have thought of the sorting, but looks good to me.

 Regards,
 Arnout

> 
> I'll send a patch to add this, but it would be good if somebody who
> is more familiar with mdev could take a look.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
