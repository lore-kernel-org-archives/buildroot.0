From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2016 11:19:07 +0100
Subject: [Buildroot] Loading modules with device tree after rootfs is
	mounted
In-Reply-To: <56AE904B.2030906@mind.be> (Arnout Vandecappelle's message of
 "Sun, 31 Jan 2016 23:52:59 +0100")
References: <CANqk_c9oEnF32aeNnPzki0vr1E4-s-xxGyC5+dHAwAw6rHkLAg@mail.gmail.com>
 <56AE904B.2030906@mind.be>
Message-ID: <87wppqsbfo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 30-01-16 18:56, Tim Michals wrote:
 >> I've created new buildroot defconfig for Udoo Neo board, u-boot, linux kernel
 >> boots and busybox prompt is active and accepts commands.  The issue is several
 >> drivers (wifi, camera, etc) are built as kernel modules and stored on ext4
 >> rootfs.  How can the kernel load these modules via the device tree from the rootfs? 

 >  The kernel doesn't automatically load modules, you need a userspace hotplug
 > helper to handle that. You have the following options:

 > 1. modprobe the required drivers in an init script (no hotplugging).
 > 2. Write a hotplug script that modprobes as required (google it).
 > 3. Use mdev as the /dev handler and add a modprobe handler in mdev.conf (google it).

We should really fix our mdev setup to do this correctly out of the
box. I don't usually use mdev, but I've just tried it on the pandaboard
which has the same problems as the kernel config builds almost
everything as modules.

As far as I can see from looking at the code and googling it, we need
to:

- Add a line to mdev.conf to support dynamic module loading:

# load modules
$MODALIAS=.*    0:0 660 @modprobe "$MODALIAS"

- Add a line to the init script for cold plugging modules (E.G. modules
for which the devices were already present before mdev was added as the
hotplug handler). mdev -s should arguable handle this, but it doesn't.

find /sys/ -name modalias | xargs sort -u | xargs modprobe -abq

I'll send a patch to add this, but it would be good if somebody who
is more familiar with mdev could take a look.

-- 
Bye, Peter Korsgaard
