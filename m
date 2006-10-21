From: Rob Landley <rob@landley.net>
Date: Sat, 21 Oct 2006 16:22:28 -0400
Subject: [Buildroot] Using udev, non-static /dev, and ramfs (or tmpfs)
In-Reply-To: <20061021183403.GA21456@reid1.localdomain>
References: <20061021183403.GA21456@reid1.localdomain>
Message-ID: <200610211622.28407.rob@landley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 21 October 2006 2:34 pm, don wrote:
> I have a buildroot system that has been working fine (thanks) using
> a static /dev in a ramfs rootfs.  Now I want to add a USB device and it 
> seems like I should let udev etc. handle it.

I'd recommend mdev from busybox, but then I wrote it. :)

> However udev cannot make entries in a read-only /dev.
>
> Is there a simple recipe for mounting /dev as writable?

mount -t tmpfs /dev /dev
 
> There are several compilcations:
> 
> 	Normally to mount with ramfs I'd use /dev/ram*. 

No, that's a ram disk not ramfs.  A ramfs (or tmpfs) doesn't have backing 
store.

Install a recent busybox (1.2.2 would be best, once I get that up. :)

To populate dev:

  mdev -s

To handle hotplug events:

  echo "/sbin/mdev" > /proc/sys/kernel/hotplug

Rob
-- 
"Perfection is reached, not when there is no longer anything to add, but
when there is no longer anything to take away." - Antoine de Saint-Exupery
