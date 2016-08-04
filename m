From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Aug 2016 22:44:30 +0200
Subject: [Buildroot] [PATCH 1/1] Patch to support latest buildroot
 environment
In-Reply-To: <1470275232-11620-1-git-send-email-olivier.singla@gmail.com>
References: <1470275232-11620-1-git-send-email-olivier.singla@gmail.com>
Message-ID: <20160804224430.61b3c0db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  3 Aug 2016 21:47:12 -0400, Olivier Singla wrote:
> From: Olivier <olivier.singla@gmail.com>

This should have been:

From: Olivier Singla <olivier.singla@gmail.com>

Indeed your From: line must match the Signed-off-by line.

Also, the commit title, "Patch to support latest buildroot environment"
is completely wrong. The patch has absolutely *nothing* to do with
supporting the latest Buildroot environment. It is about making
shellinabox to build with the musl C library. So the title should have
been something like:

	shellinabox: fix build with the musl C library

> ++#ifndef TTYDEF_IFLAG
> ++#include <sys/ttydefaults.h>
> ++#endif

The #ifndef test is completely unneeded. TTYDEF_* are available from
<sys/ttydefaults.h>, so it should just be included.

> + #ifdef HAVE_UTMPX_H
> +-#include <utmpx.h>
> ++//#include <utmpx.h>
> ++#undef HAVE_UTMPX_H
> + #endif

That's a complete hack and not the proper solution. The reason of the
build failure is that musl does "#define utmp utmpx" which causes some
symbol clash in launcher.c.

I have reported this problem to the musl developers:
http://www.openwall.com/lists/musl/2016/08/04/8. And in the mean time,
I've just added a change to shellinabox.mk to pass an autoconf variable
that makes the configure script believe that <utmpx.h> is not available
when the toolchain uses the musl C library.

In the end, I did three patches:

 1/ To turn the existing shellinabox patch to a Git formatted patch.

    https://git.buildroot.org/buildroot/commit/?id=99ed68487a83380cf00ba5c602746ada3f995bf7

 2/ One to add the patch fixing the missing <sys/ttydefaults.h> include
    and add the hack for <utmpx.h>

    https://git.buildroot.org/buildroot/commit/?id=35ccd358b304413229fc2e32f1318426cbb23a20

 3/ One to disable shellinabox for BR2_STATIC_LIBS builds, since it
    uses <dlfcn.h>. This was also causing some other build failures.

    https://git.buildroot.org/buildroot/commit/?id=1cad81f0fed3934449a28c35316684393d702a74

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
