From: Carlos Santos <unixmania@gmail.com>
Date: Thu, 12 Dec 2019 10:25:51 -0300
Subject: [Buildroot] [PATCH] modem-manager: bump to version 1.12.2
In-Reply-To: <CAAP7ucJR+0h_pJfD63eOvWiYqtHT1GyRpBtpjSPqMtw_gPhudw@mail.gmail.com>
References: <20191212093325.2178579-1-aleksander@aleksander.es>
 <CAJ4jsafsOvYMfXBpMipUSz69G=+PHLV59UzN1FvGnYyrr2L1RQ@mail.gmail.com>
 <CAAP7ucLxYCT=+j+2dEhLBKAuB74gjDdyA5Obz4Rk=LvgNaxXtw@mail.gmail.com>
 <CAJ4jsadmZEQwQdt0tr=apUw-pJN5zxJBsN1ZDksYFHnn8F1A5A@mail.gmail.com>
 <CAAP7ucJR+0h_pJfD63eOvWiYqtHT1GyRpBtpjSPqMtw_gPhudw@mail.gmail.com>
Message-ID: <CAJ4jsacyb6DEy6yBBTBN0pNdvcR0=rtU7mAvFt0crHSwhS=CoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 12, 2019 at 10:14 AM Aleksander Morgado
<aleksander@aleksander.es> wrote:
>
> > > >
> > > > I still see an error similar to the one in
> > > > http://autobuild.buildroot.net/results/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/
> > > > in a clean build after applying the patch to bump libqmi o 1.24.2 and
> > > > this one:
> > > >
> > >
> > > Did you run autoreconf in srcdir after applying the patch manually?
> >
> > 2019-12-12T07:30:18 Applying
> > 0001-build-fix-order-of-linked-libs-in-test-apps.patch using patch:
> > 2019-12-12T07:30:18 patching file test/Makefile.am
> > 2019-12-12T07:30:18 >>> modem-manager 1.12.2 Updating config.sub and
> > config.guess
> > 2019-12-12T07:30:18 for file in config.guess config.sub; do for i in
> > $(find /work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/build/modem-manager-1.12.2
> > -name $file); do cp support/gnuconfig/$file $i; done; done
> > 2019-12-12T07:30:18 >>> modem-manager 1.12.2 Configuring
> > 2019-12-12T07:30:18 >>> modem-manager 1.12.2 Autoreconfiguring
> >
> > > Not sure how that would be done when rebuilding using the
> > > br-reproduce-build setup.
> >
> > I don't use br-reproduce-build setup. I just applied the patches on
> > buildroot using git am ran a build using the same defconfig of build
> > 0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a.
> >
> > > Can you tell me what's the value of mmsmspdu_DEPENDENCIES in the
> > > "test/Makefile" file you have in your build? It should be something
> > > like this:
> > > mmsmspdu_DEPENDENCIES = $(am__DEPENDENCIES_1) \
> > >         $(top_builddir)/libmm-glib/libmm-glib.la \
> > >         $(top_builddir)/src/libhelpers.la
> > >
> > >
> > > (i.e. libmm-glib.la listed before libhelpers.la)
> >
> > mmsmspdu_DEPENDENCIES = $(am__DEPENDENCIES_1) \
> >         $(top_builddir)/libmm-glib/libmm-glib.la \
> >         $(top_builddir)/src/libhelpers.la
> >
>
> Oh, this is very strange then. Could you run the build with V=s to see
> the full compilation commands?
>
> --
> Aleksander
> https://aleksander.es

2019-12-12T10:25:19 Making all in test
2019-12-12T10:25:19 /bin/sh ../libtool  --tag=CC   --mode=link
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/bin/arm-linux-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os
 -static  -static -o mmsmspdu mmsmspdu-mmsmspdu.o -Wl,--export-dynamic
-lgmodule-2.0 -lblkid -lgio-2.0 -lgobject-2.0 -lffi -lgmodule-2.0
-lglib-2.0 -pthread -lm -lpcre -lz -lmount -lblkid
../libmm-glib/libmm-glib.la ../src/libhelpers.la
2019-12-12T10:25:19 libtool: link:
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/bin/arm-linux-gcc
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
-static -static -o mmsmspdu mmsmspdu-mmsmspdu.o -Wl,--export-dynamic
-pthread  ../libmm-glib/.libs/libmm-glib.a ../src/.libs/libhelpers.a
-lqmi-glib -lmbim-glib -lgio-2.0 -lgobject-2.0 -lffi -lgmodule-2.0
-lglib-2.0 -lm -lpcre -lz -lmount -lblkid -pthread
2019-12-12T10:25:20
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
../src/.libs/libhelpers.a(mm-modem-helpers.o): in function
`mm_3gpp_cesq_response_to_signal_info':
2019-12-12T10:25:20 mm-modem-helpers.c:(.text+0x3e38): undefined
reference to `mm_signal_new'
2019-12-12T10:25:20
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
mm-modem-helpers.c:(.text+0x3e44): undefined reference to
`mm_signal_set_rssi'
2019-12-12T10:25:20
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
mm-modem-helpers.c:(.text+0x3e5c): undefined reference to
`mm_signal_new'
2019-12-12T10:25:20
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
mm-modem-helpers.c:(.text+0x3e68): undefined reference to
`mm_signal_set_rscp'
2019-12-12T10:25:20
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
mm-modem-helpers.c:(.text+0x3e88): undefined reference to
`mm_signal_new'
2019-12-12T10:25:20
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
mm-modem-helpers.c:(.text+0x3e98): undefined reference to
`mm_signal_set_ecio'
2019-12-12T10:25:20
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
mm-modem-helpers.c:(.text+0x3eb0): undefined reference to
`mm_signal_new'
2019-12-12T10:25:20
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
mm-modem-helpers.c:(.text+0x3ebc): undefined reference to
`mm_signal_set_rsrq'
2019-12-12T10:25:20
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
mm-modem-helpers.c:(.text+0x3edc): undefined reference to
`mm_signal_new'
2019-12-12T10:25:20
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
mm-modem-helpers.c:(.text+0x3eec): undefined reference to
`mm_signal_set_rsrp'
2019-12-12T10:25:20
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
../src/.libs/libhelpers.a(mm-modem-helpers.o): in function
`mm_parse_cclk_response':
2019-12-12T10:25:20 mm-modem-helpers.c:(.text+0x7484): undefined
reference to `mm_network_timezone_new'
2019-12-12T10:25:20
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/7.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
mm-modem-helpers.c:(.text+0x7494): undefined reference to
`mm_network_timezone_set_offset'
2019-12-12T10:25:20 collect2: error: ld returned 1 exit status
2019-12-12T10:25:20 make[4]: *** [Makefile:530: mmsmspdu] Error 1
2019-12-12T10:25:20 make[3]: *** [Makefile:502: all-recursive] Error 1
2019-12-12T10:25:20 make[2]: *** [Makefile:434: all] Error 2
2019-12-12T10:25:20 make[1]: *** [package/pkg-generic.mk:260:
/work/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a/build/modem-manager-1.12.2/.stamp_built]
Error 2
2019-12-12T10:25:20 make: *** [Makefile:23: _all] Error 2


-- 
Carlos Santos <unixmania@gmail.com>
