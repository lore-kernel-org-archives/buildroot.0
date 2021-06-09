From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  9 Jun 2021 21:06:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/filemq: drop -Werror
Message-ID: <20210609190639.282968-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop -Werror to fix build failure with -DNDEBUG raised since commit
5a8c50fe05afacc3cbe8e7347e238da9f242fab0

Fixes:
 - http://autobuild.buildroot.org/results/cf4c45ed7ae2c5090ac6ba967497e0d42d5c5224

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-configure.ac-drop-Werror.patch       | 36 +++++++++++++++++++
 package/filemq/filemq.mk                      |  2 ++
 2 files changed, 38 insertions(+)
 create mode 100644 package/filemq/0001-configure.ac-drop-Werror.patch

diff --git a/package/filemq/0001-configure.ac-drop-Werror.patch b/package/filemq/0001-configure.ac-drop-Werror.patch
new file mode 100644
index 0000000000..30d22f3f16
--- /dev/null
+++ b/package/filemq/0001-configure.ac-drop-Werror.patch
@@ -0,0 +1,36 @@
+From bb47bfcffcb7e7198a621c11a3764425044d128a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 9 Jun 2021 21:01:41 +0200
+Subject: [PATCH] configure.ac: drop -Werror
+
+Drop -Werror to avoid the following build failure with -DNDEBUG:
+
+src/filemq_client.c:7:6: error: variable 'rc' set but not used [-Werror=unused-but-set-variable]
+    7 |  int rc;
+      |      ^~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/cf4c45ed7ae2c5090ac6ba967497e0d42d5c5224
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/zeromq/filemq/pull/81]
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6e127f9..e925430 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -366,7 +366,7 @@ AC_C_BIGENDIAN
+ 
+ # These options are GNU compiler specific.
+ if test "x$GCC" = "xyes"; then
+-    CPPFLAGS="-pedantic -Werror -Wall -Wc++-compat ${CPPFLAGS}"
++    CPPFLAGS="-pedantic -Wall -Wc++-compat ${CPPFLAGS}"
+ fi
+ 
+ AM_CONDITIONAL(ENABLE_SHARED, test "x$enable_shared" = "xyes")
+-- 
+2.30.2
+
diff --git a/package/filemq/filemq.mk b/package/filemq/filemq.mk
index 75d8bd992c..5947ccf980 100644
--- a/package/filemq/filemq.mk
+++ b/package/filemq/filemq.mk
@@ -13,6 +13,8 @@ FILEMQ_INSTALL_STAGING = YES
 FILEMQ_DEPENDENCIES = czmq openssl zeromq
 FILEMQ_LICENSE = MPL-2.0
 FILEMQ_LICENSE_FILES = LICENSE
+# We're patching configure.ac
+FILEMQ_AUTORECONF = YES
 
 define FILEMQ_CREATE_CONFIG_DIR
 	mkdir -p $(@D)/config
-- 
2.30.2
