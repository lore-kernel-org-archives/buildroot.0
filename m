From: Yann Sionneau <ysionneau@kalray.eu>
Date: Mon, 30 Sep 2019 18:16:03 +0200
Subject: [Buildroot] general question about patchelf and RPATH
Message-ID: <2b2ed104-854c-8d70-9b57-30bd6bd2fe1a@kalray.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I can see that patchelf does the following:

https://github.com/buildroot/buildroot/blob/master/package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch#L254

What happens then if the application needs to load a shared object via 
dlopen() (so not in DT_NEEDED) which is in a directory pointed to by 
RPATH like "$ORIGIN/testlib" like the tst-origin unit test of 
uclibc-ng-test does:

https://github.com/wbx-github/uclibc-ng-test/blob/master/test/dlopen/Makefile.in#L25

https://github.com/wbx-github/uclibc-ng-test/blob/master/test/dlopen/tst-origin.c#L15

I can see at least in my build that the RPATH gets stripped from the 
final ELF in the target dir.

see:

[ysionneau at junon build_dev_k1c]$ 
./host/bin/k1-buildroot-linux-uclibc-readelf -aW 
/work1/ysionneau/runpath/workspace/build_buildroot/build_dev_k1c/target/usr/lib/uclibc-ng-test/test/dlopen/tst-origin 
| grep RPATH
 ?0x000000000000000f (RPATH)????????????? Library rpath: [$ORIGIN/testlib]
[ysionneau at junon build_dev_k1c]$ 
/work1/ysionneau/runpath/workspace/build_buildroot/build_dev_k1c/host/bin/patchelf 
--make-rpath-relative 
/work1/ysionneau/runpath/workspace/build_buildroot/build_dev_k1c/target 
--no-standard-lib-dirs 
/work1/ysionneau/runpath/workspace/build_buildroot/build_dev_k1c/target/usr/lib/uclibc-ng-test/test/dlopen/tst-origin
[ysionneau at junon build_dev_k1c]$ 
./host/bin/k1-buildroot-linux-uclibc-readelf -aW 
/work1/ysionneau/runpath/workspace/build_buildroot/build_dev_k1c/target/usr/lib/uclibc-ng-test/test/dlopen/tst-origin 
| grep RPATH
[ysionneau at junon build_dev_k1c]$ 
./host/bin/k1-buildroot-linux-uclibc-readelf -aW 
/work1/ysionneau/runpath/workspace/build_buildroot/build_dev_k1c/target/usr/lib/uclibc-ng-test/test/dlopen/tst-origin 
| grep RUNPATH
 ?0x000000000000001d (RUNPATH)??????????? Library runpath: []

To be more precise, the RPATH is replaced by RUNPATH, but the RUNPATH is 
empty.

Then the unit test fails at runtime for me.

Thanks

-- 

Yann
