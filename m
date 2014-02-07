From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Fri, 7 Feb 2014 12:53:17 -0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140207135324.4c7cbe3f@skate>
References: <20140207073009.C5A85100E3A@stock.ovh.net>
 <20140207135324.4c7cbe3f@skate>
Message-ID: <CAAEAJfAOUEyLD=UqWwjQ9gQZrFtSshk496M_8hnYmz=tN-cGNw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 7 February 2014 09:53, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[..]
>
>>      nios2 |                      lxc-0.9.0 | NOK | http://autobuild.buildroot.net/results/f592a011321429426be81bd1ecf664ad9a2c0161/
>
> Duplicate declaration of setns() :
>
> attach.c:54:12: error: static declaration of 'setns' follows non-static declaration
> In file included from /home/test/test/1/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/include/sched.h:42:0,
>                  from namespace.h:27,
>                  from attach.c:43:
> /home/test/test/1/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/include/bits/sched.h:92:12: note: previous declaration of 'setns' was here
> make[4]: *** [liblxc_so-attach.o] Error 1
>
> Ezequiel ?
>

I guess setns is getting problematic today. Problem is this chunk of lxc's code:

#ifndef HAVE_SETNS
static int setns(int fd, int nstype)
{
#ifdef __NR_setns
return syscall(__NR_setns, fd, nstype);
#else
errno = ENOSYS;
return -1;
#endif
}
#endif

We need a way to set HAVE_SETNS. I've found a similar fix here:

http://buildroot-busybox.2317881.n4.nabble.com/git-commit-iproute2-fix-build-with-toolchains-providing-setns-2-td33940.html

I'll see if I can find a suitable fix for lxc. Help is welcome though.
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
