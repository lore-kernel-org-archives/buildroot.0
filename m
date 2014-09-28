From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Sep 2014 21:33:42 +0200
Subject: [Buildroot] [git commit] glm: Added package
Message-ID: <20140928195514.E60389D791@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f6a622240fb1ad567dfbe08fad5bfc0a749d5f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenGL Mathematics (GLM) is a header only C++ mathematics library for
graphics software based on the OpenGL Shading Language (GLSL)
specification.

http://glm.g-truc.net/

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in     |    1 +
 package/glm/Config.in |   10 ++++++++++
 package/glm/glm.mk    |   17 +++++++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2eefc3f..2ad72bc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -836,6 +836,7 @@ menu "Other"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
 	source "package/glibmm/Config.in"
+	source "package/glm/Config.in"
 	source "package/gmp/Config.in"
 	source "package/gsl/Config.in"
 	source "package/gtest/Config.in"
diff --git a/package/glm/Config.in b/package/glm/Config.in
new file mode 100644
index 0000000..41b3608
--- /dev/null
+++ b/package/glm/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_GLM
+	bool "glm"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  OpenGL Mathematics (GLM)
+
+	  http://glm.g-truc.net
+
+comment "glm needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/glm/glm.mk b/package/glm/glm.mk
new file mode 100644
index 0000000..ff9423d
--- /dev/null
+++ b/package/glm/glm.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# glm
+#
+################################################################################
+
+GLM_VERSION = 0.9.5.4
+GLM_SITE = $(call github,g-truc,glm,$(GLM_VERSION))
+GLM_LICENSE = MIT
+GLM_LICENSE_FILES = copying.txt
+
+# GLM is a header-only library, it only makes sense
+# to have it installed into the staging directory.
+GLM_INSTALL_STAGING = YES
+GLM_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
