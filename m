From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 15 Jun 2014 20:10:59 +0000 (UTC)
Subject: [Buildroot] [Bug 7208] Glibc C++ aplications crash if they use
	exceptions.
In-Reply-To: <bug-7208-163@https.bugs.busybox.net/>
References: <bug-7208-163@https.bugs.busybox.net/>
Message-ID: <20140615201059.990FE9CAB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7208

--- Comment #6 from Krzysztof Wrzalik <kwrzalik@gmail.com> 2014-06-15 20:10:59 UTC ---
It turns out that 900-musl-support.patch breaks exceptions when using glibc:

The proper exception handling in libgcc seems to need USE_PT_GNU_EH_FRAME
definition in  libgcc's unwind-dw2-fde-dip.c. However; the patch changes this
file to:

+#if !defined(inhibit_libc) && defined(HAVE_LD_EH_FRAME_HDR) &&
defined(TARGET_DL_ITERATE_PHDR)
 # define USE_PT_GNU_EH_FRAME

Configure in host-gcc-final seems to be unable to locate
TARGET_DL_ITERATE_PHDR:
checking dl_iterate_phdr in target C library... unknown

In such case unwind-dw2-fde-dip.c falls back to unwind-dw2-fde.c which does not
do the job of finding a FDE and hence the crash.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
