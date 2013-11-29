From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Nov 2013 00:40:49 +0100
Subject: [Buildroot] Microblaze and ARC toolchains
Message-ID: <20131130004049.0c5835d0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Spenser and Mischa,

I finally took some time to test your toolchain patches, for the
Microblaze and ARC architectures. I've had a number of issues, some of
which I've been able to solve (see the attached patches), but I still
have remaining issues on Microblaze:

 * Building a Microblaze toolchain with eglibc fails during the eglibc
   configure step:

*** WARNING: You should not compile GNU libc without versioning. Not using
*** versioning will introduce incompatibilities so that old binaries
*** will not run anymore.
*** For versioning you need recent binutils (binutils-2.8.1.0.23 or newer).
checking for .previous assembler directive... yes
checking for .protected and .hidden assembler directive... yes
checking whether __attribute__((visibility())) is supported... no
configure: error: compiler support for visibility attribute is required
make[1]: *** [/home/test/outputs/microblaze/build/glibc-7f0bcce417c47aefad06ddfec7cd4ced3a4e10ff/.stamp_configured] Error 1
make: *** [_all] Error 2

   What I can see in the build.log file is:

configure:5795: /home/test/outputs/microblaze/host/usr/bin/microblaze-buildroot-linux-gnu-gcc -Werror -S conftest.c -o conftest.s 1>&5
conftest.c:2:5: error: visibility attribute not supported in this configuration; ignored [-Werror=attributes]
     int bar __attribute__ ((visibility ("protected"))) = 1;
     ^
conftest.c:2:5: error: visibility attribute not supported in this configuration; ignored [-Werror=attributes]
cc1: all warnings being treated as errors
configure:5798: $? = 1
configure:5809: result: no
configure:5812: error: compiler support for visibility attribute is required

   The defconfig for this build is:

BR2_microblazeel=y
BR2_TOOLCHAIN_BUILDROOT_EGLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_HOST_GDB=y

 * Building a Microblaze toolchain with glibc fails during the glibc
   configure step, with:

checking for suffix of object files... configure: error: in `/home/test/outputs/microblaze-glibc/build/glibc-b86835ca92a1942ed08d8b5ee47498e711feaddb/build':
configure: error: cannot compute suffix of object files: cannot compile
See `config.log' for more details
make[1]: *** [/home/test/outputs/microblaze-glibc/build/glibc-b86835ca92a1942ed08d8b5ee47498e711feaddb/.stamp_configured] Error 1
make: *** [_all] Error 2

   The config.log contains:

configure:2759: /home/test/outputs/microblaze-glibc/host/usr/bin/microblaze-buildroot-linux-gnu-gcc -c -O2   conftest.c >&5
/tmp/cc0r8j50.s: Assembler messages:
/tmp/cc0r8j50.s:4: Error: unknown pseudo-op: `.ent'
/tmp/cc0r8j50.s:7: Error: unknown pseudo-op: `.frame'
/tmp/cc0r8j50.s:8: Error: unknown pseudo-op: `.mask'
/tmp/cc0r8j50.s:9: Error: no such instruction: `rtsd r15,8'
/tmp/cc0r8j50.s:11: Error: no such instruction: `addk r3,r0,r0'
configure:2763: $? = 1
configure: failed program was:
| /* confdefs.h */
| #define PACKAGE_NAME "GNU C Library"
| #define PACKAGE_TARNAME "glibc"
| #define PACKAGE_VERSION "(see version.h)"
| #define PACKAGE_STRING "GNU C Library (see version.h)"
| #define PACKAGE_BUGREPORT "http://sourceware.org/bugzilla/"
| #define PACKAGE_URL "http://www.gnu.org/software/glibc/"
| #define PKGVERSION "(Buildroot) "
| #define REPORT_BUGS_TO "<http://www.gnu.org/software/libc/bugs.html>"
| /* end confdefs.h.  */
| 
| int
| main ()
| {
| 
|   ;
|   return 0;
| }
configure:2777: error: in `/home/test/outputs/microblaze-glibc/build/glibc-b86835ca92a1942ed08d8b5ee47498e711feaddb/build':
configure:2779: error: cannot compute suffix of object files: cannot compile
See `config.log' for more details

    The defconfig is:

BR2_microblazeel=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_HOST_GDB=y

    Is is expected that the toolchain is named microblaze-<something>
    instead of microblazeel-<something> ?

 * The Microblaze build against uClibc failed as well, with:

  AS lib/crt1.o
libc/sysdeps/linux/alpha/crt1.S: Assembler messages:
libc/sysdeps/linux/alpha/crt1.S:43: Error: alignment not a power of 2
libc/sysdeps/linux/alpha/crt1.S:45: Error: unknown pseudo-op: `.ent'
libc/sysdeps/linux/alpha/crt1.S:57: Error: unknown pseudo-op: `.frame'
libc/sysdeps/linux/alpha/crt1.S:58: Error: no such instruction: `br $29,1f'
libc/sysdeps/linux/alpha/crt1.S:59: Error: no such instruction: `ldgp $29,0($29)'
libc/sysdeps/linux/alpha/crt1.S:60: Error: suffix or operands invalid for `sub'
libc/sysdeps/linux/alpha/crt1.S:61: Error: suffix or operands invalid for `mov'
libc/sysdeps/linux/alpha/crt1.S:62: Error: unknown pseudo-op: `.prologue'
libc/sysdeps/linux/alpha/crt1.S:65: Error: no such instruction: `lda $16,main'
libc/sysdeps/linux/alpha/crt1.S:67: Error: no such instruction: `ldl $17,16($30)'
libc/sysdeps/linux/alpha/crt1.S:68: Error: no such instruction: `lda $18,24($30)'
libc/sysdeps/linux/alpha/crt1.S:71: Error: no such instruction: `lda $19,_init'
libc/sysdeps/linux/alpha/crt1.S:72: Error: no such instruction: `lda $20,_fini'
libc/sysdeps/linux/alpha/crt1.S:75: Error: suffix or operands invalid for `mov'
libc/sysdeps/linux/alpha/crt1.S:78: Error: no such instruction: `stq $30,0($30)'
libc/sysdeps/linux/alpha/crt1.S:82: Error: no such instruction: `jsr $26,__uClibc_main'
libc/sysdeps/linux/alpha/crt1.S:86: Error: no such instruction: `call_pal 0'
make[2]: *** [lib/crt1.o] Error 1
make[1]: *** [/home/test/outputs/microblaze-uclibc/build/uclibc-0.9.33.2/.stamp_configured] Error 2
make: *** [_all] Error 2

    The defconfig is:

BR2_microblazeel=y
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_HOST_GDB=y

 * On the ARC side of things, what I get is a failure at the uClibc
   build step. However, what's weird is that I did get one successful
   build, but now that I've restarted everything from scratch, it fails
   (and did so two times in a row) :

  AS lib/crt1.o
as: unrecognized option '-mARC700'
make[2]: *** [lib/crt1.o] Error 1
make[1]: *** [/home/test/outputs/arc/build/uclibc-9f0f466d3b17181ce88be36ce24a775774fe686c/.stamp_configured] Error 2
make: *** [_all] Error 2

   The defconfig is:

BR2_arcle=y
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_PTHREAD_DEBUG=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_HOST_GDB=y
BR2_PACKAGE_GDB=y

Mischa and Spenser, do you have some time to look into these issues?
Since you're probably not seeing them, I can do some more testing, or
provide additional logs or details if you ask for specific things.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-binutils-pass-MAKEINFO-at-configure-build-and-instal.patch
Type: text/x-patch
Size: 1336 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131130/def96b9e/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0002-binutils-missing-host-flex-and-host-bison-dependenci.patch
Type: text/x-patch
Size: 1087 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131130/def96b9e/attachment-0001.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0003-gdb-pass-MAKEINFO-at-configure-and-install-time.patch
Type: text/x-patch
Size: 954 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131130/def96b9e/attachment-0002.bin>
