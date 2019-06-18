From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Jun 2019 19:57:41 +0200
Subject: [Buildroot] [git commit] package/keyutils: re-enable package on
 microblaze
Message-ID: <20190619052057.9380F8F5C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e8812922d35d2af9d71cf462dd065698360bde7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

keyutils has a !BR2_microblaze introduced by commit:
https://git.buildroot.net/buildroot/commit/?id=20e0926f4469a3486629cfd6fa7f449f2b659aa8
that points 2 possible build failures:
- "warning: dereferencing type-punned pointer will break strict-aliasing
  rules" treated as an error. But this warning is not treated as an
  error anymore since -Werror flag is not used after last version bumps
- glibc does not export the resolver symbols resulting in linking
  failure. But glibc used was version 2.3.6 that is not used anymore
  since. It's been released in 2005.

So re-enable package for Microblaze by removing 'depends on
!BR2_microblaze' from keyutils Config.in

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/keyutils/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/keyutils/Config.in b/package/keyutils/Config.in
index 6f0758f473..7813de3799 100644
--- a/package/keyutils/Config.in
+++ b/package/keyutils/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_KEYUTILS
 	bool "keyutils"
-	depends on !BR2_microblaze
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlopen
 	help
@@ -10,6 +9,5 @@ config BR2_PACKAGE_KEYUTILS
 	  http://people.redhat.com/~dhowells/keyutils/
 
 comment "keyutils needs a toolchain w/ dynamic library"
-	depends on !BR2_microblaze
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS
