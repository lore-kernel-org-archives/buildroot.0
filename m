From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 22:35:49 +0100
Subject: [Buildroot] [git commit branch/next] tinycbor: bump to version 0.5.0
Message-ID: <20180208220318.E873B885A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0cdf2fb747b1520f05776501455fc6a84ac20545
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This version added support for shared or static library building
through BUILD_STATIC and BUILD_SHARED variables so set them depending
on BR2_xxx_LIBS variables

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tinycbor/tinycbor.hash |  2 +-
 package/tinycbor/tinycbor.mk   | 10 +++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/tinycbor/tinycbor.hash b/package/tinycbor/tinycbor.hash
index affc7a6e41..73ab82f528 100644
--- a/package/tinycbor/tinycbor.hash
+++ b/package/tinycbor/tinycbor.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	37a06c618ccddd7edc3747277425fcd38fa71eab37c7aaf0b03818a49950da81	tinycbor-v0.4.2.tar.gz
+sha256	5826a284e7f120a8d2c49cb581702be3e851acb4083a4f5af6112975a8b22209	tinycbor-v0.5.0.tar.gz
 sha256	3c6ba0b5bfa7830505301ffb336a17b0748e0d61c4d34216e9dc98f10e40395e	LICENSE
diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index b1848b56aa..a9afbb6e46 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYCBOR_VERSION = v0.4.2
+TINYCBOR_VERSION = v0.5.0
 TINYCBOR_SITE = $(call github,intel,tinycbor,$(TINYCBOR_VERSION))
 TINYCBOR_LICENSE = MIT
 TINYCBOR_LICENSE_FILES = LICENSE
@@ -18,6 +18,14 @@ endif
 
 TINYCBOR_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) V=1
 
+ifeq ($(BR2_STATIC_LIBS),y)
+TINYCBOR_MAKE_OPTS += BUILD_STATIC=1 BUILD_SHARED=0
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+TINYCBOR_MAKE_OPTS += BUILD_STATIC=1 BUILD_SHARED=1
+else ifeq ($(BR2_SHARED_LIBS),y)
+TINYCBOR_MAKE_OPTS += BUILD_STATIC=0 BUILD_SHARED=1
+endif
+
 # disabled parallel build because of build failures while
 # producing the .config file
 define TINYCBOR_BUILD_CMDS
