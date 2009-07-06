From: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
Date: Mon, 06 Jul 2009 02:51:30 +0200
Subject: [Buildroot] External toolchain improvements
In-Reply-To: <20090703101337.7b766edb@surf>
References: <mailman.0.1246405094.1110.buildroot@busybox.net>
	<1246406073.21132.13.camel@coalu.atr> <20090701160513.2ce29151@surf>
	<1246484614.21132.36.camel@coalu.atr> <20090702145011.6b9f3fe9@surf>
	<1246600903.8052.8.camel@coalu.atr>  <20090703101337.7b766edb@surf>
Message-ID: <1246841490.1057.27.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le vendredi 03 juillet 2009 ? 10:13 +0200, Thomas Petazzoni a ?crit :
> Le Fri, 03 Jul 2009 08:01:43 +0200,
> Lionel Landwerlin <lionel.landwerlin@openwide.fr> a ?crit :
> 
> > /usr/lib/libdl.so: file not recognized: File format not recognized
> 
> Arf, libtool crap.
> 
> Can you try with
> 
> LIBGLIB2_LIBTOOL_PATCH = YES
> LIBGLIB2_AUTORECONF = YES
> 
> in package/libglib2/libglib2.mk ?
> 
> This will try to fix ltmain.sh to workaround cross-compiling issues.
> 

I finally succeeded in building glib2...
I had to patch the configure.in and the gtk-doc.make files against a
problem when reconfiguring the scripts.

GTK_DOC seems to be the main problem.

I successfully built the following packages :

atk-1.22.0
directfb-1.4.0
fontconfig-2.6.0
libungif-4.1.4
perl-5.8.8
zlib-1.2.3
cairo-1.6.4
dbus-glib-0.80
expat-2.0.1
freetype-2.3.9
jpeg-6b
libpng-1.2.35
libxml2-2.6.32
pixman-0.10.0
dbus-1.2.12
gettext-0.16.1
libglib2-2.20.1

I'm now stuck with a dbus-glib build error :

make[7]: Entering directory `/home/djdeath/src/buildroot/buildroot/build_sh4/dbus-glib-0.80/dbus/examples'
/opt/STM/STLinux-2.3/devkit/sh4/bin/sh4-linux-gcc -O2 -O2  --sysroot /home/djdeath/src/buildroot/buildroot/build_sh4/staging_dir/ -DHAVE_CONFIG_H -I. -I../.. -I../.. -I../.. -I../../dbus -I/home/djdeath/src/buildroot/buildroot/build_sh4/staging_dir/usr/include/dbus-1.0 -I/home/djdeath/src/buildroot/buildroot/build_sh4/staging_dir/usr/lib/dbus-1.0/include   -I/home/djdeath/src/buildroot/buildroot/build_sh4/staging_dir/usr/include/glib-2.0 -I/home/djdeath/src/buildroot/buildroot/build_sh4/staging_dir/usr/lib/glib-2.0/include   -DDBUS_COMPILATION  -DDBUS_API_SUBJECT_TO_CHANGE=1   -O2 -O2  --sysroot /home/djdeath/src/buildroot/buildroot/build_sh4/staging_dir/ -Wall -Wchar-subscripts -Wmissing-declarations -Wmissing-prototypes -Wnested-externs -Wpointer-arith -Wcast-align -Wfloat-equal -Wsign-compare -MT example-service.o -MD -MP -MF .deps/example-service.Tpo -c -o example-service.o example-service.c
In file included from example-service.c:57:
example-service-glue.h:5: error: 'dbus_glib_marshal_some_object_BOOLEAN__STRING_POINTER_POINTER' undeclared here (not in a function)
example-service-glue.h:6: error: 'dbus_glib_marshal_some_object_BOOLEAN__POINTER_POINTER' undeclared here (not in a function)
make[7]: *** [example-service.o] Error 1

It's a bit late, so I will check that later this week. Any suggestion is
welcome.

Except patches I've done for the GTK_DOC stuff in glib (I mostly
commented lines), you can find other patches in attachment.

Regards,

-- 
Lionel Landwerlin <lionel.landwerlin@openwide.fr>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Fix-sysroot-copy-when-current-locale-is-not-set-to-e.patch
Type: text/x-patch
Size: 1116 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090706/b1ba422a/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0002-glib2-libtool-broken.patch
Type: text/x-patch
Size: 1039 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090706/b1ba422a/attachment-0001.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0003-Avoid-ATK-to-use-glib-genmarshal-from-staging-direct.patch
Type: text/x-patch
Size: 785 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090706/b1ba422a/attachment-0002.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0004-dbus-libtool-broken.patch
Type: text/x-patch
Size: 785 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090706/b1ba422a/attachment-0003.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0005-dbus-glib-libtool-broken.patch
Type: text/x-patch
Size: 860 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090706/b1ba422a/attachment-0004.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0006-Avoid-FONTCONFIG-to-use-bin-sh-from-staging-director.patch
Type: text/x-patch
Size: 2258 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090706/b1ba422a/attachment-0005.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0007-directfb-libtool-broken.patch
Type: text/x-patch
Size: 949 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090706/b1ba422a/attachment-0006.bin>
