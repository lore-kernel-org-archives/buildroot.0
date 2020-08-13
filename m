From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Aug 2020 20:36:31 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/efl: depend on
 LuaJIT
Message-ID: <20200813183032.857B48375A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=785925c0ebc123f4bf6b0a274e84ffa86ffc6c8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Luajit is a provider for luainterpreter. We can't select providers of
virtual packages; we can only depend on them.

Note also that it is not very clear whether the host and target variants
of EFL need to be built with the same lua interpreter. Today, this is
guaranteed as we inly use luajit in both cases. But there were issues
with lua 5.1 in the past, so stick to only using luajit.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998 at free.fr:
  - depend on luajit, not "any" luainterpreter
  - which keeps the host and target variants built with the same
    interpreter
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f3134e71595ba33d2f9f82b9951a61e63f9e8727)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efl/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index ff49161163..728032018b 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -3,17 +3,16 @@ config BR2_PACKAGE_EFL
 	 # g++ issue with 4.4.5, tested with g++ 4.7.2
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS # luajit
 	depends on BR2_TOOLCHAIN_HAS_THREADS # untested without threads
 	depends on BR2_USE_MMU
 	depends on BR2_USE_WCHAR # use wchar_t
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	# https://phab.enlightenment.org/T2728
+	depends on BR2_PACKAGE_LUAJIT
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_JPEG # Emile needs libjpeg
 	select BR2_PACKAGE_LIBCURL # Ecore_con_url, runtime dependency
-	# https://phab.enlightenment.org/T2728
-	select BR2_PACKAGE_LUAJIT # Lua support broken
 	select BR2_PACKAGE_LZ4
 	select BR2_PACKAGE_ZLIB
 	help
@@ -306,5 +305,4 @@ comment "efl needs a toolchain w/ C++, dynamic library, gcc >= 4.7, threads, wch
 	depends on !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 \
 		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
