From: brianclements <brian@brianclements.net>
Date: Mon, 7 Apr 2014 11:59:39 -0700 (PDT)
Subject: [Buildroot] [Bug 7016] Git issues in resulting buildroot tar
In-Reply-To: <CAAXf6LX0tqdsLEmk7bGVT-rUWrVdSew++GFDz-Cucw-Ueg0n9w@mail.gmail.com>
References: <bug-7016-163@https.bugs.busybox.net/>
 <20140402073504.199469BF82@busybox.osuosl.org>
 <1396855570069-66989.post@n4.nabble.com>
 <CAAXf6LX0tqdsLEmk7bGVT-rUWrVdSew++GFDz-Cucw-Ueg0n9w@mail.gmail.com>
Message-ID: <1396897179003-67022.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

>It is interesting that you can reproduce without docker.
>Can you clarify how you started the system in this case? How do you
>deploy the rootfs.tar file in this case?

>One of the reasons that I asked about this, is that it is not correct
>to simply start an application built with buildroot on an existing
>system with other libraries, because they may not be compatible.
>Therefore, you need to run as a 'full' system, like in qemu, or
>possibly with chroot if the target and guest systems are of the same
>architecture. See also
>http://buildroot.uclibc.org/downloads/manual/manual.html#_chroot

>Depending on how you are running in the non-docker case, you may be
>experiencing precisely this problem in both cases.

I'm sorry I misunderstood your question before. What I replicated was not
the running of the git binary with the errors, but the building of the
rootfs.tar from my host and not from within a docker container. In this case
the two rootfs.tar images resulted in the same error with git once imported
into Docker. I will have to look into your suggestions later for actually
running this image using a different virtualization method then Docker and
update you on it.

>I have performed the same git clone on my laptop to compare the output.
>In my case, I get the following part corresponding to some place near
>the end of your log:

>3071  clone(child_stack=0,
>flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD,
>child_tidptr=0x7f3b51c0da10) = 3080
>3080  set_robust_list(0x7f3b51c0da20, 0x18 <unfinished ...>
>3071  close(10 <unfinished ...>
>3080  <... set_robust_list resumed> )   = 0
>3071  <... close resumed> )             = 0
>3080  close(9 <unfinished ...>
>3071  read(9,  <unfinished ...>
>3080  <... close resumed> )             = 0
>3080  fcntl(10, F_GETFD)                = 0
>3080  fcntl(10, F_SETFD, FD_CLOEXEC)    = 0
>3080  dup2(3, 0)                        = 0
>3080  close(3)                          = 0
>3080  dup2(8, 1)                        = 1
>3080  close(7)                          = 0
>3080  close(8)                          = 0
>3080  execve("/usr/lib/git-core/git", ["git", "index-pack", "--stdin",
>"-v", "--fix-thin", "--keep=fetch-pack 3071 on argent"...], [/* 63
>vars */]) = 0

>Here, thread 3071 forks and creates a child with pid 3080, which
>launches 'git index-pack --stdin -v ...'.
>However, in your case, there is:

>clone(child_stack=0,
>flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD,
>child_tidptr=0x7fde4b077970) = 13
>close(10)                               = 0
>read(9, "", 1)                          = 0
>close(9)                                = 0
>close(5)                                = 0
>close(8)                                = 0
>read(7, "", 46)                         = 0
>--- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=13,
>si_status=128, si_utime=436, si_stime=171} ---
>close(7)                                = 0
>wait4(13, [{WIFEXITED(s) && WEXITSTATUS(s) == 128}], 0, NULL) = 13
>write(2, "fatal: ", 7)                  = 7
>write(2, "index-pack failed", 17)       = 17
>write(2, "\n", 1)                       = 1

>Here the child tid is 13, and shortly after its creation it already
>stops, generating a SIGCHLD signal.

>This even seems to be before the 'execve' call, but maybe this is just
>a side-effect of the tracing display rather than the actual problem.
>I'm not entirely sure if this helps you in analyzing the problem, though.
>Could you check if '/usr/lib/git-core/git' is available and if it can
>be executed?

I have to admit the strace information and system calls are completely
foreign to me at the moment. I'll have to dig into them a little bit too to
see if they can shed some light on the situation.

As for the git binary, it's actually in a different location
"/usr/libexec/git-core", does that matter? Here is the status of it as it
resides in the image:

/usr/libexec/git-core # ls -hal git
-rwxr-xr-x    1 root     root        1.2M Apr  7 06:49 git
/usr/libexec/git-core # ./git --version
git version 1.8.5.3

it seems to run OK from that path. Did I do that right? Side note: git-clone
most everything in that directory have the same permissions and seem
accessible.

Let me ask you this, can you possibly just compile a version of busybox with
x86_64, largefile, and git and link me up with the resulting tar? (only
probably around 10mb). That might be a quicker way to duplicate this error
then me trying to learn my way through qemu and introduce another set of
variables for me to mess up. That way I can see if a working version is even
possible when implemented with Docker and we can possibly get rid of that
variable as well, especially if your image works for you.



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Bug-7016-New-Git-issues-in-resulting-buildroot-tar-tp66457p67022.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
