From: Jonathan Haws <Jonathan.Haws@sdl.usu.edu>
Date: Mon, 16 May 2011 19:43:53 +0000
Subject: [Buildroot] Building x86_64 Toolchain
In-Reply-To: <5ABE8A5E96C0364CAF2B4DC1DEB7CEAC490DDEBC@Mercury.usurf.usu.edu>
References: <5ABE8A5E96C0364CAF2B4DC1DEB7CEAC490DDEBC@Mercury.usurf.usu.edu>
Message-ID: <5ABE8A5E96C0364CAF2B4DC1DEB7CEAC490DDEFA@Mercury.usurf.usu.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am having some issues building the initial toolchain for an x86_64 target.  It gets to a point when it is building GCC and I get a segmentation fault.  The error is pasted below.

I tried this with all versions of GCC available, the stable release of Buildroot, as well as the latest snapshot of Buildroot.  I get the exact same errors regardless of which GCC or version of Buildroot.  However, I get two different errors based on the version of linuxthreads I include.

I am not sure what to make of either one.  Can anyone point me in the right direction?  My host system is running Fedora 12, 2.6.32.26, GCC 4.4.4, BinUtils 2.19.

Thanks!

Jonathan


LINUXTHREADS (STABLE/OLD)
libpthread/linuxthreads.old/spinlock.c:70:7: warning: variable 'spin_count' set but not used [-Wunused-but-set-variable]
  CC libpthread/linuxthreads.old/wrapsyscall.os
  CC libpthread/linuxthreads.old/pthread.oS
  AR cr libpthread/linuxthreads.old/libpthread_so.a
  STRIP -x -R .note -R .comment libpthread/linuxthreads.old/libpthread_so.a
  LD libpthread-0.9.31.so
  CC librt/mq_close.os
  CC librt/mq_getsetattr.os
  CC librt/mq_notify.os
  CC librt/mq_open.os
  CC librt/mq_receive.os
  CC librt/mq_send.os
  CC librt/mq_unlink.os
  CC librt/shm.os
  CC librt/timer_create.os
  CC librt/timer_delete.os
  CC librt/timer_getoverr.os
  CC librt/timer_gettime.os
  CC librt/timer_settime.os
  AR cr lib/librt.a
  STRIP -x -R .note -R .comment lib/librt.a
  LD librt-0.9.31.so
  CC ldso/libdl/libdl.os
In file included from ldso/libdl/libdl.c:122:0:
./ldso/ldso/x86_64/elfinterp.c: In function '_dl_do_lazy_reloc':
./ldso/ldso/x86_64/elfinterp.c:263:6: warning: variable 'symtab_index' set but not used [-Wunused-but-set-variable]
  AS ldso/ldso/x86_64/resolve.os
  AR cr lib/libdl.a
  STRIP -x -R .note -R .comment lib/libdl.a
  CC libpthread/linuxthreads.old/pthread.os
  AR cr lib/libpthread.a
  STRIP -x -R .note -R .comment lib/libpthread.a
make[1]: Leaving directory `/opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/uClibc-0.9.31'
touch -c /home/jhaws/opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/uClibc-0.9.31/lib/libc.a
/usr/bin/make -j1 -C /home/jhaws/opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/uClibc-0.9.31 \
                ARCH="x86_64" \
                PREFIX=/home/jhaws/opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/sysroot \
                DEVEL_PREFIX=/usr/ \
                RUNTIME_PREFIX=/ \
                install_runtime install_dev
make[1]: Entering directory `/opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/uClibc-0.9.31'
install -m 755 ./lib/lib*-0.9.31.so \
                /home/jhaws/opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/sysroot/lib/
(cd ./lib && tar -cf - *.so.*) | tar -xf - -C /home/jhaws/opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/sysroot/lib/
tar: libpthread.so.0: no version information available (required by /lib64/librt.so.1)
tar: libpthread.so.0: no version information available (required by /lib64/librt.so.1)
/bin/sh: line 1: 17753 Segmentation fault      (core dumped) tar -cf - *.so.*
tar: This does not look like a tar archive
tar: Exiting with failure status due to previous errors
make[1]: *** [install_runtime] Error 2
make[1]: Leaving directory `/opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/toolchain/uClibc-0.9.31'
make: *** [/home/jhaws/opt/svn/duster/EmbeddedLinux/buildroot/buildroot/output/host/usr/x86_64-unknown-linux-uclibc/sysroot/usr/lib/libc.a] Error 2


LINUXTHREADS (NEW)
  STRIP -x -R .note -R .comment lib/libutil.a
  LD libutil-0.9.31.so
  CC libpthread/linuxthreads/sysdeps/x86_64/pspinlock.oS
  CC libpthread/linuxthreads/sysdeps/unix/sysv/linux/fork.oS
  CC libpthread/linuxthreads/sysdeps/unix/sysv/linux/pt-sigsuspend.oS
  CC libpthread/linuxthreads/sysdeps/unix/sysv/linux/register-atfork.oS
  CC libpthread/linuxthreads/sysdeps/unix/sysv/linux/unregister-atfork.oS
  CC libpthread/linuxthreads/sysdeps/pthread/errno-loc.oS
In file included from libpthread/linuxthreads/sysdeps/pthread/errno-loc.c:23:0:
./libpthread/linuxthreads/sysdeps/unix/sysv/linux/x86_64/sysdep-cancel.h:20:20: fatal error: sysdep.h: No such file or directory
compilation terminated.
make[1]: *** [libpthread/linuxthreads/sysdeps/pthread/errno-loc.oS] Error 1
make[1]: Leaving directory `/opt/svn/duster/EmbeddedLinux/buildroot/buildroot-2011.02/output/toolchain/uClibc-0.9.31'
make: *** [/home/jhaws/opt/svn/duster/EmbeddedLinux/buildroot/buildroot-2011.02/output/toolchain/uClibc-0.9.31/lib/libc.a] Error 2





--
Jonathan R. Haws
jhaws at sdl.usu.edu
