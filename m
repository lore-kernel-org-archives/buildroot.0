From: Ching Hsin Lee <fresh1130@gmail.com>
Date: Mon, 11 Aug 2008 18:54:43 +0800
Subject: [Buildroot] Problem about "duplicate directive .personality" when
	compiling "eh_alloc.cc"?
Message-ID: <328c0adc0808110354r1a29db58ibe62a37fe116b59d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to build a uclibc arm cross-compiler using buildroot.

When I use the buildroot to build the file "eh_alloc.cc" in libsupc++.
The following messages appear.

/tmp/ccLFySfs.s: Assembler messages:
/tmp/ccLFySfs.s:416: Error: duplicate .personality directive
/tmp/ccLFySfs.s:572: Error: duplicate .personality directive
/tmp/ccLFySfs.s:573: Error: dupicate .handlerdata directive
/tmp/ccLFySfs.s:931: Error: duplicate .personality directive
/tmp/ccLFySfs.s:932: Error: dupicate .handlerdata directive
make[5]: *** [eh_alloc.lo] Error 1

I do a little experiment on the file and find out the following lines cause
this problem.
...
#108: __gnu_cxx::__scoped_lock sentry(emergency_mutex);
...
#128: std::terminate ();
...
#154: __gnu_cxx::__scoped_lock sentry(emergency_mutex);
...

I have tried GCC 3.4.6, GCC.4.2.4., and GCC 4,3,1.
The results are the same.

The build machine I used is linux.
GCC : 4.1.3
Binutils : 2.18

I configure the GCC using the following configuration.
/home/fresh/buildroot/toolchain_build_arm/gcc-4.3.1/configure --prefix=/usr
--build=i386-pc-linux-gnu --ho    st=i386-pc-linux-gnu
--target=arm-linux-uclibcgnueabi --enable-languages=c,c++
--with-sysroot=/usr/local/stagi    ng_dir
--with-build-time-tools=/usr/local/staging_dir/usr/arm-linux-uclibcgnueabi/bin
--disable-__cxa_atexit -    -enable-target-optspace --with-gnu-ld
--enable-shared --with-gmp=/home/fresh/buildroot/toolchain_build_arm/gmp
--with-mpfr=/home/fresh/buildroot/toolchain_build_arm/mpfr --disable-nls
--enable-threads --disable-multilib     --disable-decimal-float
--with-tune=arm9tdmi --enable-sjlj-exceptions --disable-largefile

If I turn off the "C++" language. I can correctly build this toolchain.
I really want to solve this problem. I have checked the mailing list.
There are similar problems in the mailing list but without solution.
If there is anything I can do to better this problem, please advice me to do
it.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080811/262d7b26/attachment.htm 
