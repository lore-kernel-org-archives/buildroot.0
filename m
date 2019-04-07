From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  7 Apr 2019 16:58:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/flatbuffers: Enable host build
Message-ID: <20190407145858.19985-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Host version of flatc compiler is needed for Kodi 18.x:
https://github.com/xbmc/xbmc/blob/master/cmake/modules/FindFlatBuffers.cmake#L51

Added upstream patch to install flatc to $(HOST_DIR)/bin

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-Install-flatc-as-requested.patch     | 36 +++++++++++++++++++
 package/flatbuffers/flatbuffers.mk            | 10 ++++++
 2 files changed, 46 insertions(+)
 create mode 100644 package/flatbuffers/0001-Install-flatc-as-requested.patch

diff --git a/package/flatbuffers/0001-Install-flatc-as-requested.patch b/package/flatbuffers/0001-Install-flatc-as-requested.patch
new file mode 100644
index 0000000000..1fffe7c091
--- /dev/null
+++ b/package/flatbuffers/0001-Install-flatc-as-requested.patch
@@ -0,0 +1,36 @@
+From 6980818337bb562cf89f4c2e72fa5918a461d428 Mon Sep 17 00:00:00 2001
+From: Aleix Pol <aleixpol@kde.org>
+Date: Thu, 14 Feb 2019 22:19:36 +0100
+Subject: [PATCH] Install flatc as requested (#5180)
+
+If FLATBUFFERS_BUILD_FLATC and FLATBUFFERS_INSTALL are set, flatc should
+be installed regardless of the configuration.
+
+Downloaded from upstream commit
+https://github.com/google/flatbuffers/commit/6980818337bb562cf89f4c2e72fa5918a461d428
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ CMakeLists.txt | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index a27da3fb7..4211e58b9 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -393,7 +393,6 @@ if(FLATBUFFERS_INSTALL)
+     install(
+       TARGETS flatc EXPORT FlatcTargets
+       RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
+-      CONFIGURATIONS Release
+     )
+ 
+     install(
+@@ -401,7 +400,6 @@ if(FLATBUFFERS_INSTALL)
+       FILE FlatcTargets.cmake
+       NAMESPACE flatbuffers::
+       DESTINATION ${FB_CMAKE_DIR}
+-      CONFIGURATIONS Release
+     )
+   endif()
+ 
diff --git a/package/flatbuffers/flatbuffers.mk b/package/flatbuffers/flatbuffers.mk
index 69054885ea..8cee5019cc 100644
--- a/package/flatbuffers/flatbuffers.mk
+++ b/package/flatbuffers/flatbuffers.mk
@@ -20,4 +20,14 @@ else
 FLATBUFFERS_CONF_OPTS += -DFLATBUFFERS_BUILD_SHAREDLIB=ON
 endif
 
+HOST_FLATBUFFERS_CONF_OPTS += \
+	-DCMAKE_CXX_FLAGS="-std=c++11" \
+	-DFLATBUFFERS_BUILD_FLATLIB=OFF \
+	-DFLATBUFFERS_BUILD_FLATC=ON \
+	-DFLATBUFFERS_BUILD_FLATHASH=OFF \
+	-DFLATBUFFERS_BUILD_GRPCTEST=OFF \
+	-DFLATBUFFERS_BUILD_SHAREDLIB=OFF \
+	-DFLATBUFFERS_BUILD_TESTS=OFF
+
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.20.1
