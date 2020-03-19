From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 19 Mar 2020 06:16:51 +0000
Subject: [Buildroot] [Bug 12666] Doesn't pick up a custom bash profile
In-Reply-To: <bug-12666-163@https.bugs.busybox.net/>
References: <bug-12666-163@https.bugs.busybox.net/>
Message-ID: <bug-12666-163-3vKkeEV4Oh@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12666

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Changing system/skeleton/ is not recommended. Instead, you should create your
own "root filesystem overlay", and use the option BR2_ROOTFS_OVERLAY to point
to it.

Most likely you did your change to system/skeleton/ *after* a build was done,
and you didn't do a clean rebuild from scratch. In this case, it is expected
that you don't see the changes in your image: the skeleton package has already
been built/installed, so it's not reinstalled.

Using a rootfs overlay is cleaner as you don't change the Buildroot default
skeleton, but also because they are copied into the target filesystem at every
"make" invocation.

See https://buildroot.org/downloads/manual/manual.html#rootfs-custom for more
details, as well as
https://bootlin.com/doc/training/buildroot/buildroot-slides.pdf starting from
slide 79.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
