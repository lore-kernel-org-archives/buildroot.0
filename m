From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 May 2017 17:59:29 +0200
Subject: [Buildroot] [PATCH] lttng-tools: disable on uClibc
Message-ID: <1493913569-15374-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lttng-tools has been broken on uClibc since a long time due to dlmopen()
and LM_ID_BASE not being implemented. The issue has been reported to the
upstream lttng developers more than two months ago [1], and no fix has
been provided. Therefore, it's time to disable it on uClibc.

Fixes:

  http://autobuild.buildroot.net/results/f9e82a87618bcdcd46d670697b5ac75836f7250d/

[1] https://lists.lttng.org/pipermail/lttng-dev/2017-February/026921.html

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-tools/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index 187e424..4b7712a 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # uses dlfcn
+	# uclibc does not implement dlmopen()/LM_ID_BASE
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_POPT
@@ -27,6 +29,7 @@ config BR2_PACKAGE_LTTNG_TOOLS
 
 	  http://lttng.org
 
-comment "lttng-tools needs a toolchain w/ threads, dynamic library"
+comment "lttng-tools needs a glibc or musl toolchain w/ threads, dynamic library"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		BR2_TOOLCHAIN_USES_UCLIBC
-- 
2.7.4
