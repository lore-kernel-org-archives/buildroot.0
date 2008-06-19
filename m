From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Thu, 19 Jun 2008 13:54:20 +0200
Subject: [Buildroot] GIT or SVN
In-Reply-To: <20080619111343.GC6874@mx.loc>
References: <485A3396.80701@cetrtapot.si> <485A3ABF.90707@cetrtapot.si>
	<20080619111343.GC6874@mx.loc>
Message-ID: <485A48EC.7040704@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> On Thu, Jun 19, 2008 at 12:53:51PM +0200, Hinko Kocevar wrote:
>> Hinko Kocevar wrote:
>>> Hello,
>>>
>>> I'm new to the uclibc buildroot. I've noticed that there are two repositories: GIT and SVN. GIT looks more up2date. Is GIT the tree to use?
>>>
>>> Also, I'm trying to create a uclibc toolchain for cris architecture. 
> 
> Thanks for noticing my typo and correcting the URL. Applied.
> 
> I didn't try to build cris. Please use 4.3.1 and disable libgomp:
> $ grep gomp .config
> BR2_EXTRA_GCC_CONFIG_OPTIONS="--disable-libgomp --disable-libssp"
> BR2_EXTRA_TARGET_GCC_CONFIG_OPTIONS="--disable-libgomp --disable-libssp"
> 
> I'm trying to build such a cris compiler now and will let you know how
> it goes.

I've tried it too. It passes the gcc-final compilation with 'BR2_EXTRA_GCC_CONFIG_OPTIONS="--disable-libgomp", but I have to disable shared library support and threads to make gcc-final compile. Otherwise uCLibc fails with:
...
  CC libc/unistd/usershell.os
  CC libc/unistd/usleep.os
  CC libpthread/linuxthreads.old/forward.oS
  CC libpthread/linuxthreads.old/libc_pthread_init.oS
  CC libc/misc/internals/__uClibc_main.oS
  CC libpthread/linuxthreads.old/libc_pthread_init.os
  CC libc/misc/internals/__uClibc_main.os
  CC libc/stdlib/atexit.os
  AS lib/crt1.o
  AS lib/Scrt1.o
  AS lib/crti.o
  AS lib/crtn.o
  STRIP -x -R .note -R .comment lib/libc.a
  AR cr lib/libc.a
  STRIP -x -R .note -R .comment lib/uclibc_nonshared.a
  AR cr lib/uclibc_nonshared.a
  AR cr libc/libc_so.a
  LD libuClibc-0.9.29.so
libc/libc_so.a(libc_pthread_init.oS): In function `testandset':
libc_pthread_init.c:(.text+0x0): multiple definition of `testandset'
libc/libc_so.a(forward.oS):forward.c:(.text+0x0): first defined here
make[2]: *** [lib/libc.so] Error 1
make[1]: *** [lib/libc.so.0] Error 2
make[1]: Leaving directory `/work/stage/buildroot/toolchain_build_cris/uClibc-0.9.29'
make: *** [/work/stage/buildroot/toolchain_build_cris/uClibc-0.9.29/lib/libc.a] Error 2



Also inspecting the uClibc make parameters UCLIBC_EXTRA_LDFLAGS and UCLIBC_EXTRA_CFLAGS - where are they used?

/usr/bin/make -j1 -C /work/stage/buildroot/toolchain_build_cris/uClibc-0.9.29 \
		PREFIX= \
		DEVEL_PREFIX=/ \
		RUNTIME_PREFIX=/ \
		HOSTCC="/usr/bin/gcc" \
		BUILD_CFLAGS="" \
		BUILD_LDFLAGS="" \
		UCLIBC_EXTRA_LDFLAGS=" --sysroot=/work/stage/buildroot/build_cris/staging_dir/ -L/work/stage/buildroot/build_cris/staging_dir/lib -L/work/stage/buildroot/build_cris/staging_dir/usr/lib" \
		UCLIBC_EXTRA_CFLAGS=" --sysroot=/work/stage/buildroot/build_cris/staging_dir/ -isysroot /work/stage/buildroot/build_cris/staging_dir -I=/usr/include -Os -pipe  -I/work/stage/buildroot/build_cris/staging_dir/usr/include " \
		all


And UCLIBC_EXTRA_CFLAGS has '-I=/usr/include' that seems a bit odd...

Regards,
Hinko

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
