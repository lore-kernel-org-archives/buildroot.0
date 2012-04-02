From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Apr 2012 16:25:32 +0200
Subject: [Buildroot] [PATCH] rt-tests: Make it available only when NPLT
 is selected
In-Reply-To: <1333376154-20432-1-git-send-email-markos.chandras@imgtec.com>
References: <1333376154-20432-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <20120402162532.156eed02@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 2 Apr 2012 15:15:54 +0100,
Markos Chandras <markos.chandras@imgtec.com> a ?crit :

> rt-tests package requires some definitions (like PTHREAD_PRIO_INHERIT
> etc) which are only available in Native Posix Linux Thread
> implementation.
> 
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>

I agree there is a problem, but unfortunately this solution will break
external toolchains and crosstool-ng toolchains that use glibc or
eglibc. Those toolchains have NPTL support, but BR2_PTHREADS_NATIVE is
not defined when using such toolchains.

I guess the real solution would be something like:

config BR2_TOOLCHAIN_HAS_NPTL
	bool

and then for internal backend, select this option is
BR2_PTHREADS_NATIVE is enabled. For external backend, select this
option when glibc/eglibc is used, and add an option when the uClibc
library is used. Some similar solution must be found for the
crosstool-NG backend.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
