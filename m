From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 May 2016 13:22:11 +0200
Subject: [Buildroot] [git commit] assimp: disable on Microblaze
Message-ID: <20160517112332.300F881938@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9acd598bccaab7e5edef5444abf97c840737c5b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
