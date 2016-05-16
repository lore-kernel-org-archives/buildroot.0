From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 00:03:19 +0200
Subject: [Buildroot] [PATCH] assimp: disable on Microblaze
Message-ID: <1463436199-15509-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package triggers an infinite loop bug in gcc on the Microblaze
architecture when the optimization level is O1, O2 or O3. This bug has
been reported at https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71124.

While Buildroot by default uses an Os optimization level, assimp's build
system overrides that by O3 by default.

This problem is causing timeouts in the autobuilders that make them
consume 100% of CPU during 8 hours (the timeout used by the autobuilder
scripts).

Fixes:

  http://autobuild.buildroot.net/results/084fc537ab81aed278126f173daf99f2699ef22c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/assimp/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/assimp/Config.in b/package/assimp/Config.in
index 35e2f23..93020f7 100644
--- a/package/assimp/Config.in
+++ b/package/assimp/Config.in
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_ASSIMP
 	bool "assimp"
+	# All gcc versions affected by
+	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71124, that
+	# cause an infinite loop in gcc when building this package.
+	depends on !BR2_microblaze
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_ZLIB
 	help
@@ -11,4 +15,5 @@ config BR2_PACKAGE_ASSIMP
 	  http://www.assimp.org
 
 comment "assimp needs a toolchain w/ C++"
+	depends on !BR2_microblaze
 	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.7.4
