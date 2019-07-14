From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jul 2019 22:47:36 +0200
Subject: [Buildroot] [PATCH] utils/checkpackagelib:
 CommentsMenusPackagesOrder: fix 'menuconfig' handling
In-Reply-To: <0a63745f-3e08-ffa7-6c8c-84ef9e419a78@mind.be>
References: <20190714124400.29431-1-arnout@mind.be>
 <20190714131502.GC8912@scaer> <20190714132329.GA25166@scaer>
 <7841a190-820b-cd3c-4f71-2a5b0c5f6a0d@mind.be>
 <0a63745f-3e08-ffa7-6c8c-84ef9e419a78@mind.be>
Message-ID: <20190714204736.GK29941@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-07-14 22:24 +0200, Arnout Vandecappelle spake thusly:
> On 14/07/2019 20:50, Arnout Vandecappelle wrote:
> >> On 2019-07-14 15:15 +0200, Yann E. MORIN spake thusly:
[--SNIP--]
> >> And in fact, there is one thing I don;t understand in utils/checkpackagelib/lib_config.py,
> >> line 106:
> >>     new_package = text[17: -(len(self.filename)-5):]
> >> Why are we using the current filename to strip away parts of the new
> >> package filename?
> >  That is indeed the problem. I didn't look too hard at that line (because I
> > already looked to much at all the rest :-). The len(self.filename)-5 works for
> > package/Config.in because that exactly strips off the /Config.in part of the
> > line. But that's a horrible hack, of course...
>  ... and used the same regex to get the package name.
> 
>  It now seems to work correctly. However, it turns up 10 "errors":
> 
> boot/Config.in:7: Packages in: menu "Bootloaders",
>                   are not alphabetically ordered;
>                   correct order: '-', '_', digits, capitals, lowercase;
>                   first incorrect package: arm-trusted-firmware

Good catch.

> package/fftw/Config.in:18: Packages in: if BR2_PACKAGE_FFTW,
>                            are not alphabetically ordered;
>                            correct order: '-', '_', digits, capitals, lowercase;
>                            first incorrect package: fftw-double

Unfortunately, this is where we readh the limitation: we do want the
list to be ordered not by name, but by the precision. And indeed, the
current ordering makes more sense for fftw than an alphabetical one
would.

> package/gstreamer/Config.in:7: Packages in: if BR2_PACKAGE_GSTREAMER,
>                                are not alphabetically ordered;
>                                correct order: '-', '_', digits, capitals, lowercase;
>                                first incorrect package: gst-plugins-bad

Ditto, the current ordering is correct.

> package/gstreamer1/Config.in:6: Packages in: if BR2_PACKAGE_GSTREAMER1,
>                                 are not alphabetically ordered;
>                                 correct order: '-', '_', digits, capitals,
> lowercase;
>                                 first incorrect package: gst1-plugins-base

Ditto.

> package/opengl/Config.in:2: Packages in: ,
>                             are not alphabetically ordered;
>                             correct order: '-', '_', digits, capitals, lowercase;
>                             first incorrect package: libegl

This is more questionable, because the current ordering make sense, but
the packages are all vrtual and have no prompt. So it would not be too
bad for users, only hackers.

> package/qt5/Config.in:84: Packages in: comment "Latest Qt version needs
> host/toolchain w/ gcc >= 4.8",
>                           are not alphabetically ordered;
>                           correct order: '-', '_', digits, capitals, lowercase;
>                           first incorrect package: qt5webengine

Here I am not so sure. I'd like to ensure that the "core" packages come
first, and that we were not forced to choose the alphabetical order. But
it so happens that their names naturally fits the bill (more or less).

As for the web monsters, yes, they should be alphabetically sorted.

> package/freescale-imx/Config.in:96: Packages in: if BR2_PACKAGE_FREESCALE_IMX,
>                                     are not alphabetically ordered;
>                                     correct order: '-', '_', digits, capitals,
> lowercase;
>                                     first incorrect package: firmware-imx

Here, even if we were to move imx-sc-firmware (the one really not
ordered), we'd still have to put it after more "low-level" packages. And
there are also imx-gpu-g2d and imx-gpu-viv that may cause false
positives.

> toolchain/toolchain-buildroot/Config.in:109: Packages in: comment "glibc on MIPS
> w/ NAN2008 needs a toolchain w/ headers >= 4.5",
>                                              are not alphabetically ordered;
>                                              correct order: '-', '_', digits,
> capitals, lowercase;
>                                              first incorrect package: glibc
> toolchain/toolchain-external/Config.in:17: Packages in: comment "glibc
> toolchains only available with shared lib support",
>                                            are not alphabetically ordered;
>                                            correct order: '-', '_', digits,
> capitals, lowercase;
>                                            first incorrect package:
> toolchain-external-codesourcery-aarch64
> toolchain/Config.in:70: Packages in: menu "Toolchain",
>                         are not alphabetically ordered;
>                         correct order: '-', '_', digits, capitals, lowercase;
>                         first incorrect package: gdb

Toolchain is always a little bit special, isn't it? :-)

>  I haven't looked at the details yet, but I think most of them are bogus.

There are two that are correct (ATF, and qt5webengin). The others we
want to ignore.

> So,
> maybe we should just do it for package/Config.in and package/Config.in.host.
> However, some of them *are* relevant: external toolchains, bootloaders, maybe
> qt5... Note however that for those the "comment" handling is not correct (in
> package/Config.in, comments are generally used to indicate submenus, but in
> other Config.in files this is not the case).
> 
>  Ideas?

I like the flake8 notation:
    # noqa: NO_ORDER

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
