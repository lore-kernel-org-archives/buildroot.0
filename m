From: mws <mike.w.shapiro+buildroot@gmail.com>
Date: Tue, 6 Nov 2018 14:35:20 -0600 (CST)
Subject: [Buildroot] glibc link fails on x86_64 with fPIC error
In-Reply-To: <CANQCQpZsw2w=ok==PzbUk=eC3P=vbtjX25xe22vDtoBg83XWog@mail.gmail.com>
References: <1541520575003-0.post@n4.nabble.com>
 <CANQCQpZ1j-Nfh+z0qSkshZqrZrLi4pcgYhEJfrOJrOcfDyXm-A@mail.gmail.com>
 <CANQCQpZsw2w=ok==PzbUk=eC3P=vbtjX25xe22vDtoBg83XWog@mail.gmail.com>
Message-ID: <1541536520382-0.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Matt and also Roman. In meantime I discovered something interesting:
with libc=musl the build succeeds, but with libc=uClibc-ng it fails in a way
similar to glibc, which I think exonerates glibc.  Here is the ucLibC
failure with the similar linking error:

$ tail -20 tools.log
 AR cr libc/libc_so.a
 STRIP -x -R .note -R .comment libc/libc_so.a
 CC libpthread/nptl/pthread_atfork.oS
 AR cr lib/libpthread_nonshared.a
 STRIP -x -R .note -R .comment lib/libpthread_nonshared.a
 LD libuClibc-1.0.30.so
./lib/ld64-uClibc.so.1: warning: multiple common of
`_dl_internal_error_number'
libc/libc_so.a(libdl.oS): warning: previous common is here
./lib/ld64-uClibc.so.1: warning: multiple common of `_dl_error_number'
libc/libc_so.a(libdl.oS): warning: previous common is here
./lib/ld64-uClibc.so.1: warning: multiple common of `_dl_free_function'
libc/libc_so.a(libdl.oS): warning: previous common is here
./lib/ld64-uClibc.so.1: warning: multiple common of `_dl_malloc_function'
libc/libc_so.a(libdl.oS): warning: previous common is here
/home/build/src/docker/buildroot/host/lib/gcc/x86_64-buildroot-linux-uclibc/7.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld:
libc/libc_so.a(libc-cancellation.oS): relocation R_X86_64_PC32 against
symbol `__pthread_unwind' can not be used when making a shared object;
recompile with -fPIC
/home/build/src/docker/buildroot/host/lib/gcc/x86_64-buildroot-linux-uclibc/7.3.0/../../../../x86_64-buildroot-linux-uclibc/bin/ld:
final link failed: Bad value
collect2: error: ld returned 1 exit status
make[2]: *** [lib/libc.so] Error 1
make[1]: ***
[/home/build/src/docker/buildroot/build/uclibc-1.0.30/.stamp_built] Error 2
make: *** [_all] Error 2

So my hypothesis is that something about my build system environment is
causing a misconfiguration of the toolchain with respect to gcc's defaults. 
I am thinking maybe the pic/PIC default or the mcmodel default is somehow
different from what glibc or uClibc-ng Makefiles expect it to be, and they
are not setting those options to be explicitly the way they should be in
their respective Makefiles.

So I need to figure out what part of the toolchain build is looking at the
system itself to determine defaults in this area, or alternatively find the
specific gcc setting and change its default manually in buildroot's config.




--
Sent from: http://buildroot-busybox.2317881.n4.nabble.com/
