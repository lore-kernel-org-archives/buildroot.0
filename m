From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 15 Mar 2021 21:13:45 +0100
Subject: [Buildroot] [PATCH v1] package/sane-backends: fix gcc-4.8 compile
Message-ID: <20210315201345.4567-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch to use legacy initializer variant to fix gcc-4.8 compile.

Fixes:

  - http://autobuild.buildroot.net/results/9d1cd0d0aa8c929c4b1b23b04075c331c1be80e0

  genesys/utilities.h:229:23: error: invalid initialization of non-const reference of type 'std::basic_ios<char>&' from an rvalue of type '<brace-enclosed initializer list>'
           stream_{stream}
                         ^
  genesys/image_pipeline.cpp:715:19: error: invalid initialization of non-const reference of type 'genesys::ImagePipelineNode&' from an rvalue of type '<brace-enclosed initializer list>'
       source_{source}
                     ^

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 .../0002-genesys-fix-gcc-4.8-compile.patch    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/sane-backends/0002-genesys-fix-gcc-4.8-compile.patch

diff --git a/package/sane-backends/0002-genesys-fix-gcc-4.8-compile.patch b/package/sane-backends/0002-genesys-fix-gcc-4.8-compile.patch
new file mode 100644
index 0000000000..80346596cb
--- /dev/null
+++ b/package/sane-backends/0002-genesys-fix-gcc-4.8-compile.patch
@@ -0,0 +1,50 @@
+From f67cfd6a534e9faaca83afebd61a6d77d7837174 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Mon, 15 Mar 2021 20:53:55 +0100
+Subject: [PATCH] genesys: fix gcc-4.8 compile
+
+Fixes:
+
+  genesys/utilities.h:229:23: error: invalid initialization of non-const reference of type 'std::basic_ios<char>&' from an rvalue of type '<brace-enclosed initializer list>'
+           stream_{stream}
+                         ^
+  genesys/image_pipeline.cpp:715:19: error: invalid initialization of non-const reference of type 'genesys::ImagePipelineNode&' from an rvalue of type '<brace-enclosed initializer list>'
+       source_{source}
+                     ^
+
+[Upstream: https://gitlab.com/sane-project/backends/-/merge_requests/609]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ backend/genesys/image_pipeline.cpp | 2 +-
+ backend/genesys/utilities.h        | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/backend/genesys/image_pipeline.cpp b/backend/genesys/image_pipeline.cpp
+index 4161e95..14e2f8d 100644
+--- a/backend/genesys/image_pipeline.cpp
++++ b/backend/genesys/image_pipeline.cpp
+@@ -712,7 +712,7 @@ ImagePipelineNodeCalibrate::ImagePipelineNodeCalibrate(ImagePipelineNode& source
+                                                        const std::vector<std::uint16_t>& bottom,
+                                                        const std::vector<std::uint16_t>& top,
+                                                        std::size_t x_start) :
+-    source_{source}
++    source_(source)
+ {
+     std::size_t size = 0;
+     if (bottom.size() >= x_start && top.size() >= x_start) {
+diff --git a/backend/genesys/utilities.h b/backend/genesys/utilities.h
+index 6e637d0..2ef2ddd 100644
+--- a/backend/genesys/utilities.h
++++ b/backend/genesys/utilities.h
+@@ -226,7 +226,7 @@ class BasicStreamStateSaver
+ {
+ public:
+     explicit BasicStreamStateSaver(std::basic_ios<Char, Traits>& stream) :
+-        stream_{stream}
++        stream_(stream)
+     {
+         flags_ = stream_.flags();
+         width_ = stream_.width();
+-- 
+2.30.1
+
-- 
2.30.1
