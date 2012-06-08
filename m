From: Evgeny Rovinsky <e.rovinsky@gmail.com>
Date: Fri, 8 Jun 2012 15:13:11 +0400
Subject: [Buildroot] MIPS target: some packages fail on compilation
In-Reply-To: <CACZwKmuhunVfNwRTZfVMOxhbe0h=-fzjG74rCzLYvraOg6Zvkw@mail.gmail.com>
References: <CACZwKmuhunVfNwRTZfVMOxhbe0h=-fzjG74rCzLYvraOg6Zvkw@mail.gmail.com>
Message-ID: <CACZwKmvh9yN4Ous6JTDP_SkxkDxNueKQj2eMqzKGmb5gQX3D7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I'm building a rootfs system for MIPS IV target platform (using the
crosstool-ng-1.14.1 , n64 ABI with "-O3 -march=7k" flags, the 2.6.37
kernel. Buildroot version 2012.05-rc3).
I've got the number of packages that fail on compilation stage. Here is the
list:

dmalloc
lmbench
pv
qt (the opensource version)
sysvinit
xstroke
strace
ltp-testsuite
directfb

I had to disable the compilation of all the above packages.

For instance, the "strace" package compilation fails with the following
diagnostics:
(...)
mips64-n64-linux-gnu-gcc -DHAVE_CONFIG_H -I. -I./linux/mips -I./linux
-Wall -pipe -march=7k -O3  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -MT file.o -MD -MP -MF .deps/file.Tpo -c -o file.o
file.c
file.c: In function 'printstat64':
file.c:1046:16: error: storage size of 'statbuf' isn't known
file.c:1046:16: warning: unused variable 'statbuf' [-Wunused-variable]
make[2]: *** [file.o] Error 1
make[2]: *** Waiting for unfinished jobs....
mv -f .deps/util.Tpo .deps/util.Po

The diagnostics may vary for different packages.

Also, to obtain the successful build, I had to make some changes to the
package/Makefile.in file.
1) I replaced
GNU_TARGET_NAME=$(ARCH)-linux
with
GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
on line 13
2) I commented
TARGET_CFLAGS+=-fno-pic -mno-abicalls
on line 89

Of course, it is possible make individual changes to the packages
(modifying their Makefile and source files). But maybe there's better way?
Is it possible to make all packages compile successfully?

Regards,
Evgeny Rovinsky
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120608/4912538b/attachment.html>
