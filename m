From: Charles Manning <cdhmanning@gmail.com>
Date: Thu, 13 Aug 2015 08:49:26 +1200
Subject: [Buildroot] [PATCH] wf111: Add mdev dependency
In-Reply-To: <55CB2019.5030304@je-eigen-domein.nl>
References: <1439277422-26111-1-git-send-email-cdhmanning@gmail.com>
 <55CB2019.5030304@je-eigen-domein.nl>
Message-ID: <CAE21AQqpiDz0BEA4ruKVGA28k8b4+-NWAkCjKUqX+b=Qta1yrA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 12, 2015 at 10:29 PM, Floris Bos <bos@je-eigen-domein.nl> wrote:
> On 08/11/2015 09:17 AM, Charles Manning wrote:
>>
>> wf111 really needs mdev
>
>
> Problem I have seen with mdev in its default configuration is that it
> doesn't just handle firmware load requests, but also takes it upon itself to
> create/delete the device nodes (even when that already is being handled by
> devtmpfs), and does a bad job with that.
>
> It doesn't preserve sequencing by default, and events are processed
> concurrently, and get out-of-order.
>
> Becomes a problem if your software for example does anything that causes the
> kernel to re-read the partition table of your storage.
> In that case the kernel sends events to delete all devices nodes of the
> storage device, and add them again, right after each other.
> However depending on your luck, they can get processed in reverse order:
>
> ==
> mdev[598]: 9.191594 ACTION:add SUBSYSTEM:block DEVNAME:mmcblk0p6
> DEVPATH:/devices/platform/soc/3f300000.mmc/mmc_host/mmc0/mmc0:1234/block/mmcblk0/mmcblk0p6
> mdev[598]: dev 179,6
> [...]
> mdev[593]: 9.192168 ACTION:remove SUBSYSTEM:block DEVNAME:mmcblk0p6
> DEVPATH:/devices/platform/soc/3f300000.mmc/mmc_host/mmc0/mmc0:1234/block/mmcblk0/mmcblk0p6
> mdev[593]: rule matched, line -1
> mdev[593]: unlink: mmcblk0p6
> ==
>
> Add is processed before remove, with the end result that /dev/mmcblk0p6 goes
> missing...
>
>
> So please don't pull in mdev automatically just for firmware loading,
> because it does more than just that, and can have serious side effects.

Ok, now I'm stumped. People are telling me "don't use mdev", but
nobody is providing a viable alternative.

The situation is this:
* I did not write wf111, it is not as if I am submitting a new package.
* We have an existing package wf111.
* The existing package does not work (ie. does not do fw loading)
unless there is mdev or udev. Without fw loading wf111 is broken.
* The bluegiga code includes prebuilt binaries and driver code and
comes from Bluegiga as a tarball.

If you build a system with wf111 and you do not have udev/mdev then
the system will not work. After some debugging, you will find the
reason is lack of udev/mdev, turn that on and it will work.

It seems the only way forward here is one of:
* Convince Bluegiga to change their architecture/drivers to not use
mdev/udev and release a new tarball.
* Fix mdev so it works properly.
* Run mdev in a way that just does the fw loading requests and not
anything else.

Will changing to eudev fix any of these issues?

I will try to get someone from Bluegiga involved in this thread so
that they might be convinced to fix this at a driver level.

Regards

Charles
