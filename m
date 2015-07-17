From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 17 Jul 2015 16:15:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: boost-filesystem needs wchar
Message-ID: <1437142516-12378-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add reverse dependency for cc-tool.

Fixes:
http://autobuild.buildroot.net/results/2c7/2c7783b7f3cc28d54d15a7f017442c48244ffd8e/
http://autobuild.buildroot.net/results/2c7/2c7783b7f3cc28d54d15a7f017442c48244ffd8e/
http://autobuild.buildroot.net/results/0dd/0dd3ef96bbd034a41d908cdaa6552b27fda78132/
http://autobuild.buildroot.net/results/34b/34b55b2cd83fd5d87af4a9c15d05094b16ef3960/

and many more

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/boost/Config.in   | 4 ++++
 package/cc-tool/Config.in | 5 +++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 92d59c2..68004b6 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -77,6 +77,10 @@ config BR2_PACKAGE_BOOST_EXCEPTION
 
 config BR2_PACKAGE_BOOST_FILESYSTEM
 	bool "boost-filesystem"
+	depends on BR2_USE_WCHAR
+
+comment "boost-filesystem needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
 
 config BR2_PACKAGE_BOOST_GRAPH
 	bool "boost-graph"
diff --git a/package/cc-tool/Config.in b/package/cc-tool/Config.in
index be11599..f8e4531 100644
--- a/package/cc-tool/Config.in
+++ b/package/cc-tool/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_CC_TOOL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR # boost-filesystem
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
@@ -17,6 +18,6 @@ config BR2_PACKAGE_CC_TOOL
 
 	  http://sourceforge.net/projects/cctool/
 
-comment "cc-tool needs a toolchain w/ C++, threads"
+comment "cc-tool needs a toolchain w/ C++, threads, wchar"
 	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-- 
2.4.6
