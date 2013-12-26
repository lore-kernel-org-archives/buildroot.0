From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 10:44:45 +0100
Subject: [Buildroot] [git commit] fio: prevent selection with unusable
	uClibc versions
Message-ID: <20131226094726.567429C1E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b788f1ef0660b6614ddd39535fa177d24cf02579
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The fio program uses posix_madvise(). However, posix_madvise() is only
available in the Git tree of uClibc, and in Buildroot's version of
uClibc 0.9.33, thanks to the huge number of backported patches that we
carry.

Therefore, trying to build fio with an external uClibc toolchain is
most likely going to fail (as the uClibc version is most likely an
official stable release, and no stable release of uClibc ever had the
support for posix_madvise()). And similarly, building fio with uClibc
0.9.31 and 0.9.32 is always going to fail. We disable those use cases
to avoid repeated autobuilder failures.

No kconfig comment has been added, because we don't have a
well-defined way of specifying such exceptions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fio/Config.in |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/fio/Config.in b/package/fio/Config.in
index deff12c..be99f25 100644
--- a/package/fio/Config.in
+++ b/package/fio/Config.in
@@ -3,6 +3,15 @@ config BR2_PACKAGE_FIO
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# fio uses posix_madvise(), which is not part of any official
+	# release of uClibc, but is part of uClibc Git, and backported
+	# in Buildroot patch set of uClibc 0.9.33. Therefore, we
+	# disable the build of fio for external uClibc toolchains
+	# (which use an unknown uClibc version) and for 0.9.31 and
+	# 0.9.32 which don't have posix_madvise().
+	depends on !BR2_TOOLCHAIN_EXTERNAL_UCLIBC && \
+		!BR2_UCLIBC_VERSION_0_9_31 && \
+		!BR2_UCLIBC_VERSION_0_9_32
 	help
 	  fio is an I/O tool meant to be used both for benchmark
 	  and stress/hardware verification.
