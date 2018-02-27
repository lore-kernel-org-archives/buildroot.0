From: Pierre <pinaraf@pinaraf.info>
Date: Tue, 27 Feb 2018 22:24:51 +0100
Subject: [Buildroot] [PATCH] package/skeleton-init-systemd: create a
 symlink /var/run to ../run
In-Reply-To: <1519756674.25567.181.camel@impinj.com>
References: <20180222221014.19584-1-romain.naour@gmail.com>
 <594ebd6a-1bb7-9b97-66af-d55344f8c8e9@gmail.com>
 <1519756674.25567.181.camel@impinj.com>
Message-ID: <37069250.uiOOhA36Tm@peanuts2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, February 27, 2018 7:37:54 PM CET Trent Piepho wrote:
> On Sun, 2018-02-25 at 20:16 +0100, Romain Naour wrote:
> > The file /usr/lib/tmpfiles.d/var.con will create automatically that
> > 
> > > > symlink at bootup /var/run doesn't exist yet. But dbus creates, at
> > > > install time, the directory /var/run/dbus without taking care of
> > > > /var/run. So we end up with two different directories /run and
> > > > /var/run. This bug affects more or less all systemd-provided
> > > > utilities, including logind and systemd itself.
> > > > 
> > > > This patch create the correct symlink run -> ../run when systemd
> > > > is used as init system.
> > > 
> > > This doesn't work in the RO root case.
> > 
> > Indeed, but I'm testing/fixing the RW case with this patch
> > (BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW).
> 
> I should have said that differently.  RO root has the same problem, but
> this link will not solve it.
> 
> I believe the link:
> ln -sf ../../../../run $(TARGET_DIR)/usr/share/factory/var/run
> 
> will fix the RO case.  But of course does not work in the RW case.
> 
> I can send a follow on patch to add this link for RO.
> 
> But I wish there was some other method that could solve the problem for
> both RW and RO, without needing to add special cases like this link.

I'm new to buildroot but got hit by that bug and after reading this thread I 
don't really understand why this would not work with RW.
It's quite dirty, but a link to ../../../{repeat?}/run will end up linking to 
/run since /.. is a link to /
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180227/9df6d8ba/attachment.asc>
