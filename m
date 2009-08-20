From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Thu, 20 Aug 2009 14:45:01 -0400
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901BEA58B@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA43C@mi8nycmail19.Mi8.com><20090819214237.534c433f@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA476@mi8nycmail19.Mi8.com><20090819233037.1d8e5a5d@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA4AD@mi8nycmail19.Mi8.com><20090820143514.7c5e56a2@surf>
	<BD79186B4FD85F4B8E60E381CAEE190901BEA58B@mi8nycmail19.Mi8.com>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901BEA5DB@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday, August 20, 2009 5:35 AM, Thomas Petazzoni wrote:
>> I just tried that and get the same results.  Maybe I didn't compile
>> it statically?  I just did:
>> 
>> $ arm-none-linux-gnueabi-gcc init.c -o init
>
> Add -static
>
> And verify with "file" that it is indeed statically compiled:
>
> thomas at surf:/tmp$ arm-linux-gcc -o hello hello.c
> thomas at surf:/tmp$ file hello
> hello: ELF 32-bit LSB executable, ARM, version 1 (SYSV), dynamically linked (uses shared libs), not stripped
> thomas at surf:/tmp$ arm-linux-gcc -o hello hello.c -static
> thomas at surf:/tmp$ file hello
> hello: ELF 32-bit LSB executable, ARM, version 1 (SYSV), statically linked, not stripped

Follow-up information...

It appears that ext-tool.mk is not copying the correct external toolchain
libraries for my architecture.

The ext-tool.mk uses the following to get SYSROOT_DIR:

SYSROOT_DIR=$(shell LANG=C $(TARGET_CC) -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=)

Manually doing that from the command line gives me:

$ arm-none-linux-gnueabi-gcc -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=
/opt/codesourcery/arm-none-linux-gnueabi/libc
$ arm-none-linux-gnueabi-gcc -march=armv4t -v 2>&1 | grep ^Configured | tr " " "\n" | grep -- "--with-sysroot" | cut -f2 -d=
/opt/codesourcery/arm-none-linux-gnueabi/libc

It appears the -march=armv4t option does not effect the -v option.

/opt/codesourcery/arm-none-linux-gnueabi is a hardlink to the real
location of the files.

$ ls -la /opt/codesourcery/arm-none-linux-gnueabi
lrwxrwxrwx 1 root root 70 2009-07-20 17:28 /opt/codesourcery/arm-none-linux-gnueabi -> /home/bigguiness/CodeSourcery/Sourcery_G++_Lite/arm-none-linux-gnueabi

But, if I query the directories in the compiler's search path they
are different.  Note, in the following I clipped the first part of
all the paths in order to shorten the output.

$ arm-none-linux-gnueabi-gcc -print-search-dirs
install:
	bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/
programs: =
	bin/../libexec/gcc/arm-none-linux-gnueabi/4.3.3/
	bin/../libexec/gcc/
	bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/../../../../arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi/4.3.3/
	bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/../../../../arm-none-linux-gnueabi/bin/
libraries: =
	bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/
	bin/../lib/gcc/
	bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/../../../../arm-none-linux-gnueabi/lib/arm-none-linux-gnueabi/4.3.3/
	bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/../../../../arm-none-linux-gnueabi/lib/
	bin/../arm-none-linux-gnueabi/libc/lib/arm-none-linux-gnueabi/4.3.3/
	bin/../arm-none-linux-gnueabi/libc/lib/
	bin/../arm-none-linux-gnueabi/libc/usr/lib/arm-none-linux-gnueabi/4.3.3/
	bin/../arm-none-linux-gnueabi/libc/usr/lib/

$ arm-none-linux-gnueabi-gcc -march=armv4t -print-search-dirs
install: 
	bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/
programs: =
	bin/../libexec/gcc/arm-none-linux-gnueabi/4.3.3/
	bin/../libexec/gcc/
	bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/../../../../arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi/4.3.3/
	bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/../../../../arm-none-linux-gnueabi/bin/
libraries: =
	bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/armv4t/
	bin/../lib/gcc/armv4t/
	bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/../../../../arm-none-linux-gnueabi/lib/arm-none-linux-gnueabi/4.3.3/armv4t/
	bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/../../../../arm-none-linux-gnueabi/lib/armv4t/
	bin/../arm-none-linux-gnueabi/libc/armv4t/lib/arm-none-linux-gnueabi/4.3.3/armv4t/
	bin/../arm-none-linux-gnueabi/libc/armv4t/lib/armv4t/
	bin/../arm-none-linux-gnueabi/libc/armv4t/usr/lib/arm-none-linux-gnueabi/4.3.3/armv4t/
	bin/../arm-none-linux-gnueabi/libc/armv4t/usr/lib/armv4t/
	bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/
	bin/../lib/gcc/
	bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/../../../../arm-none-linux-gnueabi/lib/arm-none-linux-gnueabi/4.3.3/
	bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/../../../../arm-none-linux-gnueabi/lib/
	bin/../arm-none-linux-gnueabi/libc/armv4t/lib/arm-none-linux-gnueabi/4.3.3/
	bin/../arm-none-linux-gnueabi/libc/armv4t/lib/
	bin/../arm-none-linux-gnueabi/libc/armv4t/usr/lib/arm-none-linux-gnueabi/4.3.3/
	bin/../arm-none-linux-gnueabi/libc/armv4t/usr/lib/

I think the ARMv5T (default) libraries are getting copied to the
staging_dir and not the ARMv4T (-march=armv4t) libraries.

Can you think of anyway to fix this?

Regards,
Hartley
