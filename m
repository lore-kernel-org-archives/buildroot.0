From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 May 2015 21:18:07 +0200
Subject: [Buildroot] [git commit] conntrack-tools: uses dlopen(),
	not available on static builds
Message-ID: <20150531191850.25E25817D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3afbc4f378bf9ba9a5ccc774df6128343e6d4a70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/fff/fff4865c9bb8ca42d3cece903d0fc3daea504f67/
http://autobuild.buildroot.net/results/742/74222a44ad168148c18af479878d8f848d3d6a73/
http://autobuild.buildroot.net/results/470/470197fad2402be9222b8abf96dd45c341a850e9/
http://autobuild.buildroot.net/results/ab1/ab1ae40f1862300cd7667b7bd03cc59d7455a769/

And many more.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/conntrack-tools/Config.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/conntrack-tools/Config.in b/package/conntrack-tools/Config.in
index 84d3fd4..03e3ed9 100644
--- a/package/conntrack-tools/Config.in
+++ b/package/conntrack-tools/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_CONNTRACK_TOOLS
 	bool "conntrack-tools"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC || BR2_TOOLCHAIN_HAS_THREADS # libtirpc
+	depends on !BR2_STATIC_LIBS # dlopen()
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
 	select BR2_PACKAGE_LIBNETFILTER_CTHELPER
 	select BR2_PACKAGE_LIBNETFILTER_CTTIMEOUT
@@ -17,4 +18,5 @@ config BR2_PACKAGE_CONNTRACK_TOOLS
 
 comment "conntrack-tools needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
+	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC) || \
+		BR2_STATIC_LIBS
