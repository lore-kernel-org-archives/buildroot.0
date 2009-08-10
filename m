From: Jean-Christian de Rivaz <jc@eclis.ch>
Date: Mon, 10 Aug 2009 09:29:12 +0200
Subject: [Buildroot] [PATCH] Re: buildroot-libtool.patch failed with
 dbus 1.3.0
In-Reply-To: <20090809005922.7e58e0bf@surf>
References: <4A7C85F0.7070604@eclis.ch>
	<20090807221717.53039a10@surf>	<4A7C9F65.4060104@eclis.ch>
	<20090808004346.443b9e49@surf>	<4A7CB3CC.8040401@eclis.ch>
	<20090808200911.4e986c77@surf>	<4A7DFDF4.3020103@eclis.ch>
	<20090809005922.7e58e0bf@surf>
Message-ID: <4A7FCC48.70507@eclis.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni a ?crit :
> Here it is. It's the classical problem, you call libtool --mode=link
> with some libraries (here -lgobject-2.0), and libtool replaces -lglib2.0
> by an incorrect absolute path, here /usr/lib/libgobject-2.0.so. The log:
> 
> /bin/bash ../libtool --tag=CC   --mode=link /usr/local/xtools/arm-unknown-linux-uclibcgnueabi-gcc-4.3.4/bin/arm-linux-gcc -Os -pipe -Os  --sysroot /home/thomas/local/buildroot-test/build_arm/staging_dir/  -Os -pipe -Os  --sysroot /home/thomas/local/buildroot-test/build_arm/staging_dir/ -Wall -Wchar-subscripts -Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wpointer-arith -Wcast-align -Wfloat-equal -Wsign-compare -export-symbols-regex "^[^_].*" -version-info 3:0:1 -no-undefined --sysroot /home/thomas/local/buildroot-test/build_arm/staging_dir/ -o libdbus-glib-1.la -rpath /usr/lib dbus-glib.lo dbus-gmain.lo dbus-gmarshal.lo dbus-gobject.lo dbus-gproxy.lo dbus-gtest.lo dbus-gvalue.lo dbus-gthread.lo dbus-gtype-specialized.lo dbus-gutils.lo dbus-gsignature.lo dbus-gvalue-utils.lo -ldbus-1 -lpthread   -lgobject-2.0 -lglib-2.0 -lintl   
> generating symbol list for `libdbus-glib-1.la'
> /usr/local/xtools/arm-unknown-linux-uclibcgnueabi-gcc-4.3.4/bin/arm-linux-nm  .libs/dbus-glib.o .libs/dbus-gmain.o .libs/dbus-gmarshal.o .libs/dbus-gobject.o .libs/dbus-gproxy.o .libs/dbus-gtest.o .libs/dbus-gvalue.o .libs/dbus-gthread.o .libs/dbus-gtype-specialized.o .libs/dbus-gutils.o .libs/dbus-gsignature.o .libs/dbus-gvalue-utils.o  | sed -n -e 's/^.*[ 	]\([ABCDGIRSTW][ABCDGIRSTW]*\)[ 	][ 	]*\([_A-Za-z][_A-Za-z0-9]*\)$/\1 \2 \2/p' | /home/thomas/local/buildroot-test/toolchain_build_arm/bin/sed 's/.* //' | sort | uniq > .libs/libdbus-glib-1.exp
> /bin/grep -E -e "^[^_].*" ".libs/libdbus-glib-1.exp" > ".libs/libdbus-glib-1.expT"
> mv -f ".libs/libdbus-glib-1.expT" ".libs/libdbus-glib-1.exp"
> echo "{ global:" > .libs/libdbus-glib-1.ver
>  cat .libs/libdbus-glib-1.exp | sed -e "s/\(.*\)/\1;/" >> .libs/libdbus-glib-1.ver
>  echo "local: *; };" >> .libs/libdbus-glib-1.ver
>  /usr/local/xtools/arm-unknown-linux-uclibcgnueabi-gcc-4.3.4/bin/arm-linux-gcc -Os -pipe -Os  --sysroot /home/thomas/local/buildroot-test/build_arm/staging_dir/ -shared  .libs/dbus-glib.o .libs/dbus-gmain.o .libs/dbus-gmarshal.o .libs/dbus-gobject.o .libs/dbus-gproxy.o .libs/dbus-gtest.o .libs/dbus-gvalue.o .libs/dbus-gthread.o .libs/dbus-gtype-specialized.o .libs/dbus-gutils.o .libs/dbus-gsignature.o .libs/dbus-gvalue-utils.o  -ldbus-1 -lpthread /usr/lib/libgobject-2.0.so /usr/lib/libglib-2.0.so -lintl  -Wl,-soname -Wl,libdbus-glib-1.so.2 -Wl,-version-script -Wl,.libs/libdbus-glib-1.ver -o .libs/libdbus-glib-1.so.2.1.0
> /usr/lib/libgobject-2.0.so: could not read symbols: File in wrong format
> collect2: ld returned 1 exit status
> make[5]: *** [libdbus-glib-1.la] Error 1

Strange. I have redo the test after a git clean -dfx && git pull
--rebase with my patch on the top, and I get this below problem. I
notice that you use EABI while I use OABI. Can this confuse libtool ?

/bin/sh ../libtool --tag=CC   --mode=link 
/home/jcdr/try/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc 
-Os -pipe -Os 
-I/home/jcdr/try/buildroot/build_arm/staging_dir/usr/include 
-I/home/jcdr/try/buildroot/build_arm/staging_dir/include 
--sysroot=/home/jcdr/try/buildroot/build_arm/staging_dir/ -isysroot 
/home/jcdr/try/buildroot/build_arm/staging_dir -mabi=apcs-gnu  -Os -pipe 
-Os  -I/home/jcdr/try/buildroot/build_arm/staging_dir/usr/include 
-I/home/jcdr/try/buildroot/build_arm/staging_dir/include 
--sysroot=/home/jcdr/try/buildroot/build_arm/staging_dir/ -isysroot 
/home/jcdr/try/buildroot/build_arm/staging_dir -mabi=apcs-gnu -Wall 
-Wchar-subscripts -Wmissing-declarations -Wmissing-prototypes 
-Wnested-externs -Wpointer-arith -Wcast-align -Wfloat-equal 
-Wsign-compare -export-symbols-regex "^[^_].*" -version-info 3:0:1 
-no-undefined -L/home/jcdr/try/buildroot/build_arm/staging_dir/lib 
-L/home/jcdr/try/buildroot/build_arm/staging_dir/usr/lib 
--sysroot=/home/jcdr/try/buildroot/build_arm/staging_dir/ -o 
libdbus-glib-1.la -rpath /usr/lib dbus-glib.lo dbus-gmain.lo 
dbus-gmarshal.lo dbus-gobject.lo dbus-gproxy.lo dbus-gtest.lo 
dbus-gvalue.lo dbus-gthread.lo dbus-gtype-specialized.lo dbus-gutils.lo 
dbus-gsignature.lo dbus-gvalue-utils.lo -ldbus-1 -lpthread 
-lgobject-2.0 -lglib-2.0 -lintl
generating symbol list for `libdbus-glib-1.la'
/home/jcdr/try/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-nm 
  .libs/dbus-glib.o .libs/dbus-gmain.o .libs/dbus-gmarshal.o 
.libs/dbus-gobject.o .libs/dbus-gproxy.o .libs/dbus-gtest.o 
.libs/dbus-gvalue.o .libs/dbus-gthread.o .libs/dbus-gtype-specialized.o 
.libs/dbus-gutils.o .libs/dbus-gsignature.o .libs/dbus-gvalue-utils.o  | 
sed -n -e 's/^.*[   ]\([ABCDGIRSTW][ABCDGIRSTW]*\)[         ][ 
]*\([_A-Za-z][_A-Za-z0-9]*\)$/\1 \2 \2/p' | 
/home/jcdr/try/buildroot/toolchain_build_arm/bin/sed 's/.* //' | sort | 
uniq > .libs/libdbus-glib-1.exp
/bin/grep -E -e "^[^_].*" ".libs/libdbus-glib-1.exp" > 
".libs/libdbus-glib-1.expT"
mv -f ".libs/libdbus-glib-1.expT" ".libs/libdbus-glib-1.exp"
echo "{ global:" > .libs/libdbus-glib-1.ver
  cat .libs/libdbus-glib-1.exp | sed -e "s/\(.*\)/\1;/" >> 
.libs/libdbus-glib-1.ver
  echo "local: *; };" >> .libs/libdbus-glib-1.ver
 
/home/jcdr/try/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc 
-Os -pipe -Os 
-I/home/jcdr/try/buildroot/build_arm/staging_dir/usr/include 
-I/home/jcdr/try/buildroot/build_arm/staging_dir/include 
--sysroot=/home/jcdr/try/buildroot/build_arm/staging_dir/ -isysroot 
/home/jcdr/try/buildroot/build_arm/staging_dir -mabi=apcs-gnu -shared 
.libs/dbus-glib.o .libs/dbus-gmain.o .libs/dbus-gmarshal.o 
.libs/dbus-gobject.o .libs/dbus-gproxy.o .libs/dbus-gtest.o 
.libs/dbus-gvalue.o .libs/dbus-gthread.o .libs/dbus-gtype-specialized.o 
.libs/dbus-gutils.o .libs/dbus-gsignature.o .libs/dbus-gvalue-utils.o 
-Wl,--rpath -Wl,/home/jcdr/try/buildroot/build_arm/staging_dir/usr/lib 
-Wl,--rpath -Wl,/home/jcdr/try/buildroot/build_arm/staging_dir/usr/lib 
-L/home/jcdr/try/buildroot/build_arm/staging_dir/lib 
-L/home/jcdr/try/buildroot/build_arm/staging_dir/usr/lib 
/home/jcdr/try/buildroot/build_arm/staging_dir/usr/lib/libdbus-1.so 
-lpthread 
/home/jcdr/try/buildroot/build_arm/staging_dir/usr/lib/libgobject-2.0.so 
/home/jcdr/try/buildroot/build_arm/staging_dir/usr/lib/libglib-2.0.so 
/home/jcdr/try/buildroot/build_arm/staging_dir/usr/lib/libintl.so 
-mabi=apcs-gnu -mabi=apcs-gnu -Wl,-soname -Wl,libdbus-glib-1.so.2 
-Wl,-version-script -Wl,.libs/libdbus-glib-1.ver -o 
.libs/libdbus-glib-1.so.2.1.0
(cd .libs && rm -f libdbus-glib-1.so.2 && ln -s libdbus-glib-1.so.2.1.0 
libdbus-glib-1.so.2)
(cd .libs && rm -f libdbus-glib-1.so && ln -s libdbus-glib-1.so.2.1.0 
libdbus-glib-1.so)
 
/home/jcdr/try/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc 
-Os -pipe -Os 
-I/home/jcdr/try/buildroot/build_arm/staging_dir/usr/include 
-I/home/jcdr/try/buildroot/build_arm/staging_dir/include 
--sysroot=/home/jcdr/try/buildroot/build_arm/staging_dir/ -isysroot 
/home/jcdr/try/buildroot/build_arm/staging_dir -mabi=apcs-gnu 
-DHAVE_CONFIG_H -I. -I.. -I.. -I.. 
-I/home/jcdr/try/buildroot/build_arm/staging_dir/usr/include/dbus-1.0 
-I/home/jcdr/try/buildroot/build_arm/staging_dir/usr/lib/dbus-1.0/include 
-I/home/jcdr/try/buildroot/build_arm/staging_dir/usr/include/glib-2.0 
-I/home/jcdr/try/buildroot/build_arm/staging_dir/usr/lib/glib-2.0/include 
-DDBUS_COMPILATION=1 -DDBUS_LOCALEDIR=\"/usr/share/locale\" 
-DDBUS_API_SUBJECT_TO_CHANGE=1 -Os -pipe -Os 
-I/home/jcdr/try/buildroot/build_arm/staging_dir/usr/include 
-I/home/jcdr/try/buildroot/build_arm/staging_dir/include 
--sysroot=/home/jcdr/try/buildroot/build_arm/staging_dir/ -isysroot 
/home/jcdr/try/buildroot/build_arm/staging_dir -mabi=apcs-gnu -Wall 
-Wchar-subscripts -Wmissing-declarations -Wmissing-prototypes 
-Wnested-externs -Wpointer-arith -Wcast-align -Wfloat-equal 
-Wsign-compare -MT dbus-gparser.lo -MD -MP -MF .deps/dbus-gparser.Tpo -c 
dbus-gparser.c -o dbus-gparser.o >/dev/null 2>&1
/home/jcdr/try/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ar 
cru .libs/libdbus-glib-1.a  dbus-glib.o dbus-gmain.o dbus-gmarshal.o 
dbus-gobject.o dbus-gproxy.o dbus-gtest.o dbus-gvalue.o dbus-gthread.o 
dbus-gtype-specialized.o dbus-gutils.o dbus-gsignature.o dbus-gvalue-utils.o
/home/jcdr/try/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ranlib 
.libs/libdbus-glib-1.a
creating libdbus-glib-1.la
(cd .libs && rm -f libdbus-glib-1.la && ln -s ../libdbus-glib-1.la 
libdbus-glib-1.la)
mv -f .deps/dbus-gparser.Tpo .deps/dbus-gparser.Plo
/bin/sh ../libtool --tag=CC   --mode=link 
/home/jcdr/try/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc 
-Os -pipe -Os 
-I/home/jcdr/try/buildroot/build_arm/staging_dir/usr/include 
-I/home/jcdr/try/buildroot/build_arm/staging_dir/include 
--sysroot=/home/jcdr/try/buildroot/build_arm/staging_dir/ -isysroot 
/home/jcdr/try/buildroot/build_arm/staging_dir -mabi=apcs-gnu  -Os -pipe 
-Os  -I/home/jcdr/try/buildroot/build_arm/staging_dir/usr/include 
-I/home/jcdr/try/buildroot/build_arm/staging_dir/include 
--sysroot=/home/jcdr/try/buildroot/build_arm/staging_dir/ -isysroot 
/home/jcdr/try/buildroot/build_arm/staging_dir -mabi=apcs-gnu -Wall 
-Wchar-subscripts -Wmissing-declarations -Wmissing-prototypes 
-Wnested-externs -Wpointer-arith -Wcast-align -Wfloat-equal 
-Wsign-compare  -L/home/jcdr/try/buildroot/build_arm/staging_dir/lib 
-L/home/jcdr/try/buildroot/build_arm/staging_dir/usr/lib 
--sysroot=/home/jcdr/try/buildroot/build_arm/staging_dir/ -o 
libdbus-gtool.la  dbus-gtype-specialized.lo dbus-gutils.lo 
dbus-gsignature.lo dbus-gvalue-utils.lo dbus-gidl.lo 
dbus-gloader-expat.lo dbus-gparser.lo -ldbus-1 -lpthread   -lexpat
/home/jcdr/try/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ar 
cru .libs/libdbus-gtool.a .libs/dbus-gtype-specialized.o 
.libs/dbus-gutils.o .libs/dbus-gsignature.o .libs/dbus-gvalue-utils.o 
.libs/dbus-gidl.o .libs/dbus-gloader-expat.o .libs/dbus-gparser.o
/home/jcdr/try/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ranlib 
.libs/libdbus-gtool.a
creating libdbus-gtool.la
(cd .libs && rm -f libdbus-gtool.la && ln -s ../libdbus-gtool.la 
libdbus-gtool.la)
/bin/sh ../libtool --tag=CC   --mode=link 
/home/jcdr/try/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc 
-Os -pipe -Os 
-I/home/jcdr/try/buildroot/build_arm/staging_dir/usr/include 
-I/home/jcdr/try/buildroot/build_arm/staging_dir/include 
--sysroot=/home/jcdr/try/buildroot/build_arm/staging_dir/ -isysroot 
/home/jcdr/try/buildroot/build_arm/staging_dir -mabi=apcs-gnu  -Os -pipe 
-Os  -I/home/jcdr/try/buildroot/build_arm/staging_dir/usr/include 
-I/home/jcdr/try/buildroot/build_arm/staging_dir/include 
--sysroot=/home/jcdr/try/buildroot/build_arm/staging_dir/ -isysroot 
/home/jcdr/try/buildroot/build_arm/staging_dir -mabi=apcs-gnu -Wall 
-Wchar-subscripts -Wmissing-declarations -Wmissing-prototypes 
-Wnested-externs -Wpointer-arith -Wcast-align -Wfloat-equal 
-Wsign-compare  -L/home/jcdr/try/buildroot/build_arm/staging_dir/lib 
-L/home/jcdr/try/buildroot/build_arm/staging_dir/usr/lib 
--sysroot=/home/jcdr/try/buildroot/build_arm/staging_dir/ -o 
dbus-binding-tool dbus-binding-tool-glib.o dbus-glib-tool.o 
./libdbus-gtool.la ./libdbus-glib-1.la -ldbus-1 -lpthread 
-lgobject-2.0 -lglib-2.0 -lintl   -lexpat
/home/jcdr/try/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc 
-Os -pipe -Os 
-I/home/jcdr/try/buildroot/build_arm/staging_dir/usr/include 
-I/home/jcdr/try/buildroot/build_arm/staging_dir/include 
--sysroot=/home/jcdr/try/buildroot/build_arm/staging_dir/ -isysroot 
/home/jcdr/try/buildroot/build_arm/staging_dir -mabi=apcs-gnu -Os -pipe 
-Os -I/home/jcdr/try/buildroot/build_arm/staging_dir/usr/include 
-I/home/jcdr/try/buildroot/build_arm/staging_dir/include 
--sysroot=/home/jcdr/try/buildroot/build_arm/staging_dir/ -isysroot 
/home/jcdr/try/buildroot/build_arm/staging_dir -mabi=apcs-gnu -Wall 
-Wchar-subscripts -Wmissing-declarations -Wmissing-prototypes 
-Wnested-externs -Wpointer-arith -Wcast-align -Wfloat-equal 
-Wsign-compare --sysroot=/home/jcdr/try/buildroot/build_arm/staging_dir/ 
-o dbus-binding-tool dbus-binding-tool-glib.o dbus-glib-tool.o 
-L/home/jcdr/try/buildroot/build_arm/staging_dir/lib 
-L/home/jcdr/try/buildroot/build_arm/staging_dir/usr/lib 
./.libs/libdbus-gtool.a ./.libs/libdbus-glib-1.so 
/home/jcdr/try/buildroot/build_arm/staging_dir/usr/lib/libdbus-1.so 
-lpthread 
/home/jcdr/try/buildroot/build_arm/staging_dir/usr/lib/libgobject-2.0.so 
/home/jcdr/try/buildroot/build_arm/staging_dir/usr/lib/libglib-2.0.so 
/home/jcdr/try/buildroot/build_arm/staging_dir/usr/lib/libintl.so 
/home/jcdr/try/buildroot/build_arm/staging_dir/usr/lib/libiconv.so -lc 
/home/jcdr/try/buildroot/build_arm/staging_dir/usr/lib/libexpat.so 
-Wl,--rpath 
-Wl,/home/jcdr/try/buildroot/build_arm/dbus-glib-0.80/dbus/.libs 
-Wl,--rpath -Wl,/home/jcdr/try/buildroot/build_arm/staging_dir/usr/lib 
-Wl,--rpath -Wl,/home/jcdr/try/buildroot/build_arm/staging_dir/usr/lib


Best Regards,

Jean-Christian de Rivaz
