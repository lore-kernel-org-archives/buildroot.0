From: Markus Mayer <mmayer@broadcom.com>
Date: Wed,  9 Jun 2021 16:48:18 -0700
Subject: [Buildroot] [PATCH 0/1] mtd-utils-2.1.2: ubihealthd depends on
 ubifs support
Message-ID: <20210609234819.1860554-1-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

With the enabling of ubihealthd, we are experiencing a new build
failure.

https://git.buildroot.net/buildroot/commit/?id=77a0167155c3

Here is what is happening:

>>> mtd 2.1.2 Installing to target
[...]
/usr/bin/install -D -m 0755
  /home/mmayer/Development/br-current/output/arm64/build/mtd-2.1.2/ubiformat
  /home/mmayer/Development/br-current/output/arm64/target/usr/sbin/ubiformat
/usr/bin/install -D -m 0755
  /home/mmayer/Development/br-current/output/arm64/build/mtd-2.1.2/ubihealthd
  /home/mmayer/Development/br-current/output/arm64/target/usr/sbin/ubihealthd
/usr/bin/install: cannot stat
  '/home/mmayer/Development/br-current/output/arm64/build/mtd-2.1.2/ubihealthd':
  No such file or directory
make[1]: *** [package/pkg-generic.mk:341:
/home/mmayer/Development/br-current/output/arm64/build/mtd-2.1.2/.stamp_target_installed]
Error 1
make: *** [Makefile:27: _all] Error 2

The problem is the following:

1. We are building with BR2_PACKAGE_MTD_UBIFS_UTILS unset and,
therefore, with --without-ubifs.

2. Building without ubifs leads to "configure" setting its internal
variable need_getrandom="no", which trickles down through the autoconf
environment.

3. Without getrandom, ubihealthd is not being built
?
From mtd-2.1.2/ubi-utils/Makemodule.am:

?49 if WITH_GETRANDOM
?50 UBI_BINS += ubihealthd
?51 endif

The mtd-utils package is consistent within itself. Everything works as
long as "make install" is being called, because it won't try to install
ubihealthd, unless it also built it. However, Buildroot has its own
install routine. It thinks ubihealthd is enabled and has been built.
Therefore, it tries to install it -- which doesn't work if
BR2_PACKAGE_MTD_UBIFS_UTILS is unset.

This patch mirrors the --with-ubifs -> ubihealthd dependency within
Buildroot. In my tests, it worked either way. It will built and install
ubihealthd (when BR2_PACKAGE_MTD_MKFSUBIFS=y) or it will skip building
and installing ubihealthd (when BR2_PACKAGE_MTD_MKFSUBIFS is unset).

Thanks,
-Markus

Markus Mayer (1):
  mtd-utils-2.1.2: ubihealthd depends on ubifs support

 package/mtd/Config.in | 1 +
 1 file changed, 1 insertion(+)

-- 
2.25.1
