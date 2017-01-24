From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 23:20:09 +1300
Subject: [Buildroot] [git commit] rng-tools: Fix disabling package on
	non-x86 architectures.
Message-ID: <20170124102020.A34E881EC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d34c0cc5800e4af4889e8631d343fcf0a894a43a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 2f89476 ("package/libgpg-error: bump to version 1.23") introduced
a BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS which was added as a dependency
to all libgpg-error reverse dependencies.

However, rng-tools only select libgpg-error if BR2_i386 || BR2_x86_64
(for RDRAND) but the rng-tools dependency was added as
BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS && (BR2_i386 || BR2_x86_64),
Therefore limiting rng-tools to the x86 architecture.

This patch changes it as ..._ARCH_SUPPORT || !(BR2_i386 || BR2_x86_64).

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rng-tools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
index 0c538cc..b00477d 100644
--- a/package/rng-tools/Config.in
+++ b/package/rng-tools/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_RNG_TOOLS
 	bool "rng-tools"
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS && (BR2_i386 || BR2_x86_64) # libgcrypt
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS || !(BR2_i386 || BR2_x86_64) # libgcrypt
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
 	# For rdrand ligcrypt is required and it's not obvious to users
 	select BR2_PACKAGE_LIBGCRYPT if BR2_i386 || BR2_x86_64
