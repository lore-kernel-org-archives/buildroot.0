From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 May 2017 10:46:53 +0200
Subject: [Buildroot] [git commit] lttng-tools: disable on uClibc/musl
Message-ID: <20170505084700.32CBD8193B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a36f24f79b92558812e24823a951e803cc8689ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lttng-tools has been broken on uClibc/musl since a long time due to
dlmopen() and LM_ID_BASE not being implemented. The issue has been
reported to the upstream lttng developers more than two months ago [1],
and no fix has been provided. Therefore, it's time to disable it on
uClibc and musl.

Fixes:

  http://autobuild.buildroot.net/results/f9e82a87618bcdcd46d670697b5ac75836f7250d/
  (uclibc)

  http://autobuild.buildroot.net/results/cb0952483b580b053a585760e59d78d11f46fc60/
  (musl)

[1] https://lists.lttng.org/pipermail/lttng-dev/2017-February/026921.html

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-tools/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index 187e424..8888ef7 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # uses dlfcn
+	# uclibc/musl don't implement dlmopen()/LM_ID_BASE
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_POPT
@@ -27,6 +29,7 @@ config BR2_PACKAGE_LTTNG_TOOLS
 
 	  http://lttng.org
 
-comment "lttng-tools needs a toolchain w/ threads, dynamic library"
+comment "lttng-tools needs a glibc toolchain w/ threads, dynamic library"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_USES_GLIBC
