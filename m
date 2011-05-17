From: Jonathan Haws <Jonathan.Haws@sdl.usu.edu>
Date: Tue, 17 May 2011 15:01:30 +0000
Subject: [Buildroot] Building x86_64 Toolchain
In-Reply-To: <20110517085847.46aa97fc@surf>
References: <5ABE8A5E96C0364CAF2B4DC1DEB7CEAC490DDEBC@Mercury.usurf.usu.edu>
	<5ABE8A5E96C0364CAF2B4DC1DEB7CEAC490DDEFA@Mercury.usurf.usu.edu>
	<20110517085847.46aa97fc@surf>
Message-ID: <5ABE8A5E96C0364CAF2B4DC1DEB7CEAC490DE492@Mercury.usurf.usu.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> (cd ./lib && tar -cf - *.so.*) | tar -xf - -C /home/jhaws/opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/sysroot/lib/
>> tar: libpthread.so.0: no version information available (required by /lib64/librt.so.1)
>> tar: libpthread.so.0: no version information available (required by /lib64/librt.so.1)
>> /bin/sh: line 1: 17753 Segmentation fault      (core dumped) tar -cf - *.so.*
>> tar: This does not look like a tar archive
>> tar: Exiting with failure status due to previous errors
>
>It seems like "tar" is segfaulting here, so it seems to be a problem
>with the tar program of your distribution. Can you check the core dump
>to see to which program it comes from ? 
>
>Can you share your Buildroot .config so that I can try to reproduce the
>problem on a different distribution?
>
>> In file included from libpthread/linuxthreads/sysdeps/pthread/errno-loc.c:23:0:
>> ./libpthread/linuxthreads/sysdeps/unix/sysv/linux/x86_64/sysdep-cancel.h:20:20: fatal error: sysdep.h: No such file or directory
>> compilation terminated.
>
>I am not sure if LinuxThreads new is supposed to compile or not.

Turns out I am now getting new errors.  I upgraded buildroot to the latest snapshot and reworked my config file (which I have attached).  The main change is I went to uClibc 0.9.32-rc3 from 0.9.31.  The errors I am getting now are as follows:

... ... ...
# Now that we have built all the objects, we need to copy
# them back to the GCC directory.  Too many things (other
# in-tree libraries, and DejaGNU) know about the layout
# of the build tree, for now.
/usr/bin/make install-leaf DESTDIR=../.././gcc \
          slibdir= libsubdir= MULTIOSDIR=.
make[4]: Entering directory `/opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/gcc-4.4.6-final/x86_64-unknown-linux-uclibc/libgcc'
/bin/sh /home/jhaws/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/gcc-4.4.6/libgcc/../mkinstalldirs ../.././gcc
/usr/bin/install -c -m 644 libgcc_eh.a ../.././gcc/
chmod 644 ../.././gcc/libgcc_eh.a
/home/jhaws/svn/duster/EmbeddedLinux/buildroot/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/bin/ranlib ../.././gcc/libgcc_eh.a
/bin/sh /home/jhaws/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/gcc-4.4.6/libgcc/../mkinstalldirs ../.././gcc; /usr/bin/install -c -m 644 ./libgcc_s.so.1 ../.././gcc/libgcc_s.so.1; rm -f ../.././gcc/libgcc_s.so; ln -s libgcc_s.so.1 ../.././gcc/libgcc_s.so
/bin/sh /home/jhaws/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/gcc-4.4.6/libgcc/../mkinstalldirs ../.././gcc
/usr/bin/install -c -m 644 libgcc.a ../.././gcc/
chmod 644 ../.././gcc/libgcc.a
/home/jhaws/svn/duster/EmbeddedLinux/buildroot/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/bin/ranlib ../.././gcc/libgcc.a
/usr/bin/install -c -m 644 libgcov.a ../.././gcc/
chmod 644 ../.././gcc/libgcov.a
/home/jhaws/svn/duster/EmbeddedLinux/buildroot/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/bin/ranlib ../.././gcc/libgcov.a
parts="crtbegin.o crtbeginS.o crtbeginT.o crtend.o crtendS.o crtprec32.o crtprec64.o crtprec80.o crtfastmath.o";            \
        for file in $parts; do                                  \
          rm -f ../.././gcc/$file;              \
          /usr/bin/install -c -m 644 $file ../.././gcc/;        \
        done
make[4]: Leaving directory `/opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/gcc-4.4.6-final/x86_64-unknown-linux-uclibc/libgcc'
make[3]: Leaving directory `/opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/gcc-4.4.6-final/x86_64-unknown-linux-uclibc/libgcc'
Checking multilib configuration for libstdc++-v3...
Checking multilib configuration for libiberty...
mkdir -p -- x86_64-unknown-linux-uclibc/libstdc++-v3
mkdir -p -- x86_64-unknown-linux-uclibc/libiberty
Configuring in x86_64-unknown-linux-uclibc/libiberty
Configuring in x86_64-unknown-linux-uclibc/libstdc++-v3
configure: creating cache ./config.cache
configure: creating cache ./config.cache
checking whether to enable maintainer-specific portions of Makefiles... no
checking for makeinfo... makeinfo --split-size=5000000
checking for perl... perl
checking build system type... checking build system type... x86_64-unknown-linux-gnu
x86_64-unknown-linux-gnu
checking host system type... checking host system type... x86_64-unknown-linux-uclibc
x86_64-unknown-linux-uclibc
checking for x86_64-unknown-linux-uclibc-ar... /home/jhaws/svn/duster/EmbeddedLinux/buildroot/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/bin/ar
checking for x86_64-unknown-linux-uclibc-ranlib... /home/jhaws/svn/duster/EmbeddedLinux/buildroot/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/bin/ranlib
checking for x86_64-unknown-linux-uclibc-gcc... /opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/gcc-4.4.6-final/./gcc/xgcc -B/opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/gcc-4.4.6-final/./gcc/ -B/home/jhaws/svn/duster/EmbeddedLinux/buildroot/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/bin/ -B/home/jhaws/svn/duster/EmbeddedLinux/buildroot/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/lib/ -isystem /home/jhaws/svn/duster/EmbeddedLinux/buildroot/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/include -isystem /home/jhaws/svn/duster/EmbeddedLinux/buildroot/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/sys-include
checking target system type... x86_64-unknown-linux-uclibc
checking for suffix of object files... checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... configure: error: in `/opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/gcc-4.4.6-final/x86_64-unknown-linux-uclibc/libiberty':
configure: error: cannot compute suffix of object files: cannot compile
See `config.log' for more details.
make[2]: *** [configure-target-libiberty] Error 1
make[2]: *** Waiting for unfinished jobs....
yes
checking for gawk... gawk
checking whether /usr/bin/make sets $(MAKE)... yes
checking for x86_64-unknown-linux-uclibc-strip... /home/jhaws/svn/duster/EmbeddedLinux/buildroot/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/bin/strip
checking how to run the C preprocessor... /lib/cpp
checking for egrep... grep -E
checking for x86_64-unknown-linux-uclibc-gcc... /opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/gcc-4.4.6-final/./gcc/xgcc -B/opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/gcc-4.4.6-final/./gcc/ -B/home/jhaws/svn/duster/EmbeddedLinux/buildroot/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/bin/ -B/home/jhaws/svn/duster/EmbeddedLinux/buildroot/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/lib/ -isystem /home/jhaws/svn/duster/EmbeddedLinux/buildroot/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/include -isystem /home/jhaws/svn/duster/EmbeddedLinux/buildroot/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/sys-include
checking for suffix of object files... configure: error: in `/opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/gcc-4.4.6-final/x86_64-unknown-linux-uclibc/libstdc++-v3':
configure: error: cannot compute suffix of object files: cannot compile
See `config.log' for more details.
make[2]: *** [configure-target-libstdc++-v3] Error 1
make[2]: Leaving directory `/opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/gcc-4.4.6-final'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/gcc-4.4.6-final'
make: *** [/home/jhaws/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/gcc-4.4.6-final/.compiled] Error 2


Any thoughts?

Thanks!

Jonathan
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-config
Type: application/octet-stream
Size: 18163 bytes
Desc: buildroot-config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110517/894dce80/attachment-0001.obj>
