From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 May 2014 22:05:18 +0200
Subject: [Buildroot] [git commit] fio: disable on nios2 because of missing
	fallocate64()
Message-ID: <20140519200727.E91FB9C1A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed56f35cbf53b48c32af4857a2a3f80294d67afc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The fallocate() function is replaced by fallocate64() while compiling
with LARGE_FILE flags. Current nios2 toolchain is missing the fallocate64()
function.

Fixes:
    http://autobuild.buildroot.net/results/9cd/9cd30031a40f768f6090cfba44c880fb2406672b
    http://autobuild.buildroot.net/results/7da/7da32ca8178aa6bada06dfaea38e9e693fba0db2
    http://autobuild.buildroot.net/results/0ef/0ef7358289bff2a5f9efda27115eddb379c1a0b9
    [...]

[Peter: reference BR2_LARGEFILE, add autobuilder refs as suggested by Yann]
Signed-off-by: Frank Bergmann <frank@frajasalo.de>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fio/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/fio/Config.in b/package/fio/Config.in
index be99f25..3f0599d 100644
--- a/package/fio/Config.in
+++ b/package/fio/Config.in
@@ -12,6 +12,9 @@ config BR2_PACKAGE_FIO
 	depends on !BR2_TOOLCHAIN_EXTERNAL_UCLIBC && \
 		!BR2_UCLIBC_VERSION_0_9_31 && \
 		!BR2_UCLIBC_VERSION_0_9_32
+	# fio uses fallocate() which becomes fallocate64() while compiling
+	# with BR2_LARGEFILE but fallocate64() is not available on nios2
+	depends on !BR2_nios2
 	help
 	  fio is an I/O tool meant to be used both for benchmark
 	  and stress/hardware verification.
@@ -20,3 +23,4 @@ config BR2_PACKAGE_FIO
 
 comment "fio needs a toolchain w/ largefile, threads"
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_nios2
