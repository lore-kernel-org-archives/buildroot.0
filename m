From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Nov 2015 16:05:21 +0100
Subject: [Buildroot] [git commit] mongrel2: uses dlopen(),
	needs dynamic library support
Message-ID: <20151108150554.43D2E8040B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=54fde8949373d6e010eefaf1e1fa8edc19cb4d4f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/c5e/c5ecfe4a5ad3712d65293de517a24e76c4376c57/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mongrel2/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mongrel2/Config.in b/package/mongrel2/Config.in
index 1afba77..1c7b495 100644
--- a/package/mongrel2/Config.in
+++ b/package/mongrel2/Config.in
@@ -1,9 +1,10 @@
-comment "mongrel2 needs a toolchain w/ C++, threads, wchar"
+comment "mongrel2 needs a toolchain w/ C++, threads, wchar, dynamic library"
 	depends on BR2_UCLIBC_VERSION_SNAPSHOT || \
 		BR2_TOOLCHAIN_USES_GLIBC || \
 		BR2_arm
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
+		BR2_STATIC_LIBS
 
 config BR2_PACKAGE_MONGREL2
 	bool "mongrel2"
@@ -12,6 +13,7 @@ config BR2_PACKAGE_MONGREL2
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
 	depends on BR2_USE_WCHAR # zeromq -> util-linux
+	depends on !BR2_STATIC_LIBS # uses dlopen()
 	# {get,make,swap}context functions present in
 	# {e,}glibc and in uClibc's master branch. Source has arm workaround
 	depends on BR2_UCLIBC_VERSION_SNAPSHOT || \
