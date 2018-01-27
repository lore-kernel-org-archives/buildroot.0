From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Jan 2018 11:22:33 +0100
Subject: [Buildroot] [git commit] package/physfs: needs threads support
Message-ID: <20180127102305.640AE83E90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53252f23b7011780daaf8185d8f0e2a7c5609dd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When physfs is built for a Linux system the PHYSFS_PLATFORM_POSIX (which
enable code that use pthread_*()) symbol must be defined, so threads support
is required.  The physfs build system used by the previous version didn't
correctly set PHYSFS_PLATFORM_POSIX for system without pthread support.

Add pthread dependency.

Fixes:
http://autobuild.buildroot.org/results/75d/75d68ff9da42d61f47d80b463445c12bc51ed1a4

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/physfs/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/physfs/Config.in b/package/physfs/Config.in
index dad3ab4..c272d88 100644
--- a/package/physfs/Config.in
+++ b/package/physfs/Config.in
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_PHYSFS
 	bool "physfs"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  PhysicsFS; a portable, flexible file i/o abstraction.
 
 	  http://icculus.org/physfs
 
-comment "physfs needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "physfs needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
