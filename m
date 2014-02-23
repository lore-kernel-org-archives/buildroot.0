From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Feb 2014 12:33:03 +0100
Subject: [Buildroot] [git commit] alsa-utils: disable on no-mmu platforms
	(fork)
Message-ID: <20140223113404.D8F918B50D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9520a56810ffb2c5d84aa2da283b37ec4c512b2c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

alsa-utils uses fork which is not available on targets without MMU support.
It seems to be possible to replace fork with vfork in alsa-utils, but we do
not like to carry such patches in buildroot without them being accepted
upstream.

Fixes
http://autobuild.buildroot.org/results/9f8/9f8e572c9f1c677155cc7d1828371bcf572ff878

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-utils/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index 12f1020..6398593 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ALSA_UTILS
 	bool "alsa-utils"
+	depends on BR2_USE_MMU # fork
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
 	select BR2_PACKAGE_ALSA_LIB
@@ -10,6 +11,7 @@ config BR2_PACKAGE_ALSA_UTILS
 	  http://www.alsa-project.org/
 
 comment "alsa-utils needs a toolchain w/ largefile, threads"
+	depends on BR2_USE_MMU # fork
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 
 if BR2_PACKAGE_ALSA_UTILS
