From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jan 2019 14:29:54 +0100
Subject: [Buildroot] [git commit] package/syslog-ng: depend on
 !BR2_STATIC_LIBS
Message-ID: <20190113132948.500818426E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44dbd2907c5995b0b0c56cb2274dc60415205dd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream now unconditionally requires dlfcn.h:
- https://github.com/balabit/syslog-ng/commit/01258e56abc5804f8ea977ff9ab98cc8e2fd4702

Fixes:
- http://autobuild.buildroot.net/results/c0bca852e053cd0e021205b3a949e750ae602333

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Reviewed-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/syslog-ng/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
index fbc236221a..6407645974 100644
--- a/package/syslog-ng/Config.in
+++ b/package/syslog-ng/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_SYSLOG_NG
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_EVENTLOG
 	select BR2_PACKAGE_LIBGLIB2
@@ -15,7 +16,8 @@ config BR2_PACKAGE_SYSLOG_NG
 
 	  https://syslog-ng.org/
 
-comment "syslog-ng needs a toolchain w/ wchar, threads"
+comment "syslog-ng needs a toolchain w/ dynamic library, wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
