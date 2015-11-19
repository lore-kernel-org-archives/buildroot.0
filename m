From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Nov 2015 11:17:48 +0100
Subject: [Buildroot] [git commit] libuecc: not available in static builds
Message-ID: <20151119101937.7496181E83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aadf19c9c3aa6e92c6727650989981fbc0757f0d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/c0d/c0d91fc0fa28fda0ffd1c9a236bde5435222bcc0/

Unconditionally builds a shared library.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fastd/Config.in   |    6 ++++--
 package/libuecc/Config.in |    4 ++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/fastd/Config.in b/package/fastd/Config.in
index 4170ea1..f753ce4 100644
--- a/package/fastd/Config.in
+++ b/package/fastd/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_FASTD
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # libcap
+	depends on !BR2_STATIC_LIBS # libuecc
 	select BR2_PACKAGE_LIBUECC
 	select BR2_PACKAGE_LIBSODIUM
 	select BR2_PACKAGE_LIBCAP
@@ -22,7 +23,8 @@ config BR2_PACKAGE_FASTD_STATUS_SOCKET
 
 endif
 
-comment "fastd needs a toolchain w/ threads, headers >= 3.0"
+comment "fastd needs a toolchain w/ threads, headers >= 3.0, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 \
+		|| BR2_STATIC_LIBS
diff --git a/package/libuecc/Config.in b/package/libuecc/Config.in
index 34bbea2..b7cd045 100644
--- a/package/libuecc/Config.in
+++ b/package/libuecc/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_LIBUECC
 	bool "libuecc"
+	depends on !BR2_STATIC_LIBS
 	help
 	  Very small Elliptic Curve Cryptography library
 
 	  http://git.universe-factory.net/libuecc
+
+comment "libuecc needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
