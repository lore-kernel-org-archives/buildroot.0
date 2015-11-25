From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Nov 2015 23:24:27 +0100
Subject: [Buildroot] [git commit] kompexsqlite: needs threads and wchar
Message-ID: <20151125222649.B50B57F97D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f5646333c3c94f56b0f20686c0eea54b332d5a7e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Wchar is used by the wrapper, fixes:
http://autobuild.buildroot.net/results/763/763d9aff86085b67077fc665e462cee81962246d/

Threads can be disabled by the sqlite build system, but since
kompexsqlite doesn't use the sqlite buildsystem and only uses a bundled
version it falls back to the default for *nixes (enabled), fixes:
http://autobuild.buildroot.net/results/c0b/c0b65be99603a2c2f07a38078f6b5622353915ca/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kompexsqlite/Config.in |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

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
