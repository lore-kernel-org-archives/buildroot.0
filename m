From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jan 2016 23:05:49 +0100
Subject: [Buildroot] host directories in target rpath
In-Reply-To: <20160101155622.GA20087@vostro>
References: <20160101155622.GA20087@vostro>
Message-ID: <20160101230549.6cb360cf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Fri, 1 Jan 2016 17:56:23 +0200, Alex Suykov wrote:

> I noticed I have bunch of target executables with host directories in RPATH:
> 
>     $ readelf -d output/target/usr/bin/aserver | grep RPATH
>      0x0000000f (RPATH) Library rpath: [/home/alex/src/buildroot.snow/output/build/alsa-lib-1.0.29/src/.libs]
>     
>     $ readelf -d output/target/usr/bin/glib-compile-resources | grep RPATH
>      0x0000000f (RPATH) Library rpath: [/home/alex/src/buildroot.snow/output/build/libglib2-2.46.1/gio/.libs:/home/alex/src/buildroot.snow/output/build/libglib2-2.46.1/gobject/.libs:/home/alex/src/buildroot.snow/output/build/libglib2-2.46.1/gmodule/.libs:/home/alex/src/buildroot.snow/output/build/libglib2-2.46.1/glib/.libs:/home/alex/src/buildroot.snow/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib]
>     
>     $ readelf -d output/target/usr/bin/weston | grep RPATH
>      0x0000000f (RPATH) Library rpath: [/home/alex/src/buildroot.snow/output/host/usr/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib]
> 
> It does not break anything, but it's not right either.
> And it makes strace output look rather messy.
> 
> A quick way to check it is building alsa-lib, which is where aserver comes from.
> 
> The underlying cause is libtool, and for autoreconfed packages I can fix it
> by patching (host-)libtool. This fixes alsa-lib but not weston because weston
> carries that code in its pre-built configure. So I have to either patch weston
> in place (and also every non-autoreconfed package), or autoreconf them all.
> 
> What's your thoughts on this? Maybe there are better ways to fix it?

You can see the following patches from Samuel Martin, which aim at
solving this problem:

  http://patchwork.ozlabs.org/patch/494781/
  http://patchwork.ozlabs.org/patch/494782/
  http://patchwork.ozlabs.org/patch/494783/
  http://patchwork.ozlabs.org/patch/494784/
  http://patchwork.ozlabs.org/patch/494785/

Samuel said he would respin them on top of master and post a new
version of those patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
