From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Mar 2021 09:36:20 +0100
Subject: [Buildroot] Analysis of build results for 2021-03-03
In-Reply-To: <20210304222634.GP2275@scaer> (Yann E. MORIN's message of "Thu, 4
 Mar 2021 23:26:34 +0100")
References: <20210304081519.C821B4B530@smtp4.osuosl.org>
 <20210304224926.45aa4056@windsurf.home> <20210304222634.GP2275@scaer>
Message-ID: <87zgzif14r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> This is a bug in uClibc: it implements renameat() only if the
 >> SYS_renameat system call exists. If only the SYS_renameat2 system call
 >> exists, the renameat() function is not implemented. Musl does this
 >> correctly:
 >> 
 >> int renameat(int oldfd, const char *old, int newfd, const char *new)
 >> {
 >> #ifdef SYS_renameat
 >> return syscall(SYS_renameat, oldfd, old, newfd, new);
 >> #else
 >> return syscall(SYS_renameat2, oldfd, old, newfd, new, 0);
 >> #endif
 >> }
 >> 
 >> uclibc needs to be patched here.

 > But what about external toolchains? We can't know whether they would
 > carry such a patch or not...

But that is the general issue with external uClibc-based toolchains, we
cannot really do anything about it.

Thomas, will you create a uclibc-ng patch?


 >> >   aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/739d625673f9b2ce2d915ecdc21910c62618d145 |     
 >> > microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/b1779a7d46f6ee9c06864c3ca252f1cdad47cf08 |     
 >> >     i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/a5fe402e3f4e538eb4584f345b029ef12ad43348 |     
 >> >     arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/abd3f886335f146ff6f16370484106bd8a205bda |     
 >> What do we do with this? The only way to solve that is to have the
 >> Cargo vendoring support, which we won't have for 2021.02. Should we
 >> drop this package ?

 > I am all in favour of dropping sentry-cli. It is a host-only package
 > with no in-tree users. When it was submitted, no rationale was given to
 > justify for having it upstream (although I suspect it may be helpfull
 > with traces generated with sentry-native).

 > In any case, this package is not playing nice with our infra, and our
 > infra is not ready to accomodate such a package yet.

 > Let's drop it for now...

Fine by me.


 >> >    nios2 | libgeos-3.9.0 | NOK |
 >> > http://autobuild.buildroot.net/results/a05fdf1958f93a206c5c66c7f636b6650683626d
 >> > | ORPH
 >> Some more nios2 toolchain issue.
 >> Should we get rid of nios2 support entirely ?

 > How prevalent is nios2? What's the support in the kernel? Some time ago,
 > quite a few old architectures were dropped; IIR, a few others were put
 > on trial to see if they were really still alive (but apart an LWN
 > article https://lwn.net/Articles/748074/ I can't find that list...)

There is also https://lwn.net/Articles/838807/, which doesn't even list
nios2. I believe it was added back in 2014:

https://lwn.net/Articles/619011/

I think running Linux on nios2 is fairly rare, but there are users. As a
data point, it looks like the clone syscall got broken almost a year
ago, and has recently been fixed by someone from Siemens:

commit 9abcfcb20320e8f693e89d86573b58e6289931cb
Author: Andreas Oetken <andreas.oetken@siemens.com>
Date:   Fri Feb 19 14:41:03 2021 +0800

    nios2: fixed broken sys_clone syscall

    The tls pointer must be pushed on the stack prior to calling nios2_clone
    as it is the 5th function argument. Prior handling of the tls pointer was
    done inside former called function copy_thread_tls using the r8 register
    from the current_pt_regs directly. This was a bad design and resulted in
    the current bug introduced in 04bd52fb.

    Fixes: 04bd52fb ("nios2: enable HAVE_COPY_THREAD_TLS, switch to kernel_clone_args")
    Signed-off-by: Andreas Oetken <andreas.oetken@siemens.com>
    Signed-off-by: Ley Foon Tan <ley.foon.tan@intel.com>
    Acked-by: Christian Brauner <christian.brauner@ubuntu.com>

Looking at the history of arch/nios2, almost all recent changes looks to
be from non-nios2 developers doing kernel wide changes, so I would say
it is fairly dead, E.G. the last functional code change authored by
someone from Intel is from 2018:

commit cb9f753a3731f7fe16447bea45cb6f8e8bb432fb
Author: Huang Ying <ying.huang@intel.com>
Date:   Thu Apr 5 16:24:39 2018 -0700

    mm: fix races between swapoff and flush dcache

So I don't have an issue with us getting rid of nios2 post-2021.02. I'll
try to remember to add a note about it in the announcement mail, so if
there are active users they will hopefully speak up.


 >> >     arm | toolchain-external-linaro-a... | NOK |
 >> > http://autobuild.buildroot.net/results/d9b9a4b7c3660bd730a19ab09e44f24bc29e3f40
 >> > | ORPH
 >> >     arm | toolchain-external-linaro-a... | NOK |
 >> > http://autobuild.buildroot.net/results/13f9a551f5ac911e7daa2a382b0683d81486cffa
 >> > | ORPH
 >> toolchain is gone ?

 > I can get it from here;

Yes, I already pushed it to s.b.o yesterday afternoon when I noticed the
failure.

-- 
Bye, Peter Korsgaard
