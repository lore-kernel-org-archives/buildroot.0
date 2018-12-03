From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 22:28:38 +0100
Subject: [Buildroot] [git commit] package/libbsd: fix display of Config.in
 comment
Message-ID: <20181203212523.853738A59A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2261eb3a36562fba5eaae4231aadb900b49e8d58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit e13855c48f21eaee07a81f8b02678839be274a45 wrongly added
depends on BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU
to display the comment "libbsd needs a toolchain w/ threads, wchar"
The same error has also been made for minizip.

To fix this issue, move dependency
!(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU) under
BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libbsd/Config.in  | 5 ++---
 package/minizip/Config.in | 2 --
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
index ba5e5cbcfa..0f320302b9 100644
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -5,12 +5,12 @@ config BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 	depends on !BR2_microblaze
 	depends on !BR2_arc
 	depends on !BR2_xtensa
+	# uClibc on noMMU doesn't provide __register_atfork()
+	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)
 
 config BR2_PACKAGE_LIBBSD
 	bool "libbsd"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
-	# uClibc on noMMU doesn't provide __register_atfork()
-	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
 	help
@@ -24,5 +24,4 @@ config BR2_PACKAGE_LIBBSD
 
 comment "libbsd needs a toolchain w/ threads, wchar"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/minizip/Config.in b/package/minizip/Config.in
index 4bc12a0d7e..68fa1d7118 100644
--- a/package/minizip/Config.in
+++ b/package/minizip/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_MINIZIP
 	bool "minizip"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
-	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU) # libbsd
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libbsd
 	depends on BR2_USE_WCHAR # libbsd
 	select BR2_PACKAGE_LIBBSD
@@ -20,5 +19,4 @@ config BR2_PACKAGE_MINIZIP_DEMOS
 
 comment "minizip needs a toolchain w/ threads, wchar"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
