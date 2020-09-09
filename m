From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 9 Sep 2020 19:55:49 +0200
Subject: [Buildroot] OpenSSH login problem
In-Reply-To: <CA+h8R2pdJExc9v7AeGAfvon1sVY-G2iYk7EzjdZFBLBRd9ApVQ@mail.gmail.com>
References: <cc86bfd55f944197bcd610626edecf2f@go-sys.de>
 <52-5f356200-5-2c492440@36238474>
 <4d943f9a8e974a60a5167db44bce6cd1@go-sys.de>
 <CA+h8R2oi0GRLYdumQOYxwON=xd7p_8pn+WoknjRd5N24Vr_5KQ@mail.gmail.com>
 <20200816220620.65159d1d@windsurf.home>
 <CA+h8R2qO01wwrEJdTx2puEbDv6mv31YxyAjG5nCn6hosPAW_aQ@mail.gmail.com>
 <CA+h8R2pjvm7Wr_hkS2wtqhzqESmgqTtxivkdTLdEr07ngJLTbQ@mail.gmail.com>
 <20200906193958.2b4199a4@gmx.net>
 <CA+h8R2pdJExc9v7AeGAfvon1sVY-G2iYk7EzjdZFBLBRd9ApVQ@mail.gmail.com>
Message-ID: <20200909195549.6aa402bd@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christian,

On Tue, 8 Sep 2020 18:39:47 -0700, Christian Stewart <christian@paral.in> wrote:

> Hi all,
>
> Unfortunately I'm still seeing this with GCC 9 and OpenSSH 8.3p1
> against a Odroid HC2 with kernel 5.8 + kernel-headers 5.8, using glibc
> 2.31.
>
> On Sun, Sep 6, 2020 at 10:40 AM Peter Seiderer <ps.report@gmx.net> wrote:
> >
> > Hello Christian, *,
> >
> > On Sat, 5 Sep 2020 19:33:23 -0700, Christian Stewart <christian@paral.in> wrote:
> >
> > > Hi all,
> > >
> > > Finally got around to running this test.
> > >
> > > I previously tested an Odroid XU4 with GCC 10 and latest binutils, and
> > > it worked.
> > >
> > > Now with a test against GCC 9 on a Odroid HC2, it's not working (ssh
> > > exits immediately after successful auth).
> > >
> > > Testing against OpenSSH 8.3p1 now and figuring out exactly why this is
> > > happening, if it's the GCC version or what.
> >
> > Tested on RPi3, the following defconfig works (buildroot-git-d1c3f077e24a41f004945f94aceb6f059c58e423,
> > linux-5.4.51):
>
> [snip]
>
> > And the following defconfig fails (linux-4.19.126):
>
> [snip]
>
> > The last lines of sshd failure strace are:
> >
> > 468   write(2, "Accepted none for root from 192."..., 59 <unfinished ...>
> > 490   clock_gettime(CLOCK_BOOTTIME, {tv_sec=306, tv_nsec=379381706}) = 0
> > 490   clock_nanosleep_time64(CLOCK_REALTIME, 0, {tv_sec=0, tv_nsec=24656548290918313},  <unfinished ...>) = ?
> > 490   +++ killed by SIGSYS +++
> > 468   <... write resumed>)              = 59
> > 468   --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_KILLED, si_pid=490, si_uid=1000, si_status=SIGSYS, si_utime=7, si_stime=2} ---
> > 468   write(2, "debug1: monitor_child_preauth: r"..., 82) = 82
> > 468   read(5, "", 4)                    = 0
> > 468   write(2, "debug1: do_cleanup\r\n", 20) = 20
> > 468   write(2, "debug1: Killing privsep child 49"..., 35) = 35
> > 468   kill(490, SIGKILL)                = 0
> > 468   exit_group(255)                   = ?
> > 468   +++ exited with 255 +++
> >
> >
> > In the failing case __NR_clock_nanosleep_time64 is not defined, so
> > SC_ALLOW(__NR_clock_nanosleep_time64) in openssh-8.3p1/sandbox-seccomp-filter.c
> > is not set...., but the strace output shows clock_nanosleep_time64() is called
> > (and aborted with SIGSYS)...
>
> Thanks for checking on this. Is there any known fix anywhere yet? I'll
> do some searching.

For the working case 'grep -R clock_nanosleep_time64 ./host' gives:

./host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/asm-generic/unistd.h:#define __NR_clock_nanosleep_time64 407
./host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/asm-generic/unistd.h:__SYSCALL(__NR_clock_nanosleep_time64, sys_clock_nanosleep)
./host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/asm/unistd-common.h:#define __NR_clock_nanosleep_time64 (__NR_SYSCALL_BASE + 407)
./host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/syscall.h:#ifdef __NR_clock_nanosleep_time64
./host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/bits/syscall.h:# define SYS_clock_nanosleep_time64 __NR_clock_nanosleep_time64
grep: ./host/arm-buildroot-linux-gnueabihf/sysroot/dev/fd: No such file or directory
grep: ./host/arm-buildroot-linux-gnueabihf/sysroot/dev/stderr: No such file or directory
grep: ./host/arm-buildroot-linux-gnueabihf/sysroot/dev/stdin: No such file or directory
grep: ./host/arm-buildroot-linux-gnueabihf/sysroot/dev/stdout: No such file or directory
grep: ./host/arm-buildroot-linux-gnueabihf/sysroot/etc/mtab: No such file or directory
grep: ./host/arm-buildroot-linux-gnueabihf/sysroot/etc/resolv.conf: No such file or directory
Binary file ./host/arm-buildroot-linux-gnueabihf/sysroot/sbin/ldconfig matches
Binary file ./host/arm-buildroot-linux-gnueabihf/sysroot/lib/libc-2.31.so matches
Binary file ./host/arm-buildroot-linux-gnueabihf/sysroot/lib/libc.so.6 matches
Binary file ./host/arm-buildroot-linux-gnueabihf/sysroot/lib32/libc-2.31.so matches
Binary file ./host/arm-buildroot-linux-gnueabihf/sysroot/lib32/libc.so.6 matches


Could you do the same for your failing 'Odroid HC2 with kernel 5.8
+ kernel-headers 5.8' case (and send my your defconfig)?

Regards,
Peter

>
> Thanks,
> Christian
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
