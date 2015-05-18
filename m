From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 May 2015 22:39:16 +0200
Subject: [Buildroot] [git commit] gpsd: requires shared library support
Message-ID: <20150518204023.AD631805F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=db989f89c9fb1ebc3997d8a3c517948392611d77
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gpsd always tries to build a shared library, so make it 'depends on
!BR2_STATIC_LIBS'. We also propagate this to the only gpsd reverse
dependency, the location support of sconeserver. While we're at it, we
add a comment indicating the dependencies of this location support,
which was missing.

Fixes:

  http://autobuild.buildroot.org/results/f52/f5261a0933f9b5449d1f4e5cab1bb02e7154e683/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gpsd/Config.in        |    6 ++++--
 package/sconeserver/Config.in |    6 ++++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index fac8756..fa8b8f6 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -1,6 +1,6 @@
-comment "gpsd needs a toolchain w/ threads"
+comment "gpsd needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 	depends on !BR2_microblaze
 
 config BR2_PACKAGE_GPSD
@@ -8,6 +8,8 @@ config BR2_PACKAGE_GPSD
 	# Uses fork()
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# Always tries to build a shared library
+	depends on !BR2_STATIC_LIBS
 	# triggers gcc ice
 	depends on !BR2_microblaze
 	help
diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index c7d602f..f16e683 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -64,10 +64,16 @@ config BR2_PACKAGE_SCONESERVER_LOCATION
 	depends on BR2_USE_MMU # gpsd
 	depends on BR2_TOOLCHAIN_HAS_THREADS # gpsd
 	depends on !BR2_microblaze # gpsd
+	depends on !BR2_STATIC_LIBS # gpsd
 	select BR2_PACKAGE_GPSD
 	help
 	  Location module for Sconeserver
 
+comment "location support needs a toolchain w/ theads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBRARY
+	depends on !BR2_microblaze
+
 config BR2_PACKAGE_SCONESERVER_LETTUCE
 	bool "lettuce"
 	help
