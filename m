From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Feb 2016 23:04:13 +0100
Subject: [Buildroot] [git commit] protobuf: introduce
	BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
Message-ID: <20160204225438.819E68025B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=abdc56006bf253bec393066f96f69f0a6246b896
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The architecture dependencies of protobuf are going to change, and
they are already duplicated between protobuf, ola and mosh. In order
to factorize the expression of those dependencies, this commit
introduces BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS.

Note that we include in this hidden Config.in option both the target
architecture dependency and the host architecture dependency.

Finally, this commit also fixes a real mistake in the mosh Config.in
file, where the condition on the architecture dependency for the
Config.in comment was inverted: we only want to show the Config.in
comment when we are on supported architectures.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mosh/Config.in     |  5 ++---
 package/ola/Config.in      |  6 ++----
 package/protobuf/Config.in | 20 +++++++++++++-------
 3 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/package/mosh/Config.in b/package/mosh/Config.in
index 868b9ff..26f7233 100644
--- a/package/mosh/Config.in
+++ b/package/mosh/Config.in
@@ -1,15 +1,14 @@
 comment "mosh needs a toolchain w/ C++, threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
 		|| BR2_STATIC_LIBS
-	depends on !(BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64)
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 config BR2_PACKAGE_MOSH
 	bool "mosh"
-	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64 # protobuf
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf
 	depends on !BR2_STATIC_LIBS # protobuf
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # protobuf
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/ola/Config.in b/package/ola/Config.in
index fd693de..55cea65 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -1,7 +1,7 @@
 comment "ola needs a toolchain w/ C++, threads, wchar, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
 		|| !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 config BR2_PACKAGE_OLA
 	bool "ola (open lighting architecture)"
@@ -12,9 +12,7 @@ config BR2_PACKAGE_OLA
 	depends on !BR2_STATIC_LIBS # protobuf
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64 # protobuf
-	# protobuf -> host-protobuf
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	help
 	  Open Lighting Architecture provides applications
 	  with a mechanism to send and receive DMX512 & RDM
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index 9ee7e7d..3d4320b 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -1,12 +1,19 @@
+# See src/google/protobuf/stubs/platform_macros.h for supported archs.
+# PowerPC doesn't actually work.
+# host-protobuf only builds on certain architectures
+config BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm
+	default y if BR2_i386
+	default y if BR2_mipsel
+	default y if BR2_x86_64
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+
 config BR2_PACKAGE_PROTOBUF
 	bool "protobuf"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# See src/google/protobuf/stubs/platform_macros.h for supported archs.
-	# PowerPC doesn't actually work.
-	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
-	# host-protobuf only builds on certain architectures
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS
 	help
 	  Protocol buffers are Google's language-neutral, platform-neutral,
@@ -17,5 +24,4 @@ config BR2_PACKAGE_PROTOBUF
 comment "protobuf needs a toolchain w/ C++, threads, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
 		|| BR2_STATIC_LIBS
-	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
