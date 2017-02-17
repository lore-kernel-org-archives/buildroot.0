From: thierry.xenomai43 at yahoo.com <thierry.xenomai43@yahoo.com>
Date: Fri, 17 Feb 2017 14:50:23 +0000 (UTC)
Subject: [Buildroot] [BUILDROOT] CPU allocation for a thread with CPU_SET,
	CPU_ZERO
References: <1953704638.2126656.1487343023965.ref@mail.yahoo.com>
Message-ID: <1953704638.2126656.1487343023965@mail.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hello,I would like allocate threads at one specific core with CPU_SET and CPU_ZERO.My target is a RaspberryPi 3 and I use Buildroot 2016.11.2RT + uclib 1.0.19 + PREEMPT_RT patch.
But when I compile my program I get this error :-----------------------------------------------------------------------test.c:107:1: attention : implicit declaration of function CPU_ZERO [-Wimplicit-function-declaration]
?CPU_ZERO(&thecpus);
?^
test.c:108:1: attention : implicit declaration of function CPU_SET [-Wimplicit-function-declaration]
?CPU_SET(0, &thecpus);
?^
test.c:109:5: attention : implicit declaration of function ?sched_setaffinity [-Wimplicit-function-declaration]
?if (sched_setaffinity(getpid(), sizeof(cpu_set_t), &thecpus)< 0)
-----------------------------------------------------------------------
>>> My ?<Buildroot>/output/build/uclib-1.0.19/include/sched.h? file is the next :-----------------------------------------------------------------------
[...]#if defined __USE_GNU && defined __UCLIBC_LINUX_SPECIFIC__
/* Access macros for `cpu_set'.? */
# define CPU_SETSIZE __CPU_SETSIZE
# define CPU_SET(cpu, cpusetp)? __CPU_SET_S (cpu, sizeof (cpu_set_t), cpusetp)
# define CPU_CLR(cpu, cpusetp)? __CPU_CLR_S (cpu, sizeof (cpu_set_t), cpusetp)
# define CPU_ISSET(cpu, cpusetp) __CPU_ISSET_S (cpu, sizeof (cpu_set_t), \
??????cpusetp)
[...]# define CPU_ALLOC_SIZE(count) __CPU_ALLOC_SIZE (count)
# define CPU_ALLOC(count) __CPU_ALLOC (count)
# define CPU_FREE(cpuset) __CPU_FREE (cpuset)
/* Set the CPU affinity for a task */
extern int sched_setaffinity (__pid_t __pid, size_t __cpusetsize,
???????? const cpu_set_t *__cpuset) __THROW;/* Get the CPU affinity for a task */
extern int sched_getaffinity (__pid_t __pid, size_t __cpusetsize,
???????? cpu_set_t *__cpuset) __THROW;[...]
-----------------------------------------------------------------------
>>> My source code is the next:-----------------------------------------------------------------------
#ifndef __USE_GNU
#define __USE_GNU
#endif#ifndef __UCLIBC_LINUX_SPECIFIC__
#define __UCLIBC_LINUX_SPECIFIC__
#endif/*
#include "/home/thierry/MesProgrammes/C/buildroot/buildroot-2016.11.2RT_PREEMPT/output/build/uclibc-1.0.19/include/sched.h"
*/#include <sched.h>
#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>
#include <time.h>
#include <stdlib.h>
#include <unistd.h>[...]int main ()
{
pthread_t tid1, tid2, tid3;
cpu_set_t thecpus;CPU_ZERO(&thecpus);
CPU_SET(0, &thecpus);
if (sched_setaffinity(getpid(), sizeof(cpu_set_t), &thecpus)< 0)
?? perror("set affinity");[...]
}
-----------------------------------------------------------------------
When I put a volontary syntax error on ?<Buildroot>/output/build/uclib-1.0.19/include/sched.h? I never get error when I make.
I think that the compilator don't watch a good 'sched.h' file
Do you think that is a bad path configuration?
Regard,
Thierry
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170217/cee3b8c2/attachment.html>
