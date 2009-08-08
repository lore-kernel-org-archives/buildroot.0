From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Aug 2009 00:59:22 +0200
Subject: [Buildroot] [PATCH] Re: buildroot-libtool.patch failed with
 dbus 1.3.0
In-Reply-To: <4A7DFDF4.3020103@eclis.ch>
References: <4A7C85F0.7070604@eclis.ch> <20090807221717.53039a10@surf>
	<4A7C9F65.4060104@eclis.ch> <20090808004346.443b9e49@surf>
	<4A7CB3CC.8040401@eclis.ch> <20090808200911.4e986c77@surf>
	<4A7DFDF4.3020103@eclis.ch>
Message-ID: <20090809005922.7e58e0bf@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 09 Aug 2009 00:36:36 +0200,
Jean-Christian de Rivaz <jc@eclis.ch> a ?crit :

> Sorry for the broken patch and tanks for accepting it. I have to learn
> the git mail command some day...

It's quite easy to use actually, once you have the patch generated.

> That's strange since I use dbus-glib on a ARM target for about 20
> applications with the dbus-1.3.0 without that problem. I usually get
> the wrong format message when I have not do a make clean before
> switching to an other architecture. Can you post more lines before
> the error so I can compare with my own build ?

Here it is. It's the classical problem, you call libtool --mode=link
with some libraries (here -lgobject-2.0), and libtool replaces -lglib2.0
by an incorrect absolute path, here /usr/lib/libgobject-2.0.so. The log:

/bin/bash ../libtool --tag=CC   --mode=link /usr/local/xtools/arm-unknown-linux-uclibcgnueabi-gcc-4.3.4/bin/arm-linux-gcc -Os -pipe -Os  --sysroot /home/thomas/local/buildroot-test/build_arm/staging_dir/  -Os -pipe -Os  --sysroot /home/thomas/local/buildroot-test/build_arm/staging_dir/ -Wall -Wchar-subscripts -Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wpointer-arith -Wcast-align -Wfloat-equal -Wsign-compare -export-symbols-regex "^[^_].*" -version-info 3:0:1 -no-undefined --sysroot /home/thomas/local/buildroot-test/build_arm/staging_dir/ -o libdbus-glib-1.la -rpath /usr/lib dbus-glib.lo dbus-gmain.lo dbus-gmarshal.lo dbus-gobject.lo dbus-gproxy.lo dbus-gtest.lo dbus-gvalue.lo dbus-gthread.lo dbus-gtype-specialized.lo dbus-gutils.lo dbus-gsignature.lo dbus-gvalue-utils.lo -ldbus-1 -lpthread   -lgobject-2.0 -lglib-2.0 -lintl   
generating symbol list for `libdbus-glib-1.la'
/usr/local/xtools/arm-unknown-linux-uclibcgnueabi-gcc-4.3.4/bin/arm-linux-nm  .libs/dbus-glib.o .libs/dbus-gmain.o .libs/dbus-gmarshal.o .libs/dbus-gobject.o .libs/dbus-gproxy.o .libs/dbus-gtest.o .libs/dbus-gvalue.o .libs/dbus-gthread.o .libs/dbus-gtype-specialized.o .libs/dbus-gutils.o .libs/dbus-gsignature.o .libs/dbus-gvalue-utils.o  | sed -n -e 's/^.*[ 	]\([ABCDGIRSTW][ABCDGIRSTW]*\)[ 	][ 	]*\([_A-Za-z][_A-Za-z0-9]*\)$/\1 \2 \2/p' | /home/thomas/local/buildroot-test/toolchain_build_arm/bin/sed 's/.* //' | sort | uniq > .libs/libdbus-glib-1.exp
/bin/grep -E -e "^[^_].*" ".libs/libdbus-glib-1.exp" > ".libs/libdbus-glib-1.expT"
mv -f ".libs/libdbus-glib-1.expT" ".libs/libdbus-glib-1.exp"
echo "{ global:" > .libs/libdbus-glib-1.ver
 cat .libs/libdbus-glib-1.exp | sed -e "s/\(.*\)/\1;/" >> .libs/libdbus-glib-1.ver
 echo "local: *; };" >> .libs/libdbus-glib-1.ver
 /usr/local/xtools/arm-unknown-linux-uclibcgnueabi-gcc-4.3.4/bin/arm-linux-gcc -Os -pipe -Os  --sysroot /home/thomas/local/buildroot-test/build_arm/staging_dir/ -shared  .libs/dbus-glib.o .libs/dbus-gmain.o .libs/dbus-gmarshal.o .libs/dbus-gobject.o .libs/dbus-gproxy.o .libs/dbus-gtest.o .libs/dbus-gvalue.o .libs/dbus-gthread.o .libs/dbus-gtype-specialized.o .libs/dbus-gutils.o .libs/dbus-gsignature.o .libs/dbus-gvalue-utils.o  -ldbus-1 -lpthread /usr/lib/libgobject-2.0.so /usr/lib/libglib-2.0.so -lintl  -Wl,-soname -Wl,libdbus-glib-1.so.2 -Wl,-version-script -Wl,.libs/libdbus-glib-1.ver -o .libs/libdbus-glib-1.so.2.1.0
/usr/lib/libgobject-2.0.so: could not read symbols: File in wrong format
collect2: ld returned 1 exit status
make[5]: *** [libdbus-glib-1.la] Error 1

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
