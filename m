From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Dec 2011 09:39:34 +0100
Subject: [Buildroot] Question about using mdev for /dev management
In-Reply-To: <4EDD1149.8060104@carallon.com>
References: <4EDD1149.8060104@carallon.com>
Message-ID: <201112130939.34100.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 05 December 2011 19:45:29 Will Wagner wrote:
> Firstly it replaces $(TARGET_DIR)/init with fs/cpio/init which attempts 
> to mount devtmpfs. My kernel doesn't support this (it's too old) and I'd 
> rather not get this trace in the boot (it worries other developers).

 I didn't realize that mdev worked without devtmpfs in the kernel...
If devtmpfs exists (and it does for all currently supported kernels), then
it should be mounted as soon as possible.  It is normally mounted
automatically by the kernel, except when it runs /init for an initramfs.
That's why we have this extra /init script for the cpio rootfs.

 You could add a check to the init script that mounts a normal tmpfs on
/dev if the mount fails (and redirect its output to /dev/null).

> I assume that for mdev we could not replace init but instead make sure 
> that /dev/console (and possibly /dev/null?) exist?

 Yeah, actually, I think /dev/console and /dev/null should be created
on the rootfs even if devtmpfs is used.  Which brings us to:


> The other small issue I have is that mdev fails to spot one of the 
> kernel devices (as the driver doesn't have a sysfs entry) so it needs 
> adding manually. I do that by adding an entry to BR2_ROOTFS_DEVICE_TABLE 
> which works fine, but doesn't seem ideal as I thought device entries 
> were meant to be set in BR2_ROOTFS_STATIC_DEVICE_TABLE, but that is not 
> offered unless static devices used. Is there a better way to do this or 
> should I just leave it as is?

 If you ask me, it's OK to add /dev entries in the BR2_ROOTFS_DEVICE_TABLE.
In fact, I think /dev/console and /dev/null should be put in there.  But
I've never gotten around to roll a patch for it.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
