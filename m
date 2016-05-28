From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 19:32:55 +0200
Subject: [Buildroot] [git commit] package/grantlee: disable for nios2 and
	microblaze
Message-ID: <20160528173343.3620781851@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ef21bc8d4e893faa81f75ef5130fa47f4dde468
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable grantlee due to a toolchain issue on nios2 and microblaze architecture [1].
Issue reproduced with binutils 2.26 and GCC 6

Fixes (microblaze):
http://autobuild.buildroot.net/results/091/091bf7df46d6057be44b8ca8653596bd84c38fbc

Fixes (nios2):
http://autobuild.buildroot.net/results/e05/e05280f1cc4f669b7e418161749290723179e987

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=20173

Signed-off-by: Romain Naour <romain.naour@gmail.com>
[Thomas:
 - tweak how the dependency is expressed
 - propagate the dependency to the comments.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/grantlee/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/grantlee/Config.in b/package/grantlee/Config.in
index 97be721..7895c7e 100644
--- a/package/grantlee/Config.in
+++ b/package/grantlee/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_GRANTLEE
 	depends on (BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT && BR2_PACKAGE_QT) || \
 		(BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5)
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405 # Qt GUI module
+	# https://sourceware.org/bugzilla/show_bug.cgi?id=20173
+	depends on !BR2_microblaze && !BR2_nios2
 	select BR2_PACKAGE_QT_STL if BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_SCRIPT if BR2_PACKAGE_QT
 	select BR2_PACKAGE_QT_GUI_MODULE if BR2_PACKAGE_QT
@@ -16,6 +18,7 @@ config BR2_PACKAGE_GRANTLEE
 
 comment "grantlee needs a toolchain with NPTL not affected by Binutils bug 19405"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on !BR2_microblaze && !BR2_nios2
 	depends on (BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT && BR2_PACKAGE_QT) || \
 		(BR2_PACKAGE_QT5_JSCORE_AVAILABLE && BR2_PACKAGE_QT5) || \
 		BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19405
