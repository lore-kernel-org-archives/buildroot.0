From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Mar 2014 23:51:54 +0100
Subject: [Buildroot] [git commit] libubox: correct json-c handling
Message-ID: <20140325225530.0DD4B9C381@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4a93b8f72be21a91345285d6c10515184a3f3fe5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/5a8/5a85e0e132f38a4a1a42c2b041f66003b64e748a/
(and a bunch of similar failures)

libubox has optional json-c handling, including the legacy version which
used libjson.so.  Unfortunately this support is buggy, so we end up with the
wrong compiler flags, and more importantly it gets confused if libjson is
enabled, as that also provides a (incompatible) libjson.so.

Fix it by disabling the legacy handling.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../libubox/libubox-01-drop-legacy-json-c.patch    |   34 ++++++++++++++++++++
 package/libubox/libubox.mk                         |    1 +
 2 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/package/libubox/libubox-01-drop-legacy-json-c.patch b/package/libubox/libubox-01-drop-legacy-json-c.patch
new file mode 100644
index 0000000..84bd99a
--- /dev/null
+++ b/package/libubox/libubox-01-drop-legacy-json-c.patch
@@ -0,0 +1,34 @@
+[PATCH] libubox: drop legacy json-c support
+
+The cmake logic is wrong (E.G. PKG_CHECK_FOR_MODULES fails unless all
+modules are found), and the legacy libjson.so name is also used by the other
+libjson (http://sourceforge.net/projects/libjson/) which provides an
+incompatible API, so just drop it.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ CMakeLists.txt |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Index: libubox-bbd846ec2d72b2629758b69dc122ac0b0f2c3e4b/CMakeLists.txt
+===================================================================
+--- libubox-bbd846ec2d72b2629758b69dc122ac0b0f2c3e4b.orig/CMakeLists.txt
++++ libubox-bbd846ec2d72b2629758b69dc122ac0b0f2c3e4b/CMakeLists.txt
+@@ -13,7 +13,7 @@
+ ENDIF()
+ 
+ INCLUDE(FindPkgConfig)
+-PKG_CHECK_MODULES(JSONC json-c json)
++PKG_CHECK_MODULES(JSONC json-c)
+ IF(JSONC_FOUND)
+   ADD_DEFINITIONS(-DJSONC)
+   INCLUDE_DIRECTORIES(${JSONC_INCLUDE_DIRS})
+@@ -42,7 +42,7 @@
+ 
+ ADD_SUBDIRECTORY(lua)
+ 
+-find_library(json NAMES json-c json)
++find_library(json NAMES json-c)
+ IF(EXISTS ${json})
+ 	ADD_LIBRARY(blobmsg_json SHARED blobmsg_json.c)
+ 	TARGET_LINK_LIBRARIES(blobmsg_json ubox ${json})
diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index 0743acc..28d5c63 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -8,6 +8,7 @@ LIBUBOX_VERSION = bbd846ec2d72b2629758b69dc122ac0b0f2c3e4b
 LIBUBOX_SITE = git://nbd.name/luci2/libubox.git
 LIBUBOX_LICENSE = LGPLv2.1, GPLv2, BSD-3c, MIT
 LIBUBOX_INSTALL_STAGING = YES
+LIBUBOX_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_JSON_C),json-c)
 
 ifeq ($(BR2_PACKAGE_LUA),y)
 	LIBUBOX_DEPENDENCIES += lua
