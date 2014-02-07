From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Feb 2014 15:55:11 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CAAEAJfAOUEyLD=UqWwjQ9gQZrFtSshk496M_8hnYmz=tN-cGNw@mail.gmail.com>
References: <20140207073009.C5A85100E3A@stock.ovh.net>
 <20140207135324.4c7cbe3f@skate>
 <CAAEAJfAOUEyLD=UqWwjQ9gQZrFtSshk496M_8hnYmz=tN-cGNw@mail.gmail.com>
Message-ID: <20140207155511.7ad8ec55@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garc?a,

On Fri, 7 Feb 2014 12:53:17 -0200, Ezequiel Garc?a wrote:

> I guess setns is getting problematic today. Problem is this chunk of lxc's code:
> 
> #ifndef HAVE_SETNS
> static int setns(int fd, int nstype)
> {
> #ifdef __NR_setns
> return syscall(__NR_setns, fd, nstype);
> #else
> errno = ENOSYS;
> return -1;
> #endif
> }
> #endif
> 
> We need a way to set HAVE_SETNS. I've found a similar fix here:
> 
> http://buildroot-busybox.2317881.n4.nabble.com/git-commit-iproute2-fix-build-with-toolchains-providing-setns-2-td33940.html
> 
> I'll see if I can find a suitable fix for lxc. Help is welcome though.

The lxc configure script has a check for setns() :

AC_CHECK_FUNCS([setns pivot_root sethostname unshare])

so if setns() is available, it should set HAVE_SETNS in config.h.

Have a look at config.log to see why it fails to detect that setns() is
available.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
