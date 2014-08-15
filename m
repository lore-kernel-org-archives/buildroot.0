From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Aug 2014 12:02:05 +0200
Subject: [Buildroot] [git commit] libcuefile: fix static linking
Message-ID: <20140815100618.995649D1C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=91ff8611957d0581760d9a3a19ea332b440fdbc5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch to libcuefile to fix BR2_PREFER_STATIC_LIB=y configurations.

Fixes:

  http://autobuild.buildroot.org/results/13e/13ecdab5bb132532674a51e0e0e1136d417dfcd9/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../libcuefile-0001-fix-static-link.patch          |   25 ++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/libcuefile/libcuefile-0001-fix-static-link.patch b/package/libcuefile/libcuefile-0001-fix-static-link.patch
new file mode 100644
index 0000000..6eb5890
--- /dev/null
+++ b/package/libcuefile/libcuefile-0001-fix-static-link.patch
@@ -0,0 +1,25 @@
+Fix static only build
+
+Make sure to build the shared library only if BUILD_SHARED_LIBS is
+ON. Normally, CMake takes care of this automatically, but libcuefile
+wants to build both the shared and static variants, so the normal
+logic of CMake doesn't apply.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/src/CMakeLists.txt
+===================================================================
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -4,7 +4,11 @@
+ add_library(cuefile-static STATIC cd cdtext cue_parse cue_print cue_scan cuefile time toc toc_parse toc_print toc_scan)
+ set_target_properties(cuefile-static PROPERTIES OUTPUT_NAME cuefile CLEAN_DIRECT_OUTPUT 1)
+ 
++if (BUILD_SHARED_LIBS)
+ add_library(cuefile-shared SHARED cd cdtext cue_parse cue_print cue_scan cuefile time toc toc_parse toc_print toc_scan)
+ set_target_properties(cuefile-shared PROPERTIES OUTPUT_NAME cuefile CLEAN_DIRECT_OUTPUT 1 VERSION 0.0.0 SOVERSION 0)
+ 
+ install(TARGETS cuefile-static cuefile-shared LIBRARY DESTINATION "lib${LIB_SUFFIX}" ARCHIVE DESTINATION "lib${LIB_SUFFIX}")
++else (BUILD_SHARED_LIBS)
++install(TARGETS cuefile-static LIBRARY DESTINATION "lib${LIB_SUFFIX}" ARCHIVE DESTINATION "lib${LIB_SUFFIX}")
++endif (BUILD_SHARED_LIBS)
