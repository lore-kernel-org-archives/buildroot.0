From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 23 Mar 2020 22:05:37 +0100
Subject: [Buildroot] iputils failures
In-Reply-To: <5e78648f.1c69fb81.748d4.e737SMTPIN_ADDED_MISSING@mx.google.com>
References: <5e78648f.1c69fb81.748d4.e737SMTPIN_ADDED_MISSING@mx.google.com>
Message-ID: <20200323210537.GB30642@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

>     arch     |             reason             |                                       url                                      
> -------------+--------------------------------+---------------------------------------------------------------------------------
> microblazeel |        iputils-20190709        | http://autobuild.buildroot.net/results/09d8c395e29e0e3f291698bb4982ab7d1a573c36
I'm not sure, how to fix this error [1]:

[12/26] Linking target ping.
FAILED: ping
/home/buildroot/autobuild/run/instance-0/output-1/host/bin/microblazeel-buildroot-linux-uclibc-gcc  -o ping 'ping at exe/ping.c.o' 'ping at exe/ping_common.c.o' 'ping at exe/ping6_common.c.o' -Wl,--as-needed -Wl,--no-undefined -Wl,-O1 -static -Wl,--start-group libcommon.a -lm /home/buildroot/autobuild/run/instance-0/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libidn2.a /home/buildroot/autobuild/run/instance-0/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a /home/buildroot/autobuild/run/instance-0/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libcrypto.a -lresolv -Wl,--end-group '-Wl,-rpath,$ORIGIN/' -Wl,-rpath-link,/home/buildroot/autobuild/run/instance-0/output-1/build/iputils-20190709/build/
/home/buildroot/autobuild/run/instance-0/output-1/host/lib/gcc/microblazeel-buildroot-linux-uclibc/8.3.0/../../../../microblazeel-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/run/instance-0/output-1/host/microblazeel-buildroot-linux-uclibc/sysroot/usr/lib/libidn2.a(striconveh.o): in function `iconv_carefully_1':
(.text+0x8c): undefined reference to `libiconv'

=> libidn2 uses libiconv. There is check for it's dependency in package/libidn2/libidn2.mk
LIBIDN2_DEPENDENCIES = \
...
$(if $(BR2_PACKAGE_LIBICONV),libiconv)

but that does not help. Is it libiconv failure or iputils failure? And is it
buildroot setup problem or upstream issue?
In worst case disabling libidn2 for iputils for static build would fix this.

Kind regards,
Petr

[1] http://autobuild.buildroot.net/results/09d8c395e29e0e3f291698bb4982ab7d1a573c36/build-end.log
