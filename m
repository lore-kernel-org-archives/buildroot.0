From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Mon, 23 Nov 2009 13:52:37 +0100
Subject: [Buildroot] libtiff compilation fails when libjpeg62-dev is
	present on host
In-Reply-To: <20091123113439.GG6897@jasper.tkos.co.il>
References: <20091109071956.GC26599@jasper.tkos.co.il>
	<1257806614.24296.9.camel@coalu.atr>
	<20091110063659.GA5220@jasper.tkos.co.il>
	<4d28d4b50911190701h2f580cc9kf89cd32795949467@mail.gmail.com>
	<20091119151320.GC21551@jasper.tkos.co.il>
	<4d28d4b50911190720s72ed6df5s29d9f52aeb2cce3f@mail.gmail.com>
	<20091123065654.GD6897@jasper.tkos.co.il>
	<4d28d4b50911230221u574da4efic80712133917b766@mail.gmail.com>
	<20091123113439.GG6897@jasper.tkos.co.il>
Message-ID: <4d28d4b50911230452u418996aexe3d1a6ac1dd63ea@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok cool.
I didn't identify the problem with some external toolchain. I had this
problem with an sh4-stlinux one, but not with an x86-intel one and it seems
Thomas didn't had any problem with its arm-whatever toolchains.

I'm working on a configuration choice in the toolchain's configuration to
force autoreconf/libtool patching for some external toolchains.

Peter: What do think about such an option ?

--
Lionel

On Mon, Nov 23, 2009 at 12:34 PM, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Lionel,
>
> On Mon, Nov 23, 2009 at 11:21:04AM +0100, Lionel Landwerlin wrote:
> > If you're not using the lastest git, but the last official release, you
> > might need to apply this patch :
> >
> >
> http://git.buildroot.org/buildroot/commit/?id=34bba153aca96765aff0c6ff4c84352cb69b94b6
>
> Your patch did the trick. After cherry picking 34bba15, the libtiff package
> compiles correctly.
>
> Thanks.
>
> baruch
>
> > --
> > Lionel
> >
> > On Mon, Nov 23, 2009 at 7:56 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> >
> > > Hi Lionel,
> > >
> > > On Thu, Nov 19, 2009 at 04:20:58PM +0100, Lionel Landwerlin wrote:
> > > > With the stlinux-2.3 toolchain I have this problem too.
> > > > Adding the AUTORECONF=YES + LIBTOOL_PATCH=YES works (for me).
> > > > Could you that ?
> > >
> > > I tried that. Here is what I get:
> > >
> > > >>> tiff 3.8.2 Patching libtool
> > >
> > > Applying buildroot-libtool.patch using plaintext: patching file
> ltmain.sh
> > > Hunk #1 FAILED at 273.
> > > Hunk #2 succeeded at 3952 (offset 1544 lines).
> > > Hunk #3 FAILED at 4096.
> > > Hunk #4 FAILED at 4440.
> > > Hunk #5 succeeded at 6976 with fuzz 1 (offset 1353 lines).
> > > Hunk #6 FAILED at 7301.
> > > 4 out of 6 hunks FAILED -- saving rejects to file ltmain.sh.rej
> > > Patch failed!  Please fix buildroot-libtool.patch!
> > > make: ***
> > > [/home/baruch/git/buildroot/build_arm/tiff-3.8.2/.stamp_libtool_patch]
> Error
> > > 1
> > >
> > > baruch
> > >
> > > > On Thu, Nov 19, 2009 at 4:13 PM, Baruch Siach <baruch@tkos.co.il>
> wrote:
> > > >
> > > > > Hi Lionel,
> > > > >
> > > > > On Thu, Nov 19, 2009 at 04:01:17PM +0100, Lionel Landwerlin wrote:
> > > > > > Sorry for timeout, did you try to activate AUTORECONF=YES and
> > > > > > LIBTOOL_PATCH=YES ?
> > > > >
> > > > > I didn't try AUTORECONF=YES. I did try LIBTOOL_PATCH=YES, but, as I
> > > said,
> > > > > the
> > > > > patch does not apply. I searched for a newer version of this patch,
> but
> > > > > didn't
> > > > > find any.
> > > > >
> > > > > baruch
> > > > >
> > > > > > On Tue, Nov 10, 2009 at 7:37 AM, Baruch Siach <baruch@tkos.co.il
> >
> > > wrote:
> > > > > >
> > > > > > > Hi Lionel,
> > > > > > >
> > > > > > > On Mon, Nov 09, 2009 at 11:43:34PM +0100, Lionel Landwerlin
> wrote:
> > > > > > > > Le lundi 09 novembre 2009 ? 09:19 +0200, Baruch Siach a ?crit
> :
> > > > > > > > > Hi Buildroot list,
> > > > > > > > >
> > > > > > > > > I need to compile libtiff as a dependency of ImageMagic on
> a
> > > recent
> > > > > > > Debian
> > > > > > > > > Squeeze host.  The strange this is that when the
> libjpeg62-dev
> > > is
> > > > > > > installed on
> > > > > > > > > the host libtools finds the host /usr/lib/libjpeg.la file
> > > during
> > > > > > > build, which makes
> > > > > > > > > the build to fail at link time as follows:
> > > > > > > > >
> > > > > > > > > libtool: link:
> /opt/arm-2009q1/bin/arm-none-linux-gnueabi-gcc
> > > -Os
> > > > > -pipe
> > > > > > > -Os  --sysroot
> /home/baruch/git/buildroot/build_arm/staging_dir/
> > > > > -shared
> > > > > > >  .libs/tif_aux.o .libs/tif_close.o .libs/tif_codec.o
> > > .libs/tif_color.o
> > > > > > > .libs/tif_compress.o .libs/tif_dir.o .libs/tif_dirinfo.o
> > > > > .libs/tif_dirread.o
> > > > > > > .libs/tif_dirwrite.o .libs/tif_dumpmode.o .libs/tif_error.o
> > > > > > > .libs/tif_extension.o .libs/tif_fax3.o .libs/tif_fax3sm.o
> > > > > .libs/tif_flush.o
> > > > > > > .libs/tif_getimage.o .libs/tif_jpeg.o .libs/tif_luv.o
> > > .libs/tif_lzw.o
> > > > > > > .libs/tif_next.o .libs/tif_ojpeg.o .libs/tif_open.o
> > > > > .libs/tif_packbits.o
> > > > > > > .libs/tif_pixarlog.o .libs/tif_predict.o .libs/tif_print.o
> > > > > .libs/tif_read.o
> > > > > > > .libs/tif_strip.o .libs/tif_swab.o .libs/tif_thunder.o
> > > .libs/tif_tile.o
> > > > > > > .libs/tif_unix.o .libs/tif_version.o .libs/tif_warning.o
> > > > > .libs/tif_write.o
> > > > > > > .libs/tif_zip.o  -Wl,--whole-archive ../port/.libs/libport.a
> > > > > > > -Wl,--no-whole-archive  /usr/lib/libjpeg.so -lz -lm -lc
> > > > >  -Wl,-soname
> > > > > > > -Wl,libtiff.so.3 -o .libs/libtiff.so.3.8.2
> > > > > > > > > /usr/lib/libjpeg.so: file not recognized: File format not
> > > > > recognized
> > > > > > > > > collect2: ld returned 1 exit status
> > > > > > > > >
> > > > > > > > > Removing libjpeg62-dev, or even renaming the host
> > > > > /usr/lib/libjpeg.lafile
> > > > > > > > > makes the problem go away. Is there a sane solutions for
> this?
> > > > > > > > >
> > > > > > > > > baruch
> > > > > > > > >
> > > > > > > >
> > > > > > > > I got the same problem with a bunch of package
> > > > > (gtk/glib/dbus-glib...)
> > > > > > > > using an external toolchain.
> > > > > > > >
> > > > > > > > I usually fix the problem by enabling libtool patching on the
> > > > > package.
> > > > > > >
> > > > > > > I tried the libtool patch. Unfortunately this patch does not
> apply
> > > on
> > > > > > > ltmain.sh of the tiff package (version 3.8.2). Is there a newer
> > > version
> > > > > of
> > > > > > > this patch?
> > > > > > >
> > > > > > > baruch
> > > > >
> > > > > --
> > > > >                                                     ~. .~   Tk Open
> > > Systems
> > > > >
> > >
> =}------------------------------------------------ooO--U--Ooo------------{=
> > > > >   - baruch at tkos.co.il - tel: +972.2.679.5364,
> http://www.tkos.co.il -
> > > > >
> > >
> > > --
> > >                                                      ~. .~   Tk Open
> > > Systems
> > >
> =}------------------------------------------------ooO--U--Ooo------------{=
> > >   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
> > >
>
> --
>                                                      ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091123/008eafa7/attachment-0001.htm>
