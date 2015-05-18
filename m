From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 May 2015 08:42:23 +0200
Subject: [Buildroot] [git commit] wvstreams: not available for static only
	builds
Message-ID: <20150518064351.6849A8196B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be1287e7e5ca2a11cd6dea84ac481d10eaa48edb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also propagated to wvdial as it selects wvstreams.

Fixes:
 http://autobuild.buildroot.org/results/0cd/0cd5e0263b42e6845504d97688632e16206bd000/
 http://autobuild.buildroot.org/results/4e0/4e0ab461ea7ed7a288303741eec89156abd49864/

Signed-off-by: Gergely Imreh <imrehg@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wvdial/Config.in    |    5 +++--
 package/wvstreams/Config.in |    5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/wvdial/Config.in b/package/wvdial/Config.in
index e57f975..5d415b1 100644
--- a/package/wvdial/Config.in
+++ b/package/wvdial/Config.in
@@ -2,12 +2,13 @@ config BR2_PACKAGE_WVDIAL
 	bool "wvdial"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # wvstreams
+	depends on !BR2_STATIC_LIBS # wvstreams
 	select BR2_PACKAGE_WVSTREAMS
 	help
 	  wvdial is an intelligent Point-to-Point Protocol dialer
 
 	  http://wvdial.googlecode.com/
 
-comment "wvdial needs a toolchain w/ C++"
+comment "wvdial needs a toolchain w/ C++, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
diff --git a/package/wvstreams/Config.in b/package/wvstreams/Config.in
index 3080dc7..0cbe60a 100644
--- a/package/wvstreams/Config.in
+++ b/package/wvstreams/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_WVSTREAMS
 	bool "wvstreams"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
@@ -9,6 +10,6 @@ config BR2_PACKAGE_WVSTREAMS
 
 	  http://wvstreams.googlecode.com/
 
-comment "wvstreams needs a toolchain w/ C++"
+comment "wvstreams needs a toolchain w/ C++, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
