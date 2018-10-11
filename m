From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 11 Oct 2018 21:04:29 +0200
Subject: [Buildroot] [PATCH 1/1] xerces: fix buid with older cmake
Message-ID: <20181011190429.22484-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Old version of cmake break cross-compilation when FindThreads is used
because of a try_run call. Add a workaround that avoids try_run.

cmake bug report: https://gitlab.kitware.com/cmake/cmake/issues/16920

Fixes:
 - http://autobuild.buildroot.org/results/784918c58310474e8b4a0b42850a55ba35a1a19e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xerces/xerces.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
index 906e4b663c..c75a8b0d35 100644
--- a/package/xerces/xerces.mk
+++ b/package/xerces/xerces.mk
@@ -17,6 +17,11 @@ endef
 
 XERCES_POST_PATCH_HOOKS += XERCES_DISABLE_SAMPLES
 
+# Before CMake 3.10, passing THREADS_PTHREAD_ARG=OFF was needed to
+# disable a try_run() call in the FindThreads tests, which caused a
+# build failure when cross-compiling.
+XERCES_CONF_OPTS += -DTHREADS_PTHREAD_ARG=OFF
+
 ifeq ($(BR2_PACKAGE_ICU),y)
 XERCES_DEPENDENCIES += icu
 endif
-- 
2.17.1
