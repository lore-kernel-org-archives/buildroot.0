From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 24 Jul 2015 10:14:53 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: boost needs wchar
Message-ID: <1437725693-21075-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The most modules of boost needs a toolchain with wchar. To ease maintenance
we make the entire boost package depend on wchar.

Also add a reverse dependency to libftdipp1 and yaml-cpp.

Fixes:
http://autobuild.buildroot.net/results/49f/49f5c0521fc90fbd4673ad233ff679be007d2953/
http://autobuild.buildroot.net/results/12f/12f544c97e3451fb2a72025ebc62292957e47070/
http://autobuild.buildroot.net/results/ef6/ef6c897ea7547e8ed5f019e8ce4473f0998f2c16/
http://autobuild.buildroot.net/results/7a0/7a0ab069c505696a7887ba5c561b76b233ce59d5/

and more.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/boost/Config.in    | 13 +++----------
 package/libftdi1/Config.in |  5 +++--
 package/yaml-cpp/Config.in |  5 +++--
 3 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 68004b6..ac70152 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -1,5 +1,5 @@
-comment "boost needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "boost needs a toolchain w/ C++, threads, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
 config BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 	bool
@@ -14,6 +14,7 @@ config BR2_PACKAGE_BOOST
 	# that unfortunately doesn't work. Until someone fixes that,
 	# let's depend on threads.
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
 	help
 	  A general purpose C++ library
 
@@ -77,10 +78,6 @@ config BR2_PACKAGE_BOOST_EXCEPTION
 
 config BR2_PACKAGE_BOOST_FILESYSTEM
 	bool "boost-filesystem"
-	depends on BR2_USE_WCHAR
-
-comment "boost-filesystem needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
 
 config BR2_PACKAGE_BOOST_GRAPH
 	bool "boost-graph"
@@ -94,12 +91,8 @@ config BR2_PACKAGE_BOOST_IOSTREAMS
 	select BR2_PACKAGE_ZLIB
 
 config BR2_PACKAGE_BOOST_LOCALE
-	depends on BR2_USE_WCHAR
 	bool "boost-locale"
 
-comment "boost-locale needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
-
 config BR2_PACKAGE_BOOST_LOG
 	bool "boost-log"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
diff --git a/package/libftdi1/Config.in b/package/libftdi1/Config.in
index 4a490a5..61d4c1c 100644
--- a/package/libftdi1/Config.in
+++ b/package/libftdi1/Config.in
@@ -15,11 +15,12 @@ config BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1
 	depends on BR2_INSTALL_LIBSTDCPP # boost
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR # boost
 	help
 	  C++ bindings for libftdi
 
-comment "libftdipp1 needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "libftdipp1 needs a toolchain w/ C++, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
 	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
 
 config BR2_PACKAGE_LIBFTDI1_PYTHON_BINDINGS
diff --git a/package/yaml-cpp/Config.in b/package/yaml-cpp/Config.in
index 9e00b3d..3cfb955 100644
--- a/package/yaml-cpp/Config.in
+++ b/package/yaml-cpp/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_YAML_CPP
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost
 	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR # boost
 	select BR2_PACKAGE_BOOST
 	help
 	  yaml-cpp is a YAML parser and emitter in C++ matching
@@ -10,6 +11,6 @@ config BR2_PACKAGE_YAML_CPP
 
 	  https://code.google.com/p/yaml-cpp/
 
-comment "yaml-cpp needs a toolchain w/ C++, threads"
+comment "yaml-cpp needs a toolchain w/ C++, threads, wchar"
 	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-- 
2.4.6
