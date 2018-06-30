From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Jun 2018 21:28:37 +0200
Subject: [Buildroot] [PATCH] alsa-utils: bat needs fftw single precision
In-Reply-To: <9349ba14bbc58c62f1824ef2742479972060e732.1530251879.git.baruch@tkos.co.il>
References: <9349ba14bbc58c62f1824ef2742479972060e732.1530251879.git.baruch@tkos.co.il>
Message-ID: <20180630212837.69ba14de@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Fri, 29 Jun 2018 08:57:59 +0300, Baruch Siach wrote:
> Otherwise the configure check for fftw fails, and alsabat does not link
> with libfftw. We can not select a config choice, so depend on single
> precision instead.
> 
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Well, if the alsabat binary can be produced without linking to libfftw,
it means libfftw is not a mandatory dependency of alsabat, but only an
optional dependency, and therefore there is no need to select/depends
on FFTW.

I tested a build with fftw in double precision, and indeed, alsabat
isn't linked with libfftw:

$ readelf -d output/target/usr/bin/alsabat 

Dynamic section at offset 0x6f28 contains 22 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libasound.so.2]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

But alsabat has been built/installed nonetheless, so FFTW is not a
mandatory dependency.

And indeed, the only code that uses FFTW is properly enclosed in:

if HAVE_LIBFFTW3
alsabat_SOURCES += analyze.c
noinst_HEADERS += analyze.h
endif

Could you turn FFTW into an optional dependency instead ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
