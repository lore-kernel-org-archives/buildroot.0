From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  2 Feb 2010 21:45:14 +0000 (UTC)
Subject: [Buildroot] [Bug 1027] Busybox flqsh commands conflict with those
	from mtd-utils
In-Reply-To: <bug-1027-163@https.bugs.busybox.net/>
References: <bug-1027-163@https.bugs.busybox.net/>
Message-ID: <20100202214514.6F1FD7775C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1027





--- Comment #2 from David Engel <buildroot@istwok.net>  2010-02-02 21:45:12 UTC ---
(In reply to comment #1)
> That is how we normally do it (E.G. let the big versions "win" if both are
> enabled). What would you suggest we do instead?

The bigger version winning is fine and to be expected.  What surprised me and
took me a couple of hours to figure out was that busybox itself and not just
one of its symlinks was overwritten.  More specifically, here is what I think
happened in my case:

When busybox was built and installed, it was installed as /bin/busybox and many
symlinks including /sbin/init and /usr/sbin/flashcp were installed pointing to
/bin/busybox.

When mtd-utils was built and installed, flashcp was installed as
/usr/sbin/flashcp, but because a symlink already existed for busybox, the
symlink was followed and flashcp was actually installed as /bin/busybox
overwriting the real busybox in the process

When I booted the resulting rootfs, the kernel executed /sbin/init which should
have been busybox but was flashcp instead.  flashcp then complained about bad
command line arguments and exited cusing the kernel to panic because init
exited.

I'm new to buildroot, so if this is how things are supposed to work, I'll learn
to live with it.  In an ideal world, the config system would prevent such
overlaps in functionality.  I realize the large number of busybox options makes
that too tedious to be practical.  

Perhaps a reasonable middle solution is to make sure the installation of other
packages don't follow symlinks and clobber busybox.  Alternately, perhaps the
busybox installation can be deferred until after the other packages and its
symlink creation changed to not clobber existing files.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
