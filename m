From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 23:23:50 +0200
Subject: [Buildroot] [PATCH 3/3] flann: disable on microblaze
In-Reply-To: <1463520230-6127-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1463520230-6127-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1463520230-6127-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.7.4
