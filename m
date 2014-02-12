From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 12 Feb 2014 13:29:35 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CAAXf6LXTF0XKg-pBGKhDmxV+VPULPSxhJm84UnfzUH=kGa3MNA@mail.gmail.com>
References: <20140212073007.B3242100CEB@stock.ovh.net>
 <20140212093245.49e2b6ac@skate>
 <CAAXf6LXjfkZ=3_fFPowo3k2HHyUkSpiHnOfGG=HS=0icjYBXhA@mail.gmail.com>
 <20140212104745.61ea39bd@skate>
 <CAAXf6LUDUyWxQ_cf2+TapCcSoB0=HRs2_413MH_FCXN56C3R_Q@mail.gmail.com>
 <CAAXf6LXTF0XKg-pBGKhDmxV+VPULPSxhJm84UnfzUH=kGa3MNA@mail.gmail.com>
Message-ID: <CAAXf6LVVkFtkFiL-9AD918JTeTPf4zgUf=RQsp4XZUOBVUaTDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, Feb 12, 2014 at 12:39 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
[..]
>
> With the alsa-lib patch applied, this is the next problem in
> alsa-utils (Blackfin FLAT config):
> checking for ALSA CFLAGS...
> checking for ALSA LDFLAGS...  -lasound -lm -ldl -lpthread
> checking for libasound headers version >= 1.0.24... found.
> checking for snd_ctl_open in -lasound... no
> configure: error: No linkable libasound was found.
> make: *** [/home/tdescham/repo/contrib/buildroot-alsa/output/build/alsa-utils-1.0.26/.stamp_configured]
> Error 1
>
>
> which is apparently the same problem as reported with bug #5774 (Not
> able to build ALSA-Utils for static build)
>
> The config.log says:
> configure:7019: checking for ALSA CFLAGS
> configure:7025: result:
> configure:7028: checking for ALSA LDFLAGS
> configure:7037: result:  -lasound -lm -ldl -lpthread
> configure:7042: checking for libasound headers version >= 1.0.24
> configure:7104:
> /home/tdescham/repo/contrib/buildroot-alsa/output/host/usr/bin/bfin-uclinux-gcc
> -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> -pipe -Os   -Wl,-elf2flt -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 conftest.c >&5
> configure:7104: $? = 0
> configure:7105: result: found.
> configure:7124: checking for snd_ctl_open in -lasound
> configure:7149:
> /home/tdescham/repo/contrib/buildroot-alsa/output/host/usr/bin/bfin-uclinux-gcc
> -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64  -pipe -Os   -Wl,-elf2flt -D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -elf2flt --static
> conftest.c -lasound   -lasound -lm -ldl -lpthread  >&5
> /home/tdescham/repo/contrib/buildroot-alsa/output/host/usr/bfin-buildroot-uclinux-uclibc/sysroot/usr/lib/libasound.a(pcm_dmix.o):
> In function `_snd_pcm_dmix_start_timer':
> pcm_dmix.c:(.text+0x53a): warning:
> /home/tdescham/repo/contrib/buildroot-alsa/output/host/opt/ext-toolchain/bfin-uclinux/bfin-uclinux/bin/ld.real:
> cannot find -ldl
> collect2: ld returned 1 exit status
>
>
> The relevant autoconf macro is AM_PATH_ALSA, defined in
> output/build/alsa-utils-1.0.26/aclocal.m4.
> However, what is the right solution?
> I assume we need to add a check to verify whether libdl is needed, correct?
> Any autoconf wizzkids in the house?

I found this snippet:
AC_CHECK_LIB(c, dlopen, LIBDL="", [AC_CHECK_LIB(dl, dlopen, LIBDL="-ldl")])

which would be used as follows in aclocal.m4:
-ALSA_LIBS="$ALSA_LIBS -lasound -lm -ldl -lpthread"
+ALSA_LIBS="$ALSA_LIBS -lasound -lm $LIBDL -lpthread"

but aclocal.m4 seems to be regenerated with autoreconf. How can you
make changes in that file?
I tried adding an m4 file in the m4 subdirectory, adding it to the Makefile.am.
But how to regenerate aclocal.m4?

Thanks,
Thomas
