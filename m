From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 04 May 2016 17:26:10 +0000
Subject: [Buildroot] [Bug 8911] New: Using sysvinit inittab and "single"
 user mode the rcS script still runs
Message-ID: <bug-8911-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8911

            Bug ID: 8911
           Summary: Using sysvinit inittab and "single" user mode the rcS
                    script still runs
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ckhardin at exablox.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Expected single user behavior to NOT run the rcS script when runlevel S is
given to sysvinit.


From the busybox code - when going into single user, the logic is conditional
to not even parse the inittab and jump into the single user shell.

busybox/init/init.c

        /* Check if we are supposed to be in single user mode */
        if (argv[1]
         && (strcmp(argv[1], "single") == 0 || strcmp(argv[1], "-s") == 0 ||
LONE_CHAR(argv[1], '1'))
        ) {
                /* ??? shouldn't we set RUNLEVEL="b" here? */
                /* Start a shell on console */
                new_init_action(RESPAWN, bb_default_login_shell, "");
        } else {
                /* Not in single user mode - see what inittab says */

                /* NOTE that if CONFIG_FEATURE_USE_INITTAB is NOT defined,
                 * then parse_inittab() simply adds in some default
                 * actions (i.e., INIT_SCRIPT and a pair
                 * of "askfirst" shells) */
                parse_inittab();
        }

However, the sysvinit uses the runlevels and the sysinit action runs before a
runlevel has been selected - so, the rcS always runs.

I believe this diff gets what should happen, but their might be a context that
I don't know about for not doing this.

diff --git a/package/sysvinit/inittab b/package/sysvinit/inittab
index 27eb4a6..fad91ea 100644
--- a/package/sysvinit/inittab
+++ b/package/sysvinit/inittab
@@ -10,7 +10,7 @@ si2::sysinit:/bin/mkdir -p /dev/pts
 si3::sysinit:/bin/mkdir -p /dev/shm
 si4::sysinit:/bin/mount -a
 si5::sysinit:/bin/hostname -F /etc/hostname
-si6::sysinit:/etc/init.d/rcS
+rcS:12345:wait:/etc/init.d/rcS

 # S0:1:respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL

-- 
You are receiving this mail because:
You are on the CC list for the bug.
