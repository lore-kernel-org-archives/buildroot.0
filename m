From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Jun 2014 12:13:35 +0200
Subject: [Buildroot] libcec needs to be patched to provide a correct
 libcec.pc
In-Reply-To: <XnsA34C3BC43515berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <20140613212754.GB16169@free.fr>
 <XnsA34C3BC43515berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20140614101335.GB3503@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-06-14 05:52 +0200, Bernd Kuhls spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
> news:20140613212754.GB16169 at free.fr:
> > Can you elaborate a bit on why and how we should patch libcec.pc,
> > please?
> 
> when libcec finds libudev during configure 
> output/staging/usr/lib/pkgconfig/libcec.pc will contain
> 
> Requires:  udev
> 
> When xbmc configure searches for libcec it finds this requirement and tries 
> to find udev.pc, which fails when only libudev is present:
> 
> checking for UDEV... yes
> configure: == libusb disabled. ==
> checking for CEC... no
> configure: error: == libcec disabled. CEC adapter support will not be 
> available. ==
> 
> xbmc/config.log shows:
> 
> configure:29084: $PKG_CONFIG --exists --print-errors "libcec >= 2.1.0"
> Package udev was not found in the pkg-config search path.
> Perhaps you should add the directory containing `udev.pc'
> to the PKG_CONFIG_PATH environment variable
> No package 'udev' found
> 
> So we need to patch libcec/configure.ac in line 237 from 
> 
> REQUIRES="$REQUIRES udev"
> 
> to
> 
> REQUIRES="$REQUIRES libudev"
> 
> to make xbmc happy.

Ah! OK, I get it now! Thanks for the thorough explanations. :-)

And indeed, my libudev-only small test-case obviously demonstrates the
above:

    $ ls -l staging/usr/lib/pkgconfig/
    total 8
    -rw-r--r-- 1 ymorin ymorin 278 Jun 13 22:58 libcec.pc
->  -rw-r--r-- 1 ymorin ymorin 509 Jun 13 22:49 libudev.pc

    $ cat staging/usr/lib/pkgconfig/libcec.pc
    prefix=/usr
    exec_prefix=/usr
    libdir=${exec_prefix}/lib
    includedir=${prefix}/include

    Name: libcec
    Description: Pulse-Eight CEC adapter library
    URL: http://www.pulse-eight.com/
    Version: 2:1:0
->  Requires:  udev
    Libs: -L${libdir} -lcec
    Cflags: -I${includedir} -I${includedir}/libcec


So, in case we only provide a libudev, can't we just simlink udev.pc to
libudev.pc  (or the other way around) as we won't patch every and all
packages in the wild?

I'll do the symlinking unless there is a good reason not to.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
