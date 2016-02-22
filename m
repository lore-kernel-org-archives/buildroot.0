From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Mon, 22 Feb 2016 21:05:00 +0200
Subject: [Buildroot] Analysis of build results for 2016-02-21
Message-ID: <CALdGskKUp-GtxeOBWq-5Tzp7b2zBad3=RoRxeN1eaJHPcg5Xww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All


arm |                     cups-2.1.2 | NOK |
http://autobuild.buildroot.net/results/07ccca8f80c56ab0ff48bfee876885b1c8c3916e/
arc |                     cups-2.1.2 | NOK |
http://autobuild.buildroot.net/results/b169b939e38cb761319a92d2871f4f59ddb5c4ac/

Both error cases looks like it has to do with uclibc not behaving as
expected at link time for the ippserver build (Both builds link statically
with position independent execution also set).  For the arm platform it
can't find the Scrt1.o file, and for the ARC compiler, __init_array_end is
undefined.

I haven't considered all the options yet, but two that come to mind are
disabling cups support for uclibc type compilers, or else to disable the
cups test-framework.

The missing Scrt1.o has to do with the compiler.  In the Configure step,
autotools checks whether the compiler is capable of generating position
independent executables.

"checking whether compiler supports -fPIE... yes"

In the linking stage it then looks for Scrt1.o, which it can't find.  This
breaks the build.

From http://dev.gentoo.org/~vapier/crt.txt
crt1.o
  Newer style of the initial runtime code.  Contains the _start symbol which
  sets up the env with argc/argv/libc _init/libc _fini before jumping to the
  libc main.  glibc calls this file 'start.S'.
Scrt1.o
  Used in place of crt1.o when generating PIEs.

Regards

Olivier Schonken
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160222/1f113fe6/attachment.html>
