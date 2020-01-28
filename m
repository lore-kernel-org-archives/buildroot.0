From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 Jan 2020 15:37:55 +0000
Subject: [Buildroot] [Bug 12511] New: rng-tools has forced dependency on
 jitterentropy-library ; It slows boot considerably
Message-ID: <bug-12511-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12511

            Bug ID: 12511
           Summary: rng-tools has forced dependency on
                    jitterentropy-library ; It slows boot considerably
           Product: buildroot
           Version: 2019.11.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: axel.voitier at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello,

Updating from 2019.05 to 2019.11.1, I noticed the boot time on my target (iMX6)
increased by ~20s. Culprit was quickly found: rngd.

Apparently we went from rng-tools 5 to 6.7. A bit more digging led me to figure
out that the actual culprit is the new jitterentropy source added relatively
recently to rng-tools.

This library provide entropy source from CPU timings jitter it seems. That's
probably very nice for system without hardware RNG. But even if you have one,
the jitter source remains enabled by default and slows the start up of rngd
significatively.

Now, the quick solution is to add 'DAEMON_ARGS+="-x jitter"' to
/etc/default/rngd. But first, that might take some digging for affected users
to figure this out.

Second, I don't think it is actually right that buildroot package for rng-tools
force the dependency on jitterentropy-library, as it is not strictly necessary
to compile and install it.
Sure, you want to provide a nice and easy default for users of targets without
HWRNG. But that impacts negatively users who do have HWRNG.

I would suggest to either provide static options for that in menuconfig.
Or, I don't know if it is possible for a .mk package file to reference a kernel
option, but it could be possible to detect if kernel has a driver enabled for
either a /dev/hwrng provider, or a TPM device.
Could also be done from /etc/init.d/S21rngd?


Cheers,
Axel

-- 
You are receiving this mail because:
You are on the CC list for the bug.
