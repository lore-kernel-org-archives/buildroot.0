From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Jun 2015 09:39:46 +0200
Subject: [Buildroot] [git commit] gflags: new package
Message-ID: <20150610074915.1FB0B807FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97b7fd055dcbdbf9064aff30641742d4f488e134
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Reviewed-by: Abhimanyu Vishwakarma <abhimanyu.v@imgtec.com>
Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/gflags/Config.in   |   13 +++++++++++++
 package/gflags/gflags.hash |    2 ++
 package/gflags/gflags.mk   |   17 +++++++++++++++++
 4 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e8a7d0a..a17901f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1015,6 +1015,7 @@ menu "Other"
 	source "package/elfutils/Config.in"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
+	source "package/gflags/Config.in"
 	source "package/glibmm/Config.in"
 	source "package/glm/Config.in"
 	source "package/gmp/Config.in"
diff --git a/package/gflags/Config.in b/package/gflags/Config.in
new file mode 100644
index 0000000..ed05944
--- /dev/null
+++ b/package/gflags/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_GFLAGS
+	bool "gflags"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  The gflags package contains a C++ library that implements
+	  commandline flags processing. It includes built-in support for
+	  standard types such as string and the ability to define flags
+	  in the source file in which they are used.
+
+	  https://github.com/gflags/gflags
+
+comment "gflags needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/gflags/gflags.hash b/package/gflags/gflags.hash
new file mode 100644
index 0000000..9c8b27a
--- /dev/null
+++ b/package/gflags/gflags.hash
@@ -0,0 +1,2 @@
+# No hash for v2.1.2, comes from the github-helper:
+none	xxx	gflags-v2.1.2.tar.gz
diff --git a/package/gflags/gflags.mk b/package/gflags/gflags.mk
new file mode 100644
index 0000000..661dad8
--- /dev/null
+++ b/package/gflags/gflags.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# gflags
+#
+################################################################################
+
+GFLAGS_VERSION = v2.1.2
+GFLAGS_SITE = $(call github,gflags,gflags,$(GFLAGS_VERSION))
+GFLAGS_INSTALL_STAGING = YES
+GFLAGS_LICENSE = BSD-3c
+GFLAGS_LICENSE_FILES = COPYING.txt
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
+GFLAGS_CONF_OPTS = -DBUILD_gflags_LIB=OFF
+endif
+
+$(eval $(cmake-package))
