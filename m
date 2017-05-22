From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 May 2017 16:10:30 +0200
Subject: [Buildroot] [git commit branch/next] fio: re-enable on uClibc
Message-ID: <20170522141157.21BDF827E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc5d15a480df91f6cc768dab5bbbefe74b1b13aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The fio package was disabled on uClibc because posix_madvise() was
back then not implemented in an official release of uClibc. It now
exists in uClibc-ng since its version 1.0.0, so we can assume it's
available. We already make lots of assumptions about external uClibc
toolchains, and they should definitely be using a recent version of
uClibc-ng to be usable by Buildroot.

Also, the Config.in comment was not handling this uClibc exception.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fio/Config.in | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/fio/Config.in b/package/fio/Config.in
index 89f54f9..8da227d 100644
--- a/package/fio/Config.in
+++ b/package/fio/Config.in
@@ -4,12 +4,6 @@ config BR2_PACKAGE_FIO
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	# fio uses posix_madvise(), which is not part of any official
-	# release of uClibc, but is part of uClibc Git, and backported
-	# in Buildroot patch set of uClibc 0.9.33. Therefore, we
-	# disable the build of fio for external uClibc toolchains
-	# (which use an unknown uClibc version)
-	depends on !BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	# fio uses fallocate() which becomes fallocate64() while compiling with
 	# largefile support, but fallocate64() is not available on nios2
 	depends on !BR2_nios2
