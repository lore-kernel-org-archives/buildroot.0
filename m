From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 22 Jul 2014 21:22:40 +0000 (UTC)
Subject: [Buildroot] [Bug 5900] config flags to the Xenomai build system ...
In-Reply-To: <bug-5900-163@https.bugs.busybox.net/>
References: <bug-5900-163@https.bugs.busybox.net/>
Message-ID: <20140722212240.8C7449D2B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5900

--- Comment #6 from romain.naour at openwide.fr 2014-07-22 21:22:39 UTC ---
Hello,

I was working with xenomai in 2012 with the mini2440, and I still have it :)

I don't think the bug report is relevant with this board.

I tried to add this line in xenomai.mk:
XENOMAI_CONF_OPT += CFLAGS="-march=armv4t -msoft-float" LDFLAGS="-march=armv4t
-msoft-float"

I always get the following message:
# switchtest
== Testing FPU check routines...
== FPU check routines: unimplemented, skipping FPU switches tests.
[...]

That's because the VFP support (CONFIG_VFP) is not enabled in the linux kernel.

config VFP
    bool "VFP-format floating point maths"
    depends on CPU_V6 || CPU_V6K || CPU_ARM926T || CPU_V7 || CPU_FEROCEON

None of these requirements are met with the s3c2440.

So, in the check_fpu_thread() the check (check != 1) is always false.

xenomai-2.6/src/testsuite/switchtest/switchtest.c:
from check_fpu_thread():

check = fp_regs_check(2);
if (check != 1) {
    fprintf(stderr,
        "== FPU check routines: unimplemented, "
        "skipping FPU switches tests.\n");
    return NULL;
}

fp_regs_check() is defined in xenomai-2.6/include/asm-arm/fptest.h:

static inline unsigned fp_regs_check(unsigned val)
{
    unsigned result = val;

    if (have_vfp) {
    [snip]
    }

    return result;
}

And have_vfp depends on CONFIG_VFP

#ifdef CONFIG_VFP
#define have_vfp (elf_hwcap & HWCAP_VFP)
#else /* !CONFIG_VFP */
#define have_vfp (0)
#endif /* !CONFIG_VFP */

So, I'm agree with ThomasDS, this is not a buildroot issue.

Note: I'm using Buildroot 2014.05-git, xenomai-2.6.3 and linux kernel 3.5.7 and
3.8.13.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
