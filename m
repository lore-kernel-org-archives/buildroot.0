From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 23 Feb 2014 11:11:18 +0100
Subject: [Buildroot] [PATCH 4 of 5 v2] alsa-utils: disable on no-mmu
	platforms (fork)
In-Reply-To: <patchbomb.1393150274@argentina>
References: <patchbomb.1393150274@argentina>
Message-ID: <bb2af0b4fae99bdd1e77.1393150278@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

alsa-utils uses fork which is not available on targets without MMU support.
It seems to be possible to replace fork with vfork in alsa-utils, but we do
not like to carry such patches in buildroot without them being accepted
upstream.

Fixes
http://autobuild.buildroot.org/results/9f8/9f8e572c9f1c677155cc7d1828371bcf572ff878

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/alsa-utils/Config.in |  2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
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
