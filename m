From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Nov 2014 09:20:47 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-11-19
In-Reply-To: <1416513506.25116.9.camel@abrodkin-8560l.internal.synopsys.com>
References: <20141120073014.164A510107F@stock.ovh.net>
 <20141120094407.4b487379@free-electrons.com>
 <1416513506.25116.9.camel@abrodkin-8560l.internal.synopsys.com>
Message-ID: <20141121092047.2970fd83@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Thu, 20 Nov 2014 19:58:26 +0000, Alexey Brodkin wrote:

> > device-linux.o: In function `check_ip6_forwarding':
> > /home/test/autobuild/instance-1/output/build/radvd-2.8/device-linux.c:189: undefined reference to `sysctl'
> > 
> > Alexey, can you have a look at this one?
> 
> This happens because for ARC in Linux kernel we don't have
> __ARCH_WANT_SYSCALL_DEPRECATED.
> 
> So a number of syscalls is not enabled in
> "include/asm-generic/unistd.h".
> 
> From the name of this define I would assume that we should avoid using
> those syscalls. So probably "radvd" should be updated.
> 
> Any thoughts?

Ok, thanks for the analysis. Going a bit further, the issue is that
when __NR_sysctl is not defined, uClibc will not provide an
implementation of sysctl(), but it will continue to install
<sys/sysctl.h>, which provides the prototype for sysctl().

Looking at the radvd code, the call to sysctl() is actually optional,
depending on whether the configure script has found <sys/sysctl.h>. So
it breaks in our case, because <sys/sysctl.h> is there, but the
sysctl() function is not actually implemented.

So I see two possible solutions (possibly non exclusive) :

 1) Fix uClibc so that it doesn't install <sys/sysctl.h> when sysctl()
    is not available.

 2) Fix radvd configure check so that instead of checking if
    <sys/sysctl.h> is available, check if the sysctl() function is
    actually present. I don't remember if AC_CHECK_FUNCS() so a
    compile+link test or just a compile test. If it does just a compile
    test, then it will not detect the problem. If that's the case, then
    use AC_TRY_LINK() would work.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
