From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 May 2012 22:23:48 +0200
Subject: [Buildroot] [PATCH 1/2] iperf: fix build on !MMU platforms
In-Reply-To: <87ipg7iurd.fsf@macbook.be.48ers.dk>
References: <1336408773-27312-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87ipg7iurd.fsf@macbook.be.48ers.dk>
Message-ID: <4FAD7554.50605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/07/12 22:47, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni<thomas.petazzoni@free-electrons.com>  writes:
>
>   Thomas>  Build tested on sh2a and blackfin architectures.
>
> Thanks. Have you sent these patches upstream?
>
>   Thomas>  ++++ b/src/Listener.cpp
>   Thomas>  +@@ -679,7 +679,11 @@
>   Thomas>  +     pid_t pid;
>   Thomas>  +
>   Thomas>  +     /* Create a child process&  if successful, exit from the parent process */
>   Thomas>  ++#ifndef HAVE_FORK
>   Thomas>  ++    if ( (pid = vfork()) == -1 ) {
>   Thomas>  ++#else
>   Thomas>  +     if ( (pid = fork()) == -1 ) {
>   Thomas>  ++#endif
>   Thomas>  +         fprintf( stderr, "error in first child create\n");
>   Thomas>  +         exit(0);
>
> I believe you aren't allowed to call exit() after vfork (but should use
> _exit() instead).
>
> http://unix.stackexchange.com/questions/5364/why-should-a-child-of-a-vfork-or-fork-call-exit-instead-of-exit

  This particular exit is OK, because it is in the error case.
It's the one below that is not OK.  Or rather, nothing is OK, because
the child process after a vfork is not supposed to do anything except
exec() or _exit() - it certainly shouldn't return from the function.
In fact, on Linux the parent process is suspended until the child either
_exit()s or exec()s, so it doesn't daemonize at all.

  I'm not sure how you can daemonize in a posixly-correct way on a NOMMU
target.  But since we're running on Linux, we can just use daemon(),
right?  Both glibc and uclibc define it AFAIK.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
