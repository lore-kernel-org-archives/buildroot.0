From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 26 May 2016 09:50:08 +0000
Subject: [Buildroot] [Bug 8911] Using sysvinit inittab and "single" user
 mode the rcS script still runs
In-Reply-To: <bug-8911-163@https.bugs.busybox.net/>
References: <bug-8911-163@https.bugs.busybox.net/>
Message-ID: <bug-8911-163-4qB9v391U7@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8911

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed on the next branch, thanks:

commit eda809cd052dea73bca02385c7a10a4d7795c912
Author: Charles Hardin <ckhardin@exablox.com>
Date:   Sat May 21 13:11:10 2016 -0700

    sysvinit: update the inittab to support "single" from the kernel

    Closes #8911

    When the kernel passes single in the command line, this translates
    into an init -s option that is suppose to drop into a shell after
    the sysinit and before the runlevel.

    So, in busybox this is hardcoded - but, in sysvinit using the
    sysinit action for the rcS means that it will always be executed
    even when trying to get into single user mode for repair.

    This change should run rcS in all of the expected runlevels
    1-5 and should achieve the desired result compared to the busybox
    and still allow a single user shell to get started as expected
    before running rcS.

    Signed-off-by: Charles Hardin <ckhardin@exablox.com>
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

-- 
You are receiving this mail because:
You are on the CC list for the bug.
