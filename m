From: Willy <willy@willygroup.org>
Date: Tue, 24 Jan 2012 10:18:17 +0000 (UTC)
Subject: [Buildroot] Add rt squarewave example in buildroot
References: <loom.20120123T152253-656@post.gmane.org>
 <20120123221407.2d5f5043@skate> <loom.20120124T085832-891@post.gmane.org>
 <20120124103221.1f769dba@skate>
Message-ID: <loom.20120124T111319-435@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@...> writes:

> Can you try with a test case program?

How?

> Strange, the uClibc is by default compiled with
> UCLIBC_HAS_ADVANCED_REALTIME, clock_nanosleep() should be there in
> librt.

The uClibc configuration file contains:
output/toolchain/uClibc-0.9.32/.config:UCLIBC_HAS_ADVANCED_REALTIME=y

And this file:
output/toolchain/uClibc-0.9.32/librt/clock_nanosleep.c
exists and contains:
######################
<cut>
#ifdef __ASSUME_POSIX_TIMERS
int
clock_nanosleep (clockid_t clock_id, int flags, const struct timespec *req,
		 struct timespec *rem)
{
<cut>
}
#else
# ifdef __NR_clock_nanosleep
extern int __libc_missing_posix_timers attribute_hidden;
#  define SYSDEP_NANOSLEEP \
  if (!__libc_missing_posix_timers)					      \
    {									      \
    <cut>
    }
# endif
# include <sysdeps/unix/clock_nanosleep.c>
#endif
########################

Thanks,
Willy
