From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Aug 2017 23:01:51 +0200
Subject: [Buildroot] [PATCH] libunwind: needs dynamic library support
Message-ID: <20170820210151.2242-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libunwind configure script explicitly links libunwind against
libgcc_s. libgcc_s is only guaranteed to be available for toolchains
that supports dynamic linking: pure static linking toolchains only
have libgcc.a, not libgcc_s.so.

Therefore, let's make libunwind unavailable on toolchains that lack
dynamic linking support. We could potentially support linking with
libgcc, but switching to libgcc_s was done upstream because libgcc was
lacking some symbols on ARM
(https://lists.nongnu.org/archive/html/libunwind-devel/2014-06/msg00024.html). Even
though recent gcc versions seem to provide such symbols in libgcc.a,
having libunwind available on static linking configurations is not a
useful enough use-case to do the necessary research to find when this
issue was fixed in gcc.

Since libunwind is not used as a mandatory dependency in any package,
adding this !BR2_STATIC_LIBS dependency is trivial and nicely avoids
the problematic situation.

This fixes two different autobuilder failures:

 - Gstreamer 1.x programs failing to link, because libunwind links
   against libgcc_s that isn't available (static linking
   configuration):

   http://autobuild.buildroot.net/results/9d4fbf7167e9afce0eef5c9e0cfd42c966ecba36/

 - Gmrender-resurrect, which fails to link, because GStreamer 1.x uses
   some libunwind functionality, but does not take into account the
   libunwind dependency in its .pc files (static linking
   configuration):

   http://autobuild.buildroot.net/results/0a3a2485c187a000482c178f1e9c64dd716a858f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libunwind/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/libunwind/Config.in b/package/libunwind/Config.in
index 1a25317..be576d1 100644
--- a/package/libunwind/Config.in
+++ b/package/libunwind/Config.in
@@ -22,11 +22,14 @@ config BR2_PACKAGE_LIBUNWIND
 	bool "libunwind"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
+	# forcefully links against libgcc_s, only available in dynamic
+	# linking configurations
+	depends on !BR2_STATIC_LIBS
 	help
 	  C API to determine the call-chain of a program.
 
 	  http://www.nongnu.org/libunwind/index.html
 
-comment "libunwind needs a toolchain w/ threads"
+comment "libunwind needs a toolchain w/ threads, dynamic library"
 	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-- 
2.9.4
