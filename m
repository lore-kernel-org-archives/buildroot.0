From: Michael S. Zick <minimod@morethan.org>
Date: Tue, 13 Dec 2011 09:24:14 -0600
Subject: [Buildroot] Question about using mdev for /dev management
In-Reply-To: <201112130939.34100.arnout@mind.be>
References: <4EDD1149.8060104@carallon.com> <201112130939.34100.arnout@mind.be>
Message-ID: <201112130924.16783.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue December 13 2011, Arnout Vandecappelle wrote:
> On Monday 05 December 2011 19:45:29 Will Wagner wrote:
> > Firstly it replaces $(TARGET_DIR)/init with fs/cpio/init which attempts 
> > to mount devtmpfs. My kernel doesn't support this (it's too old) and I'd 
> > rather not get this trace in the boot (it worries other developers).
> 
>  I didn't realize that mdev worked without devtmpfs in the kernel...
> If devtmpfs exists (and it does for all currently supported kernels), then
> it should be mounted as soon as possible.  It is normally mounted
> automatically by the kernel, except when it runs /init for an initramfs.
> That's why we have this extra /init script for the cpio rootfs.
> 
>  You could add a check to the init script that mounts a normal tmpfs on
> /dev if the mount fails (and redirect its output to /dev/null).
> 
> > I assume that for mdev we could not replace init but instead make sure 
> > that /dev/console (and possibly /dev/null?) exist?
> 
>  Yeah, actually, I think /dev/console and /dev/null should be created
> on the rootfs even if devtmpfs is used.  
>

In the "old days" (2.6.days) if you didn't provide the files for the
initramfs to the kernel, the kernel build a default one containing
only /dev/console and /dev/null and "self appended" it.

I don't know if that behavior has changed, or if it is just being
over-written (the "normal thing" to do) when the initramfs file
is appended to the built kernel.

- - - -

The kernel didn't (doesn't?) have any length of the expected file, 
it left that up to the decompression/cpio routines.

So with a few od/dd handsprings, you could take the old initramfs
file off a built kernel and replace it with a new one even if you
didn't have the kernel map file.

And, at least cpio.gz format, doesn't care how long the file is
either (although the command line tools will give you a "data
found beyond end of file" nasty-gram).
Which is where some distributions append their splash graphic image.
But a few more od/dd handsprings will also split the archive/image
into two files for you.

Not that I am proposing a "decompose" function be added to BR.
This project just makes 'em, not takes them apart.  ;-)

Mike

> Which brings us to: 
> 
> 
> > The other small issue I have is that mdev fails to spot one of the 
> > kernel devices (as the driver doesn't have a sysfs entry) so it needs 
> > adding manually. I do that by adding an entry to BR2_ROOTFS_DEVICE_TABLE 
> > which works fine, but doesn't seem ideal as I thought device entries 
> > were meant to be set in BR2_ROOTFS_STATIC_DEVICE_TABLE, but that is not 
> > offered unless static devices used. Is there a better way to do this or 
> > should I just leave it as is?
> 
>  If you ask me, it's OK to add /dev entries in the BR2_ROOTFS_DEVICE_TABLE.
> In fact, I think /dev/console and /dev/null should be put in there.  But
> I've never gotten around to roll a patch for it.
> 
>  Regards,
>  Arnout
> 
