From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 17:39:43 +0200
Subject: [Buildroot] [git commit] flann: disable on microblaze
Message-ID: <20160524153957.D2B4E81F0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=956924faa452655eebd2653c2d1db63c6c33bf46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All gcc versions fail to build flann on the Microblaze architecture, due
to gcc bug https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69401, so let's
disable this package on this architecture.

Fixes:

  http://autobuild.buildroot.net/results/3f44a1f30a88dbe4a3a83055267b472b58769e15/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/flann/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/flann/Config.in b/package/flann/Config.in
index 3725fc7..a2cd50c 100644
--- a/package/flann/Config.in
+++ b/package/flann/Config.in
@@ -2,6 +2,9 @@ config BR2_PACKAGE_FLANN
 	bool "flann"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
+	# all gcc versions fail to build flann on Microblaze due to
+	# gcc bug https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69401
+	depends on !BR2_microblaze
 	help
 	  FLANN is a library for performing fast approximate nearest
 	  neighbor searches in high dimensional spaces. It contains a
@@ -22,4 +25,5 @@ config BR2_PACKAGE_FLANN_EXAMPLES
 endif
 
 comment "flann needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_microblaze
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
