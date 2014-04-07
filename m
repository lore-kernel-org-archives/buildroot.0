From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 7 Apr 2014 15:38:18 +0200
Subject: [Buildroot] [Bug 7016] Git issues in resulting buildroot tar
In-Reply-To: <1396855570069-66989.post@n4.nabble.com>
References: <bug-7016-163@https.bugs.busybox.net/>
 <20140402073504.199469BF82@busybox.osuosl.org>
 <1396855570069-66989.post@n4.nabble.com>
Message-ID: <CAAXf6LX0tqdsLEmk7bGVT-rUWrVdSew++GFDz-Cucw-Ueg0n9w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Brian,

On Mon, Apr 7, 2014 at 9:26 AM, brianclements <brian@brianclements.net> wrote:
> https://bugs.busybox.net/show_bug.cgi?id=7016
>
>>Can you provide more details on how you actually run this image? I am not
>>familiar with Docker, so more details about how you run this is very
> welcome.
>
> Sure. You can go to https://www.docker.io/gettingstarted/ to install docker
> on a 64 bit linux system. It uses linux containers to borrow the host's
> kernel and run isolated processes with very little overhead.
>
> Then to build, clone the "gitbug" branch of this github repo:
> `git clone https://github.com/brianclements/dockerfile-busyboxplus.git
> --branch gitbug`
>
> Then as sudo -i (so you don't have to babysit your sudo timeout) run the
> script:
> `./run.sh git`
>
> It will then start one container to build the rootfs.tar, then the script
> copies it out of the build container and into the host filesystem (in the
> /git folder in the repo) and import that resulting image back into docker
> under the name "brianclements/busyboxplus:git"
>
> To see the details of how I build it, you can look at this Dockerfile (which
> works much like a bash script)
> https://github.com/brianclements/dockerfile-busyboxplus/blob/gitbug/git/tarmaker/Dockerfile
>
> You can then run commands in this new imported image by prefixing your
> command with:
> `sudo docker run brianclements/busyboxplus:git <COMMAND GOES HERE>`
>
> or, more intuitively, you can "enter" the container and be interactive by
> running:
> `sudo docker run -it brianclements/busyboxplus:git /bin/sh`
> which should give you a root prompt inside the busybox container. There you
> can `git clone` and test away. Numerous tests have been cataloged in the
> github issue tracker in this repo for your perusal (the only 2 issues in
> that repo relate to this git issue).
> https://github.com/brianclements/dockerfile-busyboxplus/tree/gitbug
>
>>Have you tried using a similar configuration on a non-docker environment,
> like
>>qemu or a real target?
>
> Yes, a build on my host, Ubuntu 13.10, gave the same exact behavior with the
> resulting rootfs.tar. I don't have any experience with qemo, but perhaps you
> could reproduce it on those systems quicker then I? Even when using the
> `make menuconfig` all I selected was x86_64 architecture, wide character,
> largefile, inet_ipv6, bridge_utils, iproute2, iptables, then git. In fact
> all you need to do is the bare minimum and it still gives the error (x86_64,
> largefile, git).

It is interesting that you can reproduce without docker.
Can you clarify how you started the system in this case? How do you
deploy the rootfs.tar file in this case?

One of the reasons that I asked about this, is that it is not correct
to simply start an application built with buildroot on an existing
system with other libraries, because they may not be compatible.
Therefore, you need to run as a 'full' system, like in qemu, or
possibly with chroot if the target and guest systems are of the same
architecture. See also
http://buildroot.uclibc.org/downloads/manual/manual.html#_chroot

Depending on how you are running in the non-docker case, you may be
experiencing precisely this problem in both cases.

>
>>Also, did you try to run git through 'strace' to see what is actually going
> on?
>
> I admit I have basic knowledge of strace, let me know if you need it run
> with different options. I compiled a container identical in all ways with
> the exception of the strace package to get the attached file.
>
> strace-git.strace-git
> <http://buildroot-busybox.2317881.n4.nabble.com/file/n66989/strace-git.strace-git>

I have performed the same git clone on my laptop to compare the output.
In my case, I get the following part corresponding to some place near
the end of your log:

3071  clone(child_stack=0,
flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD,
child_tidptr=0x7f3b51c0da10) = 3080
3080  set_robust_list(0x7f3b51c0da20, 0x18 <unfinished ...>
3071  close(10 <unfinished ...>
3080  <... set_robust_list resumed> )   = 0
3071  <... close resumed> )             = 0
3080  close(9 <unfinished ...>
3071  read(9,  <unfinished ...>
3080  <... close resumed> )             = 0
3080  fcntl(10, F_GETFD)                = 0
3080  fcntl(10, F_SETFD, FD_CLOEXEC)    = 0
3080  dup2(3, 0)                        = 0
3080  close(3)                          = 0
3080  dup2(8, 1)                        = 1
3080  close(7)                          = 0
3080  close(8)                          = 0
3080  execve("/usr/lib/git-core/git", ["git", "index-pack", "--stdin",
"-v", "--fix-thin", "--keep=fetch-pack 3071 on argent"...], [/* 63
vars */]) = 0

Here, thread 3071 forks and creates a child with pid 3080, which
launches 'git index-pack --stdin -v ...'.
However, in your case, there is:

clone(child_stack=0,
flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD,
child_tidptr=0x7fde4b077970) = 13
close(10)                               = 0
read(9, "", 1)                          = 0
close(9)                                = 0
close(5)                                = 0
close(8)                                = 0
read(7, "", 46)                         = 0
--- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=13,
si_status=128, si_utime=436, si_stime=171} ---
close(7)                                = 0
wait4(13, [{WIFEXITED(s) && WEXITSTATUS(s) == 128}], 0, NULL) = 13
write(2, "fatal: ", 7)                  = 7
write(2, "index-pack failed", 17)       = 17
write(2, "\n", 1)                       = 1

Here the child tid is 13, and shortly after its creation it already
stops, generating a SIGCHLD signal.

This even seems to be before the 'execve' call, but maybe this is just
a side-effect of the tracing display rather than the actual problem.
I'm not entirely sure if this helps you in analyzing the problem, though.
Could you check if '/usr/lib/git-core/git' is available and if it can
be executed?

Best regards,
Thomas
