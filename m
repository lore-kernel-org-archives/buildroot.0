From: Trevor Woerner <twoerner@gmail.com>
Date: Fri, 10 Feb 2012 08:22:59 -0500
Subject: [Buildroot] [PATCH v3 directfb] directfb: font handling
	requires libbz2
In-Reply-To: <8762ff2ekh.fsf@macbook.be.48ers.dk>
References: <1328826314-30424-1-git-send-email-twoerner@gmail.com>
 <1328826314-30424-2-git-send-email-twoerner@gmail.com>
 <8762ff2ekh.fsf@macbook.be.48ers.dk>
Message-ID: <CAHUNapRJ_ygVDiJRZd9+F27pH2_dQOvqLXaG8UvzSt6AWZGnuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 10, 2012 at 5:00 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Trevor" == Trevor Woerner <twoerner@gmail.com> writes:
>
> ?Trevor> From: Trevor Woerner <twoerner@gmail.com>
> ?Trevor> One of the libraries which is built by directfb, libidirectfbfont_ft2.so,
> ?Trevor> requires libbz2:
>
> That's not true. Freetype might optionally have bzip2 support, but it
> isn't a requirement for directfb.
>
> E.G. I did a basic build here:
>
> ./host/usr/bin/i586-linux-readelf -a \
> ?staging/usr/lib/directfb-1.4-6/interfaces/IDirectFBFont/libidirectfbfont_ft2.so
> ?| grep NEEDED
> ?0x00000001 (NEEDED) ? ? ? ? ? ? ? ? ? ? Shared library: [libdirect-1.4.so.6]
> ?0x00000001 (NEEDED) ? ? ? ? ? ? ? ? ? ? Shared library: [libdirectfb-1.4.so.6]
> ?0x00000001 (NEEDED) ? ? ? ? ? ? ? ? ? ? Shared library: [libfusion-1.4.so.6]
> ?0x00000001 (NEEDED) ? ? ? ? ? ? ? ? ? ? Shared library: [libz.so.1]
> ?0x00000001 (NEEDED) ? ? ? ? ? ? ? ? ? ? Shared library: [libfreetype.so.6]
> ?0x00000001 (NEEDED) ? ? ? ? ? ? ? ? ? ? Shared library: [libm.so.0]
> ?0x00000001 (NEEDED) ? ? ? ? ? ? ? ? ? ? Shared library: [libdl.so.0]
> ?0x00000001 (NEEDED) ? ? ? ? ? ? ? ? ? ? Shared library: [libpthread.so.0]
> ?0x00000001 (NEEDED) ? ? ? ? ? ? ? ? ? ? Shared library: [libgcc_s.so.1]
> ?0x00000001 (NEEDED) ? ? ? ? ? ? ? ? ? ? Shared library: [libc.so.0]
>
> So the only thing that should be fixed is to ensure bzip2 is built
> before freetype (and zlib as well) if enabled. I'll fix that.

Hi Peter,

Thank you for looking into this for me, but this is rather odd. I
pulled your latest fixes and rebuilt (make clean; make) using the
attached config. I too don't see libbz2 listed when I perform the same
"readelf -a" step as you on the host:

./host/usr/bin/arm-angstrom-linux-gnueabi-readelf -a
staging/usr/lib/directfb-1.4-6/interfaces/IDirectFBFont/libidirectfbfont_ft2.so
| grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libdirect-1.4.so.6]
 0x00000001 (NEEDED)                     Shared library: [libdirectfb-1.4.so.6]
 0x00000001 (NEEDED)                     Shared library: [libfusion-1.4.so.6]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libfreetype.so.6]
 0x00000001 (NEEDED)                     Shared library: [libm.so.6]
 0x00000001 (NEEDED)                     Shared library: [libdl.so.2]
 0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
 0x00000001 (NEEDED)                     Shared library: [libc.so.6]

But when I run the "df_dok" example on the target it complains (as
I've shown before) that libidirectfbfont_ft2.so requires libbz2:



# df_dok

   ~~~~~~~~~~~~~~~~~~~~~~~~~~| DirectFB 1.4.15 |~~~~~~~~~~~~~~~~~~~~~~~~~~
        (c) 2001-2010  The world wide DirectFB Open Source Community
        (c) 2000-2004  Convergence (integrated media) GmbH
      ----------------------------------------------------------------

(*) DirectFB/Core: Single Application Core. (2012-02-10 13:03)
(*) Direct/Memcpy: Using armasm_memcpy()
(*) Direct/Thread: Started 'VT Switcher' (-1) [CRITICAL OTHER/OTHER
0/0] <8388608>...
(*) Direct/Thread: Started 'VT Flusher' (-1) [DEFAULT OTHER/OTHER 0/0]
<8388608>...
(*) DirectFB/FBDev: Found 'omapfb' (ID 0) with frame buffer at
0x8f400000, 1536k (MMIO 0x00000000, 0k)
(*) Direct/Thread: Started 'Hotplug with Linux Input' (-1) [INPUT
OTHER/OTHER 0/0] <8388608>...
(*) DirectFB/Input: Hot-plug detection enabled with Linux Input Driver
(*) Direct/Thread: Started 'PS/2 Input' (-1) [INPUT OTHER/OTHER 0/0]
<8388608>...
(*) DirectFB/Input: IMPS/2 Mouse (1) 1.0 (directfb.org)
(*) Direct/Thread: Started 'PS/2 Input' (-1) [INPUT OTHER/OTHER 0/0]
<8388608>...
(*) DirectFB/Input: IMPS/2 Mouse (2) 1.0 (directfb.org)
(*) Direct/Thread: Started 'Keyboard Input' (-1) [INPUT OTHER/OTHER
0/0] <8388608>...
(*) DirectFB/Input: Keyboard 0.9 (directfb.org)
(*) DirectFB/Graphics: Generic Software Rasterizer 0.6 (directfb.org)
(*) DirectFB/Core/WM: Default 0.3 (directfb.org)
(*) FBDev/Mode: Setting 1024x768 RGB16
(*) FBDev/Mode: Switched to 1024x768 (virtual 1024x768) at 16 bit
(RGB16), pitch 2048
(*) Direct/Interface: Loaded 'PNG' implementation of 'IDirectFBImageProvider'.
(!) Direct/Interface: Unable to dlopen
`/usr/lib/directfb-1.4-6/interfaces/IDirectFBFont/libidirectfbfont_ft2.so'!
    --> libbz2.so.1: cannot open shared object file: No such file or directory
df_dok.c <1523>:
        (#) DirectFBError [dfb->CreateFont( dfb, fontfile, &desc,
&bench_font )]: No (suitable) implementation found!
 (!!!)  *** WARNING [Application exited without deinitialization of
DirectFB!] *** [core.c:1109 in dfb_core_deinit_check()]
 (!!!)  *** WARNING [still objects in 'Layer Region Pool'] ***
[object.c:241 in fusion_object_pool_destroy()]
 (!!!)  *** WARNING [still objects in 'Layer Context Pool'] ***
[object.c:241 in fusion_object_pool_destroy()]
 (!!!)  *** WARNING [still objects in 'GraphicsState Pool'] ***
[object.c:241 in fusion_object_pool_destroy()]
 (!!!)  *** WARNING [still objects in 'Surface Pool'] ***
[object.c:241 in fusion_object_pool_destroy()]

# /lib/ld-2.9.so --list /usr/lib/directfb-1.4-6/interfaces/IDirectFBFont/libidir
ectfbfont_ft2.so
/usr/lib/directfb-1.4-6/interfaces/IDirectFBFont/libidirectfbfont_ft2.so:
error while loading shared libraries: libbz2.so.1: cannot open shared
object file: No such file or directory



Did I misunderstand your fix? Do I need to do something explicitly in
my build? (I thought the build would pull in any required libraries
automatically).

Best regards,
    Trevor

PS For testing purposes my target is currently an emulated gumstix
overo device under qemu, if you'd like I could provide instructions to
reproduce my exact target.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.xz
Type: application/octet-stream
Size: 4140 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120210/31e268c7/attachment.obj>
