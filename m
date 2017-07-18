From: Charles Hardin <ckhardin@exablox.com>
Date: Mon, 17 Jul 2017 20:00:56 -0700
Subject: [Buildroot] [RFC] best way to fix a valgrind gcc 5 compile error on
	MIPS Octeon2
Message-ID: <CAAnoztGZF5pH9jfxt4TN9--HwdvzVus1L+5QNPcQ76H-cbfGqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So compiling for a Cavium Octeon 2 processor with 2017.02.x yields the
following error.


/home/vagrant/onebloxv1_rootfs.build/host/usr/bin/mips64-linux-gcc
-DHAVE_CONFIG_H -I. -I..  -I.. -I../include -I../VEX/pub -I../VEX/pub
-DVGA_mips64=1 -DVGO_linux=1 -DVGP_mips64_linux=1
-DVGPV_mips64_linux_vanilla=1 -Ipriv -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -g -std=gnu99 -Wall
-Wmissing-prototypes -Wshadow -Wpointer-arith -Wstrict-prototypes
-Wmissing-declarations -Wcast-align -Wcast-qual -Wwrite-strings
-Wempty-body -Wformat -Wformat-security -Wignored-qualifiers
-Wmissing-parameter-type -Wold-style-declaration -fno-stack-protector
-fno-strict-aliasing -fno-builtin  -march=mips64 -Wbad-function-cast
-fstrict-aliasing -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -O2 -g2 -fno-stack-protector -march=octeon2 -c -o
priv/libvex_mips64_linux_a-main_globals.o `test -f 'priv/main_globals.c' ||
echo './'`priv/main_globals.c

*priv/main_globals.c:1:0:* *error: *'*-mips64*' conflicts with the other
architecture options, which specify a mips64r2 processor



* ^*

Makefile:1309: recipe for target
'priv/libvex_mips64_linux_a-main_globals.o' failed

make[6]: *** [priv/libvex_mips64_linux_a-main_globals.o] Error 1

make[6]: *** Waiting for unfinished jobs....



The quickest/dirtiest/probably wrong solution I tried was to switch to an
"mtune" instead of doubling on the march.

*diff --git a/package/valgrind/valgrind.mk <http://valgrind.mk>
b/package/valgrind/valgrind.mk <http://valgrind.mk>*

*index ccc6cc3..031e648 100644*

*--- a/package/valgrind/valgrind.mk <http://valgrind.mk>*

*+++ b/package/valgrind/valgrind.mk <http://valgrind.mk>*

@@ -34,7 +34,7 @@ VALGRIND_CFLAGS = \

 # and pass the right -march option, so they take precedence over

 # Valgrind's wrongfully detected value.

 ifeq ($(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),y)

-VALGRIND_CFLAGS += -march=$(BR2_GCC_TARGET_ARCH)

+VALGRIND_CFLAGS += -mtune=$(BR2_GCC_TARGET_ARCH)

 endif



 VALGRIND_CONF_ENV = CFLAGS="$(VALGRIND_CFLAGS)"



And that gets past the compiler errors... so??? is that what people are
doing in this case?

Regards,
Charles
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170717/7134c93c/attachment.html>
