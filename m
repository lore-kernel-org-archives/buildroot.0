From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Aug 2018 19:03:25 +0200
Subject: [Buildroot] [PATCH/next/RFC v2 1/2] package/mariadb: handle missing
 ucontext_t
Message-ID: <20180826170326.18743-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On some archs uclibc does not provide ucontext_t, for details see
https://git.buildroot.net/buildroot/commit/?id=f1cbfeea95e6287c7a666aafc182ffa318eff262

Mariadb uses ucontext_t optionally, its use can be disabled by the
corresponding cmake option. Instead of copying the Config.in code from
libsigsegv we shamelessly use its ARCH_SUPPORTS option while thinking
that a more general approach might be needed for ucontext_t support so
please consider this patch a RFC.

This patch fixes a build error

In file included from /home/bernd/buildroot/output/build/mariadb-10.2.17/libmariadb/plugins/pvio/pvio_socket.c:32:0:
/home/bernd/buildroot/output/build/mariadb-10.2.17/libmariadb/include/ma_context.h:62:3: error: unknown type name ?ucontext_t?
   ucontext_t base_context;
   ^~~~~~~~~~

using this defconfig:

BR2_arcle=y
BR2_archs38=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arcle-hs38-full-2018.02-926-gb393c24.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_MYSQL=y
BR2_PACKAGE_MARIADB=y
BR2_PACKAGE_MARIADB_SERVER=y

Musl also does not provide ucontext functions:
https://wiki.musl-libc.org/open-issues.html

To fix this build error

[  6%] Linking C shared library libmariadb.so
CMakeFiles/mariadb_obj.dir/ma_context.c.o: In function `my_context_spawn_internal':
/home/bernd/buildroot/output/build/mariadb-10.3.9/libmariadb/libmariadb/ma_context.c:63: undefined reference to `setcontext'
CMakeFiles/mariadb_obj.dir/ma_context.c.o: In function `my_context_continue':
/home/bernd/buildroot/output/build/mariadb-10.3.9/libmariadb/libmariadb/ma_context.c:76: undefined reference to `swapcontext'
CMakeFiles/mariadb_obj.dir/ma_context.c.o: In function `my_context_spawn':
/home/bernd/buildroot/output/build/mariadb-10.3.9/libmariadb/libmariadb/ma_context.c:94: undefined reference to `getcontext'
/home/bernd/buildroot/output/build/mariadb-10.3.9/libmariadb/libmariadb/ma_context.c:104: undefined reference to `makecontext'
CMakeFiles/mariadb_obj.dir/ma_context.c.o: In function `my_context_yield':
/home/bernd/buildroot/output/build/mariadb-10.3.9/libmariadb/libmariadb/ma_context.c:119: undefined reference to `swapcontext'

we use the same cmake option instead of patching the source code like
void linux does:
https://github.com/void-linux/void-packages/blob/master/srcpkgs/mariadb/patches/musl_ucontext-h.patch

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added musl fix

 package/mariadb/mariadb.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 075582288a..e061cc53a8 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -61,6 +61,15 @@ else
 MARIADB_CONF_OPTS += -DWITHOUT_SERVER=ON
 endif
 
+# hack: do we need an ucontext-specific option?
+ifeq ($(BR2_PACKAGE_LIBSIGSEGV_ARCH_SUPPORTS),)
+MARIADB_CONF_OPTS += -DHAVE_UCONTEXT_H=0
+else
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+MARIADB_CONF_OPTS += -DHAVE_UCONTEXT_H=0
+endif
+endif
+
 MARIADB_CONF_OPTS += \
 	-DINSTALL_DOCDIR=share/doc/mariadb-$(MARIADB_VERSION) \
 	-DINSTALL_DOCREADMEDIR=share/doc/mariadb-$(MARIADB_VERSION) \
-- 
2.18.0
