From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 7 May 2017 00:57:14 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-05-05
In-Reply-To: <20170506062848.3CE3120C7A@mail.free-electrons.com>
References: <20170506062848.3CE3120C7A@mail.free-electrons.com>
Message-ID: <20170506215714.frikpdlcuwom57fm@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Sat, May 06, 2017 at 08:28:48AM +0200, Thomas Petazzoni wrote:
>          arm |                 wpan-tools-0.7 | NOK | http://autobuild.buildroot.net/results/7091ad71e743efb5fd530357b0f59c5c2b0e6d8f |     

Seems to be related to the recent libnl version bump, though I could not 
figure out how. I could not reproduce this failure here, even after installing 
host libnl header files.

For some reason the following wpan-tools macro evaluates to true:

src/nl_extras.h:
#if (LIBNL_VER_MIN < 2) || (LIBNL_VER_MIN == 2) && (LIBNL_VER_MIC <= 26)

libnl defines the following:

include/netlink/version.h:
#define LIBNL_VER_MAJ       3
#define LIBNL_VER_MIN       3
#define LIBNL_VER_MIC       0

Running make with V=1 shows the following command line:

.../output/host/usr/bin/arm-none-linux-gnueabi-gcc -std=gnu99 -DHAVE_CONFIG_H -I. -I..   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -I.../output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include/libnl3   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -c -o iwpan-interface.o `test -f 'interface.c' || echo './'`interface.c

No host headers as far as I can see.

Any idea?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
