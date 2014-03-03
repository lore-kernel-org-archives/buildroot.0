From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  3 Mar 2014 07:52:11 +0000 (UTC)
Subject: [Buildroot] [Bug 6944] building toolchain for sh4 fails
In-Reply-To: <bug-6944-163@https.bugs.busybox.net/>
References: <bug-6944-163@https.bugs.busybox.net/>
Message-ID: <20140303075211.559539BCC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6944

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-03-03 07:52:07 UTC ---
Aah, glad to see we have a SuperH user!

This problem is well-known (at least to me). The issue is that gcc for SH4
insists on being multilib, to all the libraries are not directly in the sysroot
but in some directory named "!m4" if I remember correctly. This confuses the
Buildroot toolchain logic, which assumes the toolchain is not multilib.

Moreover, the other problem we have with SH4 is that to be able a kernel, you
really need to have the m4-nofpu multilib variant, in addition to the m4 one.
This is why configs/qemu_sh4_r2d_defconfig has this special configuration
option:

BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-multilib-list=m4,m4-nofpu"

At this point, I must say I am not sure how this problem should be fixed
exactly.

Do you have some good knowledge of the SuperH architecture variants? That would
be very helpful: we lack some contributors using SuperH and having some minimal
knowledge of the architecture.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
