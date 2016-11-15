From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Nov 2016 11:24:32 +0100
Subject: [Buildroot] [git commit branch/next] package/netsniff-ng: allow to
	build with musl
Message-ID: <20161115102610.14AD5801EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f148d55980bbc2943706670df638b0f70d8de81e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

netsniff-ng allows build with musl since version 0.5.8. With libnet
now being able to build with musl, let's enable musl for netsniff-ng
as well.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
[Thomas: update Config.in comment.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netsniff-ng/Config.in | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/netsniff-ng/Config.in b/package/netsniff-ng/Config.in
index e52bb25..00617e3 100644
--- a/package/netsniff-ng/Config.in
+++ b/package/netsniff-ng/Config.in
@@ -7,8 +7,7 @@ config BR2_PACKAGE_NETSNIFF_NG
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_LIBNET
 	# Build with uClibc fails due to missing ceill()
-	# Build with musl fails due to various header issues
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
@@ -17,7 +16,7 @@ config BR2_PACKAGE_NETSNIFF_NG
 	  networking toolkit. If you will, the Swiss army knife for
 	  network packets.
 
-comment "netsniff-ng needs a glibc toolchain w/ threads, headers >= 3.0"
+comment "netsniff-ng needs a glibc or musl toolchain w/ threads, headers >= 3.0"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC \
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC \
 		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
