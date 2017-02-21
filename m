From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Feb 2017 10:08:04 +0100
Subject: [Buildroot] [PATCH] lttng-libust: disable on musl
Message-ID: <1487668084-7078-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version v2.9.0, lttng-libust has a tracepoint for the C library
dlmopen() function, and uses some types such as Lmid_t, related to
dlmopen(). However, musl doesn't provide dlmopen(), which causes a build
failure.

The Alpine Linux distribution has a patch [1] to remove this code
completely, but while this is a reasonable solution for a musl-only
distribution, it is not for a build system that also supports glibc and
uClibc. Therefore, we instead disable lttng-libust for the musl C
library.

The problem has been reported upstream (no mailing list archive link
available at the time of this commit).

Fixes:

  http://autobuild.buildroot.net/results/113fa95a054df183014b43ec36b329f9c59bd356/

[1] http://git.alpinelinux.org/cgit/aports/tree/testing/lttng-ust/musl-has-no-dlmopen.patch

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-libust/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/lttng-libust/Config.in b/package/lttng-libust/Config.in
index 4aba188..8600888 100644
--- a/package/lttng-libust/Config.in
+++ b/package/lttng-libust/Config.in
@@ -8,6 +8,8 @@ config BR2_PACKAGE_LTTNG_LIBUST
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	# musl doesn't provide dlmopen() functionality
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	help
 	  Userspace tracing library for the LTTng 2.x tracing
 	  infrastructure. It allows userspace programs to create
@@ -16,6 +18,7 @@ config BR2_PACKAGE_LTTNG_LIBUST
 
 	  http://lttng.org
 
-comment "lttng-libust needs a toolchain w/ dynamic library, wchar, threads"
+comment "lttng-libust needs a glibc or uClibc toolchain w/ dynamic library, wchar, threads"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_TOOLCHAIN_USES_MUSL
-- 
2.7.4
