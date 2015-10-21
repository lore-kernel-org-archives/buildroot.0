From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 21 Oct 2015 12:32:55 +0000 (UTC)
Subject: [Buildroot] [Bug 8421] util-linux installs systemd files in
	output/target/home/
In-Reply-To: <bug-8421-163@https.bugs.busybox.net/>
References: <bug-8421-163@https.bugs.busybox.net/>
Message-ID: <20151021123255.9BA6B81EE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8421

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> 2015-10-21 12:32:55 UTC ---
Looks to be caused by the recent pkgconf version bump, which now prefixes all
variables with the sysroot:

commit 3fe434bf35b09ddf438392e6e5b4bc0b849495c7
Author: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date:   Mon Oct 5 16:54:30 2015 -0300

    glib-networking: specify GIO_MODULE_DIR for target

    Since the upgrade to pkgconf 0.9.12 all directories and variables with
    directories are sysroot-prefixed, whereas with the old patch only some
    variables were (includedir, mapdir, sdkdir, libdir).

    libglib2 uses a giomoduledir=${libdir}/gio/modules variable in
    gio-2.0.pc, which when expanded via sysroot by pkgconf at configure time
    points to the staging directory (via libdir expansion).
    When target install gets called the gio module gets installed to staging
    rather than target, with the obvious consequences this has.

    Work-around this pkgconfig abuse by overriding GIO_MODULE_DIR at target
    install time.

    Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

I'll add a workaround for util-linux as well.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
