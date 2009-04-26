From: Hai Shalom <hai.shalom@gmail.com>
Date: Sun, 26 Apr 2009 17:36:46 +0300
Subject: [Buildroot] Buildroot comments and questions
Message-ID: <a4413b2d0904260736j3b85599u488c9f3d28777f36@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've been using the buildroot for the first time, and I am struggling to
create a stable toolchain for armeb with uclibc 0.9.29 and gcc 4.2.4.

There are few minor issues which I would like to update:
1. For gcc 4.2.x,  BR2_GCC_TARGET_ABI must be "aapcs" and not "aapcs-linux"
which works only for gcc 4.3.x.
2. I am using GNU find 4.1.20 which doesn't like the "-delete" flag in the
main Makefile, instead you can use " | xargs rm -rf" which is good for all
versions.
3. There is a Thumb support patch for ARM in
http://lists.busybox.net/pipermail/buildroot/2008-March/019622.html
I have problems with it because the gcc warns that crtbegin.o doesn't
support Thumb-interwork whilst my binary does.
Perhaps you should check it out?

I have a few questions and I would be greatful if you could answer or
comment:
1. I have a compilation error with crtstuff.c:

/buildroot-2009.02/toolchain_build_armeb/gcc-4.2.4/gcc/crtstuff.c: In
function '__do_global_dtors_aux':
/buildroot/buildroot-2009.02/toolchain_build_armeb/gcc-4.2.4/gcc/crtstuff.c:267:
error: '__DTOR_LIST__' undeclared (first use in this function)
/buildroot/buildroot-2009.02/toolchain_build_armeb/gcc-4.2.4/gcc/crtstuff.c:267:
error: (Each undeclared identifier is reported only once
/buildroot/buildroot-2009.02/toolchain_build_armeb/gcc-4.2.4/gcc/crtstuff.c:267:
error: for each function it appears in.)
make[2]: *** [crtbegin.o] Error 1

Trying to workaround this, resulted in non-running binaries. I tried to user
the crtstuff.c from gcc-4.3.2 and it compiled, however, I get the following
warnings:

armeb-linux-uclibc/bin/ld: warning: .init_array section has zero size
armeb-linux-uclibc/bin/ld: warning: .fini_array section has zero size

The executables run correctly though.

2. Using objdump -x, reveals that the private flags of the executables are:
[APCS-32] [FPA float format] [has entry point] which suggest Old ABI, whilst
I expected it to have [Version4 EABI] [has entry point]. Note that I enabled
EABI in the buildroot's menuconfig.


I would appreaciate any comments, thanks in advance.

Hai.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090426/e25a239b/attachment.htm>
