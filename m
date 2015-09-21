From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 21 Sep 2015 07:09:51 +0000 (UTC)
Subject: [Buildroot] [Bug 8361] Buildroot 2015.08.1 skeleton inittab
 overwritten by busybox's version
In-Reply-To: <bug-8361-163@https.bugs.busybox.net/>
References: <bug-8361-163@https.bugs.busybox.net/>
Message-ID: <20150921070951.9D2C87FD53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8361

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-09-21 07:09:51 UTC ---
Using a custom skeleton is pretty much a deprecated method of customizing your
root filesystem. You should instead be using a rootfs overlay or a post-build
script (see the Buildroot manual for details).

Specifically regarding inittab, this file is no longer part of the skeleton. It
is now installed either by Busybox, or by sysvinit, depending on which init
system you have chosen.

The previous way of doing things, with a Busybox-style inittab in the skeleton,
which was used when Busybox was the init system, caused some inconsistencies:

 - It was still on the filesystem when systemd was used as the init system,
which is not needed
 - It was overwritten by the sysvinit package when it was chosen as the init
system, which isn't nice

So the inittab file was moved from the skeleton package to the Busybox and
sysvinit packages (which require different inittab syntax).

Generally speaking, we do not ensure that files in the skeleton will not be
overwritten. Then can be overwritten by any package in Buildroot.

However, we do guarantee that the rootfs overlay and post-build script are
handled *after* all packages have been installed, so you are sure that what you
have in the rootfs overlay or what you do in the post-build scripts "wins" over
what packages are doing.

So the behavior you are observing is intentional.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
