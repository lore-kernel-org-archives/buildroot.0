From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Nov 2013 18:12:48 +0100
Subject: [Buildroot] [PATCH] lftp: new package.
In-Reply-To: <528E3223.1000401@syscom.ch>
References: <1385046971-7707-1-git-send-email-rebillout@syscom.ch>
 <1385046971-7707-2-git-send-email-rebillout@syscom.ch>
 <20131121164242.64981c00@skate> <528E3223.1000401@syscom.ch>
Message-ID: <20131121181248.3c606028@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnaud R?billout,

On Thu, 21 Nov 2013 17:17:39 +0100, Arnaud R?billout wrote:

> thanks for your comments, I'll send a second revision with everything fixed.

Thanks!

> > Can you detail the posix_fallocate() problem you've seen? Maybe we can
> > solve it in a different/nicer way.
> 
> Here is a piece of the m4 file which describes the macro 
> (lftp-4.4.10/m4/lftp.m4, line 246):
> 
> > AC_DEFINE(HAVE_POSIX_FALLOCATE, 1, [Define if you have a working 
> > posix_fallocate()])
> > AC_DEFUN([LFTP_POSIX_FALLOCATE_CHECK],[
> >    dnl * Old glibcs have broken posix_fallocate(). Make sure not to 
> > use it.
> >    dnl * It may also be broken in AIX.
> 
> In order to test that, the configure script compiles and runs a piece of 
> C code.
> 
> There's two problems with that.
> 
> First, the code won't compile because uClibc doesn't define 
> posix_fallocate. To solve that, we can fix the m4 macro with a #define.
> It's quite easy, though I don't know exactly how to do it properly.

Depends on the uClibc version. The official 0.9.33.2 version indeed
does not have posix_fallocate(), but we have a patch in Buildroot that
adds it. However, it is not available for uClibc-based external
toolchains, so we can't just assume posix_fallocate() is always here.

> But after that comes the second problem: the test is supposed to run 
> this piece of code. How are we supposed to run cross-compiled code on 
> the host ?
> I can imagine it's a typical problem, but I don't know how it's supposed 
> to be handled.

Yes, that's a typical problem, and of course, we cannot use configure
scripts that try to run programs compiled for the target on the build
machine.

I believe we have two solutions here:

 (1) Find the configure variable that can be passed in the configure
     environment to tell configure that posix_fallocate() is not
     available. Set it to "available" when a glibc/eglibc toolchain is
     used and "not available" when an uClibc toolchain is used.

 (2) Or, better, improve the configure test to be able to only do the
     compile test and not the execution test, and assume that if a
     posix_fallocate() program builds, then it means that it works. We
     don't use those old glibcs or AIX that have broken
     posix_fallocate().

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
