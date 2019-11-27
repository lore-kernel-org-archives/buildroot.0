From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 27 Nov 2019 22:20:51 +0000
Subject: [Buildroot] [Bug 11996] opencv3 SIGILL on Cortex-A5 with VFPv4-D16
In-Reply-To: <bug-11996-163@https.bugs.busybox.net/>
References: <bug-11996-163@https.bugs.busybox.net/>
Message-ID: <bug-11996-163-RZL0JFcsXR@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11996

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
So, I did a bit more research on this, but couldn't come to a useful
conclusion. The handling of CPU optimizations in opencv3 is complicated.
ENABLE_VFPV3 and ENABLE_NEON seem to be obsolete options, but the replacement
CPU_BASELINE is not very clear.

With a VFPv3-D16 case, I get:

--   CPU/HW features:
--     Baseline:
--       requested:                 DETECT
--       disabled:                  VFPV3 NEON

which is quite expected.

When NEON is enabled as the FPU, I get:

--   CPU/HW features:
--     Baseline:                    NEON
--       requested:                 DETECT
--       disabled:                  VFPV3 NEON

So NEON seems to be detected, but it's also listed in the "disabled"
features... which doesn't make a lot of sense.

Then, if I use VFPv3 as the FPU, I get:

--   CPU/HW features:
--     Baseline:
--       requested:                 DETECT
--       disabled:                  VFPV3 NEON

I.e, it doesn't detect that I have VFPv3.

(Of course the tests above are after removing ENABLE_VFPV3/ENABLE_NEON).

-- 
You are receiving this mail because:
You are on the CC list for the bug.
