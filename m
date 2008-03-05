From: Erik Andersen <andersen@codepoet.org>
Date: Tue, 4 Mar 2008 20:02:55 -0700
Subject: [Buildroot] To fix the build failure of xlib_liblbxutil,
	xlib_libX11, xlib_libXt
In-Reply-To: <1204611649.4313.7.camel@localhost>
References: <1204611649.4313.7.camel@localhost>
Message-ID: <20080305030255.GA2436@codepoet.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue Mar 04, 2008 at 11:50:49AM +0530, JS wrote:
> I am building for mipsel. And, I had to do the following modifications
> to get x11r7 to build. I have not tested the binaries yet (they are
> still getting built) so dont know whether these are right.
> 
> Please can someone look into these patches and tell me whether I am
> missing something.

Thanks for your work trying to get X11r7 working in buildroot.

This does seem to be an improvement; however, there still seems
to be some problems.  At least for me I am getting "-L/usr/lib"
in the build, which then pulls the wrong libraries..

(cd /home/andersen/SVN/buildroot/build_i586/xlib_libX11-1.1.1/src; /bin/bash ../libtool  --tag=CC --mode=relink /home/andersen/SVN/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc -Os -pipe -I/home/andersen/SVN/buildroot/build_i586/staging_dir/usr/include -I/home/andersen/SVN/buildroot/build_i586/staging_dir/include --sysroot=/home/andersen/SVN/buildroot/build_i586/staging_dir/ -isysroot /home/andersen/SVN/buildroot/build_i586/staging_dir -mtune=i586 -march=i586 -I../include -I../include/X11 -I../include -I../include/X11 -I../src/xcms -I../src/xkb -I../src/xlibi18n -Wall -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wnested-externs -fno-strict-aliasing -D_BSD_SOURCE -DHAS_FCHOWN -DHAS_STICKY_DIR_BIT -I/home/andersen/SVN/buildroot/build_i586/staging_dir/usr/include -I/home/andersen/SVN/buildroot/build_i586/staging_dir/usr/include -I/home/andersen/SVN/buildroot/build_i586/staging_dir/usr/include -I/home/andersen/SVN/buildroot/build_i586/staging_dir/usr/include -D_BSD_SOURCE -DX11_t -DTRANS_CLIENT -g -O2 -version-info 1:0:0 -no-undefined -o libX11-xcb.la -rpath /usr/lib x11_xcb.lo libX11.la -ldl -inst-prefix-dir /home/andersen/SVN/buildroot/project_build_i586/uclibc/root)
/home/andersen/SVN/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc -Os -pipe  -I/home/andersen/SVN/buildroot/build_i586/staging_dir/usr/include -I/home/andersen/SVN/buildroot/build_i586/staging_dir/include --sysroot=/home/andersen/SVN/buildroot/build_i586/staging_dir/ -isysroot /home/andersen/SVN/buildroot/build_i586/staging_dir -mtune=i586 -march=i586 -shared  .libs/x11_xcb.o  -L/home/andersen/SVN/buildroot/project_build_i586/uclibc/root/usr/lib -L/usr/lib -lX11 -L/home/andersen/SVN/buildroot/build_i586/staging_dir/usr/lib -ldl  -mtune=i586 -march=i586 -Wl,-soname -Wl,libX11-xcb.so.1 -o .libs/libX11-xcb.so.1.0.0
/usr/lib/libdl.so: file not recognized: File format not recognized
collect2: ld returned 1 exit status
libtool: install: error: relink `libX11-xcb.la' with the above command before installing it
make[3]: *** [install-libLTLIBRARIES] Error 1
make[3]: Leaving directory `/home/andersen/SVN/buildroot/build_i586/xlib_libX11-1.1.1/src'
make[2]: *** [install-exec-recursive] Error 1
make[2]: Leaving directory `/home/andersen/SVN/buildroot/build_i586/xlib_libX11-1.1.1/src'
make[1]: *** [install-exec-recursive] Error 1
make[1]: Leaving directory `/home/andersen/SVN/buildroot/build_i586/xlib_libX11-1.1.1'
make: *** [/home/andersen/SVN/buildroot/build_i586/xlib_libX11-1.1.1/.stamp_target_installed] Error 2

 -Erik

--
Erik B. Andersen             http://codepoet-consulting.com/
--This message was written using 73% post-consumer electrons--
