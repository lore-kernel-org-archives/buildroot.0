From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Oct 2018 22:54:46 +0200
Subject: [Buildroot] [git commit branch/2018.08.x] system: update Config.in
 comment about systemd dependencies
Message-ID: <20181001205402.4D4B68B4A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ff5c35df7607b1b31c4b39a82de13a417418f2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

In commit 879fa7f82a86ffdc6d1cf7c9bfbb5cf830583d69, the
BR2_INIT_SYSTEMD option was changed to allow selecting with a uClibc
toolchain. Unfortunately, the corresponding Config.in comment, which
was already bogus, was not updated to take into account the numerous
dependencies of BR2_INIT_SYSTEMD.

Due to this, even if you have uClibc enabled, the BR2_INIT_SYSTEMD
option may not be visible, and the Config.in comment may also not be
visible, leaving the user in the dark.

This commit fixes the dependencies of the Config.in comment so that
they match the one of the BR2_INIT_SYSTEMD option.

Reported-by: Raphael Jacob <r.jacob2002@gmail.com>
Cc: Raphael Jacob <r.jacob2002@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3c631c741c35f4afd9c7b6a41bcbcae40ecf8d49)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/Config.in | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index d14a864ca5..f63f27b126 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -137,9 +137,15 @@ config BR2_INIT_SYSTEMD
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_SYSTEMD
 
-comment "systemd needs a glibc or uClibc toolchain, headers >= 3.10"
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC \
-		&& BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10)
+comment "systemd needs a glibc or uClibc toolchain w/ wchar, threads, SSP, dynamic library, headers >= 3.10"
+	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC) || \
+		!BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HAS_SSP || \
+		BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 
 config BR2_INIT_NONE
 	bool "None"
