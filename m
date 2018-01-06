From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Jan 2018 15:29:53 +0100
Subject: [Buildroot] [git commit] nilfs-utils: need NPTL threads
Message-ID: <20180106143039.9BA9F83A86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f2ced651ba50c72d988b635cd883fd3f291b608
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nilfs-utils use clock_nanosleep(), which comes with NPTL threads. We
keep the dependency on threads, because sem_open() is really related
to thread support. The dependency on NPTL for clock_nanosleep() might
be lifted in the future, as it seems to be a bug in uClibc-ng.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
[Thomas: update Config.in comment.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nilfs-utils/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/nilfs-utils/Config.in b/package/nilfs-utils/Config.in
index 0c6b7a0..e49cab3 100644
--- a/package/nilfs-utils/Config.in
+++ b/package/nilfs-utils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NILFS_UTILS
 	bool "nilfs-utils"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # sem_open()
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # clock_nanosleep()
 	depends on BR2_USE_MMU # util-linux libmount, libblkid
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
@@ -11,5 +12,6 @@ config BR2_PACKAGE_NILFS_UTILS
 
 	  https://github.com/nilfs-dev/nilfs-utils
 
-comment "nilfs-utils needs a toolchain w/ threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+comment "nilfs-utils needs a toolchain w/ threads, NPTL"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
