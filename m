From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 May 2014 13:10:31 +0200
Subject: [Buildroot] [PATCH] protobuf: host-protobuf can only be built on
	certain architectures
Message-ID: <1399893031-28657-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host-protobuf package can only build on certain architectures. For
example, host-protobuf does not build on PowerPC platforms, causing
build failures on the autobuilders. Since we don't really care about
build platforms other than x86 and x86-64, this commit restricts the
build of host-protobuf to these architectures only, even though if
technically it could build on ARM and MIPS.

Fixes:

 http://autobuild.buildroot.org/results/9b9/9b9b20b0e4694b11425cdc2382650cdc2774e400/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/protobuf-c/Config.in      | 3 +++
 package/protobuf/Config.in        | 3 +++
 package/python-protobuf/Config.in | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/package/protobuf-c/Config.in b/package/protobuf-c/Config.in
index 732befc..f9fab37 100644
--- a/package/protobuf-c/Config.in
+++ b/package/protobuf-c/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_PROTOBUF_C
 	bool "protobuf-c"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
+	# host-protobuf only builds on certain architectures
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	help
 	  Code generator and runtime libraries to use Protocol Buffers
 	  from pure C (not C++).
@@ -10,3 +12,4 @@ config BR2_PACKAGE_PROTOBUF_C
 
 comment "protobuf-c needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index 293a9b9..6015b13 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_PROTOBUF
 	# See src/google/protobuf/stubs/platform_macros.h for supported archs.
 	# PowerPC doesn't actually work.
 	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
+	# host-protobuf only builds on certain architectures
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	help
 	  Protocol buffers are Google's language-neutral, platform-neutral,
 	  extensible mechanism for serializing structured data.
@@ -14,3 +16,4 @@ config BR2_PACKAGE_PROTOBUF
 comment "protobuf needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
diff --git a/package/python-protobuf/Config.in b/package/python-protobuf/Config.in
index ec22057..6649dfc 100644
--- a/package/python-protobuf/Config.in
+++ b/package/python-protobuf/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PYTHON_PROTOBUF
 	bool "python-protobuf"
 	depends on BR2_PACKAGE_PYTHON
+	# host-protobuf only builds on certain architectures
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	help
 	  Python implementation of the Google Protocol Buffers.
 
-- 
1.9.2
