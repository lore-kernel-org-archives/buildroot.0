From: Rob Landley <rob@landley.net>
Date: Mon, 9 Oct 2006 23:44:08 -0400
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
In-Reply-To: <200610092146.51748.rob@landley.net>
References: <20061009114134.C2C4E485D4@busybox.net>
	<20061009203437.GA26440@codepoet.org>
	<200610092146.51748.rob@landley.net>
Message-ID: <200610092344.09722.rob@landley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 09 October 2006 9:46 pm, Rob Landley wrote:
> On Monday 09 October 2006 4:34 pm, Erik Andersen wrote:
> > On Mon Oct 09, 2006 at 11:33:06AM -0600, Erik wrote:
> > > An alternative, is there are now some headers being
> > > produced for all architectures by dwmw2:
> > >     ftp://ftp.kernel.org/pub/linux/kernel/people/dwmw2/kernel-headers/
> > > 
> > > which looks to be usable for uClibc for all arches with minor tweeks.
> > 
> > Even better, it appears this is simply the result of
> > running 'make headers_install_all' which is now present
> > in 2.6.19-rc1.  So once 2.6.19 final is out, it will make
> > generating kernel headers _MUCH_ easier for us,
> 
> I've been exchanging email with dwmw2 about this for months now.  Now that 
> I've got some spare time I'm rebuilding Firmware Linux as a cross-compile 
> setup using qemu.  Results are a bit mixed, though.  Building current uClibc 
> cvs as of half an hour ago:
> 
>   CC ldso/ldso/ldso.oS
> In file included from ./libpthread/linuxthreads.old/sysdeps/x86_64/tls.h:25,
>                  from ./include/bits/uClibc_errno.h:35,
>                  from ./include/errno.h:62,
>                  from ./include/bits/syscalls.h:19,
>                  from ./include/sys/syscall.h:25,
>                  from ./ldso/ldso/x86_64/dl-syscalls.h:3,
>                  from ./ldso/include/dl-syscall.h:12,
>                  from ./ldso/include/ldso.h:36,
>                  from ldso/ldso/ldso.c:33:
> ./libpthread/linuxthreads.old/sysdeps/x86_64/pt-machine.h:27:24: error: 
> asm/prctl.h: No such file or directory
> 
> Changed pt-machine.h to include sys/prctl.h and it made it much farther, 
then 
> it died with:
> 
>   CC libc/sysdeps/linux/common/prctl.os
> libc/sysdeps/linux/common/prctl.c:13: error: conflicting types for 'prctl'
> ./include/sys/prctl.h:28: error: previous declaration of 'prctl' was here
> libc/sysdeps/linux/common/prctl.c:14: error: conflicting types for 'prctl'
> ./include/sys/prctl.h:28: error: previous declaration of 'prctl' was here
> 
> At which point I stopped for dinner.  Just now getting back to it...

Memo to self:  When installing the kernel headers, specify the %*#(&%& 
architecture or you get the i386 headers, which is not right when 
cross-compiling for x86_64.

  make headers_install ARCH=x86_64 INSTALL_HDR_PATH=/blah/blah/blah

The ARCH= part is _important_.

The clue was getting to:

./include/asm/posix_types.h:10: error: redefinition of 
typedef '__kernel_ino_t'
./include/bits/kernel_types.h:11: error: previous declaration 
of '__kernel_ino_t' was here

And noticing that asm/posix_types.h started with this:
#ifndef __ARCH_I386_POSIX_TYPES_H
#define __ARCH_I386_POSIX_TYPES_H

Right...

Rob
-- 
Never bet against the cheap plastic solution.
