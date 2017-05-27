From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 May 2017 17:16:06 +0200
Subject: [Buildroot] [git commit] package/opencv: fix build with old glibc
	versions
Message-ID: <20170527151611.5C4C38290E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbf2b6e3db65500f7bb29aa029a620570026373c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Prior to glibc 2.18, definitions like SIZE_MAX or INT_FAST32_MAX from
<stdint.h> were only made available for C code, or in C++ if
__STDC_LIMIT_MACROS was defined.

The code from jasper uses such definitions, without defining
__STDC_LIMIT_MACROS. Unfortunately, defining __STDC_LIMIT_MACROS in
the jasper headers doesn't work, since <stdint.h> has already been
included before, at a point where __STDC_LIMIT_MACROS was not defined.

So to solve this problem, we simply pass -D__STDC_LIMIT_MACROS in
CXXFLAGS when building opencv with jasper support.

This patch uses the same solution used for libraw:
https://git.buildroot.net/buildroot/commit/package/libraw?id=d246cf5fd01bb0d20a0e64194ffed514ea8dd0aa

Fixes:
http://autobuild.buildroot.net/results/095/095f7574afdb633c59a625cd063de03644b6d3a7/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/opencv.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index ff5ab02..92cfd43 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -192,7 +192,8 @@ OPENCV_CONF_OPTS += -DWITH_GTK=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_JASPER),y)
-OPENCV_CONF_OPTS += -DWITH_JASPER=ON
+OPENCV_CONF_OPTS += -DWITH_JASPER=ON \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -D__STDC_LIMIT_MACROS"
 OPENCV_DEPENDENCIES += jasper
 else
 OPENCV_CONF_OPTS += -DWITH_JASPER=OFF
