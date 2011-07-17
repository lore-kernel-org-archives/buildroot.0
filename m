From: David J. Fiddes <D.J@fiddes.net>
Date: Sun, 17 Jul 2011 11:55:29 +0100
Subject: [Buildroot] ARM OABI build broken with current buildroot tip
Message-ID: <4E22BFA1.7080800@fiddes.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to build an up to date ARM OABI toolchain with uClibc 0.9.32. 
The build fails with a missing stack unwind symobl.

The toolchain I'm trying to configure is pretty straight forward. From a 
"make distclean" I configure:
  - ARM processor
  - OABI
  - Disable busybox and filesystem image generation

Switching uClibc to 0.9.31 allows the build to succeed.

I'm using buildroot: bef98b7c10a9969bc3f8b977dd9e0bdafba684a3

The build error is:

/usr/bin/make -j1 -C 
/home/dave/source/cvs-versions/buildroot/output/toolchain/uClibc-0.9.32 \
	ARCH="arm" \
	PREFIX=/home/dave/source/cvs-versions/buildroot/output/host/usr/arm-unknown-linux-uclibc/sysroot \
	DEVEL_PREFIX=/usr/ \
	RUNTIME_PREFIX=/ \
	install_runtime install_dev
make[1]: Entering directory 
`/home/dave/source/cvs-versions/buildroot/output/toolchain/uClibc-0.9.32'
   LD libuClibc-0.9.32.so
libc/libc_so.a(close.oS):(.ARM.exidx+0x0): undefined reference to 
`__aeabi_unwind_cpp_pr0'
collect2: ld returned 1 exit status
make[1]: *** [lib/libc.so] Error 1
make[1]: Leaving directory 
`/home/dave/source/cvs-versions/buildroot/output/toolchain/uClibc-0.9.32'
make: *** 
[/home/dave/source/cvs-versions/buildroot/output/host/usr/arm-unknown-linux-uclibc/sysroot/usr/lib/libc.a] 
Error 2

It seems like this is a uClibc bug but I'm not sure how best to separate 
the toolchain build form the uClibc build.

Dave
