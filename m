From: Gorka Lertxundi <glertxundi@gmail.com>
Date: Mon, 30 Oct 2017 13:57:24 +0100
Subject: [Buildroot] Unable to build an image with systemd
Message-ID: <CAJCNcEb8aemsJ3YrRwK78mv_XTAOsTx54mWaGBoy22uF6zAynA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

Yesterday I run into this issue I didn't know how to proceed, can anyone
help me?

configure: error: *** libmount support required but libraries not found
package/pkg-generic.mk:217: recipe for target
'/buildroot-src/output/build/systemd-234/.stamp_configured' failed
make: *** [/buildroot-src/output/build/systemd-234/.stamp_configured] Error
1

Cross compiling to ARM using the 2017.08.1 release which supposedly has the
systemd and libmount issue solved long time ago[1]. I don't know how it's
possible my build is outputting that all the time.

systemd uses pkg-config to check if libmount exists and, as expected, using
the host-deployed pkg-config wasn't able to find it.

root at 2f591ceac91d:/buildroot-src# /buildroot-src/output/host/bin/pkg-config
--libs blkid
-L/buildroot-src/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib
-lblkid

root at 2f591ceac91d:/buildroot-src# /buildroot-src/output/host/bin/pkg-config
--libs mount
Package mount was not found in the pkg-config search path.
Perhaps you should add the directory containing `mount.pc'
to the PKG_CONFIG_PATH environment variable
Package 'mount', required by 'world', not found

I manually created mount.pc in
"output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/pkgconfig/mount.pc"
equalling
to the its "twin" blkid.pc content (changing library references of course
;) and this fixes the libmount detection but after a while it crashes:

src/core/manager.h:22:22: fatal error: libmount.h: No such file or directory
 #include <libmount.h>
                      ^
compilation terminated.
Makefile:17010: recipe for target 'src/core/libcore_la-manager.lo' failed
make[3]: *** [src/core/libcore_la-manager.lo] Error 1
Makefile:16996: recipe for target 'src/core/libcore_la-unit-printf.lo'
failed
make[3]: *** [src/core/libcore_la-unit-printf.lo] Error 1
cc1: warning:
/buildroot-src/output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/libmount:
No such file or directory [-Wmissing-include-dirs]
In file included from src/core/emergency-action.h:36:0,
                 from src/core/unit.h:32,
                 from src/core/job.h:115,
                 from src/core/transaction.h:25,
                 from src/core/transaction.c:27:
src/core/manager.h:22:22: fatal error: libmount.h: No such file or directory
 #include <libmount.h>
                      ^
compilation terminated.
Makefile:17017: recipe for target 'src/core/libcore_la-transaction.lo'
failed
make[3]: *** [src/core/libcore_la-transaction.lo] Error 1
Makefile:23270: recipe for target 'all-recursive' failed
make[2]: *** [all-recursive] Error 1
Makefile:10413: recipe for target 'all' failed
make[1]: *** [all] Error 2
make[1]: Leaving directory '/buildroot-src/output/build/systemd-234'
package/pkg-generic.mk:227: recipe for target
'/buildroot-src/output/build/systemd-234/.stamp_built' failed
make: *** [/buildroot-src/output/build/systemd-234/.stamp_built] Error 2

So something weird is going on or i'm missing something.

Thanks in advance,

[1] http://lists.busybox.net/pipermail/buildroot/2014-December/114892.html
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171030/0b6b527e/attachment.html>
