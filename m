From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 May 2018 09:05:33 +0200
Subject: [Buildroot] [git commit] lcms2: bump to version 2.9
Message-ID: <20180506071548.422948641C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2561d0844b8caca1c12ec3b23e0accadd394e83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove two patches (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Fix-lcms2.pc.in-thread-library-dependency.patch | 26 ---------------------
 .../0002-Added-an-extra-check-to-MLU-bounds.patch  | 27 ----------------------
 package/lcms2/lcms2.hash                           |  7 +++---
 package/lcms2/lcms2.mk                             |  2 +-
 4 files changed, 5 insertions(+), 57 deletions(-)

diff --git a/package/lcms2/0001-Fix-lcms2.pc.in-thread-library-dependency.patch b/package/lcms2/0001-Fix-lcms2.pc.in-thread-library-dependency.patch
deleted file mode 100644
index f8c0d00d30..0000000000
--- a/package/lcms2/0001-Fix-lcms2.pc.in-thread-library-dependency.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 0b55fd4e0935a0231ca258fde631a95215df2f72 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Fri, 11 Nov 2016 23:29:56 +0100
-Subject: [PATCH] Fix lcms2.pc.in thread library dependency.
-
-Needed (sometimes) for static linking.
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- lcms2.pc.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lcms2.pc.in b/lcms2.pc.in
-index b715f59..5b4213c 100644
---- a/lcms2.pc.in
-+++ b/lcms2.pc.in
-@@ -7,5 +7,5 @@ Name: @PACKAGE@
- Description: LCMS Color Management Library
- Version: @VERSION@
- Libs: -L${libdir} -llcms2
--Libs.private: @LIB_MATH@ 
-+Libs.private: @LIB_MATH@ @LIB_THREAD@
- Cflags: -I${includedir}
--- 
-2.8.1
-
diff --git a/package/lcms2/0002-Added-an-extra-check-to-MLU-bounds.patch b/package/lcms2/0002-Added-an-extra-check-to-MLU-bounds.patch
deleted file mode 100644
index 9a5d9dd4e9..0000000000
--- a/package/lcms2/0002-Added-an-extra-check-to-MLU-bounds.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 5ca71a7bc18b6897ab21d815d15e218e204581e2 Mon Sep 17 00:00:00 2001
-From: Marti <marti.maria@tktbrainpower.com>
-Date: Mon, 15 Aug 2016 23:31:39 +0200
-Subject: [PATCH] Added an extra check to MLU bounds
-
-Thanks to Ibrahim el-sayed for spotting the bug
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/cmstypes.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/cmstypes.c b/src/cmstypes.c
-index cb61860..c7328b9 100644
---- a/src/cmstypes.c
-+++ b/src/cmstypes.c
-@@ -1460,6 +1460,7 @@ void *Type_MLU_Read(struct _cms_typehandler_struct* self, cmsIOHANDLER* io, cmsU
- 
-         // Check for overflow
-         if (Offset < (SizeOfHeader + 8)) goto Error;
-+        if ((Offset + Len) > SizeOfTag + 8) goto Error;
- 
-         // True begin of the string
-         BeginOfThisString = Offset - SizeOfHeader - 8;
--- 
-2.11.0
-
diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
index 1cf1017c54..248a08cf87 100644
--- a/package/lcms2/lcms2.hash
+++ b/package/lcms2/lcms2.hash
@@ -1,4 +1,5 @@
-# From https://sourceforge.net/projects/lcms/files/lcms/2.8
-sha1 e9535ec4a572b8fc7a1c405c35e6f4dc97714197 lcms2-2.8.tar.gz
+# From https://sourceforge.net/projects/lcms/files/lcms/2.9
+sha1 60bea9875e017dd1c466e988c2ad98f8766e4e55 lcms2-2.9.tar.gz
 # Locally computed:
-sha256 66d02b229d2ea9474e62c2b6cd6720fde946155cd1d0d2bffdab829790a0fb22 lcms2-2.8.tar.gz
+sha256 48c6fdf98396fa245ed86e622028caf49b96fa22f3e5734f853f806fbc8e7d20 lcms2-2.9.tar.gz
+sha256 c725daac91a9259ce5e195683c0eeb797d345035c36ac5ba114c9fa80e11639a COPYING
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index f61563dea4..b6c292b762 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LCMS2_VERSION = 2.8
+LCMS2_VERSION = 2.9
 LCMS2_SITE = http://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = COPYING
