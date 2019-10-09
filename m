From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Oct 2019 00:08:56 +0200
Subject: [Buildroot] [git commit] package/libsemanage: now available on
 !glibc configs
Message-ID: <20191009221024.268BA7FB52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f3ad8c3f10987e83c549f681146c2858576ae69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsemanage was only available in glibc configurations, for three
reasons, which are all no longer true:

 - The usage of fts.h by libselinux is now provided by the musl-fts
   package when uClibc-ng or musl are used, which makes libselinux
   available to all C libraries.

 - libsemanage use of getpwent_r() has been removed by upstream commit
   2c651e0a2822368c74587efe6ec920e64e72f37b ("genhomedircon: avoid use
   of non-standard `getpwent_r`"), which is in SELinux since version
   2.7

 - audit is now available on musl, thanks to Buildroot commit
   "package/audit: re-enable on musl", which backports an upstream
   patch to make audit build with musl

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libsemanage/Config.in | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/libsemanage/Config.in b/package/libsemanage/Config.in
index ad3555aee0..e51b711cae 100644
--- a/package/libsemanage/Config.in
+++ b/package/libsemanage/Config.in
@@ -3,10 +3,6 @@ config BR2_PACKAGE_LIBSEMANAGE
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	# - libselinux needs fts.h (not available in uClibc/musl)
-	# - libsemanage itself needs getpwent_r() not available in musl
-	# - audit is not available on musl
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_arc
 	select BR2_PACKAGE_AUDIT
 	select BR2_PACKAGE_LIBSELINUX
@@ -22,8 +18,7 @@ config BR2_PACKAGE_LIBSEMANAGE
 
 	  http://selinuxproject.org/page/Main_Page
 
-comment "libsemanage needs a glibc toolchain w/ threads, dynamic library"
+comment "libsemanage needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_arc
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
