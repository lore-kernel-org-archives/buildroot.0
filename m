From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 23:10:41 +0200
Subject: [Buildroot] [git commit] let-me-create: new package
Message-ID: <20170729210653.D0029801EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b13cd74983de4a988a0bcb0857faf01b0c0564a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
[Thomas: minor tweaks in Config.in file, adjust .mk file for
static+shared build.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/let-me-create/Config.in          | 27 +++++++++++++++++++++++++++
 package/let-me-create/let-me-create.hash |  2 ++
 package/let-me-create/let-me-create.mk   | 26 ++++++++++++++++++++++++++
 5 files changed, 57 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e01c1ba..ece87e2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1392,6 +1392,7 @@ F:	package/glog/
 F:	package/gssdp/
 F:	package/gupnp/
 F:	package/gupnp-av/
+F:	package/let-me-create/
 F:	package/nanomsg/
 
 N:	Rahul Jain <rahul.jain@imgtec.com>
diff --git a/package/Config.in b/package/Config.in
index 484c753..9e90d98 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1121,6 +1121,7 @@ menu "Hardware handling"
 	source "package/gnu-efi/Config.in"
 	source "package/hidapi/Config.in"
 	source "package/lcdapi/Config.in"
+	source "package/let-me-create/Config.in"
 	source "package/libaio/Config.in"
 	source "package/libatasmart/Config.in"
 	source "package/libcec/Config.in"
diff --git a/package/let-me-create/Config.in b/package/let-me-create/Config.in
new file mode 100644
index 0000000..b0fdc73
--- /dev/null
+++ b/package/let-me-create/Config.in
@@ -0,0 +1,27 @@
+comment "let-me-create needs a toolchain w/ C++, threads, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| BR2_STATIC_LIBS
+
+config BR2_PACKAGE_LET_ME_CREATE
+	bool "let-me-create"
+	# build issues in static libs configuration
+	# see https://github.com/CreatorDev/LetMeCreate/issues/28
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  This library is collection of small wrappers for some
+	  interfaces on the Creator Ci40 board. It aims at making
+	  easier to develop on this platform. It also provides
+	  wrappers for a few clicks.
+
+	  https://github.com/CreatorDev/LetMeCreate
+
+if BR2_PACKAGE_LET_ME_CREATE
+
+config BR2_PACKAGE_LET_ME_CREATE_EXAMPLES
+	bool "Build and install examples"
+	help
+	  Build and install examples
+
+endif
diff --git a/package/let-me-create/let-me-create.hash b/package/let-me-create/let-me-create.hash
new file mode 100644
index 0000000..45b5e55
--- /dev/null
+++ b/package/let-me-create/let-me-create.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 5f42858a2062f34d2578e9cb1aed3ccb8d2409d908aa4c41a924418666d5f2bd  let-me-create-v1.5.2.tar.gz
diff --git a/package/let-me-create/let-me-create.mk b/package/let-me-create/let-me-create.mk
new file mode 100644
index 0000000..2dd07ef
--- /dev/null
+++ b/package/let-me-create/let-me-create.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# LetMeCreate
+#
+################################################################################
+
+LET_ME_CREATE_VERSION = v1.5.2
+LET_ME_CREATE_SITE = $(call github,CreatorDev,LetMeCreate,$(LET_ME_CREATE_VERSION))
+LET_ME_CREATE_INSTALL_STAGING = YES
+LET_ME_CREATE_LICENSE = BSD-3-Clause
+LET_ME_CREATE_LICENSE_FILES = LICENSE
+
+# pure static build not supported
+ifeq ($(BR2_SHARED_LIBS),y)
+LET_ME_CREATE_CONF_OPTS += -DBUILD_STATIC=OFF -DBUILD_SHARED=ON
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+LET_ME_CREATE_CONF_OPTS += -DBUILD_STATIC=ON -DBUILD_SHARED=ON
+endif
+
+ifeq ($(BR2_PACKAGE_LET_ME_CREATE_EXAMPLES),y)
+LET_ME_CREATE_CONF_OPTS += -DBUILD_EXAMPLES=ON
+else
+LET_ME_CREATE_CONF_OPTS += -DBUILD_EXAMPLES=OFF
+endif
+
+$(eval $(cmake-package))
