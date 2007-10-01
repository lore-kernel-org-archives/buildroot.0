From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Tue, 02 Oct 2007 00:15:00 +0300
Subject: [Buildroot] x11r7 build error
In-Reply-To: <200710011537.03174.rafael@riseup.net>
References: <200710011537.03174.rafael@riseup.net>
Message-ID: <47016354.9000203@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rafael2k ?????:
> I'm triyng to compile x11r7 in a i386 host to a i386 target.
> 
> the following error appears to me:
> 
> (cd /home/rafael2k/programs/gnuden/buildroot/build_i386/libxcb-1.0/src; /bin/sh ../libtool  --tag=CC --mode=relink /home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc -Os -pipe -I/home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/usr/include -I/home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/include --sysroot=/home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/ -isysroot /home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir -mtune=i386 -march=i386 -Wall -pedantic -Wpointer-arith -Wstrict-prototypes -Wmissing-declarations -Wnested-externs -I/home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/usr/include -I/home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/usr/include -g -O2 -version-info 
> 0:0:0 -o libxcb-xvmc.la -rpath /usr/lib xvmc.lo 
> libxcb.la -inst-prefix-dir /home/rafael2k/programs/gnuden/buildroot/project_build_i386/gnudenberg/root)
> /home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc -Os -pipe  -I/home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/usr/include -I/home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/include --sysroot=/home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/ -isysroot /home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir -mtune=i386 -march=i386 -shared  .libs/xvmc.o  -L/home/rafael2k/programs/gnuden/buildroot/project_build_i386/gnudenberg/root/usr/lib -L/usr/lib -lxcb -L/home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/usr/lib  -mtune=i386 -march=i386 -Wl,-soname -Wl,libxcb-xvmc.so.0 -o .libs/libxcb-xvmc.so.0.0.0
> /home/rafael2k/programs/gnuden/buildroot/build_i386/staging_dir/usr/bin/../lib/gcc/i386-linux-uclibc/4.2.1/../../../../i386-linux-uclibc/bin/ld: 
> cannot find /lib/libc.so.0
> collect2: ld returned 1 exit status
> libtool: install: error: relink `libxcb-xvmc.la' with the above command before 
> installing it
> make[2]: *** [install-libLTLIBRARIES] Error 1
> make[2]: Leaving directory 
> `/home/rafael2k/programs/gnuden/buildroot/build_i386/libxcb-1.0/src'
> make[1]: *** [install-exec-recursive] Error 1
> make[1]: Leaving directory 
> `/home/rafael2k/programs/gnuden/buildroot/build_i386/libxcb-1.0'
> make: *** 
> [/home/rafael2k/programs/gnuden/buildroot/build_i386/libxcb-1.0/.stamp_target_installed] 
> Error 2
> 
> 
> anyone has some light to me?
> 
> thx!
> rafael diniz

This is what I get for arm arch: when relinking it looks in wrong location /usr/lib for libc library,
however I do not get error because linker recognizes incompatible format and skips library:

libtool: install: warning: relinking `libxcb-xvmc.la'
(cd /opt/buildroot/build_arm/libxcb-1.0/src; /bin/sh ../libtool  --tag=CC --mode=relink /opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -Os -pipe
-I/opt/buildroot/build_arm/staging_dir/usr/include -I/opt/buildroot/build_arm/staging_dir/include --sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot /opt/buildroot/build_arm/staging_dir
-mtune=arm920t -Wall -pedantic -Wpointer-arith -Wstrict-prototypes -Wmissing-declarations -Wnested-externs -I/opt/buildroot/build_arm/staging_dir/usr/include
-I/opt/buildroot/build_arm/staging_dir/usr/include -g -O2 -version-info 0:0:0 -o libxcb-xvmc.la -rpath /usr/lib xvmc.lo libxcb.la -inst-prefix-dir /opt/buildroot/project_build_arm/uclibc/root)
/opt/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc -Os -pipe  -I/opt/buildroot/build_arm/staging_dir/usr/include -I/opt/buildroot/build_arm/staging_dir/include
--sysroot=/opt/buildroot/build_arm/staging_dir/ -isysroot /opt/buildroot/build_arm/staging_dir -mtune=arm920t -shared  .libs/xvmc.o  -L/opt/buildroot/project_build_arm/uclibc/root/usr/lib -L/usr/lib
-lxcb -L/opt/buildroot/build_arm/staging_dir/usr/lib  -mtune=arm920t -Wl,-soname -Wl,libxcb-xvmc.so.0 -o .libs/libxcb-xvmc.so.0.0.0
/opt/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.1/../../../../arm-linux-uclibc/bin/ld: skipping incompatible /usr/lib/libc.so when searching for -lc
/opt/buildroot/build_arm/staging_dir/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.1/../../../../arm-linux-uclibc/bin/ld: skipping incompatible /usr/lib/libc.a when searching for -lc
/usr/bin/install -c .libs/libxcb-xvmc.so.0.0.0T /opt/buildroot/project_build_arm/uclibc/root/usr/lib/libxcb-xvmc.so.0.0.0
(cd /opt/buildroot/project_build_arm/uclibc/root/usr/lib && { ln -s -f libxcb-xvmc.so.0.0.0 libxcb-xvmc.so.0 || { rm -f libxcb-xvmc.so.0 && ln -s libxcb-xvmc.so.0.0.0 libxcb-xvmc.so.0; }; })
(cd /opt/buildroot/project_build_arm/uclibc/root/usr/lib && { ln -s -f libxcb-xvmc.so.0.0.0 libxcb-xvmc.so || { rm -f libxcb-xvmc.so && ln -s libxcb-xvmc.so.0.0.0 libxcb-xvmc.so; }; })
/usr/bin/install -c .libs/libxcb-xvmc.lai /opt/buildroot/project_build_arm/uclibc/root/usr/lib/libxcb-xvmc.la
/usr/bin/install -c .libs/libxcb-xvmc.a /opt/buildroot/project_build_arm/uclibc/root/usr/lib/libxcb-xvmc.a


Best regards,
Ivan

--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
