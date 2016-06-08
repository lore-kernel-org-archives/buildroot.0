From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 00:09:39 +0200
Subject: [Buildroot] Static + PIE support
Message-ID: <20160609000939.63366906@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Waldemar,

We discussed a while ago the problem of supporting the static + PIE
scenario, which currently causes some build failures of the Go-based
flannel package, due to Scrt1.o being missing.

On IRC, you told me that Scrt1.o is properly produced by uClibc, and it
looks like you suspected there was some issue in how Buildroot then
packages the toolchain. So I looked at the build log of my toolchains,
and here is what I found.

If I looked at the build log of the br-arm-full toolchain (an uClibc-ng
based toolchain for ARM, with all features enabled: C++, locales,
threads, wchar, etc.), I do see Scrt1.o being built:

  AS lib/crt1.o
  AS lib/Scrt1.o
  AS lib/crti.o
  AS lib/crtn.o

Then installed:

install -m 644 ./lib/crt1.o ./lib/Scrt1.o ./lib/crti.o ./lib/crtn.o   /opt/br-arm-full-2016.05-2-g5dabb45/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib//

And it is properly present in the toolchain tarball:

test at build:/opt$ tar tvf br-arm-full-2016.05-2-g5dabb45.tar.bz2  | grep crt
-rw-r--r-- test/test       972 2016-06-01 14:27 br-arm-full-2016.05-2-g5dabb45/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/crtn.o
-rw-r--r-- test/test       988 2016-06-01 14:27 br-arm-full-2016.05-2-g5dabb45/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/crti.o
-rw-r--r-- test/test      1004 2016-06-01 14:27 br-arm-full-2016.05-2-g5dabb45/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/crt1.o
-rw-r--r-- test/test      1080 2016-06-01 14:27 br-arm-full-2016.05-2-g5dabb45/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/Scrt1.o
-rw-r--r-- test/test      1108 2016-06-01 14:31 br-arm-full-2016.05-2-g5dabb45/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.8.5/crtendS.o
-rw-r--r-- test/test      1108 2016-06-01 14:31 br-arm-full-2016.05-2-g5dabb45/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.8.5/crtend.o
-rw-r--r-- test/test      2528 2016-06-01 14:31 br-arm-full-2016.05-2-g5dabb45/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.8.5/crtbegin.o
-rw-r--r-- test/test      2528 2016-06-01 14:31 br-arm-full-2016.05-2-g5dabb45/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.8.5/crtbeginT.o
-rw-r--r-- test/test      2928 2016-06-01 14:31 br-arm-full-2016.05-2-g5dabb45/lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.8.5/crtbeginS.o

However, the flannel failures don't happen with br-arm-full, but only
with br-arm-full-static, which is the same toolchain, but built with
BR2_STATIC_LIBS=y. Due to this, uClibc is built with HAVE_SHARED
disabled.

And in this case, Scrt1.o is not built:

  AS lib/crt1.o
  AS lib/crti.o
  AS lib/crtn.o

And it is not installed:

install -m 644 ./lib/crt1.o ./lib/crti.o ./lib/crtn.o   /opt/br-arm-full-static-2016.05-2-g5dabb45/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib//

This explains why there is no Scrt1.o in the generated Buildroot
toolchain.

So I continue to believe that the problem is on uClibc's side, and not
on Buildroot's side.

It would be good if you could investigate why uClibc doesn't produce
Scrt1.o when HAVE_SHARED is disabled.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
