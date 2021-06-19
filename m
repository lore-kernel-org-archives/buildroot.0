From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 19 Jun 2021 09:48:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/pipewire: remove
 already-applied patch (and renumber)
In-Reply-To: <20210619064922.134185-1-asafka7@gmail.com>
References: <20210619064922.134185-1-asafka7@gmail.com>
Message-ID: <20210619094844.1e63947c@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Asaf,

thanks for taking care of the autobuild failure and for the patch...

Seems to be a duplicate of an already provided one (see [1]), but not
yet applied one...

Regards,
Peter

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20210609171127.79897-1-fontaine.fabrice at gmail.com/


On Sat, 19 Jun 2021 09:49:22 +0300, Asaf Kahlon <asafka7@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.net/results/a6f96a11490462dfed615a69dbfab0980e6b0ebd/
>
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  ...-fix-getrandom-detection-for-uclibc.patch} |  0
>  ...ch => 0002-fix-linking-with-latomic.patch} |  0
>  ...meson.build-fix-build-with-uclibc-ng.patch | 52 -------------------
>  3 files changed, 52 deletions(-)
>  rename package/pipewire/{0002-meson-fix-getrandom-detection-for-uclibc.patch => 0001-meson-fix-getrandom-detection-for-uclibc.patch} (100%)
>  rename package/pipewire/{0003-fix-linking-with-latomic.patch => 0002-fix-linking-with-latomic.patch} (100%)
>  delete mode 100644 package/pipewire/0002-meson.build-fix-build-with-uclibc-ng.patch
>
> diff --git a/package/pipewire/0002-meson-fix-getrandom-detection-for-uclibc.patch b/package/pipewire/0001-meson-fix-getrandom-detection-for-uclibc.patch
> similarity index 100%
> rename from package/pipewire/0002-meson-fix-getrandom-detection-for-uclibc.patch
> rename to package/pipewire/0001-meson-fix-getrandom-detection-for-uclibc.patch
> diff --git a/package/pipewire/0003-fix-linking-with-latomic.patch b/package/pipewire/0002-fix-linking-with-latomic.patch
> similarity index 100%
> rename from package/pipewire/0003-fix-linking-with-latomic.patch
> rename to package/pipewire/0002-fix-linking-with-latomic.patch
> diff --git a/package/pipewire/0002-meson.build-fix-build-with-uclibc-ng.patch b/package/pipewire/0002-meson.build-fix-build-with-uclibc-ng.patch
> deleted file mode 100644
> index 36b14d3f16..0000000000
> --- a/package/pipewire/0002-meson.build-fix-build-with-uclibc-ng.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From 8f1de87381d270a8f4e5927187ae0466a9c9504a Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Tue, 4 May 2021 22:56:54 +0200
> -Subject: [PATCH] meson.build: fix build with uclibc-ng
> -
> -Build with uclib-ng fails since commit
> -a4b0b9afe5a782a7f4a8fe153ecf51bcb0180ae3 on:
> -
> -FAILED: src/pipewire/libpipewire-0.3.so.0.326.0.p/impl-core.c.o
> -/srv/storage/autobuild/run/instance-2/output-1/host/bin/mips64el-linux-gcc -Isrc/pipewire/libpipewire-0.3.so.0.326.0.p -Isrc/pipewire -I../src/pipewire -Isrc -I../src -I. -I.. -Ispa/include -I../spa/include -fdiagnostics-color=always -pipe -Wall -Winvalid-pch -Wextra -Wpedantic -std=gnu99 -O3 -fvisibility=hidden -Werror=suggest-attribute=format -Wsign-compare -Wpointer-arith -Wpointer-sign -Wformat -Wformat-security -Wimplicit-fallthrough -Wmissing-braces -Wtype-limits -Wvariadic-macros -Wno-missing-field-initializers -Wno-unused-parameter -Wno-pedantic -Wold-style-declaration -Wunused-result -DFASTPATH -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fPIC -pthread -DHAVE_CONFIG_H -D_GNU_SOURCE -D_POSIX_C_SOURCE -MD -MQ src/pipewire/libpipewire-0.3.so.0.326.0.p/impl-core.c.o -MF src/pipewire/libpipewire-0.3.so.0.326.0.p/impl-core.c.o.d -o src/pipewire/libpipewire-0.3.so.0.326.0.p/impl-core.c.o -c ../src/pipewire/impl-core.c
> -../src/pipewire/impl-core.c:54:9: error: conflicting types for 'getrandom'
> - ssize_t getrandom(void *buf, size_t buflen, unsigned int flags) {
> -         ^~~~~~~~~
> -In file included from ../src/pipewire/impl-core.c:34:
> -/srv/storage/autobuild/run/instance-2/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:28:12: note: previous declaration of 'getrandom' was here
> - extern int getrandom(void *__buf, size_t count, unsigned int flags)
> -            ^~~~~~~~~
> -
> -Fix this build failure by adding -D_GNU_SOURCE as getrandom is protected
> -by:
> -
> -if defined __UCLIBC_LINUX_SPECIFIC__ && defined __USE_GNU
> -
> -Extracted from:
> - - https://github.com/wbx-github/uclibc-ng/blob/master/libc/sysdeps/linux/common/sys/random.h
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/a45f0ee009d90cef867dee4b1093225610fa10df
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status:
> -https://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/649]
> ----
> - meson.build | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 0a9963fb..11b63c08 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -274,7 +274,7 @@ if cc.has_function('memfd_create', prefix : '#include <sys/mman.h>', args : [ '-
> -   cdata.set('HAVE_MEMFD_CREATE', 1)
> - endif
> -
> --if cc.has_function('getrandom', prefix : '#include <sys/random.h>')
> -+if cc.has_function('getrandom', prefix : '#include <sys/random.h>', args : [ '-D_GNU_SOURCE' ])
> -   cdata.set('HAVE_GETRANDOM', 1)
> - endif
> -
> ---
> -2.30.2
> -
