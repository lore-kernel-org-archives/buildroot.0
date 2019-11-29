From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 29 Nov 2019 13:07:41 +0000
Subject: [Buildroot] [Bug 12146] Oprofile runtime issue
In-Reply-To: <bug-12146-163@https.bugs.busybox.net/>
References: <bug-12146-163@https.bugs.busybox.net/>
Message-ID: <bug-12146-163-0j8MuH717f@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12146

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Looked at it in more details, if you get EOPNOTSUPP, then you probably do have
CONFIG_OPROFILE=y enabled, but the perf_event_open() syscall fails and returns
EOPNOTSUPP. One reason for this to happen is when:

        if (is_sampling_event(event)) {
                if (event->pmu->capabilities & PERF_PMU_CAP_NO_INTERRUPT) {
                        err = -EOPNOTSUPP;
                        goto err_alloc;
                }
        }

So this really depends on your hardware PMU, and the kernel support for it.
This is not a Buildroot bug.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
