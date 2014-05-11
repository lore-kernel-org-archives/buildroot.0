From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 May 2014 20:59:02 +0200
Subject: [Buildroot] [git commit] protobuf: limit to supported architectures
Message-ID: <20140511190535.64AC49CB33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8677473035cc3e02281c8998c25d6dfa071f3b54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

protobuf 2.5.0 adds an atomic operations implementation that is limited
to a few architectures only. mips64el and armeb don't work either.

Fixes (among others)
http://autobuild.buildroot.net/results/ae9fa612d0b6c9d593504206d5cedd480ad2547e/

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ola/Config.in      |    2 ++
 package/protobuf/Config.in |    4 ++++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/ola/Config.in b/package/ola/Config.in
index eb24a3a..8d202a5 100644
--- a/package/ola/Config.in
+++ b/package/ola/Config.in
@@ -1,5 +1,6 @@
 comment "ola needs a toolchain w/ C++, threads, largefile, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
 
 config BR2_PACKAGE_OLA
 	bool "ola (open lighting architecture)"
@@ -10,6 +11,7 @@ config BR2_PACKAGE_OLA
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64 # protobuf
 	help
 	  Open Lighting Architecture provides applications
 	  with a mechanism to send and receive DMX512 & RDM
diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
index a4f542e..293a9b9 100644
--- a/package/protobuf/Config.in
+++ b/package/protobuf/Config.in
@@ -2,6 +2,9 @@ config BR2_PACKAGE_PROTOBUF
 	bool "protobuf"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# See src/google/protobuf/stubs/platform_macros.h for supported archs.
+	# PowerPC doesn't actually work.
+	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
 	help
 	  Protocol buffers are Google's language-neutral, platform-neutral,
 	  extensible mechanism for serializing structured data.
@@ -10,3 +13,4 @@ config BR2_PACKAGE_PROTOBUF
 
 comment "protobuf needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
