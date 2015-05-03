From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 May 2015 19:33:52 +0200
Subject: [Buildroot] [git commit] libfreeimage: disable on ARC and Blackfin
Message-ID: <20150503173426.09F6980836@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6e55cd5d604b51a5f6658d4bf2f602a360d9c887
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libfreeimage fails to build on ARC, due to compiler issues:

  Error: invalid register number `63'

This should probably be fixed at the compiler level.

It also fails to build on Blackfin, due to numerous libfreeimage
issues:

  1/ Missing LL suffixes in Source/OpenEXR/IlmImf/ImfFastHuf.cpp. This
     can be fixed by backporting upstream OpenEXR commit
     https://github.com/openexr/openexr/commit/57ecf581d053f5cacf2e8fc3c024490e0bbe536f.patch.

  2/ Invalid characters in libraw_x3f.cpp. This can be fixed by
     applying dos2unix on the file.

  3/ Usage of too long constants in an unsigned long in
     dcraw_common.cpp, in code like "id == 0x4434303430" where id is
     an "unsigned long" i.e 32 bits on 32 bits platform.

Due to (3) being apparently unsolved upstream, and causing a build
error on Blackfin, we disable libfreeimage on this
architecture. However, this code seems so broken that making
libfreeimage as entirely broken would maybe be a better option.

Fixes:

  http://autobuild.buildroot.org/results/b33/b3372581c82786cc0a87f8cc2e78f047cc079255/ (ARC issue)
  http://autobuild.buildroot.org/results/f3b/f3bd6be448cffed3caae7850233168e6d0f6a5bd/ (Blackfin issue)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfreeimage/Config.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/libfreeimage/Config.in b/package/libfreeimage/Config.in
index 914c0af..04fb278 100644
--- a/package/libfreeimage/Config.in
+++ b/package/libfreeimage/Config.in
@@ -2,6 +2,10 @@ config BR2_PACKAGE_LIBFREEIMAGE
 	bool "libfreeimage"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
+	# compiler issue: "Error: invalid register number `63'"
+	depends on !BR2_arc
+	# Numerous build issues
+	depends on !BR2_bfin
 	help
 	  FreeImage is an Open Source library project for developers who
 	  would like to support popular graphics image formats like PNG,
@@ -11,4 +15,6 @@ config BR2_PACKAGE_LIBFREEIMAGE
 	  http://freeimage.sourceforge.net
 
 comment "libfreeimage needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_arc
+	depends on !BR2_bfin
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP
