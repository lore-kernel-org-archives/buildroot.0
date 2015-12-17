From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 23:24:17 +0100
Subject: [Buildroot] [PATCH v1] Makefile: valgrind needs non-stripped
 dynamic linker library
In-Reply-To: <1444161096-11419-1-git-send-email-ps.report@gmx.net>
References: <1444161096-11419-1-git-send-email-ps.report@gmx.net>
Message-ID: <20151217232417.6d87b00a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Tue,  6 Oct 2015 21:51:36 +0200, Peter Seiderer wrote:
> Fixes the following valgrind error (tested on freescale imx6):
> 
> valgrind:  Fatal error at startup: a function redirection
> valgrind:  which is mandatory for this platform-tool combination
> valgrind:  cannot be set up.  Details of the redirection are:
> valgrind:
> valgrind:  A must-be-redirected function
> valgrind:  whose name matches the pattern:      strcmp
> valgrind:  in an object with soname matching:   ld-linux-armhf.so.3
> valgrind:  was not found whilst processing
> valgrind:  symbols from the object with soname: ld-linux-armhf.so.3
> valgrind:
> valgrind:  Possible fixes: (1, short term): install glibc's debuginfo
> valgrind:  package on this machine.  (2, longer term): ask the packagers
> valgrind:  for your Linux distribution to please in future ship a non-
> valgrind:  stripped ld.so (or whatever the dynamic linker .so is called)
> valgrind:  that exports the above-named function using the standard
> valgrind:  calling conventions for this platform.  The package you need
> valgrind:  to install for fix (1) is called
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  Makefile | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

I've applied after slightly adjusting the comment in the Makefile: we
are still stripping the dynamic linker, but we are only stripping the
debugging symbols.

I did a quick test on glibc, and here are the numbers:

 - Completely unstripped:	755612
 - Debugging symbols stripped:	123560 (i.e with your patch)
 - Fully stripped:		101548 (i.e without your patch)

Since the difference with your patch is only 22 KB, I thought it was
not worth the effort making it conditional on whether valgrind is used
or not. If other people disagree with this judgment, they are invited
to submit a follow-up patch :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
