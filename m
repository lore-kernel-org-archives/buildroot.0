From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Nov 2014 21:33:14 +0100
Subject: [Buildroot] [git commit] util-linux: re-enable libmount and
	binaries on Microblaze
Message-ID: <20141111205928.D2D29B4003@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b1dab16d40edf22a80e1512b4c93c975241e64ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 442aa88f95d6c4a921aa3d4de91f54d50bd0cd35 ("util-linux: bump
version and revamp options"), Gustavo disabled util-linux libmount and
binaries on microblaze, as it was not building properly.

However, as mentionned in the comment, these options were disabled on
Microblaze due to "libc lacks UTIME_NOW & UTIME_COMMIT for
libmount". This was true specifically for the microblaze external
toolchain that we were using at the time. But we are no longer using
this external toolchain (which proved to be broken in many ways), and
have microblaze support in our internal backend.

I have verified that with our internal toolchain, util-linux with
libmount and the binaries enabled builds fine.

Those options are not selected by anything else in Buildroot, so
there's no other package impacted by this dependency change.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/Config.in |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index 934021a..07e1fbb 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -21,8 +21,6 @@ config BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 
 config BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
-	# libc lacks UTIME_NOW & UTIME_COMMIT
-	depends on !(BR2_microblazeel || BR2_microblazebe)
 	depends on BR2_USE_MMU # util-linux/libblkid
 	bool "libmount"
 	help
@@ -36,8 +34,6 @@ config BR2_PACKAGE_UTIL_LINUX_LIBUUID
 config BR2_PACKAGE_UTIL_LINUX_BINARIES
 	bool "install utilities"
 	depends on BR2_USE_MMU # fork()
-	# libc lacks UTIME_NOW & UTIME_COMMIT for libmount
-	depends on !(BR2_microblazeel || BR2_microblazebe)
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
