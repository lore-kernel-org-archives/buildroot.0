From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Sat, 29 Nov 2014 22:54:20 +0100
Subject: [Buildroot] toolchain/helpers.mk: check_musl fails
Message-ID: <1417298060.18257.12.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I've build an internal Buildroot toolchain with the latest musl C
library. Now I want to use this toolchain as an external toolchain. I've
copied output/host/usr/ to a new place and changed the KConfig menu
entry to external toolchain.

make fails with the following error:
        Incorrect selection of the C library

toolchain/helpers.mk/check-musl is:
        check_musl = \
        	SYSROOT_DIR="$(strip $1)"; \
        	if test ! -f $${SYSROOT_DIR}/lib/libc.so -o -e
        $${SYSROOT_DIR}/lib/libm.so ; then \
        		echo "Incorrect selection of the C library" ; \
        		exit -1; \
        	fi

I've checked the SYSROOT_DIR variable in helpers.mk/check-musl:
        SYSROOT_DIR: /home/joerg/Development/toolchain/musl-gcc/usr/arm-buildroot-linux-musleabi/sysroot/
        

[joerg at nzxt sysroot]$ cd /home/joerg/Development/toolchain/musl-gcc/usr/arm-buildroot-linux-musleabi/sysroot/
[joerg at nzxt sysroot]$ ls -l lib
total 1344
lrwxrwxrwx 1 joerg joerg      16 25. Nov 19:19 ld-musl-arm.so.1 -> /usr/lib/libc.so
-rw-r--r-- 1 joerg joerg     132 25. Nov 19:19 libgcc_s.so
-rw-r--r-- 1 joerg joerg 1368741 25. Nov 19:19 libgcc_s.so.1
[joerg at nzxt sysroot]$ ls -l usr/lib
total 14180
-rw-r--r-- 1 joerg joerg     920 25. Nov 19:19 crt1.o
-rw-r--r-- 1 joerg joerg     832 25. Nov 19:19 crti.o
-rw-r--r-- 1 joerg joerg     812 25. Nov 19:19 crtn.o
-rw-r--r-- 1 joerg joerg 1893224 25. Nov 19:19 libc.a
-rw-r--r-- 1 joerg joerg       8 25. Nov 19:19 libcrypt.a
-rwxr-xr-x 1 joerg joerg  737808 25. Nov 19:19 libc.so
-rw-r--r-- 1 joerg joerg       8 25. Nov 19:19 libdl.a
-rw-r--r-- 1 joerg joerg       8 25. Nov 19:19 libm.a
-rw-r--r-- 1 joerg joerg       8 25. Nov 19:19 libpthread.a
-rw-r--r-- 1 joerg joerg       8 25. Nov 19:19 libresolv.a
-rw-r--r-- 1 joerg joerg       8 25. Nov 19:19 librt.a
-rw-r--r-- 1 joerg joerg 7812470 25. Nov 19:19 libstdc++.a
lrwxrwxrwx 1 joerg joerg      19 25. Nov 19:19 libstdc++.so -> libstdc++.so.6.0.20
lrwxrwxrwx 1 joerg joerg      19 25. Nov 19:19 libstdc++.so.6 -> libstdc++.so.6.0.20
-rwxr-xr-x 1 joerg joerg 4013497 25. Nov 19:19 libstdc++.so.6.0.20
-rw-r--r-- 1 joerg joerg    2419 25. Nov 19:19 libstdc++.so.6.0.20-gdb.py
-rw-r--r-- 1 joerg joerg       8 25. Nov 19:19 libutil.a
-rw-r--r-- 1 joerg joerg       8 25. Nov 19:19 libxnet.a
-rw-r--r-- 1 joerg joerg     992 25. Nov 19:19 Scrt1.o

Any ideas or suggestions?

Best regards
J?rg
