From: Romain Naour <romain.naour@openwide.fr>
Date: Sat,  8 Aug 2015 12:57:02 +0200
Subject: [Buildroot] [PATCHv2] package/wvstreams: disable for musl toolchains
Message-ID: <1439031422-24117-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The project seems not maintained anymore since there
is no commit since 2011:
https://github.com/wlach/wvstreams

After fixing the first build issue by adding a missing limit.h header...
xplc/modulemgr.cc:90:14: error: ?PATH_MAX? was not declared in this scope
   char fname[PATH_MAX];

and fixing a basename() conflict between the gnu and posix version,
the build fail due to missing __libc_stack_end.

wvtask.cc:(.test+0xb08): undefined reference to `__libc_stack_end'

There is a configure test for __libc_stack_end support but it
doesn't work properly with a musl toolchain.

Since we already have several fixes for uClibc, let's mark wvstreams
as not available for musl toolchains, until someone interested
enough fixes it.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
v2: improve the commit log
    fix indentation in Config.in
    propagates the dependency to wvdial
---
 package/wvdial/Config.in    | 5 +++--
 package/wvstreams/Config.in | 6 ++++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/wvdial/Config.in b/package/wvdial/Config.in
index 5d415b1..3b09927 100644
--- a/package/wvdial/Config.in
+++ b/package/wvdial/Config.in
@@ -3,12 +3,13 @@ config BR2_PACKAGE_WVDIAL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # wvstreams
 	depends on !BR2_STATIC_LIBS # wvstreams
+	depends on !BR2_TOOLCHAIN_USES_MUSL # wvstreams
 	select BR2_PACKAGE_WVSTREAMS
 	help
 	  wvdial is an intelligent Point-to-Point Protocol dialer
 
 	  http://wvdial.googlecode.com/
 
-comment "wvdial needs a toolchain w/ C++, dynamic library"
+comment "wvdial needs a (e)glibc or uClibc-ng toolchain w/ C++, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/wvstreams/Config.in b/package/wvstreams/Config.in
index 0cbe60a..257340e 100644
--- a/package/wvstreams/Config.in
+++ b/package/wvstreams/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_WVSTREAMS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
+	# musl not supported and no upstream activity since 2011.
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
@@ -10,6 +12,6 @@ config BR2_PACKAGE_WVSTREAMS
 
 	  http://wvstreams.googlecode.com/
 
-comment "wvstreams needs a toolchain w/ C++, dynamic library"
+comment "wvstreams needs a (e)glibc or uClibc-ng toolchain w/ C++, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
-- 
2.4.3
