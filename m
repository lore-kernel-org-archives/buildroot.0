From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 20 Nov 2015 12:19:07 -0300
Subject: [Buildroot] [PATCH] kompexsqlite: needs threads and wchar
Message-ID: <1448032747-7558-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Wchar is used by the wrapper, fixes:
http://autobuild.buildroot.net/results/763/763d9aff86085b67077fc665e462cee81962246d/

Threads can be disabled by the sqlite build system, but since
kompexsqlite doesn't use the sqlite buildsystem and only uses a bundled
version it falls back to the default for *nixes (enabled), fixes:
http://autobuild.buildroot.net/results/c0b/c0b65be99603a2c2f07a38078f6b5622353915ca/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/kompexsqlite/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/kompexsqlite/Config.in b/package/kompexsqlite/Config.in
index b6d7d7f..5b71842 100644
--- a/package/kompexsqlite/Config.in
+++ b/package/kompexsqlite/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_KOMPEXSQLITE
 	bool "kompexsqlite"
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	help
@@ -8,5 +10,6 @@ config BR2_PACKAGE_KOMPEXSQLITE
 
 	  http://sqlitewrapper.kompex-online.com/index.php
 
-comment "kompexsqlite needs a toolchain w/ C++, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
+comment "kompexsqlite needs a toolchain w/ C++, wchar, threads, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.4.10
