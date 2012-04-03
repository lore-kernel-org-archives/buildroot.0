From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Apr 2012 23:33:48 +0200
Subject: [Buildroot] [PATCH] rt-tests: Make it available only when NPLT
	is selected
In-Reply-To: <20120402162532.156eed02@skate> (Thomas Petazzoni's message of
 "Mon, 2 Apr 2012 16:25:32 +0200")
References: <1333376154-20432-1-git-send-email-markos.chandras@imgtec.com>
 <20120402162532.156eed02@skate>
Message-ID: <87fwckv6tf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Mon, 2 Apr 2012 15:15:54 +0100,
 Thomas> Markos Chandras <markos.chandras@imgtec.com> a ?crit :

 >> rt-tests package requires some definitions (like PTHREAD_PRIO_INHERIT
 >> etc) which are only available in Native Posix Linux Thread
 >> implementation.
 >> 
 >> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>

 Thomas> I agree there is a problem, but unfortunately this solution will break
 Thomas> external toolchains and crosstool-ng toolchains that use glibc or
 Thomas> eglibc. Those toolchains have NPTL support, but BR2_PTHREADS_NATIVE is
 Thomas> not defined when using such toolchains.

 Thomas> I guess the real solution would be something like:

 Thomas> config BR2_TOOLCHAIN_HAS_NPTL
 Thomas> 	bool

 Thomas> and then for internal backend, select this option is
 Thomas> BR2_PTHREADS_NATIVE is enabled. For external backend, select this
 Thomas> option when glibc/eglibc is used, and add an option when the uClibc
 Thomas> library is used. Some similar solution must be found for the
 Thomas> crosstool-NG backend.

Alternatively you can make it depend on !pthreads (ugly because it is so
verbose)

depends on !(BR2_TOOLCHAIN_CTNG_THREADS_NONE ||
         BR2_TOOLCHAIN_CTNG_THREADS_PTHREADS ||
         BR2_TOOLCHAIN_CTNG_THREADS_PTHREADS_OLD ||
         BR2_PTHREADS_NONE || BR2_PTHREADS || BR2_PTHREADS_OLD)

-- 
Bye, Peter Korsgaard
