From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 22 Dec 2010 09:34:35 +0000 (UTC)
Subject: [Buildroot] [Bug 2965] Broken linkage to xkbcomp (blocking X server
	startup)
In-Reply-To: <bug-2965-163@https.bugs.busybox.net/>
References: <bug-2965-163@https.bugs.busybox.net/>
Message-ID: <20101222093435.7B4838E0D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2965

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
I'm sending in a minute a patch that fixes this to the Buildroot mailing-list.

The thing is that xkeyboard-config <= 1.8 created a symbolic link from
/usr/share/X11/xkb/xkbcomp to the xkbcomp binary used@compile time, which in
cross-compile mode in the host xkbcomp. In fact, this symbolic link seems to be
useless, and has been removed from xkeyboard-config >= 1.9. So the fix was to
just bump xkeyboard-config to the latest available version, 2.0.

Concerning the usr/bin/xkbcomp binary in the target directory, it is there,
since the xkeyboard-config package selects xapp_xkbcomp for the target. Here is
what I have here :

$ ls -l target/usr/share/X11/xkb/xkbcomp
ls: cannot access target/usr/share/X11/xkb/xkbcomp: No such file or directory

$ ls -l target/usr/bin/xkbcomp 
-rwxr-xr-x 1 test test 156804 Dec 22 09:27 target/usr/bin/xkbcomp

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
