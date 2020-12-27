From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 14:45:20 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/opencv3: fix
 build with protobuf and gcc < 6
Message-ID: <20201227133026.8702582B9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c768514db989a59802858df9616670ad2531872b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Fix the folloing build failure with protobuf (enabled since commit
31c68a449ecd7da61ecfd909bea7ce799f9a6450) and gcc 5.3.0:

[ 53%] Building CXX object modules/dnn/CMakeFiles/opencv_dnn.dir/opencv-caffe.pb.cc.o
In file included from /home/peko/autobuild/instance-1/output-1/per-package/opencv3/host/opt/ext-toolchain/mips64el-buildroot-linux-uclibc/include/c++/5.5.0/atomic:38:0,
                 from /home/peko/autobuild/instance-1/output-1/per-package/opencv3/host/mips64el-buildroot-linux-uclibc/sysroot/usr/include/google/protobuf/io/coded_stream.h:115,
                 from /home/peko/autobuild/instance-1/output-1/build/opencv3-3.4.12/buildroot-build/modules/dnn/opencv-caffe.pb.h:23,
                 from /home/peko/autobuild/instance-1/output-1/build/opencv3-3.4.12/buildroot-build/modules/dnn/opencv-caffe.pb.cc:4:
/home/peko/autobuild/instance-1/output-1/per-package/opencv3/host/opt/ext-toolchain/mips64el-buildroot-linux-uclibc/include/c++/5.5.0/bits/c++0x_warning.h:32:2: error: #error This file requires compiler and library support for the ISO C++ 2011 standard. This support must be enabled with the -std=c++11 or -std=gnu++11 compiler options.
 #error This file requires compiler and library support \
  ^

Fixes:
 - http://autobuild.buildroot.org/results/7caf175af039054a032b8f63b458b3940d9ec0f3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bf96f4e8d327a8d7a4b1ab732486aced3d1d8da8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv3/opencv3.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 865f69ac8f..872b1272a6 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -288,7 +288,9 @@ OPENCV3_CONF_OPTS += -DWITH_PNG=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV3_WITH_PROTOBUF),y)
+# protobuf needs c++11 (since 3.6.0)
 OPENCV3_CONF_OPTS += \
+	-DENABLE_CXX11=ON \
 	-DPROTOBUF_UPDATE_FILES=ON \
 	-DWITH_PROTOBUF=ON
 OPENCV3_DEPENDENCIES += protobuf
