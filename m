From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 14:59:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/pipewire: fix build with
 uclibc-ng
In-Reply-To: <20210504211016.1216759-1-fontaine.fabrice@gmail.com>
References: <20210504211016.1216759-1-fontaine.fabrice@gmail.com>
Message-ID: <20210518125906.GJ2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-05-04 23:10 +0200, Fabrice Fontaine spake thusly:
> Build fails with uclibc-ng since bump to version 0.3.26 in commit
> a6d88d3ba5e30e11f4d726f341bc56c1be7c71c9
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a45f0ee009d90cef867dee4b1093225610fa10df
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

However, we've also bumped the version in the next branch, and it
includes this patch, but it seems that was not enough:

    https://git.busybox.net/buildroot/commit/?h=next&id=b003cb5d16de9c92baba7dea7a6626c71cefc4fb
    http://lists.busybox.net/pipermail/buildroot/2021-May/310023.html

If you have some CPU cycles available, could you have a look and see
why this is the case?

Regards,
Yann E. MORIN.

> ---
>  ...meson.build-fix-build-with-uclibc-ng.patch | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 package/pipewire/0002-meson.build-fix-build-with-uclibc-ng.patch
> 
> diff --git a/package/pipewire/0002-meson.build-fix-build-with-uclibc-ng.patch b/package/pipewire/0002-meson.build-fix-build-with-uclibc-ng.patch
> new file mode 100644
> index 0000000000..36b14d3f16
> --- /dev/null
> +++ b/package/pipewire/0002-meson.build-fix-build-with-uclibc-ng.patch
> @@ -0,0 +1,52 @@
> +From 8f1de87381d270a8f4e5927187ae0466a9c9504a Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 4 May 2021 22:56:54 +0200
> +Subject: [PATCH] meson.build: fix build with uclibc-ng
> +
> +Build with uclib-ng fails since commit
> +a4b0b9afe5a782a7f4a8fe153ecf51bcb0180ae3 on:
> +
> +FAILED: src/pipewire/libpipewire-0.3.so.0.326.0.p/impl-core.c.o
> +/srv/storage/autobuild/run/instance-2/output-1/host/bin/mips64el-linux-gcc -Isrc/pipewire/libpipewire-0.3.so.0.326.0.p -Isrc/pipewire -I../src/pipewire -Isrc -I../src -I. -I.. -Ispa/include -I../spa/include -fdiagnostics-color=always -pipe -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu99 -O3 -fvisibility=hidden -Werror=suggest-attribute=format -Wsign-compare -Wpointer-arith -Wpointer-sign -Wformat -Wformat-security -Wimplicit-fallthrough -Wmissing-braces -Wtype-limits -Wvariadic-macros -Wno-missing-field-initializers -Wno-unused-parameter -Wno-pedantic -Wold-style-declaration -Wunused-result -DFASTPATH -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -pthread -DHAVE_CONFIG_H -D_GNU_SOURCE -D_POSIX_C_SOURCE -MD -MQ src/pipewire/libpipewire-0.3.so.0.326.0.p/impl-core.c.o -MF src/pipewire/libpipewire-0.3.so.0.326.0.p/impl-core.c.o.d -o src/pipewire/libpipewire-0.3.so.0.326.0.p/impl-core.c.o -c ../src/pipewire/impl-core.c
> +../src/pipewire/impl-core.c:54:9: error: conflicting types for 'getrandom'
> + ssize_t getrandom(void *buf, size_t buflen, unsigned int flags) {
> +         ^~~~~~~~~
> +In file included from ../src/pipewire/impl-core.c:34:
> +/srv/storage/autobuild/run/instance-2/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:28:12: note: previous declaration of 'getrandom' was here
> + extern int getrandom(void *__buf, size_t count, unsigned int flags)
> +            ^~~~~~~~~
> +
> +Fix this build failure by adding -D_GNU_SOURCE as getrandom is protected
> +by:
> +
> +if defined __UCLIBC_LINUX_SPECIFIC__ && defined __USE_GNU
> +
> +Extracted from:
> + - https://github.com/wbx-github/uclibc-ng/blob/master/libc/sysdeps/linux/common/sys/random.h
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/a45f0ee009d90cef867dee4b1093225610fa10df
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +https://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/649]
> +---
> + meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/meson.build b/meson.build
> +index 0a9963fb..11b63c08 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -274,7 +274,7 @@ if cc.has_function('memfd_create', prefix : '#include <sys/mman.h>', args : [ '-
> +   cdata.set('HAVE_MEMFD_CREATE', 1)
> + endif
> + 
> +-if cc.has_function('getrandom', prefix : '#include <sys/random.h>')
> ++if cc.has_function('getrandom', prefix : '#include <sys/random.h>', args : [ '-D_GNU_SOURCE' ])
> +   cdata.set('HAVE_GETRANDOM', 1)
> + endif
> + 
> +-- 
> +2.30.2
> +
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
