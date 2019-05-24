From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 24 May 2019 13:26:46 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/iputils: fix build with
 nettle
In-Reply-To: <20190521172325.30527-1-fontaine.fabrice@gmail.com>
References: <20190521172325.30527-1-fontaine.fabrice@gmail.com>
Message-ID: <20190524112644.GA22294@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

can you please merge this fix to next?
Thanks a lot.

Kind regards,
Petr

> Fixes:
>  - http://autobuild.buildroot.org/results/e86555090e27b631ba35214ef100aa9331844684

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-ninfod_name.c-fix-build-with-nettle.patch | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/iputils/0001-ninfod-ninfod_name.c-fix-build-with-nettle.patch

> diff --git a/package/iputils/0001-ninfod-ninfod_name.c-fix-build-with-nettle.patch b/package/iputils/0001-ninfod-ninfod_name.c-fix-build-with-nettle.patch
> new file mode 100644
> index 0000000000..796185011a
> --- /dev/null
> +++ b/package/iputils/0001-ninfod-ninfod_name.c-fix-build-with-nettle.patch
> @@ -0,0 +1,38 @@
> +From f209ebb91e65980bcdddce8cc12b00ec11623f76 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 21 May 2019 19:14:18 +0200
> +Subject: [PATCH] ninfod/ninfod_name.c: fix build with nettle
> +
> +Build of ninfod with nettle fails on:
> +/home/test/autobuild/run/instance-1/output/host/bin/mips64el-linux-gcc  -o ninfod/ninfod 'ninfod/0cb6efe@@ninfod at exe/ni_ifaddrs.c.o' 'ninfod/0cb6efe@@ninfod at exe/ninfod.c.o' 'ninfod/0cb6efe@@ninfod at exe/ninfod_addrs.c.o' 'ninfod/0cb6efe@@ninfod at exe/ninfod_core.c.o' 'ninfod/0cb6efe@@ninfod at exe/ninfod_name.c.o' -Wl,--no-undefined -Wl,--as-needed -Wl,-O1 -Wl,--start-group libcommon.a -lcap /home/test/autobuild/run/instance-1/output/host/usr/bin/../mips64el-buildroot-linux-uclibc/sysroot/usr/lib/libnettle.so -Wl,--end-group -pthread '-Wl,-rpath,$ORIGIN/..:/home/test/autobuild/run/instance-1/output/host/usr/bin/../mips64el-buildroot-linux-uclibc/sysroot/usr/lib' -Wl,-rpath-link,/home/test/autobuild/run/instance-1/output/build/iputils-s20190515/build/:/home/test/autobuild/run/instance-1/output/host/usr/bin/../mips64el-buildroot-linux-uclibc/sysroot/usr/lib
> +ninfod/0cb6efe@@ninfod at exe/ninfod_name.c.o: In function `init_nodeinfo_nodename':
> +ninfod_name.c:(.text+0x378): undefined reference to `MD5_Init'
> +
> +This error is raised because MD5_Init is not defined by nettle.
> +To fix this error, include iputils_md5dig.h if USE_NETTLE is defined.
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/e86555090e27b631ba35214ef100aa9331844684
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/iputils/iputils/pull/181]
> +---
> + ninfod/ninfod_name.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/ninfod/ninfod_name.c b/ninfod/ninfod_name.c
> +index daf606d..525c93d 100644
> +--- a/ninfod/ninfod_name.c
> ++++ b/ninfod/ninfod_name.c
> +@@ -95,7 +95,7 @@
> + 
> + #include <arpa/inet.h>
> + 
> +-#if defined(HAVE_GCRYPT_H) || defined(USE_KERNEL_CRYPTO_API)
> ++#if defined(HAVE_GCRYPT_H) || defined(USE_KERNEL_CRYPTO_API) || defined(USE_NETTLE)
> + # include "iputils_md5dig.h"
> + #elif defined(HAVE_GNUTLS_OPENSSL_H)
> + # include <gnutls/openssl.h>
> +-- 
> +2.20.1
> +
