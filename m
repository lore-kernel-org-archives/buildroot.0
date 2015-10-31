From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 Oct 2015 17:38:11 +0100
Subject: [Buildroot] [PATCH] package/openvmtools: does not build with uClibc
Message-ID: <1446309491-24752-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On glibc 2.4+, openvmtools uses euidaccess(), which is not implemented
on uClibc.

But since uClibc fakes being a glibc-3.10, openvmtools believes it can
use euidaccess(), and thus we get a linking error.

Fixes:
    http://autobuild.buildroot.org/results/779/779bed269982f0b2e04baecae2e720d602319552/
    http://autobuild.buildroot.org/results/860/8609823e35115f07b0f16f0a1831201aa1cf9e3c/
    http://autobuild.buildroot.org/results/f57/f572573c5f7f9206e0a8309b535a7c633a2d6b16/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
Note; an alternate solution would be to patch openvmtools to not use
euidaccess with uClibc as well. But I'm warry of patching. After all, a
package that deals with virtual machines is not really size-sensitive,
so it is not completely stupid to disable it with uClibc, and require
either glibc or musl...
---
 package/openvmtools/Config.in | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index 98cbeb9..64bf65c 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_OPENVMTOOLS
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	depends on BR2_ENABLE_LOCALE
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBDNET
 	help
@@ -40,13 +41,14 @@ config BR2_PACKAGE_OPENVMTOOLS_PAM
 	help
 	  Support for PAM in openvmtools
 
-comment "PAM support needs a uClibc or (e)glibc toolchain w/ dynamic library"
+comment "PAM support needs an (e)glibc toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
 
 endif
 
-comment "openvmtools needs a toolchain w/ wchar, threads, RPC, locale"
+comment "openvmtools needs an (e)glibc or musl toolchain w/ wchar, threads, RPC, locale"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_HAS_NATIVE_RPC || !BR2_ENABLE_LOCALE
+		!BR2_TOOLCHAIN_HAS_NATIVE_RPC || !BR2_ENABLE_LOCALE || \
+		BR2_TOOLCHAIN_USES_UCLIBC
-- 
1.9.1
