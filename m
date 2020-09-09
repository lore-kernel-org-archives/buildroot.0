From: Christian Stewart <christian@paral.in>
Date: Tue, 8 Sep 2020 18:39:47 -0700
Subject: [Buildroot] OpenSSH login problem
In-Reply-To: <20200906193958.2b4199a4@gmx.net>
References: <cc86bfd55f944197bcd610626edecf2f@go-sys.de>
 <52-5f356200-5-2c492440@36238474>
 <4d943f9a8e974a60a5167db44bce6cd1@go-sys.de>
 <CA+h8R2oi0GRLYdumQOYxwON=xd7p_8pn+WoknjRd5N24Vr_5KQ@mail.gmail.com>
 <20200816220620.65159d1d@windsurf.home>
 <CA+h8R2qO01wwrEJdTx2puEbDv6mv31YxyAjG5nCn6hosPAW_aQ@mail.gmail.com>
 <CA+h8R2pjvm7Wr_hkS2wtqhzqESmgqTtxivkdTLdEr07ngJLTbQ@mail.gmail.com>
 <20200906193958.2b4199a4@gmx.net>
Message-ID: <CA+h8R2pdJExc9v7AeGAfvon1sVY-G2iYk7EzjdZFBLBRd9ApVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Unfortunately I'm still seeing this with GCC 9 and OpenSSH 8.3p1
against a Odroid HC2 with kernel 5.8 + kernel-headers 5.8, using glibc
2.31.

On Sun, Sep 6, 2020 at 10:40 AM Peter Seiderer <ps.report@gmx.net> wrote:
>
> Hello Christian, *,
>
> On Sat, 5 Sep 2020 19:33:23 -0700, Christian Stewart <christian@paral.in> wrote:
>
> > Hi all,
> >
> > Finally got around to running this test.
> >
> > I previously tested an Odroid XU4 with GCC 10 and latest binutils, and
> > it worked.
> >
> > Now with a test against GCC 9 on a Odroid HC2, it's not working (ssh
> > exits immediately after successful auth).
> >
> > Testing against OpenSSH 8.3p1 now and figuring out exactly why this is
> > happening, if it's the GCC version or what.
>
> Tested on RPi3, the following defconfig works (buildroot-git-d1c3f077e24a41f004945f94aceb6f059c58e423,
> linux-5.4.51):

[snip]

> And the following defconfig fails (linux-4.19.126):

[snip]

> The last lines of sshd failure strace are:
>
> 468   write(2, "Accepted none for root from 192."..., 59 <unfinished ...>
> 490   clock_gettime(CLOCK_BOOTTIME, {tv_sec=306, tv_nsec=379381706}) = 0
> 490   clock_nanosleep_time64(CLOCK_REALTIME, 0, {tv_sec=0, tv_nsec=24656548290918313},  <unfinished ...>) = ?
> 490   +++ killed by SIGSYS +++
> 468   <... write resumed>)              = 59
> 468   --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_KILLED, si_pid=490, si_uid=1000, si_status=SIGSYS, si_utime=7, si_stime=2} ---
> 468   write(2, "debug1: monitor_child_preauth: r"..., 82) = 82
> 468   read(5, "", 4)                    = 0
> 468   write(2, "debug1: do_cleanup\r\n", 20) = 20
> 468   write(2, "debug1: Killing privsep child 49"..., 35) = 35
> 468   kill(490, SIGKILL)                = 0
> 468   exit_group(255)                   = ?
> 468   +++ exited with 255 +++
>
>
> In the failing case __NR_clock_nanosleep_time64 is not defined, so
> SC_ALLOW(__NR_clock_nanosleep_time64) in openssh-8.3p1/sandbox-seccomp-filter.c
> is not set...., but the strace output shows clock_nanosleep_time64() is called
> (and aborted with SIGSYS)...

Thanks for checking on this. Is there any known fix anywhere yet? I'll
do some searching.

Thanks,
Christian
