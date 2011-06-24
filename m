From: raymond zhao <raymond.zhao.ml@gmail.com>
Date: Fri, 24 Jun 2011 15:52:39 -0400
Subject: [Buildroot] Is this a bug? libm in uclibc 0.9.32
Message-ID: <BANLkTimqhX+pHGkSHQMpTX=n82_eHmj0tA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I am trying to build tool chain with uclibc 0.9.32 and gcc 4.6.x for
powerpc 8540 processor. there are errors when it build libm lib. I do
not know if it a bug or there are some thing wrong in my config.

1. No one defines libm_ARCH_fpu_OUT in make files, so the files under
directory toolchain\uClibc-0.9.32\libm\powerpc\e500\fpu will nor be
build at all. then there will be a link error for unsolved functions.
2. Somehow the NOT_IN_lic is not passed to the build command line for
libm/powerpc/e500/fpu/fe_nomask.c, then the  __libc_errno  in this
files will compain.

Here is my patch to make it works. It it is a bug and I am fixing it
correctly. I will be very happy to see them in next release. :-)


--- a/libm/powerpc/e500/fpu/Makefile.arch	2011-03-16 15:11:13.000000000 -0400
+++ b/libm/powerpc/e500/fpu/Makefile.arch.new	2011-05-25
12:15:55.619014656 -0400
@@ -5,6 +5,7 @@
 # Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
 #

+libm_ARCH_fpu_OUT := $(libm_ARCH_fpu_DIR)
 libm_ARCH_SRC:=$(wildcard $(libm_ARCH_fpu_DIR)/*.c)
 libm_ARCH_OBJ:=$(patsubst
$(libm_ARCH_fpu_DIR)/%.c,$(libm_ARCH_fpu_OUT)/%.o,$(libm_ARCH_SRC))


--- a/libm/powerpc/e500/fpu/fe_nomask.c	2011-03-16 15:11:13.000000000 -0400
+++ b/libm/powerpc/e500/fpu/fe_nomask.c	2011-05-25 12:35:15.015045993 -0400
@@ -17,6 +17,7 @@
    Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
    02111-1307 USA.  */

+#define NOT_IN_libc     //Raymond add this to kill __libc_errno error
 #include <fenv.h>
 #include <errno.h>
