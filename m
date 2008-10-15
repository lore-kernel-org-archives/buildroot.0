From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Oct 2008 10:50:44 +0200
Subject: [Buildroot] The issue is link_all_deplibs libtool config
 variable
In-Reply-To: <20081009114343.2eabb7e6@surf>
References: <20081007165610.4de3f377@surf>
	<20081009114343.2eabb7e6@surf>
Message-ID: <20081015105044.040b8915@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

[ Not sure it's worth posting to this list about Buildroot problems
  since no-one cares, but anyway... ]

Le Thu, 9 Oct 2008 11:43:43 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> It seems that the problem is caused by libtool configuration variable
> "link_all_deplibs" being set to "no".
> 
> This problem has been reported here:
> http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=297726. It seems that
> setting link_all_deplibs to yes works for native compilation, but not
> from cross-compilation. The patch seems be to be Debian-specific, and
> I'm an Ubuntu user, so I inherited this patch.
> 
> As a quick and gory hack, I modified the configure to replace all
> instances of link_all_deplibs=no by link_all_deplibs=yes. And the
> compilation now works properly.

This workaround works but is not nice, because the binary ends up being
linked with *all* libraries, and not only the ones on which the binary
directly depends. This is sad because the Linux dynamic library loader
is able at runtime to compute the indirect dependencies. And not being
linked with *all* the dependent libraries has the nice effect that you
don't need to relink all your applications when you change a library.

So, back to the problem. The following libtool command line:

/bin/bash ../libtool --tag=CC --mode=link /usr/local/uclibc-0.9.29/arm/usr//bin/arm-linux-gcc -Os  -I/home/thomas/local/buildroot/build_arm/staging_dir/include -I/home/thomas/local/buildroot/build_arm/staging_dir/usr/include -I/usr/local/uclibc-0.9.29/arm/usr//arm-linux/include  -g -O2  -L/home/thomas/local/buildroot/build_arm/staging_dir/lib -L/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib -o fc-cache  fc-cache.o ../src/libfontconfig.la 
mkdir .libs

generates the following command line:

/usr/local/uclibc-0.9.29/arm/usr//bin/arm-linux-gcc -Os -I/home/thomas/local/buildroot/build_arm/staging_dir/include -I/home/thomas/local/buildroot/build_arm/staging_dir/usr/include -I/usr/local/uclibc-0.9.29/arm/usr//arm-linux/include -g -O2 -o fc-cache fc-cache.o -L/home/thomas/local/buildroot/build_arm/staging_dir/lib -L/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib ../src/.libs/libfontconfig.so -Wl,--rpath -Wl,/home/thomas/local/buildroot/build_arm/fontconfig-2.6.0/src/.libs

This command line properly includes a -Wl,--rpath option to the place
where the fontconfig library is present (since it hasn't already been
installed), but misses a -Wl,--rpath to the usr/lib directory in the
staging dir. Manually linking with the same command line, to which
"-Wl,--rpath
-Wl,/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib" works
properly. And the resulting binary only depends on libc and
libfontconfig, not on the libraries required by libfontconfig (which
will be loaded automatically by the Linux library loader) :

$ arm-linux-readelf -a fc-cache
[...]
 0x00000001 (NEEDED)                     Shared library: [libfontconfig.so.1]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]
 0x0000000f (RPATH)                      Library rpath: [/home/thomas/local/buildroot/build_arm/fontconfig-2.6.0/src/.libs:/home/thomas/local/buildroot/build_arm/staging_dir/usr/lib/]
[...]

However, the rpath (in which the dynamic linker will try at runtime to
find the libraries) has been written in the binary. Which is just
plain stupid because this rpath will be completely meaningless on the target
system. No rpath is needed since on the target system, the libraries
are installed in the standard directories (/lib, /usr/lib), and the
dynamic linker knows about these standard paths.

The solution is to use -Wl,--rpath-link instead of -Wl,--rpath.

So, I have a manual workaround, but I don't know how to fix it properly ?

Any clue ?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
