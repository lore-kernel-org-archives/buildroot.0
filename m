From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Feb 2017 21:48:25 +0100
Subject: [Buildroot] CPU allocation for a thread with CPU_SET, CPU_ZERO
In-Reply-To: <1953704638.2126656.1487343023965@mail.yahoo.com>
References: <1953704638.2126656.1487343023965.ref@mail.yahoo.com>
 <1953704638.2126656.1487343023965@mail.yahoo.com>
Message-ID: <01640808-a298-6079-675c-0ab53297971a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-02-17 15:50, thierry.xenomai43 at yahoo.com wrote:
> My target is a RaspberryPi 3 and I use Buildroot 2016.11.2RT + uclib 1.0.19 + PREEMPT_RT patch.

 I assume you do have threads enabled?

[snip]
>>>> My source code is the next:
> -----------------------------------------------------------------------
> #ifndef __USE_GNU
> #define __USE_GNU
> #endif
> #ifndef __UCLIBC_LINUX_SPECIFIC__
> #define __UCLIBC_LINUX_SPECIFIC__
> #endif

 As explained in the man page, you should define _GNU_SOURCE instead of these.

> /*
> #include
> "/home/thierry/MesProgrammes/C/buildroot/buildroot-2016.11.2RT_PREEMPT/output/build/uclibc-1.0.19/include/sched.h"

 What gets used is .../output/staging/usr/include/sched.h, but that should just
be a copy of this file.

> */
> #include <sched.h>

 This *should* actually be sufficient. You don't pass something like
-I/usr/include, do you?

 You can compile with -E instead of -c to see what exactly gets #included and
where the symbols get defined (or not).


 Regards,
 Arnout

> #include <stdio.h>
> #include <pthread.h>
> #include <semaphore.h>
> #include <time.h>
> #include <stdlib.h>
> #include <unistd.h>
> [...]
> int main ()
> {
> pthread_t tid1, tid2, tid3;
> cpu_set_t thecpus;
> CPU_ZERO(&thecpus);
> CPU_SET(0, &thecpus);
> if (sched_setaffinity(getpid(), sizeof(cpu_set_t), &thecpus)< 0)
>    perror("set affinity");
> [...]
> }
> -----------------------------------------------------------------------
> 
> When I put a volontary syntax error on
> ?<Buildroot>/output/build/uclib-1.0.19/include/sched.h? I never get error when I
> make.
> I think that the compilator don't watch a good 'sched.h' file
> Do you think that is a bad path configuration?
> 
> Regard,
> Thierry
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
