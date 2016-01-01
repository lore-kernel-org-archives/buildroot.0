From: Alex Suykov <alex.suykov@gmail.com>
Date: Fri, 1 Jan 2016 17:56:23 +0200
Subject: [Buildroot] host directories in target rpath
Message-ID: <20160101155622.GA20087@vostro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I noticed I have bunch of target executables with host directories in RPATH:

    $ readelf -d output/target/usr/bin/aserver | grep RPATH
     0x0000000f (RPATH) Library rpath: [/home/alex/src/buildroot.snow/output/build/alsa-lib-1.0.29/src/.libs]
    
    $ readelf -d output/target/usr/bin/glib-compile-resources | grep RPATH
     0x0000000f (RPATH) Library rpath: [/home/alex/src/buildroot.snow/output/build/libglib2-2.46.1/gio/.libs:/home/alex/src/buildroot.snow/output/build/libglib2-2.46.1/gobject/.libs:/home/alex/src/buildroot.snow/output/build/libglib2-2.46.1/gmodule/.libs:/home/alex/src/buildroot.snow/output/build/libglib2-2.46.1/glib/.libs:/home/alex/src/buildroot.snow/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib]
    
    $ readelf -d output/target/usr/bin/weston | grep RPATH
     0x0000000f (RPATH) Library rpath: [/home/alex/src/buildroot.snow/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib]

It does not break anything, but it's not right either.
And it makes strace output look rather messy.

A quick way to check it is building alsa-lib, which is where aserver comes from.

The underlying cause is libtool, and for autoreconfed packages I can fix it
by patching (host-)libtool. This fixes alsa-lib but not weston because weston
carries that code in its pre-built configure. So I have to either patch weston
in place (and also every non-autoreconfed package), or autoreconf them all.

What's your thoughts on this? Maybe there are better ways to fix it?


package/libtool/0001-no-rpath.patch:
--- a/m4/libtool.m4
+++ b/m4/libtool.m4
@@ -5035,7 +5035,6 @@
     # are reset later if shared libraries are not supported. Putting them
     # here allows them to be overridden if necessary.
     runpath_var=LD_RUN_PATH
-    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='$wl-rpath $wl$libdir'
     _LT_TAGVAR(export_dynamic_flag_spec, $1)='$wl--export-dynamic'
     # ancient GNU ld didn't support --whole-archive et. al.
     if $LD --help 2>&1 | $GREP 'no-whole-archive' > /dev/null; then
