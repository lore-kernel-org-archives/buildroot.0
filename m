From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 15 Aug 2017 18:05:08 +0200
Subject: [Buildroot] [git commit] package/mtd: test programs need threads
Message-ID: <20170815160109.9AD8D7FA7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=95e8c5eb6f15712ce0f40dbc0f806a95f40d3b95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test programs depend on pthreads:
http://git.infradead.org/mtd-utils.git/blob/1bfee8660131fca7a18f68e9548a18ca6b3378a0:/configure.ac#l43

Also propagate the threads dependency to BR2_PACKAGE_MTD_INTEGCK.

Fixes
http://autobuild.buildroot.net/results/879/879c79e505f65387a46c4be263dc8783c8ca61bf/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Arnout: add depends on BR2_USE_MMU to comment]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mtd/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index a1df4cf..37e4b4a 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -24,6 +24,7 @@ config BR2_PACKAGE_MTD_UBIFS_UTILS
 
 config BR2_PACKAGE_MTD_TESTS
 	bool
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 
 comment "MTD tools selection"
 
@@ -174,9 +175,14 @@ config BR2_PACKAGE_MTD_UBIBLOCK
 
 config BR2_PACKAGE_MTD_INTEGCK
 	bool "integck"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # mtd-tests
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_MTD_TESTS
 	help
 	  Install the integck test program.
 
+comment "integck needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+
 endif
