From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 May 2014 22:20:44 +0200
Subject: [Buildroot] [git commit] protobuf: host-protobuf can only be built
	on certain architectures
Message-ID: <20140512204138.914919CB9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0f6fca606134b81c13a9cd03169158a24e3346f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The host-protobuf package can only build on certain architectures. For
example, host-protobuf does not build on PowerPC platforms, causing
build failures on the autobuilders. Since we don't really care about
build platforms other than x86 and x86-64, this commit restricts the
build of host-protobuf to these architectures only, even though if
technically it could build on ARM and MIPS.

Fixes:

 http://autobuild.buildroot.org/results/9b9/9b9b20b0e4694b11425cdc2382650cdc2774e400/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/Config.in        |    2 ++
 package/ola/Config.in             |    2 ++
 package/protobuf-c/Config.in      |    3 +++
 package/protobuf/Config.in        |    3 +++
 package/python-protobuf/Config.in |    2 ++
 5 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index daa9603..f693f31 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -419,6 +419,8 @@ comment "rrdtool support needs a toolchain w/ wchar"
 config BR2_PACKAGE_COLLECTD_RIEMANN
 	bool "riemann"
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
+	# protobuf-c -> host-protobuf
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_PACKAGE_PROTOBUF_C
 	help
 	  Sends data to Riemann, a stream processing and monitoring system.
diff --git a/package/ola/Config.in b/package/ola/Config.in
index 8d202a5..713102c 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -12,6 +12,8 @@ config BR2_PACKAGE_OLA
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64 # protobuf
+	# protobuf -> host-protobuf
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	help
 	  Open Lighting Architecture provides applications
 	  with a mechanism to send and receive DMX512 & RDM
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
 
