From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 26 Dec 2020 11:25:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/opencv3: fix build with protobuf
 and gcc < 6
Message-ID: <20201226102500.351912-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/opencv3/opencv3.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 3e3e5987a5..06074ac229 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -286,7 +286,9 @@ OPENCV3_CONF_OPTS += -DWITH_PNG=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV3_WITH_PROTOBUF),y)
+# protobuf needs c++11 (since 3.6.0)
 OPENCV3_CONF_OPTS += \
+	-DENABLE_CXX11=ON \
 	-DPROTOBUF_UPDATE_FILES=ON \
 	-DWITH_PROTOBUF=ON
 OPENCV3_DEPENDENCIES += protobuf
-- 
2.29.2
