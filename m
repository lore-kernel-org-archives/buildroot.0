From: Trent Piepho <tpiepho@impinj.com>
Date: Tue, 27 Feb 2018 18:37:54 +0000
Subject: [Buildroot] [PATCH] package/skeleton-init-systemd: create a
 symlink /var/run to ../run
In-Reply-To: <594ebd6a-1bb7-9b97-66af-d55344f8c8e9@gmail.com>
References: <20180222221014.19584-1-romain.naour@gmail.com>
 <1519410337.25567.173.camel@impinj.com>
 <594ebd6a-1bb7-9b97-66af-d55344f8c8e9@gmail.com>
Message-ID: <1519756674.25567.181.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2018-02-25 at 20:16 +0100, Romain Naour wrote:
> The file /usr/lib/tmpfiles.d/var.con will create automatically that
> > > symlink at bootup /var/run doesn't exist yet. But dbus creates, at
> > > install time, the directory /var/run/dbus without taking care of
> > > /var/run. So we end up with two different directories /run and
> > > /var/run. This bug affects more or less all systemd-provided
> > > utilities, including logind and systemd itself.
> > > 
> > > This patch create the correct symlink run -> ../run when systemd
> > > is used as init system.
> > 
> > This doesn't work in the RO root case.
> 
> Indeed, but I'm testing/fixing the RW case with this patch
> (BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW).

I should have said that differently.  RO root has the same problem, but
this link will not solve it.

I believe the link:
ln -sf ../../../../run $(TARGET_DIR)/usr/share/factory/var/run

will fix the RO case.  But of course does not work in the RW case.

I can send a follow on patch to add this link for RO.

But I wish there was some other method that could solve the problem for
both RW and RO, without needing to add special cases like this link.
