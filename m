From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 23 Mar 2020 22:23:26 +0100
Subject: [Buildroot] iputils failures
In-Reply-To: <20200323210537.GB30642@dell5510>
References: <5e78648f.1c69fb81.748d4.e737SMTPIN_ADDED_MISSING@mx.google.com>
 <20200323210537.GB30642@dell5510>
Message-ID: <CAPi7W80h-+Sp_HygfO5LtA23Uc7cWdiPfZcEEoSj1LB9ABLucg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Petr,

Le lun. 23 mars 2020 ? 22:05, Petr Vorel <petr.vorel@gmail.com> a ?crit :
>
> Hi,
>
> >     arch     |             reason             |                                       url
> > -------------+--------------------------------+---------------------------------------------------------------------------------
> > microblazeel |        iputils-20190709        | http://autobuild.buildroot.net/results/09d8c395e29e0e3f291698bb4982ab7d1a573c36
> I'm not sure, how to fix this error [1]:
>
> [12/26] Linking target ping.
> FAILED: ping
> /home/buildroot/autobuild/run/instance-0/output-1/host/bin/microblazeel-buildroot-linux-uclibc-gcc  -o ping 'ping at exe/ping.c.o' 'ping at exe/ping_common.c.o' 'ping at exe/ping6_common.c.o' -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -static -Wl,--start-group libcommon.a -lm /home/buildroot/autobuild/run/instance-0/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libidn2.a /home/buildroot/autobuild/run/instance-0/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a /home/buildroot/autobuild/run/instance-0/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a -lresolv -Wl,--end-group '-Wl,-rpath,$ORIGIN/' -Wl,-rpath-link,/home/buildroot/autobuild/run/instance-0/output-1/build/iputils-20190709/build/
> /home/buildroot/autobuild/run/instance-0/output-1/host/lib/gcc/microblazeel-buildroot-linux-uclibc/8.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/run/instance-0/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libidn2.a(striconveh.o): in function `iconv_carefully_1':
> (.text+0x8c): undefined reference to `libiconv'
>
> => libidn2 uses libiconv. There is check for it's dependency in package/libidn2/libidn2.mk
> LIBIDN2_DEPENDENCIES = \
> ...
> $(if $(BR2_PACKAGE_LIBICONV),libiconv)
>
> but that does not help. Is it libiconv failure or iputils failure? And is it
> buildroot setup problem or upstream issue?
The issue is due to the meson build system which does not retrieve
-liconv from libidn2.pc as it does not call pkg-config with --static
argument.
I sent a patch to fix this more than one month ago:
https://patchwork.ozlabs.org/patch/1238548.
The upstream Pull Request is still open a upstream is reluctant to
merge it: https://github.com/mesonbuild/meson/pull/6629.
This issue raise build failures with all meson packages when building
statically including iputils but also libglib2.
> In worst case disabling libidn2 for iputils for static build would fix this.
>
> Kind regards,
> Petr
>
> [1] http://autobuild.buildroot.net/results/09d8c395e29e0e3f291698bb4982ab7d1a573c36/build-end.log
Best Regards,

Fabrice
