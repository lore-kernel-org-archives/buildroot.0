From: Eric P Caillibot <epc@xiphos.ca>
Date: Tue, 20 Mar 2007 13:57:33 -0400
Subject: [Buildroot] Problem involving libc/libc_so.a(pread_write.os)
Message-ID: <1174413454.32392.4.camel@tintin>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am trying to set up Buildroot on a host running ubuntu, my target
being a powerpc 405, running version 2.4.26 of the Linux kernel.

This is what I did, after checking Buildroot out of SVN:

$ make menuconfig

-> In the menu, I changed GCC compiler version to 4.1.2 (although in a
previous attempt I left the default choice in place and ended up with
the same result)
-> Changed Target Architecture to powerpc
-> Kernel Headers left at Linux 2.4.31 (since 2.4.26 is not in the
list) 

$ make

When prompted, I chose:

Target Processor Type
> 1. CLASSIC (CONFIG_CLASSIC) (NEW)

...

  STRIP -x -R .note -R .comment lib/libc.a
  AR cr lib/libc.a
  STRIP -x -R .note -R .comment lib/uclibc_nonshared.a
  AR cr lib/uclibc_nonshared.a
  AR cr libc/libc_so.a
  LD libuClibc-0.9.29.so
libc/libc_so.a(pread_write.os):(.text+0x14): undefined reference to
`__illegally_sized_syscall_arg4'
make[2]: *** [lib/libc.so] Error 1
make[1]: *** [lib/libc.so.0] Error 2
make[1]: Leaving directory
`/home/epc/dev/buildroot/toolchain_build_powerpc/uClibc'
make: ***
[/home/epc/dev/buildroot/toolchain_build_powerpc/uClibc/lib/libc.a]
Error 2


After this point, I tried changing different settings, but ultimately,
subsequent attempts always got me the same error.

$ make clean
$ make

...

make MAKE="make -j1"
-C /home/epc/dev/buildroot/toolchain_build_powerpc/uClibc \
                PREFIX= \

DEVEL_PREFIX=/home/epc/dev/buildroot/build_powerpc/staging_dir/ \

RUNTIME_PREFIX=/home/epc/dev/buildroot/build_powerpc/staging_dir/ \
                install_runtime install_dev
make[1]: Entering directory
`/home/epc/dev/buildroot/toolchain_build_powerpc/uClibc'
install -d /home/epc/dev/buildroot/build_powerpc/staging_dir/lib
install -m 644 lib/lib*-0.9.29.so \
                /home/epc/dev/buildroot/build_powerpc/staging_dir/lib
install: cannot stat `lib/lib*-0.9.29.so': No such file or directory
make[1]: *** [install_runtime] Error 1
make[1]: Leaving directory
`/home/epc/dev/buildroot/toolchain_build_powerpc/uClibc'
make: *** [/home/epc/dev/buildroot/build_powerpc/staging_dir/lib/libc.a]
Error 2


Can anyone help me figure out what is going wrong?

Thank you very much!

Eric
